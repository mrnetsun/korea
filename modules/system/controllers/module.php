<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Module extends Admin_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'module_model';
	/**
	 * 
	 * @var Module_Model
	 */
	public $model;
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	
	//action insert
	protected $before_insert = array('call_before_insert');
	protected $after_insert = array('call_after_insert');
	
	//action update
	protected $before_update = array();
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();
	
    public function __construct(){
        parent::__construct();  
        
    }
    
    protected function call_before_insert(){
    	$aryData = array();
    	$ok = true;
    	
    	if(file_exists(MODULEPATH.$this->postData['modulePath'])){
    		$ok = false;	
    		$aryData ['serror'] = __("Folder [".$this->postData['modulePath']."] is existed!");
    	}
    	
    	if(!checkValidName($this->postData['modulePath'])){
    		$ok = false;
    		$aryData ['serror'] = __("Sorry this name [".$this->postData['modulePath']."] can not be used!");
    	}
    	
    	$aryData ['ok'] = $ok;
    	return $aryData;
    }
    
    
    protected function call_after_insert(){
    	
    	$controller = $this->postData['modulePath'];
    	$tableName = $this->postData['tableName'];
    	$primaryKey = $this->postData['primaryKey'];
    	//make module folder
    	$params = array(
    			'modulePath' => $this->postData['modulePath'],
    			'controller' =>$controller,
    			'tableName'=>$tableName,
    			'primaryKey'=>$primaryKey,
    			'addEditRow'=>$this->input->post('addEditRow'),
    			'listSearchRow'=>$this->input->post('listSearchRow')
    	);
    	createModule($params);
    	
    }
    
    
    public function insert(){
    	$aryData = parent::insert(true);
    	if(!$aryData['ok']){ 
    		$this->session->set_flashdata('error', $aryData['serror']);
    	}else{
    		$this->session->set_flashdata('message',$aryData['smessage']);
    	}
    	redirect('system/module');
    }
    
    protected function _buildCondition(){
    	$aryCondition = array();
    	 
    	if(!empty($this->postData)){
    		if($this->postData['moduleName']){
    			$aryCondition['like'] =  array("moduleName"=>$this->postData['moduleName']);
    		}
    	}
    	return $aryCondition;
    }
    
    protected function _getDataList($aryCondition=array(),$start='',$sort=array()){
    	return $this->model->_getModuleList($aryCondition,$this->pagingConfig['per_page'],$start,$sort);
    }
    
    public  function checkTable(){
    	$tableName = $this->input->post('tableName');
    	$ok = $this->model->checkTable($tableName);
    	if(!$ok){
    		$aryData['serror'] = __("Table [$tableName] is not existed.");
    	}
    	
    	$aryData = array('ok'=>$ok);
    	echo json_encode($aryData);
    }
    
    public function getTableField($tableName=''){
    	if(!$tableName) $tableName = $this->input->post('tableName');
    	$aryData = array('ok'=>true);
    	
    	if(!$tableName){
    		$ok = false;
    		$aryData['serror'] = __('Invalid input data.');
    		echo json_encode($aryData);
    		return;
    	}
    	
    	$ok = $this->model->checkTable($tableName);
    	
    	if($ok){
    		$aryData['data'] = $this->model->getTableField($tableName);
    	}else{
    		$aryData['serror'] = __("Table [$tableName] does not existed!");
    	}
	
    	$aryData['ok'] = $ok;
    	
    	echo json_encode($aryData);
    }
    
    public function getConfigAddEdit(){
    	$tableField = $this->input->post('tableField1');
    	$this->template->set('tableField',$tableField);
    	$this->baseView('system/modules/addEditConfigElements'); 
    }
    
    public function getConfigListSearch(){
    	$tableField = $this->input->post('tableField2');
    	//debug($tableField);
    	$this->template->set('tableField',$tableField);
    	$this->baseView('system/modules/listSearchConfigElements');
    }
    
    public  function getControllerForm($moduleId){
    	$module = $this->model->get($moduleId);
    	$this->template->set('fillData',$module);
    	$this->view('system/modules/addController');
    }
    
    public function checkControllerName(){
    	$controller = $this->input->post('controllerName');
    	$module = $this->input->post('modulePath');
    	
    	$ok = true; 
    	$aryData = array();
    	
    	
    	if(!$controller || !$module){
    		$ok = false;
    		$aryData['serror'] = __('Invalid input data.');
    		echo json_encode($aryData);
    		return;
    	}    	
    	
    	$aryController = getControllerFiles($module);
    	foreach($aryController as $item){
    		if(strtolower($item[0]) == strtolower($controller)){
    			$ok = false;
    			$aryData['serror'] = __("Controller [$controller] is existed!");
    			break;
    		}
    	}
    	
    	if($ok){
    		$ok = checkValidName($controller);
    		if(!$ok){
    			$aryData['serror'] = __("Invalid a controller name.");	
    		}
    	}
    	
    	$aryData['ok'] = $ok;
    	
    	echo json_encode($aryData);
    }
    
    public function addController(){
    	$module = $this->model->get($this->postData['moduleId']);
    	$controller = $this->postData['controllerName'];
    	$tableName = $this->postData['tableName'];
    	$primaryKey = $this->postData['primaryKey'];
    	
    	$params = array(
    			'modulePath' => $module->modulePath,
    			'controller' =>$controller,
    			'tableName'=>$tableName,
    			'primaryKey'=>$primaryKey,
    			'addEditRow'=>$this->input->post('addEditRow'),
    			'listSearchRow'=>$this->input->post('listSearchRow')
    	);
    	
    	createController($params);

		//add resource
		$this->model->add('sys_resource',array(
			'moduleId'=>$module-> $module->modulePath,
			'resource_name'=>$module->modulePath.'/'.$controller,
			'resource_code'=>$module->modulePath.'/'.$controller,
			'permissions'=>'["full","listview","add","edit","delete"]',
			'status'=>1
		));
    	
    	//add menu
    	/*$this->model->add('sys_menu',
    						array('menuName'=>$controller,
    								'menuLink'=>$module->modulePath.'/'.$controller,
    								'moduleId'=>$module->modulePath,
    								'status'=>1,
    								'createdId'=>$this->LoginData->memberId,
    								'createdTime'=>date("Y-m-d H:i:s")
    								));*/
    	
    	redirect(site_url('system/module/detail/'.$module->moduleId));
    }
    
   }