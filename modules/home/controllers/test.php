<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Test extends Front_Controller {
    /**
     * Model
     * @var string
     */
    public $model_name  = 'account_model';
    /**
     *
     * @var Test_Model
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

    public function index(){

        //thi thu
        $exams = $this->model->find_where('list',array('cate_id'=>4,'status'=>3),array('from'=>'exam'));

        foreach($exams as $k=>$e){
            $exams[$k]->total_attempt = $this->mongo_db->where(array('exam_id'=>intval($e->exam_id)))
                ->count('exam_member');
            $exams[$k]->attempt = $this->mongo_db->where(array('exam_id'=>intval($e->exam_id),'memberId'=>$this->LoginData->memberId))
                ->count('exam_member');
            $exams[$k]->online = $this->mongo_db->where(array('exam_id'=>intval($e->exam_id),'memberId'=>$this->LoginData->memberId,'status'=>EXAM_DOING))
                ->count('exam_member');
        }

        $this->template->set('exams',$exams);
       $this->view('tests/index');
    }

    public function xem($id=''){
        $id = intval($id);
        $exam = $this->model->get(intval($id),array('from'=>'exam'));
        if(!$exam) redirect('home');

        if($this->LoginData){
            $myHistory = $this->mongo_db->select(
                    array('memberInfo','memberId','exam_id','test_detail','start_time','end_time',
                        'member_test_point','member_pass_status'
                        ))
                ->order_by(array('start_time'=>-1))
                ->limit(10)
                ->get_where('exam_member',array('exam_id'=>$id,'memberId'=>$this->LoginData->memberId));

        }else{
            $myHistory = array();
        }
        $this->template->set('myHistory',$myHistory);

        $groups_q = array(
            //array('$project'=>array('exam_id'=>1,'memberId'=>1,'start_time'=>1,'end_time'=>1,'member_test_point'=>1,'member_pass_status'=>1,'memberInfo'=>1,'test_detail'=>1)),
            array('$match'=> array('exam_id'=>$id)),
            array('$group'=>array('_id'=>'$memberId','max_score'=>array('$max'=>'$member_test_point'),
                'detail' => array('$addToSet'=>array('memberInfo'=>'$memberInfo'))
                )),

            array('$sort'=>array('max_score'=>-1)),
            array('$limit'=>5)
        );

        $topMember = $this->mongo_db->aggregate('exam_member',$groups_q);

        $this->template->set('topMember',$topMember);

        $this->view('tests/xem',array('exam'=> $exam));
    }

    public function thi($id=''){

        if(!$this->LoginData){
            accessDenied();
        }

        $this->loadJs('soundmanager/script/soundmanager2-jsmin.js');
        $this->loadJs('soundmanager/demo/bar-ui/script/bar-ui.js');
        $this->assetCss('soundmanager/demo/bar-ui/css/bar-ui.css');

        $this->loadJs('slimscroll/jquery.slimscroll.min.js');

        $exam = $this->model->get($id,array('from'=>'exam'));
        $id = intval($id);

        //reset all
//        $this->mongo_db->delete_all('exam_member');

        $memberId = ($this->LoginData->memberId)? $this->LoginData->memberId:session_id();

        //get exam_status
        $exam_status = $this->mongo_db->get_where('exam_member',array('status'=>EXAM_DOING,'memberId'=>$memberId,'exam_id'=>$id));


        if(empty($exam_status)){
            $test = $this->model->find_where('',
                array('IN'=>array('test_id'=>json_decode($exam->tests))),
                array('from'=>'test','fixed_sort'=>'rand()'));

            $components = $this->model->find_where('list',
                array('test_id'=>$test->test_id),
                array('from'=>'test_component',
                        'fixed_sort'=>'position ASC, test_component_id ASC'
                    ));

            foreach($components as $k=>$c){

                if($c->display_random){
                    $fixed_sort =  'rand()';
                }else{
                    $fixed_sort =  'mt.order_position ASC';
                }

                $components[$k]->questions = $this->model->find_where('list',
                    array('mt.test_id'=>$test->test_id,'mt.test_component_id'=>$c->test_component_id),
                    array(
                        'select'=>'q.*,mt.question_point,mt.question_sub_point',
                        'join'=>array(array('question as q','q.question_id = mt.question_id AND q.status ='.ACTIVE)),
                        'fixed_sort'=>$fixed_sort,
                        'from'=>'test_question')
                    );

                foreach( $components[$k]->questions as $i =>$q){
                    if($q->question_type == 11){
                        $components[$k]->questions[$i]->sub_questions = $this->model->find_where('list',
                            array('parent_id'=>$q->question_id),
                            array('from'=>'question'));
                    }
                }
            }


            $exam_status = array();
            $exam_status['status'] = EXAM_DOING;

            $exam_status['exam'] = array(
                                            'exam_id'=>$exam->exam_id,
                                            'title'=>$exam->title,
                                            'audio_record'=>$exam->audio_record,
                                            'start_time'=>$exam->start_time,
                                            'end_time'=>$exam->end_time,
                                            'mark_type'=>$exam->mark_type,
                                            'show_point'=>$exam->show_point,
                                            'show_feedback'=>$exam->show_feedback,
                                            'pass_point'=>$exam->pass_point,
                                            'show_result'=>$exam->show_result,
                                            'exam_type'=>$exam->exam_type,
                                            'show_checkAnswer'=>$exam->show_checkAnswer,
                                            'markExamType'=>$exam->markExamType,
                                            'show_member_choise'=>$exam->show_member_choise,
                                            'max_audio_play'=>$exam->max_audio_play
                                            );

            if($this->LoginData->memberId){
                $member = $this->model->get($this->LoginData->memberId,array('from'=>'sys_member'));
                $exam_status['memberInfo'] = array(
                    'name'=>$member->firstName.' '.$member->lastName,
                    'username'=>$member->username,
                    'email'=>$member->email,
                    'birdthday'=>$member->birdthday,
                    'avatar'=>$member->avatar
                );
                $exam_status['is_guest'] = 0;
            }else{
                $exam_status['is_guest'] = 1;
                $exam_status['memberInfo'] = array('name'=>__('Guest'));
            }

            $exam_status['memberId'] = $this->LoginData->memberId;
            $exam_status['session'] = session_id();
            $exam_status['exam_id'] = $id;
            $exam_status['test_id'] = $test->test_id;
            $exam_status['start_time'] =  new MongoDate();
            $exam_status['end_time'] = '';
            $exam_status['test_detail'] = $test;

            $exam_status['components'] = $components;

            $this->mongo_db->insert('exam_member',$exam_status);

            //get from Mongo
            $exam_status = $this->mongo_db->get_where('exam_member',array('status'=>EXAM_DOING,'memberId'=>$memberId,'exam_id'=>$id));

        }

        //check expired
        $endTestTime = date("Y-m-d H:i:s",strtotime("+".$exam_status[0]['test_detail']['time_limit'].' minutes',$exam_status[0]['start_time']->sec));
        $remain = (strtotime($endTestTime) - time());

        $sheetId = $exam_status[0]['_id']->{'$id'};

        if($remain <= 0){
            redirect('thi-thu/finish/'.$sheetId);
        }

        $this->template->set('remain',$remain);

        $this->template->set('exam_status',$exam_status[0]);


        $this->view('tests/thi',array('exam'=> $exam),'','exam');
    }

    public function updateQuestion(){

        $_id =  new MongoId ($this->input->post('sheet_id'));
        $question_id = intval($this->input->post('question_id'));
        $component_index = $this->input->post('component_index');
        $question_index = $this->input->post('question_index');

        $question_sub_id = $this->input->post('question_sub_id');
        $sub_index = $this->input->post('sub_index');

        $answer = $this->input->post('answer');

        $aryData = array('ok'=>true,'question_id'=>$question_id,'answer'=>$answer);


        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('exam_member');



        //check expired
        $endTestTime = date("Y-m-d H:i:s",strtotime("+".$anserSheet['test_detail']['time_limit'].' minutes',$anserSheet['start_time']->sec));
        $remain = (strtotime($endTestTime) - time());
        $aryData['remain'] = $remain;

//        $sheetId = $anserSheet['_id']->{'$id'};
//        if($remain <= 0){
//            //expired
//            redirect('thi-thu/finish/'.$sheetId);
//        }

        //update
        if($anserSheet){
            if($anserSheet['components'][$component_index]['questions'][$question_index]['question_id'] == $question_id){

                if($anserSheet['components'][$component_index]['questions'][$question_index]['question_type'] == 11 && $question_sub_id){
                    //sub question submit
                    $point = getMemberPoint($anserSheet['components'][$component_index]['questions'][$question_index]['sub_questions'][$sub_index],$answer,$anserSheet['components'][$component_index]['questions'][$question_index]);

                    $anserSheet['components'][$component_index]['questions'][$question_index]['sub_questions'][$sub_index]['member_point'] =  $point;
                    //update parent question point
                    $parent_point = 0;
                    foreach($anserSheet['components'][$component_index]['questions'][$question_index]['sub_questions'] as $sub){
                        $parent_point+=  floatval($sub['member_point']);
                    }
                    $anserSheet['components'][$component_index]['questions'][$question_index]['member_point'] =  $parent_point;

                    //update point component
                    $component_point = 0;
                    foreach($anserSheet['components'][$component_index]['questions'] as $q){
                        $component_point += floatval($q['member_point']);
                    }
                    $anserSheet['components'][$component_index]['member_component_point'] = $component_point;
                    //update test point
                    $test_point = 0;
                    foreach($anserSheet['components'] as $c){
                        $test_point += floatval($c['member_component_point']);
                    }

                    //check result
                    $pass_check = ($test_point/$anserSheet['test_detail']['total_point'])*100;
                    if($anserSheet['exam']['pass_point']){
                        $pass_flag = $pass_check >= $anserSheet['exam']['pass_point'];
                    }else{
                        $pass_flag = $pass_check >= $anserSheet['test_detail']['pass_point'];
                    }
                    $member_pass_status = ($pass_flag)?1:0;

                    $this->mongo_db->where(array('_id'=>$_id))
                        ->set(array(
                            "member_test_point"=>$test_point,
                            "member_pass_status"=>$member_pass_status,
                            "components.$component_index.member_component_point"=>$component_point,
                            "components.$component_index.questions.$question_index.sub_questions.$sub_index.member_answer"=>$answer,
                            "components.$component_index.questions.$question_index.sub_questions.$sub_index.member_point"=>$point,
                            "components.$component_index.questions.$question_index.member_point"=>$parent_point
                        ))
                        ->update('exam_member');


                    if($anserSheet['exam']['show_checkAnswer']){
                        $aryData['show_check'] = 1;
                        $aryData['question_id'] = $question_sub_id;
                        $aryData['point'] = $point;
                        $aryData['test_point'] = $test_point;
                    }
                }else{
                    $point = getMemberPoint($anserSheet['components'][$component_index]['questions'][$question_index],$answer);

                    $anserSheet['components'][$component_index]['questions'][$question_index]['member_point'] =  $point;
                    //update point component
                    $component_point = 0;
                    foreach($anserSheet['components'][$component_index]['questions'] as $q){
                        $component_point += floatval($q['member_point']);
                    }
                    $anserSheet['components'][$component_index]['member_component_point'] = $component_point;
                    //update test point
                    $test_point = 0;
                    foreach($anserSheet['components'] as $c){
                        $test_point += floatval($c['member_component_point']);
                    }

                    //check result
                    $pass_check = ($test_point/$anserSheet['test_detail']['total_point'])*100;
                    if($anserSheet['exam']['pass_point']){
                        $pass_flag = $pass_check >= $anserSheet['exam']['pass_point'];
                    }else{
                        $pass_flag = $pass_check >= $anserSheet['test_detail']['pass_point'];
                    }
                    $member_pass_status = ($pass_flag)?1:0;

                    $this->mongo_db->where(array('_id'=>$_id))
                        ->set(array(
                            "member_test_point"=>$test_point,
                            "member_pass_status"=>$member_pass_status,
                            "components.$component_index.member_component_point"=>$component_point,
                            "components.$component_index.questions.$question_index.member_answer"=>$answer,
                            "components.$component_index.questions.$question_index.member_point"=>$point
                        ))
                        ->update('exam_member');


                    if($anserSheet['exam']['show_checkAnswer']){
                        $aryData['show_check'] = 1;
                        $aryData['question_id'] = $question_id;
                        $aryData['point'] = $point;
                        $aryData['test_point'] = $test_point;
                    }
                }


            }else{
                $aryData['ok'] = false;
            }

        }else{
            $aryData['ok'] = false;
        }



        echo  json_encode($aryData);
    }

    public function finish($sheet_id){

        if(!$sheet_id) redirect('home');

        $_id =  new MongoId ($sheet_id);
        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('exam_member');

        if($anserSheet['status']!= EXAM_FINISHED){
            $this->mongo_db->where(array('_id'=>$_id))
                ->set(array(
                    "status"=>EXAM_FINISHED,
                    'end_time'=>new MongoDate()
                ))
                ->update('exam_member');
        }

        $this->view('tests/anser_sheet',array('anserSheet'=>$anserSheet));
    }

    public function ketqua($sheet_id){
        if(!$sheet_id) redirect('home');

        $_id =  new MongoId ($sheet_id);
        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('exam_member');

        if($anserSheet['status']!= EXAM_FINISHED){
            $this->mongo_db->where(array('_id'=>$_id))
                ->set(array(
                    "status"=>EXAM_FINISHED,
                    'end_time'=>new MongoDate()
                ))
                ->update('exam_member');
        }

        $this->view('tests/quick_result',array('anserSheet'=>$anserSheet));
    }

    public function chitiet($sheet_id){
        if(!$sheet_id) redirect('home');

        $this->loadJs('soundmanager/script/soundmanager2-jsmin.js');
        $this->loadJs('soundmanager/demo/bar-ui/script/bar-ui.js');
        $this->assetCss('soundmanager/demo/bar-ui/css/bar-ui.css');

        $_id =  new MongoId ($sheet_id);
        $anserSheet =  $this->mongo_db->where(array('_id'=>$_id))->find_one('exam_member');

        if($anserSheet['status']!= EXAM_FINISHED){
            $this->mongo_db->where(array('_id'=>$_id))
                ->set(array(
                    "status"=>EXAM_FINISHED,
                    'end_time'=>new MongoDate()
                ))
                ->update('exam_member');
        }




    $this->view('tests/detail_result',array('anserSheet'=>$anserSheet));
    }
}

//end of Home