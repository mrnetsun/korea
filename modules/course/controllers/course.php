<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Course extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'course_model';
	/**
	 * 
	 * @var Course_Model
	 */
	public $model;
	
	

	/**
	 * Course controller 
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
			 			
			if($this->postData['course_id']!=''){
    		 	$aryCondition['and'][] =  array("mt.course_id"=>$this->postData['course_id']);
    		 }			
			if($this->postData['title']!=''){
    		 	$aryCondition['like'][] =  array("mt.title"=>$this->postData['title']);
    		 }			
			if($this->postData['cate_id']!=''){
    		 	$aryCondition['and'][] =  array("mt.cate_id"=>$this->postData['cate_id']);
    		 }			
			if($this->postData['mentor']!=''){
    		 	$aryCondition['and'][] =  array("mt.mentor"=>$this->postData['mentor']);
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
    	$rows =  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*',
		'select'=>'mt.*,c.cate_name',
		'join'=>array(
			array('course_category as c','c.id = mt.cate_id','left')
		)
		,'created'=>true));
    	return $rows;
    }



}

//end of Course