<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Resource extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'resource_model';
	/**
	 * 
	 * @var Resource_Model
	 */
	public $model;
	
	

	/**
	 * Resource controller 
	 */
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	protected $after_edit = array();
	
	//action insert
	protected $before_insert = array('prepare_update_cb');
	protected $after_insert = array();
	
	//action update
	protected $before_update = array('prepare_update_cb');
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();
	
    public function __construct(){
        parent::__construct();  
        
    }
    
    protected function prepare_update_cb(){
    	$aryData = array('ok'=>true);
    	$this->postData['resource_code'] = strtolower($this->postData['resource_code']);
    	$this->postData['permissions'] = json_encode($this->postData['permissions']);
    	return $aryData;
    }
    
    /**
	 * Build a Condition where for search 
	 * @return mixed:
	*/
    protected function _buildCondition(){
    	$aryCondition = array();
    	
    	if(!empty($this->postData)){
    		 //search
			 			
			if($this->postData['moduleId']!=''){
    		 	$aryCondition['and'][] =  array("moduleId"=>$this->postData['moduleId']);
    		 }			
			if($this->postData['resource_name']!=''){
    		 	$aryCondition['like'][] =  array("resource_name"=>$this->postData['resource_name']);
    		 }			
			if($this->postData['resource_code']!=''){
    		 	$aryCondition['like'][] =  array("resource_code"=>$this->postData['resource_code']);
    		 }			
					
			if($this->postData['status']!=''){
    		 	$aryCondition['and'][] =  array("LBL_STATUS"=>$this->postData['status']);
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
    	return  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*','created'=>true));
    	
    }


	
 
}

//end of Resource