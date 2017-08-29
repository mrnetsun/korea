<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Region extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'region_model';
	/**
	 * 
	 * @var Region_Model
	 */
	public $model;
	
	

	/**
	 * Region controller 
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
			 			
			if($this->postData['region_code']!=''){
    		 	$aryCondition['and'][] =  array("region_code"=>$this->postData['region_code']);
    		 }			
			if($this->postData['region_name']!=''){
    		 	$aryCondition['like'][] =  array("region_name"=>$this->postData['region_name']);
    		 }			
			if($this->postData['country_code']!=''){
    		 	$aryCondition['and'][] =  array("country_code"=>$this->postData['country_code']);
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
    	return  parent::_getDataList($aryCondition,$start,$sort,
    			array('select'=>'mt.*,c.nicename',
    					'join'=>array(array('country as c','c.iso = mt.country_code','left')),
    					'created'=>true));
    	
    }
	
 
}

//end of Region