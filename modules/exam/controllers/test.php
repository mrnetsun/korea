<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Test extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'test_model';
	/**
	 * 
	 * @var Test_Model
	 */
	public $model;
	
	

	/**
	 * Test controller 
	 */
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	protected $after_edit = array();
	
	//action insert
	protected $before_insert = array();
	protected $after_insert = array();
	
	//action update
	protected $before_update = array();
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();
	
    public function __construct(){
        parent::__construct();  
        
    }
    
    
    /**
	 * Build a Condition where for search 
	 * @return mixed:
	*/
    protected function _buildCondition(){
    	$aryCondition = array();
    	
    	if(!empty($this->postData)){
    		 //search
			 			

			if($this->postData['test_name']!=''){
    		 	$aryCondition['like'][] =  array("mt.test_name"=>$this->postData['test_name']);
    		 }			
			if($this->postData['cate_id']!=''){
    		 	$aryCondition['and'][] =  array("mt.cate_id"=>$this->postData['cate_id']);
    		 }			

			if($this->postData['status']!=''){
    		 	$aryCondition['and'][] =  array("mt.status"=>$this->postData['status']);
    		 }



    	}
    	return $aryCondition;
    }

	public function insert($return = false)
	{
		$aryData = parent::insert(true);
		$aryData['url_reload'] = site_url('exam/test/edit/'.$aryData['ok']);
		echo  json_encode($aryData);
	}

	public function update($id = '', $return = false)
	{

		$question_id  = $this->postData['question_id'];
		$question_point  = $this->postData['question_point'];
		$question_sub_point  = $this->postData['question_sub_point'];
		$test_id = intval($this->postData['test_id']);

		//remove
		$deleted_question = $this->session->userdata('deleted_question');
		if(!empty($deleted_question)){
			$this->model->deleteWhere_primary('question_id IN ('.implode(',',$deleted_question).')',array('from'=>'test_question'));
		}

		//update
		$total = 0;
		$questions = array();
		foreach($question_id as $k=>$q){
			$totalC = 0;
			foreach($q as $i=>$v){
				$total += floatval($question_point[$k][$i]);
				$totalC += floatval($question_point[$k][$i]);
				$questions[] = array('test_component_id'=>$k,'test_id'=>$test_id,'question_id'=>intval($v),'question_point'=>$question_point[$k][$i],'question_sub_point'=>$question_sub_point[$k][$i]);
			}

			$this->model->update('test_component',array('total_question'=>count($q),'total_point'=>$totalC),array('test_component_id'=>$k));

		}

		foreach($questions as $q){
			$existed = $this->model->find_where('',
				array('test_component_id'=>$q['test_component_id'],'question_id'=>$q['question_id'],'test_id'=>$test_id),
				array('from'=>'test_question'));

			if($existed){
				$this->model->update('test_question',$q,array('test_component_id'=>$q['test_component_id'],'test_id'=>$test_id,'question_id'=>$q['question_id']));
			}else{
				$this->model->add('test_question',$q);
			}
		}

		$data = array();
		$data['test_id'] = $this->postData['test_id'];
		$data['test_name'] = $this->postData['test_name'];
		$data['cate_id'] = $this->postData['cate_id'];
		$data['time_limit'] = $this->postData['time_limit'];
		$data['pass_point'] = $this->postData['pass_point'];
		$data['total_point'] = $total;
		$data['description'] = $this->postData['description'];
		$data['status'] = $this->postData['status'];

		$this->postData = $data;
		$aryData =  parent::update($id, true);

		unset($aryData['urlLoadList']);

		$this->session->set_flashdata('message',__("MSG_UPDATE_SUCCESSFUL"));
		$aryData ['url_reload'] = site_url('exam/test');
		echo json_encode($aryData);
	}

	public function edit($id = '', $permission = 'all')
	{

		$this->session->unset_userdata('inserted_question');
		$this->session->unset_userdata('filter_where');
		$this->session->unset_userdata('question_filter');
		$this->session->unset_userdata('deleted_question');

		$id = intval($id);
		$this->session->unset_userdata('filter_where');
		$question_stack = array();
		$temps = $this->model->find_where('list',array('test_id'=>$id),array('from'=>'test_question'));

		foreach($temps as $t){
			$question_stack[] = $t->question_id;
		}
//		debug($question_stack);
		$this->session->set_userdata('question_stack',$question_stack);

		$component = $this->getTestComponent($id);

		$this->template->set('component',$component);
		parent::edit($id, $permission);
	}

	private  function getTestComponent($id){
		$id = intval($id);
		$component = $this->model->find_where('list',array('test_id'=>$id),array('from'=>'test_component'));
		$inserted_question = $this->session->userdata('inserted_question');

		foreach($component as $k=>$c){
			$tmp = $this->model->find_where('list',array('test_id'=>$c->test_id,'test_component_id'=>$c->test_component_id),array('from'=>'test_question'));
			$aryQID = array();
			foreach($tmp as $q){
				$aryQID[] = $q->question_id;
			}


			if(!empty($inserted_question[$c->test_component_id])){
				$aryQID = array_merge($aryQID,$inserted_question[$c->test_component_id]);
			}



			$where = array('mt.status'=>ACTIVE);
			if(!empty($aryQID)){
				$where['IN'] = array('mt.question_id'=>$aryQID);
			}else{
				$where['AND'] = array('tq.test_component_id'=>$c->test_component_id);
			}
			$component[$k]->questions = $this->model->find_where('list',
				$where,
				array(
					'select'=>'mt.title,mt.question_type,mt.cate_id,mt.point,mt.point_sub,mt.content,mt.answer,mt.media,mt.question_type,mt.question_id,tq.test_component_id,tq.question_point,tq.question_sub_point,tq.order_position,c.cate_name',
					'from'=>'question',
					'join'=>array(
						array('test_question as tq','tq.question_id = mt.question_id  AND tq.test_id = '.$c->test_id.' AND tq.test_component_id = '.$c->test_component_id,'left'),
						array('question_category as c','c.cate_id = mt.cate_id','left')
					)
				));

			foreach($component[$k]->questions as $j=>$q){
				if($q->question_type == 11){
					$component[$k]->questions[$j]->sub_questions = $this->model->find_where('list',array('parent_id'=>$q->question_id),array('from'=>'question'));
				}
			}

//			debug($this->db->last_query());
		}

		return $component;
	}

	private  function getTestViewComponent($id){
		$id = intval($id);
		$component = $this->model->find_where('list',array('test_id'=>$id),array('from'=>'test_component'));

		foreach($component as $k=>$c){


			$where = array('mt.status'=>ACTIVE);
			$where['AND'] = array('tq.test_component_id'=>$c->test_component_id);

			$component[$k]->questions = $this->model->find_where('list',
				$where,
				array(
					'select'=>'mt.title,mt.question_type,mt.cate_id,mt.point,mt.point_sub,mt.content,mt.answer,mt.media,mt.question_type,mt.question_id,tq.test_component_id,tq.question_point,tq.question_sub_point,tq.order_position,c.cate_name',
					'from'=>'question',
					'join'=>array(
						array('test_question as tq','tq.question_id = mt.question_id  AND tq.test_id = '.$c->test_id.' AND tq.test_component_id = '.$c->test_component_id,'left'),
						array('question_category as c','c.cate_id = mt.cate_id','left')
					)
				));

			foreach($component[$k]->questions as $j=>$q){
				if($q->question_type == 11){
					$component[$k]->questions[$j]->sub_questions = $this->model->find_where('list',array('parent_id'=>$q->question_id),array('from'=>'question'));
				}
			}

//			debug($this->db->last_query());
		}

		return $component;
	}

	public function loadComponent(){
		$testId = $this->input->post('test_id');
		$component = $this->getTestComponent($testId);

		$this->template->set('component',$component);
		$this->baseView('tests/component/component_list');
	}

	public function addComponent($test_id){
		$this->template->set('test_id',$test_id);
		$this->view('tests/component/add');
	}

	public function insertComponent(){
		$test_id = $this->postData['test_id'];
		$ok = $this->model->add('test_component',$this->postData);
		$aryData = array('ok'=>$ok,'test_id'=>$test_id);
		if(!$ok){
//			$aryData['serror'] = __("ERR_CANOT_INSERT");
		}else{
			$aryData['serror'] = __("MSG_UPDATE_SUCCESS");
		}
		echo json_encode($aryData);
	}

	public function editComponent($id){
		$component = $this->model->get($id,array('from'=>'test_component'));
		$this->template->set('fillData',$component);
		$this->view('tests/component/edit');
	}

	public function updateComponent(){

		$ok = $this->model->update('test_component',$this->postData,
			array('test_component_id'=>$this->postData['test_component_id'],
			'test_id'=>$this->postData['test_id']));
		echo json_encode(array('ok'=>$ok,'test_id'=>$this->postData['test_id'],'smessage'=>__('MSG_UPDATE_SUCCESSFUL'),'serror'=>__('ERR_CANNOT_UPDATE')));
	}

	public function deleteComponent($id){

		$id = intval($id);
		$this->model->delete($id,'',array('from'=>'test_component'));

		echo json_encode(array('ok'=>true,'component_id'=>$id));
	}

	public function addTestQuestion($test_id,$component_id){
		$this->template->set('test_id',$test_id);
		$this->template->set('component_id',$component_id);

		$html = $this->getQuestionList(0,true);
		$this->template->set('html',$html);
		$this->view('tests/component/add_question');

	}

	public function insertTestQuestion(){
		$question = $this->postData['question_id'];
		$test_id = $this->postData['test_id'];
		$component_id = $this->postData['component_id'];
		$number_random = $this->postData['number_random'];
		if($number_random >0){
			$question_stack = $this->session->userdata('question_stack');
			$inserted_question = $this->session->userdata('inserted_question');

			if(!empty($inserted_question)){
				$tmp = array();
				foreach($inserted_question as $g){
					$tmp = array_merge($tmp,$g);
				}
				$question_stack = array_merge($question_stack,$tmp);
			}

			$where = array('mt.status'=>ACTIVE);
			if(!empty($question_stack)){
				$where['NOT IN'] = array('question_id'=>$question_stack);
			}

			$filter_where = $this->session->userdata('filter_where');
			if(!empty($filter_where)){
				$where = array_merge($where,$filter_where);
			}

			$questions = $this->model->find_where('list',$where,
				array(
					'select'=>'mt.*,c.cate_name',
					'from'=>'question'
				,'join'=>array(array('question_category as c','c.cate_id = mt.cate_id','left'))
				,'limit'=>$number_random,'fixed_sort'=>'rand()'));

			$question = array();
			foreach($questions as $q){
				$question[] = $q->question_id;
			}

			$inserted_question = $this->session->userdata('inserted_question');
			if($inserted_question[$component_id]){
				$inserted_question[$component_id] = array_merge($inserted_question[$component_id],$question);
			}else{
				$inserted_question[$component_id] = $question;
			}
			//remove duplicate
			$tmp = array_flip(array_flip($inserted_question[$component_id]));
			$inserted_question[$component_id] = $tmp;

			$this->session->set_userdata('inserted_question',$inserted_question);

		}else{
			if(!empty($question)){
				$inserted_question = $this->session->userdata('inserted_question');
				if($inserted_question[$component_id]){
					$inserted_question[$component_id] = array_merge($inserted_question[$component_id],$question);
				}else{
					$inserted_question[$component_id] = $question;
				}
				//remove duplicate
				$tmp = array_flip(array_flip($inserted_question[$component_id]));
				$inserted_question[$component_id] = $tmp;

				$this->session->set_userdata('inserted_question',$inserted_question);
			}
		}

		echo json_encode(array('ok'=>true,'closeOverlay'=>1,'test_id'=>$test_id,'smessage'=>sprintf(__("LBL_ADDED_QUESTION"),count($question))));
	}

	public function getQuestionList($start=0,$return=false){

		$question_stack = $this->session->userdata('question_stack');
		$inserted_question = $this->session->userdata('inserted_question');

		if(!empty($inserted_question)){
			$tmp = array();
			foreach($inserted_question as $g){
				$tmp = array_merge($tmp,$g);
			}
			$question_stack = array_merge($question_stack,$tmp);
		}

		$where = array('mt.status'=>ACTIVE);
		if(!empty($question_stack)){
			$where['NOT IN'] = array('question_id'=>$question_stack);
		}

		if($this->postData){
			$filter_where = array();
			if($this->postData['question']){
				$filter_where['AND'][] = '(question_id = '.intval($this->postData['question']).' OR title LIKE \'%'.trim($this->postData['question']).'%\')';
			}

			if($this->postData['cate_id']){
				$aryCate = array($this->postData['cate_id']);
				getAllChildCategory($this->postData['cate_id'],array('table'=>'question_category','id'=>'cate_id','parent'=>'parent_id'),$aryCate);

				$filter_where['IN'] = array('mt.cate_id'=>$aryCate);
			}

			if($this->postData['question_type']){
				$filter_where['AND'][] = array('question_type'=>$this->postData['question_type']);
			}

			$this->session->set_userdata('filter_where',$filter_where);
			$this->session->set_userdata('question_filter',$this->postData);
		}

		$filter_where = $this->session->userdata('filter_where');
		if(!empty($filter_where)){
			$where = array_merge($where,$filter_where);
		}



		$questions = $this->model->find_where('list',$where,
			array(
				'select'=>'mt.*,c.cate_name',
				'from'=>'question'
			,'join'=>array(array('question_category as c','c.cate_id = mt.cate_id','left'))
			,'limit'=>20,'offset'=>$start));

//		debug($this->db->last_query());

		$html = $this->baseView('tests/component/question_list',array('questions'=>$questions),true);
		if($return){
			return $html;
		}else{
			echo json_encode(array('ok'=>true,'html'=>$html));
		}
	}

	public function removeQuestion($component_id,$question_id){

			$question_stack = $this->session->userdata('question_stack');
			if($question_stack){
				foreach ($question_stack as $k => $q) {
					if ($q == $question_id) unset($question_stack[$k]);
				}
				$this->session->set_userdata('question_stack', $question_stack);
			}


			$inserted_question = $this->session->userdata('inserted_question');
			if($inserted_question[$component_id]){
				foreach($inserted_question[$component_id] as $k=>$q){
					if($q == $question_id) unset($inserted_question[$component_id][$k]);
				}
				$this->session->set_userdata('inserted_question',$inserted_question);
			}




		$deleted_question = $this->session->userdata('deleted_question');
		$deleted_question[] = $question_id;

		$deleted_question = array_flip(array_flip($deleted_question));

		$this->session->set_userdata('deleted_question',$deleted_question);

		echo json_encode(array('ok'=>true,'question_id'=>$question_id));
	}

	public function detail($id = '')
	{

		$this->loadJs('soundmanager/script/soundmanager2-jsmin.js');
		$this->loadJs('soundmanager/demo/bar-ui/script/bar-ui.js');
		$this->assetCss('soundmanager/demo/bar-ui/css/bar-ui.css');
		$component = $this->getTestViewComponent($id);
		$this->template->set('component',$component);

		parent::detail($id);
	}

	/**
	 * Get data for List screen
	 * @param array $aryCondition
	 * @param int $start
	 * @return mixed
	*/ 
    protected function _getDataList($aryCondition=array(),$start='',$sort= array()){
    	$rows =  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*,c.cate_name',
			'join'=>array(array('test_category as c','c.cate_test_id = mt.cate_id','left')),
			'created'=>true));
    	return $rows;
    }
	
 
}

//end of Test