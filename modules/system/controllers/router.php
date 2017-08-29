<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Router extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'router_model';
	/**
	 * 
	 * @var Router_Model
	 */
	public $model;
	
	

	/**
	 * Router controller 
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
			 			
			if($this->postData['slug']!=''){
    		 	$aryCondition['like'][] =  array("mt.slug"=>$this->postData['slug']);
    		 }			
			if($this->postData['controller']!=''){
    		 	$aryCondition['like'][] =  array("mt.controller"=>$this->postData['controller']);
    		 }			
			if($this->postData['status']!=''){
    		 	$aryCondition['like'][] =  array("mt.status"=>$this->postData['status']);
    		 }			
			if($this->postData['updatedTime']!=''){
    		 	$aryCondition['like'][] =  array("mt.updatedTime"=>$this->postData['updatedTime']);
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

//end of Router