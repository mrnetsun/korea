<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Article extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'article_model';
	/**
	 * 
	 * @var Article_Model
	 */
	public $model;
	
	

	/**
	 * Article controller 
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
		if(!$this->postData['public']) $this->postData['public'] = null;
		else $this->postData['public'] = strtosqltime($this->postData['public']);

		$this->postData['gallery'] = json_encode($this->postData['gallery']);

		$this->postData['author_search'] = to_slug($this->postData['author']);
		$aryTag = explode(',',$this->postData['tags']);
		foreach($aryTag as $k=>$v) $aryTag[$k] = to_slug($v);
		$this->postData['tags_search'] = implode(',',$aryTag);

//		debug($this->postData);
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
			 			
			if($this->postData['title']!=''){
    		 	$aryCondition['like'][] =  array("mt.title"=>$this->postData['title']);
    		 }			
			if($this->postData['category_id']!=''){
    		 	$aryCondition['and'][] =  array("mt.category_id"=>$this->postData['category_id']);
    		 }			

			if($this->postData['feature']!=''){
    		 	$aryCondition['and'][] =  array("mt.feature"=>$this->postData['feature']);
    		 }
			if($this->postData['status']!=''){
				$aryCondition['and'][] =  array("mt.status"=>$this->postData['status']);
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
		$aryData =  parent::insert(true);
		$aryData['url_reload'] = site_url('article/article');
		$this->session->set_flashdata('message',__('MSG_UPDATE_SUCCESSFUL'));
		echo json_encode($aryData);
	}

	public function update($id = '', $return = false)
	{
		$aryData =  parent::update($id, true);
		$aryData['url_reload'] = site_url('article/article');
		$this->session->set_flashdata('message',__('MSG_UPDATE_SUCCESSFUL'));

		echo json_encode($aryData);
	}

	/**
	 * Get data for List screen
	 * @param array $aryCondition
	 * @param int $start
	 * @return mixed
	*/ 
    protected function _getDataList($aryCondition=array(),$start='',$sort= array()){
    	$rows =   parent::_getDataList($aryCondition,$start,$sort,array('select'=>'mt.*,c.name as cate_name',
		'join'=>array(
			array('category as c','c.cateId  = mt.category_id','left')
		)
		,'created'=>true));

		return $rows;
    }

	public function refine($id){
		$aryData = array('ok'=>true);
		$article = $this->model->get($id);
		if($article->other_source){
			$source = json_decode($article->other_source);
			$thumb = json_decode($article->thumbnail);

			$img_content = curl_get_content(str_replace(' ','%20',$source[0]));

			$new_file = $thumb->real_name;


			$f = fopen($new_file,"w+");
			fwrite($f,$img_content);
			fclose($f);

			watermark($new_file);

			$aryData['smessage'] = __('MSG_UPDATE_SUCCESSFUL');

		}else{
			$aryData['ok'] = false;
			$article['serror'] = __('MSG_NO_RESOURCE');
		}

		echo  json_encode($aryData);

	}
	
 
}

//end of Article