<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Solrclass extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'solrclass_model';
	/**
	 * 
	 * @var Solrclass_Model
	 */
	public $model;
	
	

	/**
	 * Solrclass controller 
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
			 			
			if($this->postData['className']!=''){
    		 	$aryCondition['like'][] =  array("mt.className"=>$this->postData['className']);
    		 }			
			if($this->postData['status']!=''){
    		 	$aryCondition['and'][] =  array("mt.status"=>$this->postData['status']);
    		 }			
			if($this->postData['base']!=''){
    		 	$aryCondition['and'][] =  array("mt.base"=>ACTIVE);
    		 }
			if($this->postData['filter']!=''){
				$aryCondition['and'][] =  array("mt.filter"=>ACTIVE);
			}
			if($this->postData['tokenizer']!=''){
				$aryCondition['and'][] =  array("mt.tokenizer"=>ACTIVE);
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
    	return  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*'));
    	
    }

	public function insert(){
		$this->postData['classParam'] = json_encode($this->postData['classParam']);
		$aryData = parent::insert(true);
		echo json_encode($aryData);
	}

	public function update($id=''){
		$this->postData['classParam'] = json_encode($this->postData['classParam']);
		$aryData =  parent::update($id,true);
		echo json_encode($aryData);
	}
	
 
}

//end of Solrclass