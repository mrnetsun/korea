<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Page extends Front_Controller {
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
	 * Home controller
	 */

	//form add
	protected $before_add = array();

	//form edit
	protected $before_edit = array();

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

	public function index($slug=''){
		$page = $this->model->getArticleBySlug($slug);

		// add breadcrumbs
		$this->breadcrumbs->push(__("LBL_HOMEPAGE"),'/');
		$this->breadcrumbs->push($page->cate_name,'tin-tuc/'.$page->cate_slug);
		$this->breadcrumbs->push($page->title,'ban-tin/'.$page->slug);

		if(!$page){
			show_404();
		}else {
			$this->template->set('page', $page);

			//update hits
			$this->model->update('article',array('hit'=>$page->hit +1),array('article_id'=>$page->article_id));

			//categories
			$categories = $this->model->find_where('list',array('status'=>ACTIVE,'type'=>'ARTICLE'),
				array('from'=>'category','fixed_sort'=>'position ASC'));

			$this->template->set('categories',$categories);

			//newest
			$latest = $this->model->getLatest(6,$page->category_id);
			$this->template->set('latest',$latest);

			//most viewed
			$top_view = $this->model->getTopView(6,$page->category_id);
			$this->template->set('topView',$top_view);

			$this->view('pages/page');
		}
	}


	public function home($p=0){

		//categories
		$categories = $this->model->find_where('list',array('status'=>ACTIVE,'type'=>'ARTICLE'),
			array('from'=>'category','fixed_sort'=>'position ASC'));

		$this->template->set('categories',$categories);

		// add breadcrumbs
		$this->breadcrumbs->push(__("LBL_HOMEPAGE"),'/');
		$this->breadcrumbs->push(__("LBL_NEWS"),'tin-tuc');

		//news feature
		$feature = $this->model->getFeature(5);
		$this->template->set('feature',$feature);

		//most viewed
		$top_view = $this->model->getTopView(5);
		$this->template->set('topView',$top_view);
//		debug($this->db->last_query());

		//newest
		$latest = $this->model->getLatest(6);
		$this->template->set('latest',$latest);

		//get list
		$aryFeatureId = array();
		foreach($feature as $item){
			$aryFeatureId[] = $item->article_id;
		}

		$where = array('status'=>ACTIVE,'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))');

		if(!empty($aryFeatureId))$where['NOT IN'] = array('article_id'=>$aryFeatureId);

		$articles = $this->model->find_where('list',
			$where,
			array('from'=>'article','fixed_sort'=>'`updatedTime` DESC','limit'=>10));
//		debug($this->db->last_query());

		$this->template->set('articles',$articles);

		$article_list = $this->listAllArticle($p,true);

		$isAjax = $this->input->is_ajax_request();
		if($isAjax){
			echo $article_list;
		}else{
			$this->template->set('article_list',$article_list);
			$this->view('pages/home');
		}
	}

	public function listAllArticle($start,$return = false){
		$this->load->library('pagination');

		$limit = 10;
		if($start<=0) $start = 1;
		$offset = ($start-1)*$limit;
		//list article
		$where = array('mt.status'=>ACTIVE,
			'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))');

		$articles = $this->model->find_where('list',$where,
			array(
			'select'=>'mt.*,c.name as cate_name, c.slug as cate_slug'
			,'offset'=>$offset,'limit'=>$limit
			,'join'=>array(
			array('category as c','c.cateId = mt.category_id','left')
			)
			,'order_by'=>array('mt.updatedTime'=>'DESC')));

		$total = $this->model->count_where($where);

		$this->template->set('articles',$articles);

		$config['div'] = 'articleList';
		$config['anchor'] = 'captchaAnchor';
		$config['base_url'] = '/article/page/listAllArticle/';
		$config['total_rows'] = $total;
		$config['per_page'] = $limit;
		$config['cur_page'] = $start;
		$config['display_from'] = "Display from";
		$config['display_to'] = "to";
		$config['display_of'] = "of";
		$this->template->set('start',$start);

		$this->jquery_pagination->initialize($config);
		$this->template->set('pagination',$this->jquery_pagination);

		$isAjax = $return;
		if (!$isAjax) $isAjax = $this->input->is_ajax_request();

		if($isAjax){
			$html = $this->baseView('pages/listAll',array(),true);
		}else{
			$html = $this->view('pages/listAll',array(),true);
		}


		if($return) return $html;
		else echo $html;

	}



	public function category($slug='',$p=0){


		//category list
		$page = $this->model->getCategoryBySlug($slug);

		// add breadcrumbs
		$this->breadcrumbs->push(__("LBL_HOMEPAGE"),'/');
		$this->breadcrumbs->push(__("LBL_NEWS"),'tin-tuc');
		$this->breadcrumbs->push($page->name,'tin-tuc/'.$page->slug);

		if(!$page){
			show_404();
		}else{
			$this->template->set('page',$page);
			//write log

			//news feature
			$feature = $this->model->getFeature(5,$page->cateId);
			$this->template->set('feature',$feature);


			//categories
			$categories = $this->model->find_where('list',array('status'=>ACTIVE,'type'=>'ARTICLE'),
				array('from'=>'category','fixed_sort'=>'position ASC'));

			$this->template->set('categories',$categories);

			//newest
			$latest = $this->model->getLatest(6,$page->cateId);
			$this->template->set('latest',$latest);

			//most viewed
			$top_view = $this->model->getTopView(6,$page->cateId);
			$this->template->set('topView',$top_view);
			$article_list = $this->listArticleCategory($slug,$p,true);



			$isAjax = $this->input->is_ajax_request();
			if($isAjax){
				echo $article_list;
			}else{
				$this->template->set('article_list',$article_list);
				$this->view('pages/category');
			}

		}

	}

	private function listArticleCategory($slug,$start,$return = false){
		$this->load->library('pagination');

		$category = $this->model->getCategoryBySlug($slug);

		$limit = 10;
		if($start<=0) $start = 1;
		$offset = ($start-1)*$limit;
		//list article
		$where = array('status'=>ACTIVE,
			'category_id'=>$category->cateId,
			'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))');

		$articles = $this->model->find_where('list',$where,
			array('offset'=>$offset,'limit'=>$limit
		,'order_by'=>array('mt.updatedTime'=>'DESC')));

		$total = $this->model->count_where($where);

		$this->template->set('articles',$articles);

		$config['div'] = 'articleList';
		$config['anchor'] = 'captchaAnchor';
		$config['base_url'] = '/tin-tuc/'.$category->slug;
		$config['total_rows'] = $total;
		$config['per_page'] = $limit;
		$config['cur_page'] = $start;
		$config['display_from'] = "Display from";
		$config['display_to'] = "to";
		$config['display_of'] = "of";
		$this->template->set('start',$start);

		$this->jquery_pagination->initialize($config);
		$this->template->set('pagination',$this->jquery_pagination);

		$isAjax = $return;
		if (!$isAjax) $isAjax = $this->input->is_ajax_request();

		if($isAjax){
			$html = $this->baseView('pages/list',array(),true);
		}else{
			$html = $this->view('pages/list',array(),true);
		}


		if($return) return $html;
		else echo $html;

	}

	public function author($slug='',$p=0){

 		//author
		$author = $this->model->find_where('',array('author_slug'=>$slug),array('from'=>'article_author'));
		$this->template->set("author",$author);

		// add breadcrumbs
		$this->breadcrumbs->push(__("LBL_HOMEPAGE"),'/');
		$this->breadcrumbs->push(__("LBL_NEWS"),'tin-tuc');
		$this->breadcrumbs->push($author->author_name,'tac-gia/'.$slug);

		if(!$author){
			show_404();
		}else{

			//write log

			//categories
			$categories = $this->model->find_where('list',array('status'=>ACTIVE,'type'=>'ARTICLE'),
				array('from'=>'category','fixed_sort'=>'updatedTime ASC'));

			$this->template->set('categories',$categories);

			//newest
			$latest = $this->model->getLatest(6);
			$this->template->set('latest',$latest);

			//most viewed
			$top_view = $this->model->getTopView(6);
			$this->template->set('topView',$top_view);

			$article_list = $this->listArticleAuthor($slug,$p,true);


			$isAjax = $this->input->is_ajax_request();
			if($isAjax){
				echo $article_list;
			}else{
				$this->template->set('article_list',$article_list);
				$this->view('pages/author');
			}

		}

	}

	private function listArticleAuthor($slug,$start,$return = false){
		$this->load->library('pagination');

		$limit = 10;
		if($start<=0) $start = 1;
		$offset = ($start-1)*$limit;
		//list article
		$where = array('mt.status'=>ACTIVE,
			'author_search'=>$slug,
			'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))');
		$articles = $this->model->find_where('list',$where,
			array('select'=>'mt.*,c.name as cate_name, c.slug as cate_slug'
				,'offset'=>$offset,'limit'=>$limit
				,'join'=>array(
					array('category as c','c.cateId = mt.category_id','left')
				),
				'order_by'=>array('mt.updatedTime'=>'DESC')));

		$total = $this->model->count_where($where);

		$this->template->set('articles',$articles);

		$config['div'] = 'articleList';
		$config['anchor'] = 'captchaAnchor';
		$config['base_url'] = '/tac-gia/'.$slug;
		$config['total_rows'] = $total;
		$config['per_page'] = $limit;
		$config['cur_page'] = $start;
		$config['display_from'] = "Display from";
		$config['display_to'] = "to";
		$config['display_of'] = "of";
		$this->template->set('start',$start);

		$this->jquery_pagination->initialize($config);
		$this->template->set('pagination',$this->jquery_pagination);

		$isAjax = $return;
		if (!$isAjax) $isAjax = $this->input->is_ajax_request();

		if($isAjax){
			$html = $this->baseView('pages/listAll',array(),true);
		}else{
			$html = $this->view('pages/listAll',array(),true);
		}


		if($return) return $html;
		else echo $html;

	}


	public function tag($slug='',$p=0){

		//author
		$this->template->set('slug',$slug);

		// add breadcrumbs
		$this->breadcrumbs->push(__("LBL_HOMEPAGE"),'/');
		$this->breadcrumbs->push(__("LBL_NEWS"),'tin-tuc');
		$this->breadcrumbs->push($slug,'tu-khoa/'.$slug);

		if(!$slug){
			show_404();
		}else{

			//write log

			//categories
			$categories = $this->model->find_where('list',array('status'=>ACTIVE,'type'=>'ARTICLE'),
				array('from'=>'category','fixed_sort'=>'position ASC'));

			$this->template->set('categories',$categories);

			//newest
			$latest = $this->model->getLatest(6);
			$this->template->set('latest',$latest);

			//most viewed
			$top_view = $this->model->getTopView(6);
			$this->template->set('topView',$top_view);

			$article_list = $this->listArticleTag($slug,$p,true);


			$isAjax = $this->input->is_ajax_request();
			if($isAjax){
				echo $article_list;
			}else{
				$this->template->set('article_list',$article_list);
				$this->view('pages/tags');
			}

		}

	}

	private function listArticleTag($slug,$start,$return = false){
		$this->load->library('pagination');

		$limit = 10;
		//list article
		$where = array('mt.status'=>ACTIVE,
			'LIKE'=>array('tags_search'=>$slug),
			'AND'=>'(ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))');
		$articles = $this->model->find_where('list',$where,
			array('select'=>'mt.*,c.name as cate_name, c.slug as cate_slug'
				,'offset'=>$start,'limit'=>$limit
				,'join'=>array(
					array('category as c','c.cateId = mt.category_id','left')
				)
				,'order_by'=>array('mt.updatedTime'=>'DESC')));

		$total = $this->model->count_where($where);

		$this->template->set('articles',$articles);

		$config['div'] = 'articleList';
		$config['anchor'] = 'captchaAnchor';
		$config['base_url'] = '/tu-khoa/'.$slug;
		$config['total_rows'] = $total;
		$config['per_page'] = $limit;
		$config['cur_page'] = $start;
		$config['display_from'] = "Display from";
		$config['display_to'] = "to";
		$config['display_of'] = "of";
		$this->template->set('start',$start);

		$this->jquery_pagination->initialize($config);
		$this->template->set('pagination',$this->jquery_pagination);

		$isAjax = $return;
		if (!$isAjax) $isAjax = $this->input->is_ajax_request();

		if($isAjax){
			$html = $this->baseView('pages/listAll',array(),true);
		}else{
			$html = $this->view('pages/listAll',array(),true);
		}


		if($return) return $html;
		else echo $html;

	}


	public function search($slug='',$p=0){

		$slug = rawurldecode($slug);

		//keyword
		$this->template->set('slug',$slug);

		// add breadcrumbs
		$this->breadcrumbs->push(__("LBL_HOMEPAGE"),'/');
		$this->breadcrumbs->push(__("LBL_NEWS"),'tin-tuc');
		$this->breadcrumbs->push($slug,'tu-khoa/'.$slug);

		if(!$slug){
			show_404();
		}else{

			//write log

			//categories
			$categories = $this->model->find_where('list',array('status'=>ACTIVE,'type'=>'ARTICLE'),
				array('from'=>'category','fixed_sort'=>'position ASC'));

			$this->template->set('categories',$categories);

			//newest
			$latest = $this->model->getLatest(6);
			$this->template->set('latest',$latest);

			//most viewed
			$top_view = $this->model->getTopView(6);
			$this->template->set('topView',$top_view);

			$article_list = $this->listArticleSearch($slug,$p,true);


			$isAjax = $this->input->is_ajax_request();
			if($isAjax){
				echo $article_list;
			}else{
				$this->template->set('article_list',$article_list);
				$this->view('pages/search');
			}

		}

	}

	private function listArticleSearch($slug,$start,$return = false){
		$this->load->library('pagination');
		$slug = rawurldecode($slug);
//		debug($slug);
		$limit = 10;
		if($start<=0) $start = 1;
		$offset = ($start-1)*$limit;
		//list article
		$where = array('mt.status'=>ACTIVE,
			//'LIKE'=>array('tags_search'=>$slug),
			'AND'=>'(title LIKE "%'.$slug.'%" OR tags_search LIKE "%'.$slug.'%") AND (ISNULL(public) OR (public IS NOT NULL AND public <="'.date("Y-m-d").'"))');
		$articles = $this->model->find_where('list',$where,
			array('select'=>'mt.*,c.name as cate_name, c.slug as cate_slug'
			,'offset'=>$offset,'limit'=>$limit
			,'join'=>array(
				array('category as c','c.cateId = mt.category_id','left')
			)
			,'order_by'=>array('mt.updatedTime'=>'DESC')));

		$total = $this->model->count_where($where);
//		debug($this->db->last_query());

		$this->template->set('articles',$articles);

		$config['div'] = 'articleList';
		$config['anchor'] = 'captchaAnchor';
		$config['base_url'] = '/tim-kiem/'.$slug;
		$config['total_rows'] = $total;
		$config['per_page'] = $limit;
		$config['cur_page'] = $start;
		$config['display_from'] = "Display from";
		$config['display_to'] = "to";
		$config['display_of'] = "of";
		$this->template->set('start',$start);

		$this->jquery_pagination->initialize($config);
		$this->template->set('pagination',$this->jquery_pagination);

		$isAjax = $return;
		if (!$isAjax) $isAjax = $this->input->is_ajax_request();

		if($isAjax){
			$html = $this->baseView('pages/listAll',array(),true);
		}else{
			$html = $this->view('pages/listAll',array(),true);
		}


		if($return) return $html;
		else echo $html;

	}


}

//end of Home