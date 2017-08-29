<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Article_Model extends MY_Model{
	
	/**
	 *@var array config
	 * table : table of object for Add,Edit,Delete,Update
	 * view: create view of List Screen
	 * view: create view of View Screen
	 */
	protected  $main = array(
			'table'=>'article',
			'list'=>'',
			'view'=>''		
			);
	
	/**	 
	 * The primary key name, by default set to 'id'
	 *  @var string
	*/
	protected $primary_key = 'article_id';
	
	/**
	 * @var array
	 * The database table fields, used for filtering data arrays before inserting and updating
	* If not set, an additional query will be made to fetch these fields
	*/
	protected $fields = array();
	
	/**
	 * @var array
	 * The field may be switch 0 or 1 value
	 * If not set, an additional query will be made to fetch these fields
	 */
	protected $switchfields = array('status','feature');
	
    function __construct(){
        parent::__construct();
       
    }

	public function getArticleBySlug($slug){
		$where = array('mt.slug'=>$slug);
		if(!$this->LoginData->permission['article/article']->full){
			$where['mt.status'] = ACTIVE;
			$where['AND'] = '(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))';

		}
		$row = $this->find_where('',$where,array(
			'select'=>'mt.*,c.slug as cate_slug,c.name as cate_name',
			'join'=>array(array('category as c','c.cateId = mt.category_id','left'))));
		return $row;
	}
	public function getCategoryBySlug($slug){
		$where = array('slug'=>$slug,'type'=>'ARTICLE');
		if(!$this->LoginData->permission['article/article']->full){
			$where['status'] = ACTIVE;
		}
		$row = $this->find_where('',$where,array('from'=>'category'));
		return $row;
	}

	public function getArticleByAuthor($slug){
		$where = array('author_search'=>$slug);
		if(!$this->LoginData->permission['article/article']->full){
			$where['status'] = ACTIVE;
		}
		$rows = $this->find_where('list',$where,array('from'=>'article'));
//		debug($this->db->last_query());
		return $rows;
	}


	public function getTopView($limit=6,$cateId = ''){
		$where = array('mt.status'=>ACTIVE,'AND'=>'mt.updatedTime >="'.date("Y-m-d",strtotime('-30 days')).'"');
		if($cateId) $where['category_id'] = intval($cateId);
		$rows = $this->find_where('list',
			$where,
			array('select'=>'mt.*,c.slug as cate_slug,c.name as cate_name',
				'from'=>'article'
			,'join'=>array(array('category as c','c.cateId = mt.category_id','left'))
			,'fixed_sort'=>'hit DESC','limit'=>$limit));

		return $rows;
	}

	public function getFeature($limit=6,$cateId = ''){
		$where = array('mt.status'=>ACTIVE,'feature'=>ACTIVE,'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))');
		if($cateId) $where['category_id'] = intval($cateId);

		$rows = $this->find_where('list',
			$where,
			array(
				'select'=>'mt.*,c.slug as cate_slug,c.name as cate_name',
				'from'=>'article'
			,'join'=>array(array('category as c','c.cateId = mt.category_id','left'))
			,'order_by'=>array("mt.updatedTime"=> 'DESC')
			,'limit'=>$limit));
		return $rows;
	}

	public function getLatest($limit=6,$cateId = ''){
		$where = array('mt.status'=>ACTIVE,'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))');
		if($cateId) $where['category_id'] = intval($cateId);
		$rows = $this->find_where('list',
			$where,
			array('select'=>'mt.*,c.slug as cate_slug,c.name as cate_name',
				'from'=>'article'
			,'join'=>array(array('category as c','c.cateId = mt.category_id','left'))
			,'fixed_sort'=>'mt.createdTime DESC','limit'=>$limit));

		return $rows;
	}
}