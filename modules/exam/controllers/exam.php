<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Exam extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'exam_model';
	/**
	 * 
	 * @var Exam_Model
	 */
	public $model;
	
	

	/**
	 * Exam controller 
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
			if($this->postData['status']!=''){
    		 	$aryCondition['like'][] =  array("mt.status"=>$this->postData['status']);
    		 }			
			if($this->postData['cate_id']!=''){
    		 	$aryCondition['like'][] =  array("mt.cate_id"=>$this->postData['cate_id']);
    		 }
			if($this->postData['start']!=''){
				$aryCondition['and'][] = 'DATE_FORMAT("%Y-%m-%d",start_time) = \''.date("Y-m-d",strtotime($this->postData['start'])).'\'';
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
    	$rows =  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*,c.cate_name',
			'join'=>array(array('exam_category as c','c.exam_category_id =  mt.cate_id','left')),
			'created'=>true));

		return $rows;
    	
    }

	public function edit($id = '', $permission = 'all')
	{
		$exam = $this->model->get($id);
		$tests = json_decode($exam->tests);
		if(!$tests) $tests = array();

		$this->session->set_userdata('test_stack',$tests);
		$testListHTML = $this->loadTest(true);
		$this->template->set('testListHTML',$testListHTML);
		parent::edit($id, $permission);
	}

	public function insert($return = false)
	{
		$this->postData['tests'] = json_encode($this->postData['test_id']);
		if($this->postData['start_time']){
			$this->postData['start_time'] = date("Y-m-d H:i:s",strtotime($this->postData['start_time']));
		}
		if($this->postData['end_time']){
			$this->postData['end_time'] = date("Y-m-d H:i:s",strtotime($this->postData['end_time']));
		}

		$return = parent::insert($return,$return);
		$return['url_reload'] = site_url('exam/exam');

		if($return['ok']){
			$this->session->set_flashdata('message',$return['smessage']);
		}else{
			$this->session->set_flashdata('error',$return['serror']);
		}

		echo json_encode($return);
	}

	public function update($id = '', $return = false)
	{
		$this->postData['tests'] = json_encode($this->postData['test_id']);
		if($this->postData['start_time']){
			$this->postData['start_time'] = date("Y-m-d H:i:s",strtotime($this->postData['start_time']));
		}
		if($this->postData['end_time']){
			$this->postData['end_time'] = date("Y-m-d H:i:s",strtotime($this->postData['end_time']));
		}
//		$ok = $this->model->update('exam',$this->postData,array('exam_id'=>$this->postData['exam_id']));
//		debug($this->db->last_query());
		$return = parent::update($id, true);
		$return['url_reload'] = site_url('exam/exam');

		if($return['ok']){
			$this->session->set_flashdata('message',$return['smessage']);
		}else{
			$this->session->set_flashdata('error',$return['serror']);
		}

		echo json_encode($return);
	}

	public function addTest(){

		$exam_filter = $this->session->userdata('exam_filter');

		$html = $this->getTestList(0,true);

		$this->view('exams/addTest',array('html'=>$html,'exam_filter'=>$exam_filter));

	}

	public function insertTest(){
		$test_stack = $this->session->userdata('test_stack');
		$test = $this->postData['test_id'];
		if(!empty($test)) {
			if(!$test_stack){
				$test_stack = $test;
			}else{
				$test_stack = array_merge($test_stack,$test);
			}

			$test_stack = array_flip(array_flip($test_stack));
			$this->session->set_userdata('test_stack',$test_stack);

		}

		echo json_encode(array('ok'=>true,'smessage'=>'MSG_UPDATE_SUCCESSFUL'));
	}

	public function loadTest($return = false){
		$test_stack = $this->session->userdata('test_stack');
		if($test_stack){
			$test = $this->model->find_where('list',array('IN'=>array('test_id'=>$test_stack)),array('from'=>'test'));
		}else{
			$test = array();
		}

		$html = $this->baseView('exams/exam_test',array('test'=>$test),true);
		if($return){
			return $html;
		}else{
			echo json_encode(array('ok'=>true,'html'=>$html));
		}
	}

	public function getTestList($start=0,$return = false){
		$testInsert = $this->session->userdata('test_stack');

		$where = array('mt.status'=>ACTIVE);
		if(!empty($testInsert)){
			$where['NOT IN'] = array('test_id'=>$testInsert);
		}

		if($this->postData){
			$filter_where = array();
			if($this->postData['title']){
				$filter_where['AND'][] = '(test_id = '.intval($this->postData['title']).' OR test_name LIKE \'%'.trim($this->postData['title']).'%\')';
			}

			if($this->postData['cate_id']){
				$aryCate = array($this->postData['cate_id']);
				getAllChildCategory($this->postData['cate_id'],array('table'=>'exam_category','id'=>'exam_category_id','parent'=>'parent_id'),$aryCate);

				$filter_where['IN'] = array('mt.cate_id'=>$aryCate);
			}


			$this->session->set_userdata('filter_where',$filter_where);
			$this->session->set_userdata('exam_filter',$this->postData);
		}

		$filter_where = $this->session->userdata('filter_where');
		if(!empty($filter_where)){
			$where = array_merge($where,$filter_where);
		}



		$tests = $this->model->find_where('list',$where,
			array(
				'select'=>'mt.*,c.cate_name',
				'from'=>'test'
			,'join'=>array(array('exam_category as c','c.exam_category_id = mt.cate_id','left'))
			,'limit'=>20,'offset'=>$start));

//		debug($this->db->last_query());

		$html = $this->baseView('exams/test_list',array('tests'=>$tests),true);
		if($return){
			return $html;
		}else{
			echo json_encode(array('ok'=>true,'html'=>$html));
		}
	}
	
 
}

//end of Exam