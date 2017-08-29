<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Content extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'content_model';
	/**
	 * 
	 * @var Content_Model
	 */
	public $model;
	
	

	/**
	 * Content controller 
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
			 			
			if($this->postData['title']!=''){
    		 	$aryCondition['like'][] =  array("mt.title"=>$this->postData['title']);
    		 }			
			if($this->postData['content']!=''){
    		 	$aryCondition['like'][] =  array("mt.content"=>$this->postData['content']);
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

	public function add()
	{
		$this->loadJs('ckeditor/ckeditor.js');
		parent::add();
	}
	public function edit($id = '', $permission = 'all')
	{
		$this->loadJs('ckeditor/ckeditor.js');
		parent::edit($id, $permission);
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

//end of Content