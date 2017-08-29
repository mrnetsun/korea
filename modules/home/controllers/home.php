<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Home extends Front_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'home_model';
	/**
	 *
	 * @var Home_Model
	 */
	public $model;



	/**
	 * Home controller
	 */

	//form add
	protected $before_add = array();

	//form edit
	protected $before_edit = array();

	//action insert
	protected $before_insert = array();
	protected $after_insert = array();

	//action update
	protected $before_update = array();
	protected $after_update = array();

	//form view
	protected $before_view = array();
	protected $after_view = array();

	/**
	 * @var SSH2
	 */
	protected $ssh2;

	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->load->helper('dom');
		$this->load->helper('weather');

		$currentCity = $this->session->userdata('currentCity');
		if(!$currentCity){
			$currentCity = getCityByIp();
			$this->session->set_userdata('currentCity',$currentCity);
		}

		//weather
		$weather = getLocationWeather('Hanoi');
		$this->template->set('weather',$weather);

		//greeting
		$greeting = $this->model->find_where('',array('status'=>ACTIVE),
			array('from'=>'greeting','fixed_sort'=>'rand()'));
		$this->template->set('greeting',$greeting);

		//news
		$news = $this->model->find_where('list',
			array('mt.status'=>ACTIVE,'mt.feature'=>ACTIVE,'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))'),
			array(
				'select'=>'mt.*,c.slug as cate_slug,c.name as cate_name',
				'from'=>'article'
				,'join'=>array(array('category as c','c.cateId = mt.category_id','left'))
				,'order_by'=>array('mt.updatedTime'=> 'DESC'),'limit'=>5));
		$this->template->set('news',$news);

		$company_news = $this->model->find_where('list',
			array('mt.status'=>ACTIVE,'mt.feature'=>ACTIVE,'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))'),
			array(
				'select'=>'mt.*,c.slug as cate_slug,c.name as cate_name',
				'from'=>'article'
			,'join'=>array(array('category as c','c.cateId = mt.category_id','left'))
			,'order_by'=>array('mt.updatedTime'=>'DESC','mt.updatedTime'=> 'DESC'),'limit'=>4));
		$this->template->set('company_news',$company_news);

		//team
		$team = $this->model->find_where('list',array('mt.score_date'=>date("Y-m-d")),array(
			'from'=>'member_today_score',
			'join'=>array(array('sys_member as m','m.memberId = mt.memberId')),
			'limit'=>3,
			'order_by'=>array('mt.score_value'=>'DESC')
		));

		$this->template->set('team',$team);

		$this->view('homes/index','','','homepage');
	}

	public function page($slug=''){
		$where = array('slug'=>$slug);

		if(!$this->LoginData->permission['home/home']->full) $where['status'] = ACTIVE;
		$content = $this->model->find_where('',$where,array('from'=>'article_static'));
//		debug($content);
		if(!$content){
			show_404();
		}else{
			$this->template->set('page',$content);
			$this->view('homes/page');
		}
	}

	public function contact(){

		$MAP_OBJECT = new GoogleMapAPI();
		$this->addHeader($MAP_OBJECT->getHeaderJS());

		$where = array('slug'=>'lien-he');
		$content = $this->model->find_where('',$where,array('from'=>'article_static'));
		$this->template->set('contact',$content);
		$this->view('homes/contact');

	}

	public function overload(){
		$referer = $this->session->flashdata('refer');
		if($referer){
			$this->session->set_userdata('referer',$referer);
		}
		$referer = $this->session->userdata('refer');
		$this->template->set('referer',$referer);
		$this->view('homes/overload');
	}

	public function sendMail(){
		$aryData = array('ok'=>true);
		$to = getDBConfig('SYS_CONTACT_EMAIL');
		$name = $this->postData['fullName'];
		$subject_company = sprintf(__("EMAIL_SUBJECT_CONTACT_FORM"),$name);
		$subject_confirm = sprintf(__("EMAIL_SUBJECT_CONTACT_FORM_CONFIRM"),'TimDoanhNghiep.Vn');
		$html_email = $this->baseView('emails/contact_form_company',array('data'=>$this->postData),true);
		//contact form
		$ok = sendMailQueue($to,$subject_company,$html_email);
		$aryData['ok'] = $ok;
		if($ok){
			$html_email = $this->baseView('emails/contact_form_confirm',array('data'=>$this->postData),true);
			$ok = sendMailQueue($to,$subject_confirm,$html_email);
			$aryData['smessage'] = __("MSG_EMAIL_SENT_SUCCESSFUL");
		}else{
			$aryData['serror'] = __("ERR_CANNOT_SEND_EMAIL");
		}
		echo json_encode($aryData);
	}

	public function subscriber(){
		$aryData = array('ok'=>true);
		$to = getDBConfig('SYS_CONTACT_EMAIL');
		$email = $this->postData['email'];
//		debug($email);
		if(!$email || !valid_email($email)){
			$aryData['ok'] = false;
			$aryData['serror'] = __("ERR_INVALID_EMAIL");
		}else{
			$subject_company = sprintf(__("EMAIL_SUBJECT_SUBSCRIBER_FORM"),$email);
			$subject_confirm = __("EMAIL_SUBJECT_SUBSCRIBER_CONFIRM");
			$html_email = $this->baseView('emails/subscriber_form_company',array('data'=>$this->postData),true);

			//save user to database
			$data = array('memberId'=>$this->LoginData->memberId,
				'email'=>$email,
				'status'=>ACTIVE
			);

			$isExisted = $this->model->find_where('',array('email'=>$email),array('from'=>'newsletter'));
			if(empty($isExisted)){
				$ok = $this->model->add('newsletter',$data);
				$update = 0;
			}else{
				$update = 1;
				$ok = $this->model->update('newsletter',$data,array('id'=>$isExisted->id));
			}


			//send mail to company
			sendMailQueue($to,$subject_company,$html_email);

			//send mail to user
			$html_email = $this->baseView('emails/subscriber_form_confirm',array('data'=>$this->postData),true);
			sendMailQueue($to,$subject_confirm,$html_email);

			$aryData['ok'] = $ok;
			if($ok){
				if($update){
					$aryData['smessage'] = __("MSG_SUBSCRIBER_EXISTED");
				}else{
					$aryData['smessage'] = __("MSG_SUBSCRIBER_SUCCESSFUL");
				}

			}else{
				$aryData['serror'] = __("ERR_CANNOT_SEND_EMAIL");
			}
		}


		echo json_encode($aryData);
	}

	public function unsubscriber($email){
		$email = base64_decode($email);
		$isExisted = $this->model->find_where('',array('email'=>$email),array('from'=>'newsletter'));

		if(empty($isExisted)){
			$this->template->set('error',__("MSG_EMAIL_NOT_EXISTED_IN_SUBSCRIBER"));
		}else{
			$this->template->set('message',__("MSG_UNSUBSCRIBER_SUCCESSFUL"));
		}

		$this->view('homes/unsubscriber');

	}

	public function about(){
		$where = array('slug'=>'gioi-thieu');

		if(!$this->LoginData->permission['home/home']->full) $where['status'] = ACTIVE;
		$content = $this->model->find_where('',$where,array('from'=>'article_static'));
		$team = $this->model->find_where('list',array('status'=>ACTIVE,'code'=>'TEAM'),array('from'=>'people_say'));
		$this->template->set('team',$team);
		if(!$content){
			show_404();
		}else{
			$this->template->set('page',$content);
			$this->view('homes/about_us','','','auth');
		}
	}

	public function advertising(){
		$where = array('slug'=>'quang-cao');

		if(!$this->LoginData->permission['home/home']->full) $where['status'] = ACTIVE;
		$content = $this->model->find_where('',$where,array('from'=>'article_static'));

		if(!$content){
			show_404();
		}else{
			$this->template->set('page',$content);
			$this->view('homes/page');
		}
	}

	public function getjob(){
		$where = array('slug'=>'tuyen-dung');

		if(!$this->LoginData->permission['home/home']->full) $where['status'] = ACTIVE;
		$content = $this->model->find_where('',$where,array('from'=>'article_static'));

		if(!$content){
			show_404();
		}else{
			$this->template->set('page',$content);
			$this->view('homes/page');
		}
	}


	public function weather(){
		$aryWeather = $this->model->find_where('list',
			array('status'=>ACTIVE,'date'=>date("Y-m-d")),
			array('from'=>'weather_detail','fixed_sort'=>'location ASC'));

		$this->template->set('aryWeather',$aryWeather);
		$this->view('homes/weather','','','auth');
	}

	public function banner($banner_id){
		if(!$banner_id) return '';
		$banner = $this->model->get($banner_id,array('from'=>'banner'));
		//update click
		$this->db->query('update '.$this->db->dbprefix('banner').' SET clicked = clicked +1 where banner_id = '.intval($banner_id));
		debug($banner);
	}

	public function updateQuestion(){
		set_time_limit(0);
//		$question = $this->model->find_where('list',array(),array('from'=>'question'));
//		foreach($question as $k=>$q){
//			$answer = $this->model->find_where('list',array('question_id'=>$q->question_id),array('from'=>'exam_question_choise'));
//			$new_answer = array();
//			foreach($answer as $a){
//
//				$new_answer[] = array('plan_a'=>$a->plan_a,'plan_b'=>$a->plan_b,'true_plan'=>$a->true_plan);
//			}
//			echo $k.'- ';
//			$this->model->update('question',array('answer'=>json_encode($new_answer)),array('question_id'=>$q->question_id));
//		}


//		$question = $this->model->find_where('list',array('like'=>array('content'=>'mp3')),array('from'=>'question'));
//
//		foreach($question as $k=>$q) {
//			$html = $q->content;
////			debug($html,false);
//			preg_match_all("#<object[^>]*>(.+?)</object>#ims", $html, $matches);
//			$content = str_replace($matches[0],'',$html);
////			debug($content);
//			$medias = array();
//			foreach ($matches[0] as $item) {
//				preg_match('/uploadlib(.*)\&/', $item, $matches);
//				$medias[] = trim($matches[0], '& ');
//			}
//			echo $k.'- ';
//			if(count($medias)>1) debug($medias);
//
//			$this->model->update('question',array('media'=>$medias[0],'content'=>$content),array('question_id'=>$q->question_id));
//		}

		//components
//		$components = $this->model->find_where('list',array(),array('from'=>'test_component'));
//		foreach($components as $c){
//			$questions = $this->model->find_where('list',array('test_component_id'=>$c->test_component_id),array('from'=>'test_question'));
//			$aryComQuest = array();
//			foreach ($questions as $question) {
//				$aryComQuest[] = array('question_id'=>$question->question_id);
//			}
//		}

		$exams  = $this->model->find_where('list',array(),array('from'=>'exam'));
		foreach($exams as $e){
			$tests = $this->model->find_where('list',array('exam_id'=>$e->exam_id),array('from'=>'exam_test'));
			$aryTest = array();
			foreach($tests as $t){
				$aryTest[] = $t->test_id;
			}

			$this->model->update('exam',array('tests'=>json_encode($aryTest)),array('exam_id'=>$e->exam_id));
		}

		echo "<br>Done";

	}


}

//end of Home