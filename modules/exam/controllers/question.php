<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Question extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'question_model';
	/**
	 * 
	 * @var Question_Model
	 */
	public $model;
	
	

	/**
	 * Question controller 
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
	protected $after_view = array('get_category_name');
	
    public function __construct(){
        parent::__construct();  
        
    }

	protected function get_category_name($data){
		$data->category = $this->model->find_where('',array('cate_id'=>$data->cate_id),array('from'=>'question_category'));

		return array('ok'=>true,'fillData'=>$data);
	}

	public function add()
	{
		$this->loadJs('soundmanager/script/soundmanager2-nodebug-jsmin.js');
		$this->loadJs('ckeditor/ckeditor.js');
		parent::add();
	}
	public function edit($id = '', $permission = 'all')
	{
		$this->loadJs('soundmanager/script/soundmanager2-nodebug-jsmin.js');
		$this->loadJs('ckeditor/ckeditor.js');
		parent::edit($id, $permission);
	}

	public function insert($return = false)
	{

		$answer = array();
		foreach ($this->postData['answer'] as $k=>$item) {

			if(isset($this->postData['true_plan'])){
				$item['true_plan'] = ($k == $this->postData['true_plan'])?1:0;
			}else{
				$item['true_plan'] = 0;
			}

			$answer[] = $item;
		}

		$this->postData['answer'] = json_encode($answer);

		$aryData =  parent::insert(true);
		if($aryData['ok']){
			$this->session->set_flashdata('message',__("MSG_UPDATE_SUCCESSFUL"));
		}else{
			$this->session->set_flashdata('error',__("ERR_CANNOT_UPDATE"));
		}

		$aryData['url_reload'] = site_url('exam/question');
		echo json_encode($aryData);

	}

	public function update($id = '', $return = false)
	{

		$answer = array();
		foreach ($this->postData['answer'] as $k=>$item) {

			if(isset($this->postData['true_plan'])){
				$item['true_plan'] = ($k == $this->postData['true_plan'])?1:0;
			}else{
				$item['true_plan'] = 0;
			}

			$answer[] = $item;
		}

		$this->postData['answer'] = json_encode($answer);

		$aryData =  parent::update($id, true);
		if($aryData['ok']){
			$this->session->set_flashdata('message',__("MSG_UPDATE_SUCCESSFUL"));
		}else{
			$this->session->set_flashdata('error',__("ERR_CANNOT_UPDATE"));
		}


		$aryData['url_reload'] = site_url('exam/question');
		echo json_encode($aryData);
	}


	public function addSub($question_id){
		$this->template->set('question_id',$question_id);
		$this->view('questions/add_sub');
	}

	public function insertSub(){
		$answer = array();
		$parent_id = $this->postData['parent_id'];
		if(!$parent_id) return;

		foreach ($this->postData['answer'] as $k=>$item) {

			if(isset($this->postData['true_plan'])){
				$item['true_plan'] = ($k == $this->postData['true_plan'])?1:0;
			}else{
				$item['true_plan'] = 0;
			}

			$answer[] = $item;
		}

		$this->postData['answer'] = json_encode($answer);

		$aryData =  parent::insert(true);
		if($aryData['ok']){
			$this->session->set_flashdata('message',__("MSG_UPDATE_SUCCESSFUL"));
		}else{
			$this->session->set_flashdata('error',__("ERR_CANNOT_UPDATE"));
		}


		$aryData['url_reload'] = site_url('exam/question/edit/'.$parent_id);
		echo json_encode($aryData);
	}

	public function editSub($subId){
		$question = $this->model->get($subId);
		$this->template->set('fillData',$question);
		$this->view('questions/edit_sub');
	}

	public function updateSub(){
		$answer = array();
		foreach ($this->postData['answer'] as $k=>$item) {

			if(isset($this->postData['true_plan'])){
				$item['true_plan'] = ($k == $this->postData['true_plan'])?1:0;
			}else{
				$item['true_plan'] = 0;
			}

			$answer[] = $item;
		}

		$this->postData['answer'] = json_encode($answer);

		$question = $this->model->get($this->postData['question_id']);

		$aryData =  parent::update($question->question_id, true);
		if($aryData['ok']){
			$this->session->set_flashdata('message',__("MSG_UPDATE_SUCCESSFUL"));
		}else{
			$this->session->set_flashdata('error',__("ERR_CANNOT_UPDATE"));
		}


		$aryData['url_reload'] = site_url('exam/question/edit/'.$question->parent_id);
		echo json_encode($aryData);
	}

	public function deleteSub($subId){

		$sub = $this->model->get($subId);
		if(!$sub ) return '';
		$aryData = array('ok'=>1,'url_reload'=>site_url('exam/question/loadSub/'.$sub->parent_id));
		$this->model->delete($subId);
		echo  json_encode($aryData);
	}

	public function loadSub($questionId){
		$fillData = new stdClass();
		$fillData->question_id = $questionId;

		$this->view('questions/type/type_11','fillData',$fillData);
	}



	/**
	 * Build a Condition where for search 
	 * @return mixed:
	*/
    protected function _buildCondition(){
    	$aryCondition = array();

		$aryCondition['and'][] =  array("mt.parent_id"=>0);
    	
    	if(!empty($this->postData)){
    		 //search
			 			
			if($this->postData['cate_id']!=''){

				$aryCateId = array($this->postData['cate_id']);
				getAllChildCategory($this->postData['cate_id'],array('table'=>'question_category','parent'=>'parent_id','id'=>'cate_id'),$aryCateId);

				$aryCondition['IN'] =  array("mt.cate_id"=>$aryCateId);
    		 }			
			if($this->postData['title']!=''){
    		 	$aryCondition['like'][] =  array("mt.title"=>$this->postData['title']);
    		 }			
			if($this->postData['status']!=''){
    		 	$aryCondition['and'][] =  array("mt.status"=>$this->postData['status']);
    		 }			

			if($this->postData['question_type']!=''){
    		 	$aryCondition['and'][] =  array("mt.question_type"=>$this->postData['question_type']);
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
    	$rows=  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*,c.cate_name',
		'join'=>array(array('question_category c','c.cate_id = mt.cate_id','left')),
		'created'=>true));
    	return $rows;
    }



 
}

//end of Question