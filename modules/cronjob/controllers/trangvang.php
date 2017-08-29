<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Trangvang extends MY_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'cronjob_model';
	/**
	 * 
	 * @var Cronjob_Model
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
		set_time_limit(0);
        parent::__construct();
		$this->load->helper('dom');
		$this->load->helper('crawler');
        
    }
    
    public function index(){

		$this->do_crawler();
    }



    public function mongo(){
		header('Content-Type: text/html; charset=utf-8');
		$collection = 'company';
		$data = $this->mongo_db->get($collection);
		debug($data);

    }

	public function find(){
		header('Content-Type: text/html; charset=utf-8');
		$collection = 'company';
		$name = '5a6b17c23ddfd4a4b853867dd5f10445';
		$existed = $this->mongo_db->get_where($collection,array('vn.md5'=>$name));
		debug($existed);
	}

	public function delete(){

		$collection = 'company';
		$this->mongo_db->delete_all($collection);

	}

	function test(){
		header('Content-Type: text/html; charset=utf-8');
		$url = 'http://trangvangvietnam.com/listings/1187765499/nha_phan_phoi_ac_quy_duc_hai.htm';
		$data = crawler_trangvangvietnam($url);
		debug($data);
	}


	public function do_crawler(){
		$crawler = $this->model->find_where('',array('status'=>ACTIVE),array('from'=>'crawler'));
		$this->template->set('crawler',$crawler);

		$totalCompany = $this->model->count_where(array(),array('from'=>'company'));
		$this->template->set('totalCompany',number_format($totalCompany,  0 , '.' , ' ' ));

		$totalCategory = $this->model->count_where(array(),array('from'=>'crawler_category'));
		$this->template->set('totalCategory',number_format($totalCategory,  0 , '.' , ' ' ));

		$totalCrawCompany = $this->model->count_where(array(),array('from'=>'crawler_company'));
		$this->template->set('totalCrawCompany',number_format($totalCrawCompany,  0 , '.' , ' ' ));


		$_SESSION['total'] = $this->model->count_where(array('status'=>1),array('from'=>'crawler_company'));

		$this->view('trangvangs/crawler');
	}

	public function trangvangvietnam($id='',$flag=''){

		error_reporting(0);

		$aryData = array('ok'=>true);


		$company = $this->model->find_where('',array('status'=>0),array('from'=>'crawler_company'));

		if(!empty($company)){
			$this->model->update('crawler_company',array('status'=>2),array('id'=>$company->id));
			$aryData['link'] = $company->link;
			$data = crawler_trangvangvietnam($company->link);

			$data['Company_Name'] = $company->name;

			$tmp = explode('-',$data['Company_Name']);
			if($tmp[1] && strpos($tmp[1],trim($tmp[0]))!== false){
				$data['Company_Name'] = $tmp[1];
			}

			$data['Slug'] = to_slug($data['Company_Name']);
			$data['md5'] = md5(strtolower($data['Company_Name']));

			if(!empty($data)){
				//check duplicate
				$existed = $this->model->find_where('',
					array('md5'=>md5(strtolower($data['Company_Name']))),array('from'=>'company'));

				if(!empty($existed)){
					$data['Slug'].= '-'.count($existed);
				}
				$aryData['name'] = $data['Company_Name'];




				$data['updatedId'] = $this->LoginData->memberId;
				//if(!$aryData['UpdatedTime']) $data['UpdatedTime'] = date("Y-m-d H:i:s");

				$data['createdId'] = $this->LoginData->memberId;
				$data['createdTime'] = date("Y-m-d H:i:s");

				//insert to MySQL
				$data['Rate'] = json_encode($data['Rate']);
				$data['Comment'] = json_encode($data['Comment']);
				$data['Contact'] = json_encode($data['Contact']);
				$data['Get_In_Touch'] = json_encode($data['Get_In_Touch']);
				$data['Verified_User'] = json_encode($data['Verified_User']);
				$data['Categories'] = json_encode($data['Categories']);
				$data['Product_Serivces'] = json_encode($data['Product_Serivces']);
				$data['Gallery'] = json_encode($data['Gallery']);
				$data['Video'] = json_encode($data['Video']);
//				debug($data);

				$id = $this->model->add('company',$data);

				if(!$aryData['name']){
					$this->model->add('crawler_log',array('type'=>'No Name','attempt'=>$id,'url'=>$company->link));
				}

				$_SESSION['total']++;

				$this->model->update('crawler_company',array('status'=>1),array('id'=>$company->id));
			}else{
				//error
				$aryData['name'] = 'Error';
				$this->model->update('crawler_company',array('status'=>-1),array('id'=>$company->id));
			}
		}else{
			$aryData['ok'] = false;
			$aryData['serror'] = "Không có công ty nào cần xử lý";
		}



		$aryData['total'] = $_SESSION['total'];
		echo  json_encode($aryData);

	}
	public function crawler_category(){

		for($page=1;$page<=22;$page++){
			$data = crawler_category($page);

			foreach($data as $c){
				echo $c['label'].'<br>';
				$id = $this->model->add('crawler_category',array('name'=>$c['label'],'number'=>$c['number'],'link'=>$c['link'],'parent'=>0));
				if(!empty($c['items'])){
					foreach($c['items'] as $sub){
						$this->model->add('crawler_category',array('name'=>$sub['label'],'number'=>$sub['number'],'link'=>$sub['link'],'parent'=>$id));
					}
				}
			}
		}
		echo 'Done.';
	}

	public function refineCompany(){
		$aryUrl = array();
		$aryUrl[] = 'http://trangvangvietnam.com/categories/14280/dai_ly_ve_may_bay.html?page=9';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/208810/phe_lieu.html?page=2';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/208810/phe_lieu.html?page=4';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/208810/phe_lieu.html?page=5';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/208810/phe_lieu.html?page=6';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/208810/phe_lieu.html?page=7';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/208810/phe_lieu.html?page=8';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/208810/phe_lieu.html?page=9';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/132120/website_thiet_ke_trang_web.html?page=29';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/132120/website_thiet_ke_trang_web.html?page=31';
		$aryUrl[] = 'http://trangvangvietnam.com/categories/132120/website_thiet_ke_trang_web.html?page=32';
		$inserted = 0;
		foreach($aryUrl as $url){
			$data = crawler_list($url,0);
			debug($data,false);
			if(!empty($data)){
				foreach($data as $c){
					$isExisted = $this->model->find_where('',array('link'=>$c['link']),array('from'=>'crawler_company'));
					if(empty($isExisted)){
						$inserted++;
						$this->model->add('crawler_company',$c);
					}else{
						$log = array('type'=>'Duplicate','url'=>$isExisted->link);
						$this->model->add('crawler_log',$log);
					}
				}
			}else{
				$log = array('type'=>'Empty Category','url'=>$url);
				$this->model->add('crawler_log',$log);
			}
		}

		echo "Inserted:$inserted";

	}


	public function getCompanyList(){
		$this->view('trangvangs/getCompanyList');
	}

	public function  buildCompanyList(){
		$cate = $this->model->find_where('',array('status'=>0,'parent'=>0),array('from'=>'crawler_category'));
		$this->model->update('crawler_category',array('status'=>2),array('id'=>$cate->id));
//		debug($this->db->last_query());
		$aryData = array('ok'=>1,'continue'=>true,'name'=>$cate->name,'crawler_url'=>$cate->link);
		if(!empty($cate)){
			$str_html = curl_get_content($cate->link);
			if(!$str_html) return '';
			$html = str_get_html($str_html);
			$paging = $html->find('div[class=paging] a');
			$aryPage = array();
			foreach($paging as $p){
				$aryPage[] = getStandardText(strip_tags($p->innertext));
			}
			$totalPage = end($aryPage); $inserted = 0;
//			debug($totalPage);

			for($i=1;$i<=$totalPage;$i++){
				$ulr = $cate->link.'?page='.$i;
				$data = crawler_list($ulr,$cate->id);
//				debug($data);
				if(!empty($data)){
					foreach($data as $c){
						$isExisted = $this->model->find_where('',array('link'=>$c['link']),array('from'=>'crawler_company'));
						if(empty($isExisted)){
							$inserted++;
							$this->model->add('crawler_company',$c);
						}else{
							$log = array('type'=>'Duplicate','url'=>$isExisted->link);
							$this->model->add('crawler_log',$log);
						}
					}
				}else{
					$log = array('type'=>'Empty Category','url'=>$ulr);
					$this->model->add('crawler_log',$log);
				}

			}

			$aryData['number'] = $cate->number;
			$aryData['inserted'] = $inserted;

			$this->model->update('crawler_category',array('status'=>1),array('id'=>$cate->id));

		}else{
			$aryData['continue'] = false;
		}
		echo  json_encode($aryData);
	}


}

//end of Home