<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Log extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'log_model';
	/**
	 * 
	 * @var Log_Model
	 */
	public $model;


	/**
	 * Log controller 
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
		$CI = &get_instance();
		$this->CI = $CI;

    }
    
    
    /**
	 * Build a Condition where for search 
	 * @return mixed:
	*/
    protected function _buildCondition(){
    	$aryCondition = array();
    	
    	if(!empty($this->postData)){
    		 //search
			if($this->postData['controller']!=''){
    		 	$aryCondition['like'][] =  array("mt.controller"=>$this->postData['controller']);
    		 }
			if($this->postData['type']!=''){
				$aryCondition['and'][] =  array("mt.type"=>intval($this->postData['type']));
			}


			if($this->postData['actor']!=''){
    		 	$aryCondition['like'][] =  array("mt.actor"=>$this->postData['actor']);
    		 }			
			if($this->postData['updatedTime']!=''){
				$updatedTime = $this->postData['updatedTime'];
				$date = explode('|', $updatedTime );
				$start = trim($date[0]);
				$end = ($date[1])? trim($date[1]) : trim($date[0]);
				$aryCondition['and'][] =  "(DATE_FORMAT(mt.updatedTime,'%Y-%m-%d') >='$start' AND DATE_FORMAT(mt.updatedTime,'%Y-%m-%d') <= '$end')";
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
    protected function _getDataList($aryCondition=array(),$start='',$sort ){
		if( !$sort['updatedTime'] ){
			$sort['updatedTime'] = 'DESC';
		}
		$rows = parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*'));
//		debug($this->db->last_query());
		$rows=$this->mergeGetList($rows);
		return $rows;
    }
}

//end of Log