<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Practice extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'practice_model';
	/**
	 * 
	 * @var Practice_Model
	 */
	public $model;
	
	

	/**
	 * Practice controller 
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
	protected $after_view = array('cb_view_detail');
	
    public function __construct(){
        parent::__construct();  
        
    }

	public function index()
	{
		$this->loadJs('soundmanager/script/soundmanager2-nodebug-jsmin.js');
		return parent::index(); // TODO: Change the autogenerated stub
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
				$aryCateId = array($this->postData['cate_id']);
				getAllChildCategory($this->postData['cate_id'],array('table'=>'vocabulary_category','parent'=>'parent_id'),$aryCateId);
				$like = [];
				foreach ($aryCateId as $c){
					$like[] = 'cate_id LIKE "%'.$c.'%"';
				}
    		 	$aryCondition['AND'][] =  '('.implode(' OR ',$like).')';
    		 }			
			if($this->postData['title']!=''){
    		 	$aryCondition['like'][] =  array("mt.title"=>$this->postData['title']);
    		 }			
			if($this->postData['meaning']!=''){
    		 	$aryCondition['like'][] =  array("mt.meaning"=>$this->postData['meaning']);
    		 }			

			if($this->postData['status']!=''){
    		 	$aryCondition['and'][] =  array("mt.status"=>$this->postData['status']);
    		 }			

    	}
    	return $aryCondition;
    }

	public function insert($return = false)
	{
		$this->postData['cate_id'] = json_encode($this->postData['cate_id']);
		return parent::insert($return); // TODO: Change the autogenerated stub
	}

	public function update($id = '', $return = false)
	{
		$this->postData['cate_id'] = json_encode($this->postData['cate_id']);
//		 debug($this->postData);
		return parent::update($id, $return); // TODO: Change the autogenerated stub
	}

	protected function cb_view_detail($data){
		debug($data);
		$fillData = array();
		return array('ok'=>true,'fillData'=>$fillData);
	}


	/**
	 * Get data for List screen
	 * @param array $aryCondition
	 * @param int $start
	 * @return mixed
	*/ 
    protected function _getDataList($aryCondition=array(),$start='',$sort= array()){
    	$rows =   parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*','created'=>true));
//		debug($this->db->last_query());
		foreach($rows as $k=>$v){
			if($v->cate_id){
				$rows[$k]->category = $this->model->find_where('list',
					array('IN'=>array('id'=>json_decode($v->cate_id))),
					array('from'=>'vocabulary_category'));
			}

		}
    	return $rows;
    }

	public function add()
	{
		$this->loadJs('soundmanager/script/soundmanager2-nodebug-jsmin.js');
		parent::add(); // TODO: Change the autogenerated stub
	}

	public function edit($id = '', $permission = 'all')
	{
		$this->loadJs('soundmanager/script/soundmanager2-nodebug-jsmin.js');
		parent::edit($id, $permission); // TODO: Change the autogenerated stub
	}


}

//end of Practice