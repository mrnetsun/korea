<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Country extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'country_model';
	/**
	 * 
	 * @var Country_Model
	 */
	public $model;
	
	

	/**
	 * Country controller 
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
			 			
			if($this->postData['iso']!=''){
    		 	$aryCondition['like'][] =  array("iso"=>$this->postData['iso']);
    		 }			
			if($this->postData['nicename']!=''){
    		 	$aryCondition['like'][] =  array("nicename"=>$this->postData['nicename']);
    		 }			
			if($this->postData['phonecode']!=''){
    		 	$aryCondition['and'][] =  array("phonecode"=>$this->postData['phonecode']);
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

//end of Country