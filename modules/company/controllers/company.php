<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Company extends Front_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'company_model';
	/**
	 * 
	 * @var Company_Model
	 */
	public $model;
	
	

	/**
	 * Company controller 
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
    
    public function index($slug='')
	{
		$where = array('mt.Slug'=>$slug);
		if(!$this->LoginData->permission['company/company']->full) {
			//$where['mt.status'] = ACTIVE;
		}
		$company = $this->model->find_where('',$where,array('from'=>'company'));

		if(!$company){
			show_404();
		}else {
			$company = prepare_company($company);
			$MAP_OBJECT = new GoogleMapAPI();
			$this->addHeader($MAP_OBJECT->getHeaderJS());
			// add breadcrumbs
			$this->breadcrumbs->push(__("LBL_HOMEPAGE"),'/');
			$this->breadcrumbs->push(__("LBL_COMPANY"),'doanh-nghiep/');
			$this->breadcrumbs->push($company->Company_Name,'doanh-nghiep/'.$company->Slug);

			$this->template->set('company',$company);

			$this->view('companys/index');
		}
	}

	function sendMail(){
		$aryData = array('ok'=>true);

		$company = $this->model->get(intval($this->postData['company_id']));

		if($company->Contact){
			$contact = json_decode($company->Contact);
			$company_email = $contact->Email;
		}else{
			$company_email = '';
		}

		//overwrite test
		$company_email = 'dtluc@cmc.com.vn';

		if($company_email){
			$user_email = $this->postData['email'];
			$subject_to_company = sprintf(__('MAIL_TITLE_SEND_ENQUIRE'),$this->postData['first_name'].' '.$this->postData['last_name']);
			$subject_to_user = sprintf(__('MAIL_TITLE_SEND_CONFIRM_EMAIL'),$company->Company_Name);

			$html_email = $this->baseView('emails/company_enquiry',array('data'=>$this->postData),true);
			//debug($html_email);
			$this->load->config('email');
			$this->load->library('email');
			$this->email = new CI_Email($this->config->item('gmail'));
			$this->email->from($this->config->item('system_email'), $this->config->item('app_name'));
			$this->email->to($company_email);
			$this->email->subject($subject_to_company);
			$this->email->message( $html_email );

			//send to company
			if($this->email->send())
			{
				//send copy email to user
				$this->email->to($user_email);
				$this->email->subject($subject_to_user);
				$this->email->send();

				$aryData['smessage'] =  __("MSG_SEND_ENQUIRE_SUCCESS");
			}
			else
			{
				$aryData['ok'] = false;
				$aryData['serror'] =  __('ERR_SEND_COMPANY_ENQUIRY');

			}
		}else{
			$aryData['ok'] = false;
			$aryData['serror'] = __('ERR_CANNOT_SEND_COMPANY_ENQUIRY');
		}

		echo json_encode($aryData);

	}


}

//end of Company