<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Vneconomy extends MY_Controller {
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
        parent::__construct();
        $this->load->helper('dom');
    }

    public function index($id=''){

       $item  = $this->model->find_where('',array('id'=>$id),
            array(
                'select'=>'mt.*,c.name as cate_name',
                'from'=>'crawler_article_topic',
                'join'=>array(
                    array('category as c','c.cateId = mt.cateId','left')
                )
                ));
       $this->template->set('item',$item);

        //others
        $other_topic = $this->model->find_where('list',array('code'=>'vneconomy','status'=>ACTIVE,'id <>'=>$id),array('from'=>'crawler_article_topic'));
        $this->template->set('other_topic',$other_topic);

       $this->view("vneconomy/index");
    }

    public function getArticleLink($id){
        $aryData = array('ok'=>true);
        $link = $this->model->get($id,array('from'=>'crawler_article_topic'));
        $topicId = $link->id;
        $cateId = $link->cateId;
        $approve = $link->approve;
        $code = $link->code;
        $topic = $link;
        $html_string = curl_get_content($link->link);
        $domain = 'http://vneconomy.vn';
        try{
            $html = str_get_html($html_string);
            $found = array();
            $headerleftcm = $html->find('div[class="headerleftcm"]');
            $link = $headerleftcm[0]->find('a[class="hdlcmtitlel"]');
            foreach($link as $item){
                $data = array();
                $data['title'] = trim($item->innertext);
                $data['slug'] = to_slug($data['title']);
                $data['link'] = $domain.$item->attr['href'];
                $data['domain'] = $domain;
                $data['feature'] = 1;
                $data['status'] = 0;
                $data['approve'] = $approve;
                $data['code'] = $code;
                $found[] = $data;
            }

            $link = $headerleftcm[0]->find('a[class="titletopfooter"]');
            foreach($link as $item){
                $data = array();
                $data['title'] = trim($item->innertext);
                $data['slug'] = to_slug($data['title']);
                $data['link'] = $item->attr['href'];
                $data['domain'] = $domain;
                $data['feature'] = 1;
                $data['status'] = 0;
                $data['approve'] = $approve;
                $data['code'] = $code;
                $found[] = $data;
            }

            $link = $headerleftcm[0]->find('a[class="ultopmidtitle"]');
            foreach($link as $item){
                $data = array();
                $data['title'] = trim($item->innertext);
                $data['slug'] = to_slug($data['title']);
                $data['link'] = $item->attr['href'];
                $data['domain'] = $domain;
                $data['feature'] = 1;
                $data['status'] = 0;
                $data['approve'] = $approve;
                $data['code'] = $code;
                $found[] = $data;
            }

            $link = $headerleftcm[0]->find('a[class="titletopmid2"]');
            foreach($link as $item){
                $data = array();
                $data['title'] = trim($item->innertext);
                $data['slug'] = to_slug($data['title']);
                $data['link'] = $item->attr['href'];
                $data['domain'] = $domain;
                $data['feature'] = 0;
                $data['status'] = 0;
                $data['approve'] = $approve;
                $data['code'] = $code;
                $found[] = $data;
            }
            $ok = false;$inserted=0;
            foreach($found as $article){
                $isExited = $this->model->find_where('',array('AND'=>'(link ="'.$article['link'].'" OR slug="'.$article['slug'].'")'),
                    array('from'=>'crawler_article_link'));
                if(!$isExited){
                    $article['category_id'] = $cateId;
                    $ok = true;$inserted++;
                    $this->model->add('crawler_article_link',$article);
                }
            };

            //update running time
            $this->model->update('crawler_article_topic',array('last_running'=>date("Y-m-d H:i:s")),array('id'=>$topicId));

        }catch(Exception $e){
            $ok = false;
        }

        if(!$ok){
            $aryData['smessage'] = $topic->title.'-Không có bản ghi nào mới.<br>';
        }else{
            $aryData['smessage'] = $topic->title.'-Đã thêm '.$inserted.' bản ghi mới.<br>';
        }
        $aryData['ok'] = $ok;

        //done
        $this->model->update('crawler_article_topic',array('run_flag'=>1),array('id'=>$topicId));
        echo json_encode($aryData);

    }


}

//end of Home