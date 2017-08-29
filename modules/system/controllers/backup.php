<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Backup extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'backup_model';
	/**
	 * 
	 * @var Backup_Model
	 */
	public $model;
	private $model2;
	private $db2;

	/**
	 * @var SSH2
	 */
	private $ssh2;
	
	

	/**
	 * Backup controller 
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
	protected $before_update = array('check_member','performImport');
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();
	
    public function __construct(){
        parent::__construct();
		$this->loadCss('../common/loadcss/solr/bootstrap-progressbar-2.3.2.css');
		$this->load->library('encrypt');
		$this->load->library('cookie');
		$this->encrypt = new CI_Encrypt();

		//ssh library
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
    	$aryCondition = array();
    	
    	if(!empty($this->postData)){
    		 //search
			 			
			if($this->postData['createdId']!=''){
    		 	$aryCondition['like'][] =  array("mt.createdId"=>$this->postData['createdId']);
    		 }
			if($this->postData['createdTime']!=''){
				$updatedTime = $this->postData['createdTime'];
				$date = explode('|', $updatedTime );
				$start = trim($date[0]);
				$end = ($date[1])? trim($date[1]) : trim($date[0]);
				$aryCondition['and'][] =  "(DATE_FORMAT(mt.createdTime,'%Y-%m-%d') >='$start' AND DATE_FORMAT(mt.createdTime,'%Y-%m-%d') <= '$end')";
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
    protected function _getDataList($aryCondition=array(),$start='',$sort){
		if( !$sort['updatedTime'] ){
			$sort['updatedTime'] = 'DESC';
		}
    	return  parent::_getDataList(
			$aryCondition,$start,$sort,
			array(
				'select'=>'mt.*,m.firstName,m.lastName','created'=>true,
				'join'=>array(
					array('sys_member as m','m.memberId=mt.createdId','left')
				)
			)
		);
    	
    }

	protected function check_member(){

		$aryData = array('ok' => true,'smessage'=>'','serror'=>'');
		$postData = $this->postData;
		$login = $this->LoginData;
		unset($this->postData['password']);
		if( $this->LoginData->password != password( $postData['password'] ) ){
			//debug( password( $this->postData['password'] ) );
			$aryData['ok'] = false;
			$aryData['serror'] .= __('LBL_PASSWORD_INCORRECT');
			return $aryData;
		}else{
			if(  $postData['backup_id']  ){
				$data = $this->model->get( $postData['backup_id'] );
				//$postData['note_new'] = str_replace(array('"',"'"),'',$postData['note_new'] );
				$postData['note_new'] = $postData['note_new'] !=''? $postData['note_new']:'';
				$arrNote = array();
				$arrNote[] = array('action'=>__('LBL_ROLL_BACK'),'memberId'=>$login->memberId,'createdDate'=>date('Y-m-d H:i:s'),'username'=>$login->username,'email'=>$login->email,'note'=>$postData['note_new']);
				if($data->note){
					$noteOld = json_decode($data->note,true);
					if( !empty( $noteOld ) ){
						foreach( $noteOld as $key=>$value )
							$arrNote[] = $value;
					}
				}

				$this->postData['note'] = json_encode( $arrNote );
				unset($this->postData['note_new']);
			}else{

				$note = json_encode(array( array('action'=>__('LBL_DEPLOY'),'memberId'=>$login->memberId,'createdDate'=>date('Y-m-d H:i:s'),'username'=>$login->username,'email'=>$login->email,'note'=>$postData['note'])));
				$this->postData['note'] = $note;
			}
		}
		if( $this->session->userdata('note') ){
			$this->session->unset_userdata('note');
		}
		$this->session->set_userdata('note',$this->postData['note']);

		return $aryData;
	}

	protected function create_backup(){
		$aryData = array('ok' => true,'smessage'=>'','serror'=>'');
		$this->load->helper('file');
		$CI = &get_instance();
		$date = date("Ymd");

		$path = UPLOAD_DIR."backup_database/" . $date . "/";
		if (!file_exists($path)) {
			mkdir($path, 0777,true);
		}

		$CI->db2 = $CI->load->database('ypsolr2', TRUE);
		$this->CI = $CI;
		$this->db2 = $CI->db2;
		$result = shell_backup_sql( $this->db2 );// call shell get data backup

		if( !$result['ok'] ){
			$aryData['ok'] = false;
			$aryData['serror'] = $result['serror'];
			return $aryData;
		}else {
			$file_backup =  $path.date("Ymd_His").'_solr.sql';
			$ok = write_file($file_backup, $result['result'] );
			$aryData['ok'] = $ok;
			$aryData['file'] = $file_backup;
			if(!$ok){
				$aryData['serror'] = __("ERR_CANNOT_WRITE_BACKUP_FILE");
			}

		}

		return $aryData;
	}

	protected function performImport($id){
		$aryData = array('ok' => true,'smessage'=>'','serror'=>'');
		$CI = &get_instance();
		$CI->db2 = $CI->load->database('ypsolr2', TRUE);
		$this->CI = $CI;
		$this->db2 = $CI->db2;
		$item = $this->model->get($id);

		$urlImport = FCPATH.$item->backup_file;

		$resultImport = shell_import_sql( $this->db2, $urlImport );//call shell perform import

		if( !$resultImport['ok'] ){
			$aryData['ok'] = false;
			$aryData['serror'] = $resultImport['serror'];
			return $aryData;
		}


		return $aryData;
	}


	public function doBackup( $step = null ){
		$aryData = array('ok'=>true,'smessage'=>'','serror'=>'','urlLoadList'=>site_url('system/backup/getList'));
		$aryData['smessage'] = __("LBL_GENERATE_FILE_BACKUP");
		if( isset($this->postData['note_new']) ){
			$this->session->set_userdata('note_new',$this->postData['note_new']);
		}

		switch( intval( $step ) ){
			case 0:
				$aryData['percent'] = 10;
				break;
			case 1:
				$aryData['percent'] = ($step)*20;
				break;
			case 2:
				$aryData['percent'] = ($step)*20;
				break;
			case 3:
				$aryData['percent'] = ($step)*20;
				break;
			case 4:
				$aryData['percent'] = ($step)*20;
				break;
			case 5:
				$aryData['percent'] = ($step)*20;
				$login = $this->LoginData;
				$result = $this->create_backup();
				$note = $this->session->userdata('note_new');

				$history = array(
					'backup_file' => $result['file'],
					'note' => !empty($note)? $note :'--',
					'createdTime' => date('Y-m-d H:i:s'),
					'updatedTime' => date('Y-m-d H:i:s'),
					'createdId' => $this->LoginData->memberId,
					'updatedId' => $this->LoginData->memberId,
					'status' => ACTIVE,
				);
				$databackup = $this->model->add('backup_restore',$history);
				if( $databackup ){
					$data_before = $this->model->get( $databackup );
					if(!empty($data_before)){
						$data_before->comment = 'Create backup by '.$login->firstName.' '.$login->lastName;
					}
					$logData = array(
						'comment' =>
							sprintf( __('MSG_BACKUP_DATABASE_AT'), $login->firstName.' '.$login->lastName, formatDate($history['createdTime'] ) )
					);
					$this->model->addLog($logData);
				}

				if( $result['ok'] ){
					$aryData['smessage'] = __("LBL_COMPLETED");
				}else{
					$aryData['serror'] = $result['serror'];
					$aryData['ok'] = false;
				}
				break;
		}
		echo json_encode($aryData);
	}



	public function verifyRestore()
	{
		$aryData = array('ok'=>true);
		$this->session->set_userdata('RESTORE_OPTION',$this->postData);
		$this->session->set_userdata('RESTORE_DATA_PERMISSION', true);
		echo json_encode($aryData);
	}

	public function update($step = null){
		return $this->doBackup($step);
	}
	public function doRestore($step = null){
		$aryData = array('ok'=>true,'percent'=>1,'smessage'=>'','serror'=>'');
		$restore_data = $this->session->userdata('RESTORE_OPTION');
		$permission = $this->session->userdata('RESTORE_DATA_PERMISSION');
		if($restore_data['backup_id'] && $permission){
			switch( intval( $step ) ) {
				case 0:
					$deploy_detail = $this->model->get($restore_data['backup_id'], array('from' => 'backup_restore'));
					if( !empty( $deploy_detail ) ){
						$path =$urlImport = FCPATH.$deploy_detail->backup_file;
						if (!file_exists($path)) {
							$aryData['ok'] = false;
							$aryData['serror'] = __("File backup isn't exits!");
						}
						//file_exists($path_file)
					}
					$aryData['percent'] = 5;
					break;
				case 1:
					$aryData['percent'] = ($step) * rand(10,20);
					break;
				case 2:
					$aryData['percent'] = ($step) * rand(10,20);
					break;
				case 3:
					$aryData['percent'] = ($step) * rand(10,20);
					break;
				case 4:
					$aryData['percent'] = ($step) * rand(10,20);
					break;
				case 5:
					//update history
					$words = array(
						//'note' => $restore_data['note'],
						'updatedTime' => date('Y-m-d H:i:s'),
						'updatedId' => $this->LoginData->memberId,
						'status' => ACTIVE,
					);
					$login = $this->LoginData;
					$this->model->update('backup_restore', $words, array('backup_id' => $restore_data['backup_id']));
					//write log
					$deploy_detail = $this->model->get($restore_data['backup_id'], array('from' => 'backup_restore'));
					$logData = array(
						'comment' =>
							sprintf( __('MSG_RESTORED_DATABASE_AT'), $login->firstName.' '.$login->lastName, formatDate(date('Y-m-d H:i:s') ) )
					);
					$this->model->addLog($logData);

					//restore backup Database
					$resultImport = $this->performImport($restore_data['backup_id']);
					if (!$resultImport['ok']) {
						$aryData['ok'] = false;
						$aryData['serror'] = $resultImport['serror'];
					} else {

						$aryData['ok'] = true;
						setDeployFlag(1);
						setDBConfig('DEPLOY_DATE',date("Y-m-d H:i:s"));
						//completed
						$aryData['percent'] = ($step) * 20;
						$aryData['smessage'] = __('LBL_RESTORE_SUCCESS');
					}
				break;
			}

		}else{
			$aryData['ok'] = false;
			$aryData['serror'] = __("ERR_YOU_HAVENT_PERMISSION");
		}

		echo json_encode( $aryData );
	}
	public function download($id,$down= false){
		$this->load->helper('download');
		$aryData = array('ok'=>true,'smessage'=>'','serror'=>'','result'=>'');
		$item = $this->model->get( $id );
		$urlDownload = FCPATH.$item->backup_file;
		if($down){
			force_download('solr_backup_'.date("YmdHis",strtotime($item->createdTime)).'.sql',file_get_contents($urlDownload));
		}else{
			if( file_exists( $urlDownload ) ){
				// Read the file's contents
				$aryData['file']= site_url('system/backup/download/'.$id.'/get');
			} else {
				$aryData['ok'] = false;
				$aryData['serror'] = __('LBL_DOWNLOAD_FAILED_NOT_FOUND');
			}

		}

		echo json_encode($aryData);
	}
}

//end of Backup