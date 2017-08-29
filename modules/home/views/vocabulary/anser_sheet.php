<div class="gap"></div>
<?php
    echo pageHeader($anserSheet['topic']);
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
            <div class="col-md-7"><?php echo date("<b>d/m/Y</b> H:i:s A",strtotime($anserSheet['start']))?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Nộp bài</div>
            <div class="col-md-7"><?php echo date("<b>d/m/Y</b> H:i:s A",strtotime($anserSheet['end_time']))?></div>
        </div>
        <div class="gap"></div>
        <div class="row">
            <div class="col-md-5">Điểm thi</div>
            <div class="col-md-7"><?php echo floatval($anserSheet['member_point'])?>/<?php echo count($anserSheet['questions'])?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Tình trạng</div>
            <div class="col-md-7"><?php echo ($anserSheet['passed'])?'<span class="text_ok"><i class="fa fa-check-circle"></i> Đạt</span>':'<span class="text_error"><i class="fa fa-times"></i> Không đạt</span>'?></div>
        </div>
        <div class="gap"></div>
        <div class="row">
            <div class="col-md-6">
                <?php echo anchor('tu-vung/kiemtra/'.$anserSheet['topic_id'],'<i class="fa fa-refresh"></i> Làm lại',
                    array(

                        'class'=>'btn btn-default btn-large'))?>
            </div>
        </div>

    </div>
    <div class="col-md-7">

        <div class="answerSheetMember">
            <h3>Bảng kết quả</h3>
            <div class="answerSheetMemberContent" style="background: #fff;">
                <?php
                $qIndex = 0;$totalFinished=0;
                $checkAnswer = true;


                    if($anserSheet['questions'])foreach($anserSheet['questions'] as $k=>$q){

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


                            echo '<a class="item qIndex_'.$k.'" data-question="'.$q['question_id'].'"><span class="index">'.$qIndex.'</span>'.$option.'</a> ';

                }
                ?>
            </div>
            <div class="gap-mini"></div>
            <?php echo anchor('tu-vung/chitiet/'.$anserSheet['_id']->{'$id'},'Xem chi tiết',array('style'=>'color:#555'))?>

            <div class="gap"></div>
        </div>

    </div>
</div>
</div>