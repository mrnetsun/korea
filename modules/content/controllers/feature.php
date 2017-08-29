<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Feature extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'feature_model';
	/**
	 * 
	 * @var Feature_Model
	 */
	public $model;
	
	

	/**
	 * Feature controller 
	 */
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	protected $after_edit = array();
	
	//action insert
	protected $before_insert = array('prepare_data');
	protected $after_insert = array();
	
	//action update
	protected $before_update = array('prepare_data');
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();
	
    public function __construct(){
        parent::__construct();  
        
    }

	protected function prepare_data(){
		$aryData = array('ok'=>true);

		if(!$this->postData['start_date']) $this->postData['start_date'] = null;
		else $this->postData['start_date'] = strtosqltime($this->postData['start_date']);
		if(!$this->postData['end_date']) $this->postData['end_date'] = null;
		else $this->postData['end_date'] = strtosqltime($this->postData['end_date']);

		return $aryData;
	}
    
    
    /**
	 * Build a Condition where for search 
	 * @return mixed:
	*/
    protected function _buildCondition(){
    	$aryCondition = array();
    	
    	if(!empty($this->postData)){
    		 //search
			if($this->postData['company_id']!=''){
				$aryCondition['and'][] =  array("mt.company_id"=>$this->postData['company_id']);
			}
			if($this->postData['company_name']!=''){
				$aryCondition['like'][] =  array("mt.company_name"=>$this->postData['company_name']);
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
    	return  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*','created'=>true));
    	
    }
	
 
}

//end of Feature