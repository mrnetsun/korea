<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Cronlog extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'cronlog_model';
	/**
	 * 
	 * @var Cronlog_Model
	 */
	public $model;
	
	

	/**
	 * Cronlog controller 
	 */
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	protected $after_edit = array();
	
	//action insert
	protected $before_insert = array('check_member');
	protected $after_insert = array();
	
	//action update
	protected $before_update = array('check_member');
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();
	
    public function __construct(){
        parent::__construct();
		$this->load->library('encrypt');
		$this->load->library('cookie');
		$this->encrypt = new CI_Encrypt();

		$this->load->library('ssh2');
		$this->load->config('ssh');

		$ssh_config = $this->config->item('ssh_server');

		$server = json_decode(getDBConfig('SOLR_SSH_SERVER'));
		$ssh_config['host'] = $server[0][0];
		$ssh_config['auth']['username'] = $server[0][1];
		$ssh_config['auth']['password'] = $server[0][2];

		// Connect
		$ssh = new SSH2($ssh_config);
		$this->ssh2 = $ssh;
    }
    
    
    /**
	 * Build a Condition where for search 
	 * @return mixed:
	*/
    protected function _buildCondition(){
    	$aryCondition = array('actor'=>'Java Agent');
		$updatedTime = $this->postData['updatedTime'];
    	if(!empty($this->postData)){
    		 //search
			 			
			if($this->postData['comment']!=''){
    		 	$aryCondition['like'][] =  array("mt.comment"=>$this->postData['comment']);
    		 }			
			if($this->postData['description']!=''){
    		 	$aryCondition['like'][] =  array("mt.description"=>$this->postData['description']);
    		 }
			if($this->postData['type']!=''){
				$aryCondition['and'][] =  array("mt.type"=>$this->postData['type']);
			}
			if( $updatedTime!='' ){
					$createdTime = $updatedTime;
					$arrDateTime = explode('|',$updatedTime);
					$start = trim($arrDateTime[0]);
					$end = ($arrDateTime[1])? trim($arrDateTime[1]) : trim($arrDateTime[0]);
					$aryCondition['and'][] =  "(DATE_FORMAT(mt.updatedTime,'%Y-%m-%d') >='$start' AND DATE_FORMAT(mt.updatedTime,'%Y-%m-%d') <= '$end')";
    		 }
    	}
    	return $aryCondition;
    }
    
    
	/**
	 * Get data for List screen
	 * @param array $aryCondition
	 * @param int $start
	 * @return mixed
	*/ 
    protected function _getDataList($aryCondition=array(),$start='',$sort= array()){
    	$rows =   parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*'));
//		debug($this->db->last_query());
    	return $rows;
    }

	private function check_member(){

		$aryData = array('ok' => true,'smessage'=>'','serror'=>'');
		$postData = $this->postData;
		$this->postData['status'] = 1;
		$this->postData['flag'] = 0;
		if( $this->LoginData->password != password( $postData['password'] ) ){
			//password
			//debug( password( $this->postData['password'] ) );
			$aryData['ok'] = false;
			$aryData['serror'] .= __('LBL_PASSWORD_INCORRECT');
			//$this->session->set_flashdata('serror', __('LBL_PASSWORD_INCORRECT') );
		}
		return $aryData;
	}

	public function command($type=''){

		$command = '';
		$aryData = $this->check_member();

		switch(strtolower($type)){
			case 'restart':
				$command = getDBConfig('SOLR_RESTART');
				break;
			case 'daily':
				$command = getDBConfig('SOLR_DAILY_UPDATE');
				break;
		}


		if($aryData['ok'] && $command){
			try{



				$this->ssh2->connect();

				if($this->ssh2->authenticate()){

					/* For devices which support OpenSSH and OpenSSH2 Variants */
					$exampleOutput = $this->ssh2->exec(array($command));
					if(!$exampleOutput ){
						$aryData['ok'] = false;
						$aryData['serror'] = $this->ssh2->getLastError();
					}
					else{
						$aryData['smessage'] =  nl2br($exampleOutput);
					}

				}

				// ALWAYS DISCONNECT
				$this->ssh2->disconnect();

			}
			catch(SSH2FailedToConnectException $e){
				$aryData['ok'] = false;
				$aryData['serror'] = $e->getMessage();
			}
		}

		echo json_encode($aryData);

	}

	public function restartsolr(){

		$this->view('cronlogs/restartsolr');
	}

	public function dailyupdate(){
		$this->view('cronlogs/dailyupdate');
	}
	
 
}

//end of Cronlog