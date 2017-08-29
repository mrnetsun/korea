<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Testcategory extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'testcategory_model';
	/**
	 * 
	 * @var Testcategory_Model
	 */
	public $model;
	
	

	/**
	 * Testcategory controller 
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
			 			
			if($this->postData['cate_test_id']!=''){
    		 	$aryCondition['and'][] =  array("mt.cate_test_id"=>$this->postData['cate_test_id']);
    		 }			
			if($this->postData['cate_name']!=''){
    		 	$aryCondition['like'][] =  array("mt.cate_name"=>$this->postData['cate_name']);
    		 }			
			if($this->postData['parent_id']!=''){
    		 	$aryCondition['and'][] =  array("mt.parent_id"=>$this->postData['parent_id']);
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
    	$rows =  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*,c.cate_name as parent_name',
			'join'=>array(array('test_category as c','c.cate_test_id = mt.parent_id','left')),
			'created'=>true));
    	return $rows;
    }
	
 
}

//end of Testcategory