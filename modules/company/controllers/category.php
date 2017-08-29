<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Category extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'category_model';
	/**
	 *
	 * @var Category_Model
	 */
	public $model;



	/**
	 * Category controller
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
		$aryCondition = array('mt.type'=>'COMPANY');

		if(!empty($this->postData)){
			//search

			if($this->postData['name']!=''){
				$aryCondition['like'][] =  array("mt.name"=>trim($this->postData['name']));
			}
			if($this->postData['status']!=''){
				$aryCondition['and'][] =  array("mt.status"=>$this->postData['status']);
			}

			if($this->postData['parentId']!=''){
				$aryCondition['and'][] =  array("mt.parentId"=>$this->postData['parentId']);
			}

		}
		return $aryCondition;
	}



	public function insert($return = false)
	{
		$this->postData['type']= 'COMPANY';
		$this->session->set_userdata('last_category',$this->postData['parentId']);
		return parent::insert($return);
	}

	public function add()
	{
		$this->template->set('last_category',$this->session->userdata('last_category'));
		parent::add(); // TODO: Change the autogenerated stub
	}

	/**
	 * Get data for List screen
	 * @param array $aryCondition
	 * @param int $start
	 * @return mixed
	 */
	protected function _getDataList($aryCondition=array(),$start='',$sort= array()){
		$rows =  parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*,c.name as parent_name','created'=>true,
			'join'=>array(array('category as c','c.cateId = mt.parentId','left'))
		));
//		debug($this->db->last_query());
		return $rows;
	}


}

//end of Category