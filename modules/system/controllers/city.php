<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class City extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'city_model';
	/**
	 * 
	 * @var City_Model
	 */
	public $model;
	
	

	/**
	 * City controller 
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
			 			
			if($this->postData['location']!=''){
    		 	$aryCondition['like'][] =  array("mt.location"=>$this->postData['location']);
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
    	return  parent::_getDataList($aryCondition,$start,$sort);
    	
    }
	
 
}

//end of City