<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Questioncategory extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'questioncategory_model';
	/**
	 * 
	 * @var Questioncategory_Model
	 */
	public $model;
	
	

	/**
	 * Questioncategory controller 
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
			 			
			if($this->postData['cate_id']!=''){
    		 	$aryCondition['like'][] =  array("mt.cate_id"=>$this->postData['cate_id']);
    		 }			
			if($this->postData['cate_name']!=''){
    		 	$aryCondition['like'][] =  array("mt.cate_name"=>$this->postData['cate_name']);
    		 }			
			if($this->postData['parent_id']!=''){
    		 	$aryCondition['like'][] =  array("mt.parent_id"=>$this->postData['parent_id']);
    		 }			
			if($this->postData['status']!=''){
    		 	$aryCondition['like'][] =  array("mt.status"=>$this->postData['status']);
    		 }			
			if($this->postData['createdTime']!=''){
    		 	$aryCondition['like'][] =  array("mt.createdTime"=>$this->postData['createdTime']);
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
		return  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*,c.cate_name as parent_name'
		,'join'=>array(array('question_category c','c.parent_id = mt.cate_id','left'))
		,'created'=>true));
    	
    }
	
 
}

//end of Questioncategory