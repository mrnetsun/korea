<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Role extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'role_model';
	/**
	 * 
	 * @var Role_Model
	 */
	public $model;
	
	

	/**
	 * Role controller 
	 */
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	protected $after_edit = array();
	
	//action insert
	protected $before_insert = array('checkDuplicate');
	protected $after_insert = array();
	
	//action update
	protected $before_update = array('checkDuplicate');
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();
	
    public function __construct(){
        parent::__construct();  
        
    }

	protected function sort_input_data($input_data){
		$input=explode(",",$input_data);

		$arr_input=array();
		foreach($input as $key=>$val){
			$arr_val=explode(" ", $val);
			if (count($arr_val))foreach($arr_val as $key=>$w){
				if($w==="")unset($arr_val[$key]);
			}
			$str_val=implode(" ",$arr_val);
			if($str_val) $arr_input[]= $str_val;
		}
		asort($arr_input);

		$str_input=implode(",",$arr_input);
		if(substr($str_input, 0,1) == ",") $str_input=substr($str_input, 1, strlen($str_input));
		return $str_input;
	}

	protected function checkDuplicate()
	{
		$aryData = array('ok' => true);
		$this->postData['roleName'] = $this->sort_input_data(trim($this->postData['roleName']));
		$roleName = $this->postData["roleName"];
		if (isset($this->postData['roleId'])) {
			$arr_duplicate = $this->model->find_where('', array('roleName' => $roleName,'roleId !='=>$this->postData['roleId']) );
		}else{

			$arr_duplicate = $this->model->find_where('', array('roleName' => $roleName ) );
		}

		$is_duplicate=($arr_duplicate->roleId) ? 1:0;

		if($is_duplicate){
			$aryData['ok'] = false;
			$aryData['serror'] = __('Role is existed.');
			return $aryData;
		}
		return $aryData;
	}


	public function listItem($roleId){
		 
		$roleId = intval($roleId);
		$canReadRecord=$this->do_read_record($roleId);
		if($canReadRecord){
			$role = $this->model->find_where('',array('roleId'=>$roleId),array('from'=>'sys_role'));
			$this->template->set('role',$role);
			$roles = $this->model->find_where('list',array(),array('from'=>'sys_role'));
			$this->template->set('roles',$roles);

			$data = $this->model->find_where('list',array('status'=>ACTIVE,'permision_role_id'=> NULL),
					array(
							'select'=>'*',
							'from'=>'sys_resource','fixed_sort'=>'rposition ASC'
					,'join'=>array(
							array('sys_role_permision as p','p.resourceId = mt.resource_id AND p.roleId = '.$roleId,'left')
					)
					));

			foreach($data as $d){
				$this->model->add('sys_role_permision',
						array('roleId'=>$roleId,
								'resourceId'=>$d->resource_id,
								'position'=>$d->rposition,'updatedTime'=>date("Y-m-d H:i:s")));
			}


			$resource = $this->model->find_where('list',array('status'=>ACTIVE),
					array(
							'select'=>'*',
						//'from'=>'sys_resource','fixed_sort'=>'rposition ASC'
							'from'=>'sys_resource','fixed_sort'=>'resource_name ASC'
					,'join'=>array(
							array('sys_role_permision as p','p.resourceId = mt.resource_id AND p.roleId = '.$roleId,'left')
					)
					));
			$this->template->set('resource',$resource);
			$this->view('permissions/index');
		}else{
			$this->session->set_flashdata('notice',__("LBL_ALREADY_READ"));
			redirect("member/role");
		}

	}

	public function updatePermission($roleId){
		$aryData = array('ok'=>true,'smessage'=>__('MSG_UPDATE_SUCCESSFUL'),'serror'=>__('ERR_CANNOT_SAVE'));
		$resource = $this->postData['resource'];
		$this->db->trans_start();
		$canWriteRecord=$this->do_write_record($roleId);
		if($canWriteRecord){
			foreach($resource as $rId){
				$full = intval($this->postData['full'][$rId]);
				$listView = intval($this->postData['listview'][$rId]);
				$add = intval($this->postData['add'][$rId]);
				$edit = intval($this->postData['edit'][$rId]);
				$delete = intval($this->postData['delete'][$rId]);
				$data = array('full'=>$full,'listView'=>$listView,'add'=>$add,'edit'=>$edit,'delete'=>$delete);
				$this->model->update('sys_role_permision',$data,array('permision_role_id'=>$rId));
			}

			//update session
			$this->load->model('auth/auth_model');
			$this->LoginData->permission = $this->auth_model->getMemberPermision($this->LoginData);
			$this->session->set_userdata('LoginData',$this->LoginData);

			$this->db->trans_complete();
			if($this->db->trans_status() === false){
				$aryData['ok'] = false;
			}
		}else{
			$aryData['ok'] = false;
			$aryData ['serror'] = __("LBL_ALREADY_READ");
		}
		if($aryData['ok']){
			$aryData['url_reload']=site_url('member/role/');
			$this->session->set_flashdata('message',__('MSG_UPDATE_SUCCESSFUL'));
		}
		echo json_encode($aryData);
	}
    
    /**
	 * Build a Condition where for search 
	 * @return mixed:
	*/
    protected function _buildCondition(){
    	$aryCondition = array();
    	
    	if(!empty($this->postData)){
    		 //search
			 			
			if($this->postData['roleName']!=''){
    		 	$aryCondition['like'][] =  array("mt.roleName"=>$this->postData['roleName']);
    		 }			
			if($this->postData['status']!=''){
    		 	$aryCondition['and'][] =  array("mt.status"=>$this->postData['status']);
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
		$rows=  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*','created'=>true));
		$rows = $this->mergeGetList($rows);
		return $rows;
    }
	
 
}

//end of Role