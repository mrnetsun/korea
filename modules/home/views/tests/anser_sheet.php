<div class="gap"></div>
<?php
    echo pageHeader($anserSheet['exam']['title']);
//debug($anserSheet);
?>
<div class="container">
<div class="row">
    <div class="col-md-5">
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
        <div class="gap"></div>
        <div class="row">
            <div class="col-md-5">Điểm thi</div>
            <div class="col-md-7"><?php echo floatval($anserSheet['member_test_point'])?>/<?php echo $anserSheet['test_detail']['total_point']?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Tình trạng</div>
            <div class="col-md-7"><?php echo ($anserSheet['member_pass_status'])?'<span class="text_ok"><i class="fa fa-check-circle"></i> Đạt</span>':'<span class="text_error"><i class="fa fa-times"></i> Không đạt</span>'?></div>
        </div>
        <div class="gap"></div>
        <div class="row">
            <div class="col-md-6">
                <?php echo anchor('thi-thu/finish/'.$anserSheet['_id']->{'$id'},'<i class="fa fa-facebook"></i> Chia sẻ',
                    array(
                        'data-title'=>$e->title,
                        'class'=>'btnShare btn btn-default btn-facebook btn-large'))?>
                <?php echo anchor('thi-thu/thi/'.$anserSheet['exam']['exam_id'],'<i class="fa fa-refresh"></i> Làm lại',
                    array(

                        'class'=>'btn btn-default btn-large'))?>
            </div>
        </div>

    </div>
    <div class="col-md-7">
        <?php if( $anserSheet['exam']['show_member_choise']){?>
        <div class="answerSheetMember">
            <h3>Bảng kết quả</h3>
            <div class="answerSheetMemberContent" style="background: #fff;">
                <?php
                $qIndex = 0;$totalFinished=0;
                $checkAnswer = $anserSheet['exam']['show_result'];

                if($anserSheet['components'])foreach($anserSheet['components'] as $c){
                    if($c['questions'])foreach($c['questions'] as $q){
                        if($q['question_type'] != 11){
                            $qIndex++;

                            if(is_null($q['member_answer'])){
                                $option ='<span class="option"></span>';
                            }else{
                                if($checkAnswer){
                                    if($q['member_point'] >0){
                                        $member_check = 'true';
                                    }else{
                                        $member_check = 'false';
                                    }
                                }else{
                                    $member_check = '';
                                }
                                $option ='<span class="option checked '.$member_check.'">'.($q['member_answer']+1).'</span>';
                                $totalFinished++;
                            }


                            echo '<a href="#question_'.$q['question_id'].'" class="item qIndex_'.$q['question_id'].'" data-question="'.$q['question_id'].'"><span class="index">'.$qIndex.'</span>'.$option.'</a> ';
                        }else{
                            if($q['sub_questions'])foreach($q['sub_questions'] as $sub){
                                $qIndex++;

                                if(is_null($sub['member_answer'])){
                                    $option ='<span class="option"></span>';
                                }else{
                                    if($checkAnswer){
                                        if($q['member_point'] >0){
                                            $member_check = 'true';
                                        }else{
                                            $member_check = 'false';
                                        }
                                    }else{
                                        $member_check = '';
                                    }

                                    $option ='<span class="option checked '.$member_check.'">'.($sub['member_answer']+1).'</span>';
                                    $totalFinished++;
                                }
                                echo '<a href="#question_'.$sub['question_id'].'"  class="item qIndex_'.$sub['question_id'].'" data-question="'.$sub['question_id'].'"><span class="index">'.$qIndex.'</span>'.$option.'</a> ';
                            }
                        }

                    }
                }
                ?>
            </div>
            <div class="gap-mini"></div>
            <?php echo anchor('thi-thu/chitiet/'.$anserSheet['_id']->{'$id'},'Xem chi tiết',array('style'=>'color:#555'))?>

            <div class="gap"></div>
        </div>
        <?php }?>
    </div>
</div>
</div>