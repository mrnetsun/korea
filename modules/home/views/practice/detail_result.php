<div class="gap"></div>
<?php
    echo pageHeader($anserSheet['exam']['title']);
//debug($anserSheet);
?>
<div class="container">
<div class="row">
    <div class="col-md-2">
        <div class="memberAvatar">
        <?php echo base_img($anserSheet['memberInfo']['avatar'])?>
        </div>
    </div>
    <div class="col-md-4">
        <div class="row">
            <div class="col-md-5">Họ tên</div>
            <div class="col-md-7"><?php echo $anserSheet['memberInfo']['name']?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Mã đăng nhập</div>
            <div class="col-md-7"><?php echo $anserSheet['memberInfo']['username']?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Giờ vào</div>
            <div class="col-md-7"><?php echo date("<b>d/m/Y</b> H:i:s A",$anserSheet['start_time']->sec)?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Nộp bài</div>
            <div class="col-md-7"><?php echo date("<b>d/m/Y</b> H:i:s A",$anserSheet['end_time']->sec)?></div>
        </div>
        </div>
    <div class="col-md-4">

        <div class="row">
            <div class="col-md-5">Điểm thi</div>
            <div class="col-md-7"><?php echo floatval($anserSheet['member_test_point'])?>/<?php echo $anserSheet['test_detail']['total_point']?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Tình trạng</div>
            <div class="col-md-7"><?php echo ($anserSheet['member_pass_status'])?'<span class="text_ok"><i class="fa fa-check-circle"></i> Đạt</span>':'<span class="text_error"><i class="fa fa-times"></i> Không đạt</span>'?></div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <?php echo anchor('luyen-thi/finish/'.$anserSheet['_id']->{'$id'},'<i class="fa fa-facebook"></i> Chia sẻ',
                    array(
                        'data-title'=>$e->title,
                        'class'=>'btnShare btn btn-default btn-facebook btn-large'))?>
                <?php echo anchor('luyen-thi/thi/'.$anserSheet['exam']['exam_id'],'<i class="fa fa-refresh"></i> Làm lại',
                    array(

                        'class'=>'btn btn-default btn-large'))?>
            </div>
        </div>

    </div>
    </div>
    <div class="row">
        <div class="gap"></div>
    <div class="col-md-12">
        <?php if( $anserSheet['exam']['show_member_choise']){?>
        <div class="">
            <div class="examQuestion">
                <?php
                $qIndex = 0;
                if($anserSheet['components'])foreach($anserSheet['components'] as $jc=>$c){
                    if($c['show_title']){
                        echo '<h2>'.$c['title'].'</h2>';
                    }

                    if($c['questions'])foreach($c['questions'] as $jq=>$q){
                        echo '<section class="questionItem">';

                        echo '<input type="hidden" name="component_index" value="'.$jc.'"/>';
                        echo '<input type="hidden" name="question_index" value="'.$jq.'"/>';
                        echo '<input type="hidden" name="question_id" value="'.$q['question_id'].'"/>';

//                    echo $q['question_type'] ;
                        if($q['question_type'] != 11){

                            $qIndex++;
                            echo '<h3 data-type="'.$q['question_type'].'" class="item question_'.$q['question_id'].'"> Câu '.$qIndex.'</span> </h3>';

                            echo displayQuestionFront($q);
                            echo displayQuestionAnswerFront($q,array('member'=>true,'show_checkAnswer'=>true,'exam'=>$exam));


                        }else{
                            if($q['sub_questions'])foreach($q['sub_questions'] as $js=>$sub){
                                echo '<input type="hidden" name="sub_index" value="'.$js.'"/>';
                                $qIndex++;
                                echo '<h3 data-type="'.$sub['question_type'].'" class="item subQuestion question_'.$sub['question_id'].'"> Câu '.$qIndex.'</span> </h3>';
                                echo displayQuestionFront($sub);
                                echo displayQuestionAnswerFront($sub,array('member'=>true,'show_checkAnswer'=>true,'exam'=>$exam));

                            }
                        }

                        echo "</section>";

                    }
                }
                ?>
            </div>
            <div class="gap-mini"></div>

        </div>
        <?php }?>
    </div>
</div>
</div>