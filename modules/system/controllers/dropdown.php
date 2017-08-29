<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Dropdown extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'dropdown_model';
	/**
	 * 
	 * @var Dropdown_Model
	 */
	public $model;
	
	

	/**
	 * Dropdown controller 
	 */
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	
	//action insert
	protected $before_insert = array('before_save');
	protected $after_insert = array();
	
	//action update
	protected $before_update = array('before_save');
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
    		 //sustomer code
    		if($this->postData['moduleId']){
    			$aryCondition['and'] =  array("mt.moduleId"=>$this->postData['moduleId']);
    		}
    		
    		if($this->postData['dropdownName']){
    			$aryCondition['like'] =  array("dropdownName"=>$this->postData['dropdownName']);
    		}
    		
    		if($this->postData['dropdownCode']){
    			$aryCondition['and'] =  array("dropdownCode"=>$this->postData['dropdownCode']);
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
    protected function _getDataList($aryCondition=array(),$start='',$sort = array()){
    	//customer code
    	
    	return $this->model->_getDropdownList($aryCondition,$this->pagingConfig['per_page'],$start,$sort);
    }
    
    public  function before_save(){
    	
    	$aryData = array('ok'=>true);
    	$aryItem = array();
    	
    	foreach($this->postData['value'] as $key=>$val){
    		if(trim($val) !== '' && trim($this->postData['text'][$key]) !==''){
    			$aryItem[] = array('value'=>$val,'text'=>$this->postData['text'][$key]);
    		}
    	}
    	
    	$this->postData['value'] = json_encode($aryItem);
    	    	
    	//check existed
    	$where = array('dropdownCode'=>$this->postData['dropdownCode']);
    	if($this->postData['dropdownId']){
    		$where['dropdownId !='] = $this->postData['dropdownId'];
    	}
    	$row = $this->model->find_where('LBL_FIRST',
    			$where
    	);
    	if($row){
    		$aryData['ok'] = false;
    		$aryData['serror'] = __("The code is existed.");
    	}    	
    	return $aryData;
    }
    /**
     * Check duplicate dropdown Code
     */
    public function checkDuplicate(){
    	$code = strtoupper($this->input->post('code'));    	
    	$dropdownId = $this->input->post('dropdownId');
    	$aryData = array('ok'=>true);
    	if($code){
    		$aryWhere = array('dropdownCode'=>$code);
    		if($dropdownId) $aryWhere['dropdownId !='] = $dropdownId;
    	
    		$isExits = $this->model->find_where('',$aryWhere);
    		if($isExits){
    			$aryData['ok'] = false;
    			$aryData['serror'] = __("The [$code] is in used.");
    		}
    	}    	 
    	echo json_encode($aryData);
    }
    
 
}

//end of Dropdown