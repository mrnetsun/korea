<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Importmember extends My_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'importmember_model';
	/**
	 * 
	 * @var Importmember_Model
	 */
	public $model;
	
	

	/**
	 * Importmember controller 
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
    
    public function index($input='',$type='checkbox',$role=''){
    	$this->session->unset_userdata(_getBaseName('getList.start'));
    	$this->session->unset_userdata(_getBaseName('getList.filter'));
    	
    	if(!$input) $input = 'input';
    	if($role){
    		$this->session->set_userdata('member.roleID',$role);
    	}else{
    		$this->session->unset_userdata('member.roleID');
    	}
    	$this->session->set_userdata('memberChoseType', $type);
    	$this->template->set('input',$input);
    	return parent::index();
    }
    
    public function getList($start=''){
    	$this->template->set('memberChoseType',$this->session->userdata('memberChoseType'));
    	return parent::getList($start);
    }
    public function getListTask($start=''){
        $this->template->set('memberChoseType',$this->session->userdata('memberChoseType'));
        $project_id = $this->session->userdata('project_id');
        return parent::getListTask($start,$project_id='');
    }
    /**
	 * Build a Condition where for search 
	 * @return mixed:
	*/
    protected function _buildCondition(){
    	$aryCondition = array();
		if($this->session->userdata('member.roleID')){
			
    		$roles = explode(',',$this->session->userdata('member.roleID'));
		}else{
			//debug($roles);
	    	
	    	switch($this->LoginData->roleId){
	    		case ROLE_ADMIN:
	    			//$aryCondition['and'][] = array('mt.departmentId'=>$this->LoginData->departmentId);
	    			$roles = array(ROLE_ADMIN,ROLE_SUBA,ROLE_TD,ROLE_MERCHANT,ROLE_VOLUN);
	    			break;
	    		case ROLE_SUBA:
	    			$aryCondition['and'][] = array('mt.departmentId'=>$this->LoginData->departmentId);
	    			$roles = array(ROLE_ADMIN,ROLE_SUBA,ROLE_TD,ROLE_MERCHANT,ROLE_VOLUN);
	    			break;
	    		case ROLE_TD:
	    			$aryCondition['and'][] = array('mt.departmentId'=>$this->LoginData->departmentId);
	    			$roles = array(ROLE_ADMIN,ROLE_SUBA,ROLE_MERCHANT,ROLE_VOLUN);
	    			break;
    			case ROLE_MERCHANT:
    				$aryCondition['and'][] = array('mt.departmentId'=>$this->LoginData->departmentId);
    				$roles = array(ROLE_ADMIN,ROLE_SUBA,ROLE_TD,ROLE_VOLUN);
    				break;
    			case ROLE_VOLUN:
    				$aryCondition['and'][] = array('mt.departmentId'=>$this->LoginData->departmentId);
    				$roles = array(ROLE_TD,ROLE_MERCHANT);
    				break;
	    		default:
	    			break;
	    	}
	    	
		}
    	
    	if(!empty($roles)){
    		$aryCondition['IN'] = array('mt.roleId'=>$roles);
    	}
    	if(!empty($this->postData)){
    		 //search
			 			
			if($this->postData['firstName']!=''){
    		 	$aryCondition['like'][] =  array("firstName"=>$this->postData['firstName']);
    		 }			
			if($this->postData['email']!=''){
    		 	$aryCondition['like'][] =  array("LBL_EMAIL"=>$this->postData['email']);
    		 }
    	}
    	return $aryCondition;
    }
    public function addMember($input='',$type='radio',$role='')
    {
        $this->session->unset_userdata(_getBaseName('getList.start'));
        $this->session->unset_userdata(_getBaseName('getList.filter'));

        if(!$input) $input = 'input';
        if($role){
            $this->session->set_userdata('member.roleID',$role);
        }else{
            $this->session->unset_userdata('member.roleID');
        }
        $this->session->set_userdata('memberChoseType', $type);
        $this->template->set('input',$input);
        if($this->model){
            $arySearch = $this->session->userdata(_getBaseName('getList.search'));
            $this->template->set('arySearch',$arySearch);

            $htmlList = Modules::run($this->controller.'/getList');
            $htmlList = str_replace('id="'._getName('Form').'"', 'id="'._getBaseName('GetList_Form').'"', $htmlList);
            $this->template->set('htmlList',$htmlList);
            $this->view($this->controller.'s/addMember');
        }


    }
    public function addMemberTask($input='',$type='radio',$role='')
    {
        $this->session->unset_userdata(_getBaseName('getList.start'));
        $this->session->unset_userdata(_getBaseName('getList.filter'));
        $project_id = $this->session->userdata('project_id');
        if(!$input) $input = 'input';
        if($role){
            $this->session->set_userdata('member.roleID',$role);
        }else{
            $this->session->unset_userdata('member.roleID');
        }
        $this->session->set_userdata('memberChoseType', $type);
        $this->template->set('input',$input);
        if($this->model){
            $arySearch = $this->session->userdata(_getBaseName('getList.search'));
            $this->template->set('arySearch',$arySearch);

            $htmlList = Modules::run($this->controller.'/getListTask');
            $htmlList = str_replace('id="'._getName('Form').'"', 'id="'._getBaseName('GetList_Form').'"', $htmlList);
            $this->template->set('htmlList',$htmlList);
            $this->view($this->controller.'s/addMemberTask');
        }


    }
    
	/**
	 * Get data for List screen
	 * @param array $aryCondition
	 * @param int $start
	 * @return mixed
	*/ 
    protected function _getDataList($aryCondition=array(),$start='',$sort= array()){
    	
    	$rows =  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*, r.roleName,mt.roleId as roleId','join'=>array(array('sys_role as r','r.roleId=mt.roleId','left'))));
    	//debug($this->db->last_query());
    	return $rows;
    	
    }
    protected function _getDataListTask($aryCondition=array(),$start='',$sort= array(),$project_id){

        $rows =  parent::_getDataListTask($aryCondition,$start,$sort,array('select'=>'mt.*, r.roleName,mt.roleId as roleId','join'=>array(array('sys_role as r','r.roleId=mt.roleId','left')),'join'=>array(array('project_users_project as pa','pa.users_id=mt.memberId','pa.project_id='.$project_id,'left'))));
        //debug($this->db->last_query());
        return $rows;

    }
	
 
}

//end of Importmember