<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Banner extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'banner_model';
	/**
	 * 
	 * @var Banner_Model
	 */
	public $model;
	
	

	/**
	 * Banner controller 
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
			if($this->postData['image']!=''){
    		 	$aryCondition['like'][] =  array("mt.image"=>$this->postData['image']);
    		 }			
			if($this->postData['start_date']!=''){
    		 	$aryCondition['like'][] =  array("mt.start_date"=>$this->postData['start_date']);
    		 }			
			if($this->postData['end_date']!=''){
    		 	$aryCondition['like'][] =  array("mt.end_date"=>$this->postData['end_date']);
    		 }			
			if($this->postData['status']!=''){
    		 	$aryCondition['like'][] =  array("mt.status"=>$this->postData['status']);
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

	public function insert($return = false)
	{
		$data = array();

		$data['client_id'] = $this->postData['client_id'];
		$data['title'] = $this->postData['title'];

		$data['campaign'] = $this->postData['campaign'];
		$data['image'] = $this->postData['image'];
		$data['type'] = $this->postData['type'];
		$data['keyword'] = $this->postData['keyword'];
		$data['detail'] = $this->postData['detail'];
		$data['googleads'] = $this->postData['googleads'];
		$data['impressed'] = 0;
		$data['clicked'] = 0;
		$data['status'] = $this->postData['status'];

		if($this->postData['start_date']){
			$data['start_date'] = date("Y-m-d H:i:s",strtotime($this->postData['start_date']));
		}

		if($this->postData['end_date']){
			$data['end_date'] = date("Y-m-d H:i:s",strtotime($this->postData['end_date']));
		}

		if($this->postData['position']){
			$data['position'] = json_encode($this->postData['position']);
		}

		if($this->postData['categories_article']){
			$data['categories_article'] = json_encode($this->postData['categories_article']);
		}

		if($this->postData['categories_company']){
			$data['categories_company'] = json_encode($this->postData['categories_company']);
		}

		$campaign_id = $this->postData['campaign'];
		$campaign = $this->model->get($campaign_id,array('from'=>'banner_campaign'));

		if(!$data['start_date']){
			$data['start_date'] = date("Y-m-d",strtotime($campaign->start_date));
		}

		switch($campaign_id){
			case 4:
			case 5:
			case 6:
				$end_date = date("Y-m-d",strtotime(date("Y-m-d", strtotime($campaign->start_date)) . " +".$campaign->days."days"));
				$data['end_date'] = $end_date.' 23:59:00';
				break;
		}

		$this->postData = $data;
		$this->session->set_flashdata('message',__('MSG_UPDATE_SUCCESSFUL'));
		$aryData=parent::insert(true);
		$aryData['url_reload']=site_url("banner/banner/");

		if($return) {
			return $aryData;
		}else{
			echo json_encode($aryData);
		}
	}


	public function update($id = '', $return = false)
	{

		$data = array();

		$data['banner_id'] = intval($this->postData['banner_id']);
		$data['client_id'] = $this->postData['client_id'];
		$data['title'] = $this->postData['title'];

		$data['campaign'] = $this->postData['campaign'];
		$data['image'] = $this->postData['image'];
		$data['type'] = $this->postData['type'];
		$data['detail'] = $this->postData['detail'];
		$data['keyword'] = $this->postData['keyword'];
		$data['googleads'] = $this->postData['googleads'];
		$data['impressed'] = 0;
		$data['clicked'] = 0;
		$data['status'] = $this->postData['status'];

		if($this->postData['start_date']){
			$data['start_date'] = date("Y-m-d H:i:s",strtotime($this->postData['start_date']));
		}

		if($this->postData['end_date']){
			$data['end_date'] = date("Y-m-d H:i:s",strtotime($this->postData['end_date']));
		}

		if($this->postData['position']){
			$data['position'] = json_encode($this->postData['position']);
		}

		if($this->postData['categories_article']){
			$data['categories_article'] = json_encode($this->postData['categories_article']);
		}

		if($this->postData['categories_company']){
			$data['categories_company'] = json_encode($this->postData['categories_company']);
		}

		$campaign_id = $this->postData['campaign'];
		$campaign = $this->model->get($campaign_id,array('from'=>'banner_campaign'));

		if(!$data['start_date']){
			$data['start_date'] = date("Y-m-d",strtotime($campaign->start_date));
		}

		switch($campaign_id){
			case 4:
			case 5:
			case 6:
				$end_date = date("Y-m-d",strtotime(date("Y-m-d", strtotime($campaign->start_date)) . " +".$campaign->days."days"));
				$data['end_date'] = $end_date.' 23:59:00';
				break;
		}

//		debug($data);
		$this->postData = $data;

		$aryData=parent::update($id, true);
		if($aryData['ok']){
			$this->session->set_flashdata('message', $aryData['smessage']);
			$aryData['url_reload']=site_url("banner/banner/");
		}
		$this->session->set_flashdata('message',__('MSG_UPDATE_SUCCESSFUL'));
		if($return) {
			return $aryData;
		}else{
			echo json_encode($aryData);
		}
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

//end of Banner