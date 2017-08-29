<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Vocabulary extends Front_Controller {
    /**
     * Model
     * @var string
     */
    public $model_name  = 'vocabulary_model';
    /**
     *
     * @var Vocabulary_Model
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

    /**
     * @var SSH2
     */
    protected $ssh2;

    public function __construct(){
        parent::__construct();
         
    }

    public function index($parent_id=1){
         $this->topic($parent_id);
    }

    public function topic($parent_id =1 ,$start=1){
        $parent_id = intval($parent_id);
        $parent = $this->model->get($parent_id,array('from'=>'vocabulary_category'));
        $this->template->set('parent',$parent);
        $limit = 30;
        if(!$start) $start = 1;
        $offset = ($start-1)*$limit;
        $where = array('parent_id'=>$parent_id,'status <>'=> 0);
        $categories = $this->model->find_where('list',$where,array('from'=>'vocabulary_category','offset'=>$offset,'limit'=>$limit));

        foreach($categories as $k=>$c){
            $categories[$k]->is_done = $this->is_topic_done($c->id);
        }

        $this->template->set('categories',$categories);

        $total = $this->model->count_where($where,array('from'=>'vocabulary_category'));

        $config['div'] = 'articleList';
        $config['anchor'] = 'captchaAnchor';
        $config['base_url'] = '/tu-vung/topic/'.$parent_id;
        $config['total_rows'] = $total;
        $config['per_page'] = $limit;
        $config['cur_page'] = $start;
        $config['display_from'] = "Display from";
        $config['display_to'] = "to";
        $config['display_of'] = "of";
        $this->template->set('start',$start);

        $this->jquery_pagination->initialize($config);
        $this->template->set('pagination',$this->jquery_pagination);


        $this->view('vocabulary/index',array(),'','practice');
    }

    public function card($cate_id){
        $this->loadJs('soundmanager/script/soundmanager2-nodebug-jsmin.js');
        $this->loadJs('flib/flip.js');




        $category = $this->model->get($cate_id,array('from'=>'vocabulary_category'));
        $this->template->set('category',$category);

        $words = $this->model->find_where('list',array('status <>'=>0,'LIKE'=>array('cate_id'=>'"'.intval($cate_id).'"')));

        $this->template->set('words',$words);

        if($this->LoginData->memberId){
            $topic_done = $this->mongo_db->get_where('topic_result',array('memberId'=>$this->LoginData->memberId,'topic_id'=>$cate_id));

            $this->template->set('topic_done',$topic_done[0]);
        }


        $this->view('vocabulary/card',array(),'','practice');
    }

    public function luyentap($cate_id){
        $this->loadJs('soundmanager/script/soundmanager2-nodebug-jsmin.js');

        $html = $this->practice($cate_id,0,true);

        $this->view('vocabulary/luyentap',array('html'=>$html),'','practice');
    }

    public function practice($cate_id,$index=0,$flag = false){
        $aryData = array('ok'=>true);

        $cate_id = intval($cate_id);
        $category = $this->model->get($cate_id,array('from'=>'vocabulary_category'));
        $this->template->set('category',$category);

        $this->session->set_userdata('member.vocabulary',array());

        $total = $this->model->count_where(
            array('status <>'=>0,
                'LIKE'=>array('cate_id'=>'"'.$cate_id.'"'))
        );

//        debug($this->db->last_query());

        $this->template->set('total',$total);

        $this->session->set_userdata('member.total',intval($total));


        $word = $this->model->find_where('',
            array('status <>'=>0,
                'LIKE'=>array('cate_id'=>'"'.$cate_id.'"')),
                array('offset'=>$index,'limit'=>1)
            );
       if($word){
           $this->template->set('word',$word);

           $mixed = $this->model->find_where('list',
               array('status <>'=>0,
                   'id <>'=>$word->id,
                   'LIKE'=>array('cate_id'=>'"'.$cate_id.'"'))
               ,array('fixed_sort'=>'rand()','limit'=>3));
           $this->template->set('mixed',$mixed);

           $html = $this->baseView('vocabulary/practice',array('cate_id'=>$cate_id,'index'=>$index),true);
       }else{
           $aryData['finished'] = true;
           $html = '';
       }

        if($flag){
            return $html;
        }else{
            $aryData['html'] = $html;
            echo json_encode($aryData);
        }
    }

    public function check(){

        $answer	= $this->input->post('answer');
        $cate_id	= $this->input->post('cate_id');
        $index	= $this->input->post('index');
        $id	= $this->input->post('q');

        $vocabulary = $this->session->userdata('member.vocabulary');

        $total = $this->session->userdata('member.total');

        $aryData = array('answer'=>$answer,'cate_id'=>$cate_id,'index'=>$index);
        if(md5('index'.$id) == $answer){
            $aryData['ok'] = true;
            $aryData['html'] = $this->practice($cate_id,$index+1,true);


            $vocabulary[] = $id;

            $this->session->set_userdata('member.vocabulary',$vocabulary);

        }else{
            $aryData['ok'] = false;

        }
        $processed = count($vocabulary);

        if($total){
            $aryData['percent'] = ($processed/$total)*100;
        }else{
            $aryData['percent'] = 0;
        }

        $aryData['label'] = $processed.'/'.$total;

        echo json_encode($aryData);
    }

    public function kiemtra($cate_id=0){
//        $this->load->library('benchmark2','','benchmark2');
//        $this->benchmark2->mark('code_start');
        $this->loadJs('soundmanager/script/soundmanager2-nodebug-jsmin.js');

        $this->loadJs('soundmanager/demo/bar-ui/script/bar-ui.js');
        $this->assetCss('soundmanager/demo/bar-ui/css/bar-ui.css');

        $this->loadJs('slimscroll/jquery.slimscroll.min.js');

        //reset
        $this->mongo_db->delete_all('vocabulary_test');

        $cate_id = intval($cate_id);
        $category = $this->model->get($cate_id,array('from'=>'vocabulary_category'));
        $this->template->set('category',$category);

        $memberId = ($this->LoginData->memberId)? $this->LoginData->memberId:session_id();

        $exam_status = $this->mongo_db->get_where('vocabulary_test',array('status'=>EXAM_DOING,'memberId'=>$memberId,'cate_id'=>$cate_id));
//        debug($exam_status);
        if(empty($exam_status)) {

            $words = $this->model->find_where('list',
                array('status <>' => 0,
                    'LIKE' => array('cate_id' => '"' . $cate_id . '"')),
                array('fixed_sort' => 'rand()', 'limit' => 40)
            );
            $limit_time = 40;// 40 phút



            $questions = array();
            foreach ($words as $word) {
                $mixed = $this->model->find_where('list',
                    array('status <>' => 0,
                        'id <>' => $word->id,
                        'LIKE' => array('cate_id' => '"' . $cate_id . '"'))
                    , array('fixed_sort' => 'rand()', 'limit' => 3));
                $this->template->set('mixed', $mixed);

                $answer = array(array('title'=>$word->title,'meaning'=>$word->meaning,'audio'=>$word->audio,'true_plan'=>1));
                foreach ($mixed as $m) {
                    $answer[] = array('title'=>$m->title,'meaning'=>$m->meaning,'audio'=>$m->audio,'true_plan'=>0);
                }

                //trộn đáp án
                shuffle($answer);

                $questions[] = array('title' => $word->title,
                    'audio' => $word->audio,
                    'type' => rand(1, 5),
                    'meaning' => $word->meaning,
                    'answer' => $answer,
                    'point' => 1
                    //'member_point'=>0,
                    //'member_answer'=>''
                );
            }

            //trộn câu hỏi
            shuffle($questions);

            $member = array();
            $member['avatar'] = $this->LoginData->avatar;
            $member['firstName'] = $this->LoginData->firstName;
            $member['lastName'] = $this->LoginData->lastName;

            $test = array('memberId' => $memberId,
                'memberInfo'=>$member,
                'topic'=>$category->cate_name,
                'topic_id'=>$category->id,
                'start' => date("Y-m-d H:i:s"),
                'passed' => false,
                'status' => EXAM_DOING,
                'cate_id' => $cate_id,
                'total_question' => count($questions),
                'time_limit' => $limit_time,
                'member_point' => 0,
                'questions' => $questions,
                'heart' => 4
            );



            $this->mongo_db->insert('vocabulary_test',$test);

            //get from Mongo
            $exam_status = $this->mongo_db->get_where('vocabulary_test',array('status'=>EXAM_DOING,'memberId'=>$memberId,'cate_id'=>$cate_id));

        }

//        debug($exam_status);

        //check expired
        $endTestTime = date("Y-m-d H:i:s",strtotime("+".$exam_status[0]['time_limit'].' minutes',strtotime($exam_status[0]['start'])));
//        debug($endTestTime);
        $remain = (strtotime($endTestTime) - time());

        $sheetId = $exam_status[0]['_id']->{'$id'};

        if($remain <= 0){
            redirect('tu-vung/finish/'.$sheetId);
        }

        $this->template->set('remain',$remain);

        $this->template->set('exam_status',$exam_status[0]);

//        $this->benchmark2->mark('code_end');

//        echo $this->benchmark2->elapsed_time('code_start', 'code_end');

        $this->view('vocabulary/kiemtra',array(),'','exam');
    }

    public function updateQuestion(){
        $_id =  new MongoId ($this->input->post('sheet_id'));
        $question_id = intval($this->input->post('question_id'));

        $answer = $this->input->post('answer');

        $aryData = array('ok'=>true,'question_id'=>$question_id,'answer'=>$answer);


        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('vocabulary_test');

//        debug($anserSheet);

        $endTestTime = date("Y-m-d H:i:s",strtotime("+".$anserSheet['time_limit'].' minutes',strtotime($anserSheet['start'])));
//        debug($endTestTime);
        $remain = (strtotime($endTestTime) - time());

        //update
        if($anserSheet){
            $anserSheet['questions'][$question_id]['member_answer'] = $answer;
            if($anserSheet['questions'][$question_id]['answer'][$answer]['true_plan']){
                $point =  $anserSheet['questions'][$question_id]['point'];
            }else{
                $point = 0;
            }

            $anserSheet['questions'][$question_id]['member_point'] = $point;

            $total_point = 0;
            foreach( $anserSheet['questions'] as $q){
                $total_point += intval($q['member_point']);
            }


            $passed = false;
            if(($total_point/count($anserSheet['questions']))*100 >= 70){
                $passed = true;
            }


            $this->mongo_db->where(array('_id'=>$_id))
                ->set(array(
                    'member_point'=>$total_point,
                    "passed"=>$passed,
                    "questions.$question_id.member_point"=>$point,
                    "questions.$question_id.member_answer"=>$answer,
                ))->update('vocabulary_test');



        }

        $aryData['remain'] = $remain;

//        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('vocabulary_test');
//        debug($anserSheet);

        echo  json_encode($aryData);

    }

    public function finish($sheet_id){

        if(!$sheet_id) redirect('home');

        $_id =  new MongoId ($sheet_id);
        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('vocabulary_test');

        if($anserSheet['status']!= EXAM_FINISHED){
            $this->mongo_db->where(array('_id'=>$_id))
                ->set(array(
                    "status"=>EXAM_FINISHED,
                    'end_time'=>date("Y-m-d H:i:s")
                ))
                ->update('vocabulary_test');

        }

//        $anserSheet['passed'] = true; $anserSheet['member_point'] = 15;
//        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('vocabulary_test');

        if($anserSheet['passed'] && $this->LoginData->memberId){
            $topic =  $this->mongo_db->where(array('topic_id'=>$anserSheet['topic_id'],'memberId'=>$this->LoginData->memberId))->find_one('topic_result');
            if(!$topic){
                $this->mongo_db->insert('topic_result',
                    array('topic_id'=>$anserSheet['topic_id'],
                        'memberId'=>$this->LoginData->memberId,
                        'member_point'=>$anserSheet['member_point'],
                        'date'=>date("Y-m-d H:i:s")));
            }else{
                if($anserSheet['member_point'] > $topic['member_point']){
                    $this->mongo_db->where(array('_id'=>$topic['_id']))
                        ->set(array(
                            "member_point"=>$anserSheet['member_point'],
                            'date'=>date("Y-m-d H:i:s")
                        ))
                        ->update('topic_result');
                }

            }

        }

        $this->view('vocabulary/anser_sheet',array('anserSheet'=>$anserSheet));
    }


    public function chitiet($sheet_id){
        if(!$sheet_id) redirect('home');

        $this->loadJs('soundmanager/script/soundmanager2-jsmin.js');
        $this->loadJs('soundmanager/demo/bar-ui/script/bar-ui.js');
        $this->assetCss('soundmanager/demo/bar-ui/css/bar-ui.css');

        if(!$sheet_id) redirect('home');

        $_id =  new MongoId ($sheet_id);
        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('vocabulary_test');

        if($anserSheet['status']!= EXAM_FINISHED){
            $this->mongo_db->where(array('_id'=>$_id))
                ->set(array(
                    "status"=>EXAM_FINISHED,
                    'end_time'=>date("Y-m-d H:i:s")
                ))
                ->update('vocabulary_test');

        }

        $this->view('vocabulary/detail_result',array('anserSheet'=>$anserSheet));
    }

    private function is_topic_done($cate_id){
        if(!$this->LoginData->memberId) return false;

        $topic_done = $this->mongo_db->where(array('memberId'=>$this->LoginData->memberId,'topic_id'=>$cate_id))
            ->find_one('topic_result');
        if(!empty($topic_done)){
            return true;
        }else{
            return false;
        }
    }

}

//end of Home