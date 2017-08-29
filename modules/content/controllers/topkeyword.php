<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Topkeyword extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'topkeyword_model';
	/**
	 * 
	 * @var Topkeyword_Model
	 */
	public $model;
	
	

	/**
	 * Topkeyword controller 
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
			 			
			if($this->postData['keyword']!=''){
    		 	$aryCondition['like'][] =  array("mt.keyword"=>$this->postData['keyword']);
    		 }			
			if($this->postData['url']!=''){
    		 	$aryCondition['like'][] =  array("mt.url"=>$this->postData['url']);
    		 }			
			if($this->postData['target']!=''){
    		 	$aryCondition['like'][] =  array("mt.target"=>$this->postData['target']);
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

//end of Topkeyword