<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Roles extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'roles_model';
	/**
	 * 
	 * @var Roles_Model
	 */
	public $model;
	
	

	/**
	 * Roles controller 
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
			 			
			if($this->postData['roleName']){
    		 	$aryCondition['like'] =  array("roleName"=>$this->postData['roleName']);
    		 }			
			if($this->postData['moduleId']){
    		 	$aryCondition['and'] =  array("moduleId"=>$this->postData['moduleId']);
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
    	return  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*','created'=>true,'updated'=>true));
    	
    }
	
 
}

//end of Roles