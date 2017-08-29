    <?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Api extends REST_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'services_model';
	
	/**
	 * 
	 * @var Services_Model
	 */
	public $model;
		
	/**
	 *
	 * @var RestClient
	 */
	public $RestClient;
	
	/**
	 * 
	 * @var Push
	 */
	public $Push;
	
	/**
	 *
	 * @var ObjXML
	 */
	public $ObjXML;
	
	/**
	 * String
	 * @var unknown_type
	 */
	public $_data;


	public function __construct()
	{
		parent::__construct();
		
		$this->load->library('RestClient');
		$this->RestClient = new RestClient();
		
		$this->load->library('Push');
		$this->Push = new Push();
		
		$this->load->library('ObjXML');
		$this->ObjXML = new ObjXML();


		
		$client_data = $this->request->body;
		

		 
		if(!$client_data){
			$client_data = $this->post();
		}
		
		$this->_data = $client_data;
		
		
	}

	public function updateDeployFlag_post(){
		//0: Chưa deploy; 1: Chuyen deploy; 2: dang deploy;3: finish; -1:error
		$aryData = array('ok'=>true,'message'=>'','error'=>'','errorCode'=>'');
		$flag = $this->_data['flag'];
		$ok = $this->model->update('sys_config',array('configValue'=>$flag),array('configCode'=>'DEPLOY_STATUS'));
		$aryData['ok'] = $ok;
		if(!$ok){
			$aryData['error'] = __("ERR_CANNOT_UPDATE");
			$aryData['errorCode'] = '001';
		}else{
			$aryData['message'] = __("MSG_UPDATE_SUCCESSFUL");
		}

		$this->response($aryData, 200);
	}

	public function reportError_post(){
		$aryData = array('ok'=>true,'message'=>'','error'=>'','errorCode'=>'');

		$errorCode = trim($this->_data['errorCode']);

		$status = $this->sendMail($errorCode);

		if ($status) {
			$aryData['message'] = __("MSG_SEND_EMAIL_SUCCESS");
		} else {
			$aryData['ok'] = false;
			$aryData['error'] = __("ERR_CANNOT_SEND_EMAIL");
			$aryData['errorCode'] = '002';
		}

		$this->response($aryData, 200);
	}


	public function addLog_post(){
		//0: Chưa deploy; 1: Chuyen deploy; 2: dang deploy;3: finish;
		$aryData = array('ok'=>true,'message'=>'','error'=>'','errorCode'=>'');
		$action = $this->_data['action'];
		$status = $this->_data['status'];
		$step = $this->_data['step'];
		$status = $this->_data['status'];
		$description = $this->_data['description'];

		if($status==0){
			$this->sendMail('ERROR');
		}

		$ok = $this->model->add('cronjob_log',array('action'=>$action,'status'=>$status,'description'=>$description));
		$aryData['ok'] = $ok;
		if(!$ok){
			$aryData['error'] = __("ERR_CANNOT_LOG");
			$aryData['errorCode'] = '003';
		}else{
			$aryData['message'] = __("MSG_INSERT_SUCCESSFUL");
		}

		$this->response($aryData, 200);
	}

	//=====================
	private function sendMail($code){
		$email = getDBConfig('EMAIL_REPORT');


		switch ($code){
			default:
				$html_email = $this->load->view('email_report', true);
		}

		$this->model->update('sys_config',array('configValue'=>-1),array('configCode'=>'DEPLOY_STATUS'));

		$this->model->add('cronjob_log',array('action'=>'Repport error:'.$code,'description'=>$html_email));

		$this->load->config('email');
		$this->load->library('email');
		$this->email = new CI_Email($this->config->item('gmail'));
		$this->email->from($this->config->item('system_email'), $this->config->item('app_name'));
		$this->email->to($email);

		$bcc = $this->config->item('system_bcc_email');
		$this->email->bcc($bcc);

		$this->email->subject(__('LBL_SUBJECT_REPORT_ERROR'));
		$this->email->message($html_email);

		return $this->email->send();
	}

}

//end of Services