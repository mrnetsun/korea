<div class="gap-mini"> </div>

<?php
//debug($remain);
?>

<input type="hidden" id="endTesttime" value="<?php echo $remain?>"/>

<div id="examHeader">
    <div class="container">
    <div class="row examHeader">
        <div class="col-md-5">
        <h1><div class="float_left"><i class="fa fa-book"></i> </div>
            <div class="float_left" style="margin-left: 20px;">
                <div class="title"><?php echo $exam->title;?></div>
                <div class="time"><?php echo $exam_status['test_detail']['time_limit']?> Phút</div>
            </div>
        </h1>
        </div>
        <div class="col-md-2">
            <div class="testPoint"><i class="fa fa-tasks"></i> Tổng: <?php echo $exam_status['test_detail']['total_point']?> Điểm</div>
        </div>
        <div class="col-md-2">
            <div class="timeStart"><i class="fa fa-flag"></i> Bắt đầu: <?php echo date("H:i:s",$exam_status['start_time']->sec)?></div>
        </div>
        <div class="col-md-2">
            <div class="remainTime">
                <i class="fa fa-clock-o"></i>
                <span id="countdown" class="<?php echo ($remain<=0)? 'expired':''; ?>">
                    <?php
                    if($remain>0){
                        $timeRemain = '';
                        $hours = floor($remain / 3600);
                        $mins = floor($remain / 60 % 60);
                        $secs = floor($remain % 60);

                        if($hours){
                            $timeRemain .= str_pad($hours,2,'0',STR_PAD_LEFT).':';
                        }

                        $timeRemain .= str_pad($mins,2,'0',STR_PAD_LEFT).':';
                        $timeRemain .= str_pad($secs,2,'0',STR_PAD_LEFT);

                        echo $timeRemain;

                    }else{
                        echo  'Hết giờ';
                    }
                    ?>
                </span>
            </div>
        </div>
        <div class="col-md-1">
            <div class="finishExam">
            <button data-url="<?php echo site_url('thi-thu/finish/'.$exam_status['_id']->{'$id'})?>" id="btnFinish" class="btn btn-success">Nộp bài</button>
            </div>
        </div>
    </div>
    </div>
</div>
<?php
$sheetId = $exam_status['_id']->{'$id'};
echo '<input type="hidden" id="sheetId"  name="sheetId" value="'.$sheetId.'"/>';
?>
<div class="row">
    <div class="col-md-3">
        <div id="answerSheet" class="answerSheet">
            <h3 class="text-center">Bảng trả lời</h3>
            <div class="answerSheetContent">
        <?php
            $qIndex = 0;$totalFinished=0;
            $checkAnswer = $exam_status['exam']['show_checkAnswer'];

            if($exam_status['components'])foreach($exam_status['components'] as $c){
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
            <div class="text-center answerSheetProccess">
                <span id="totalFinished"><?php echo $totalFinished;?></span>/<span id="totalOverall"><?php echo $qIndex;?></span>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="examQuestion">
        <?php
            $qIndex = 0;
            if($exam_status['components'])foreach($exam_status['components'] as $jc=>$c){
                if($c['show_title']){
                    echo '<h2>'.$c['title'].'</h2>';
                }

                if($c['questions'])foreach($c['questions'] as $jq=>$q){
                    echo '<section class="questionItem questionItemType'.$q['question_type'].'">';

                    echo '<input type="hidden" name="component_index" value="'.$jc.'"/>';
                    echo '<input type="hidden" name="question_index" value="'.$jq.'"/>';
                    echo '<input type="hidden" name="question_id" value="'.$q['question_id'].'"/>';

//                    echo $q['question_type'] ;
                    if($q['question_type'] != 11){

                        $qIndex++;
                        echo '<h3 data-type="'.$q['question_type'].'" class="item question_'.$q['question_id'].'"> Câu '.$qIndex.'</span> </h3>';

                        echo displayQuestionFront($q);
                        echo displayQuestionAnswerFront($q,array('member'=>true,'exam'=>$exam));


                    }else{
                        echo displayQuestionFront($q);
                        if($q['sub_questions'])foreach($q['sub_questions'] as $js=>$sub){
                            echo '<section>';
                            echo '<input type="hidden" name="component_index" value="'.$jc.'"/>';
                            echo '<input type="hidden" name="question_index" value="'.$jq.'"/>';
                            echo '<input type="hidden" name="question_id" value="'.$q['question_id'].'"/>';
                            echo '<input type="hidden" name="question_sub_id" value="'.$sub['question_id'].'"/>';
                            echo '<input type="hidden" name="sub_index" value="'.$js.'"/>';
                            $qIndex++;
                            echo '<h3 data-type="'.$sub['question_type'].'" class="item subQuestion question_'.$sub['question_id'].'"> Câu '.$qIndex.'</span> </h3>';

                            echo displayQuestionFront($sub);
                            echo displayQuestionAnswerFront($sub,array('member'=>true,'exam'=>$exam));
                            echo '</section>';
                        }
                    }

                    echo "</section>";

                }
            }
        ?>
        </div>
    </div>
</div>

<script>

$(document).ready(function(){

    resizeWindow();
    $(window).resize(function() {
        resizeWindow();
    });

    $('.answerWrap input').click(function(){
        $(this).closest('.answerWrap').find('.checked').removeClass('checked');
        $(this).closest('label').find('.option').addClass('checked');
        var answer = parseInt($(this).closest('label').find('input').val(),10);


        var strData = $(this).closest('section').find('input').serialize();
        strData+='&answer='+answer;

        var question_id = $(this).closest('section').find('input[name=question_id]').val();

        $('#answerSheet .qIndex_'+question_id+' .option').addClass('checked').text(answer+1);


        $('#totalFinished').text($('#answerSheet .checked').length);


        $.ajax({
            url: '<?php echo site_url("thi-thu/updateQuestion")?>',
            type: "POST",
            data:strData+'&sheet_id='+$('#sheetId').val(),
            dataType:'json',
            success:function(data){
                question_id = data.question_id;

                $('#answerSheet .qIndex_'+question_id+' .option').addClass('checked').text(parseInt(data.answer,10)+1);
                if(data.show_check){
                    if(data.point >0){
                        $('#answerSheet .qIndex_'+question_id+' .option').removeClass('false').addClass('true');
                        $('#feeadback_q'+question_id).removeClass('fbFalse').addClass('fbTrue').html('<i class="fa fa-check-circle"></i> Đúng');
                    }else{
                        $('#answerSheet .qIndex_'+question_id+' .option').removeClass('true').addClass('false');
                        $('#feeadback_q'+question_id).removeClass('fbTrue').addClass('fbFalse').html('<i class="fa fa-times"></i> Sai');
                    }
                }

                var finishUrl = $('#btnFinish').data('url');
                document.location = finishUrl;
            }
        });

    });

    $('#answerSheet a.item').click(function(){
        var question_id = $(this).data('question');
        var aoffset = $('.question_'+question_id).offset().top;

        $('html, body').animate({scrollTop: aoffset - 130}, 300);
    });

    $('#btnFinish').click(function(){
        var finishUrl = $('#btnFinish').data('url');
        var end = parseInt($('#endTesttime').val(),10);

        var proccessed = $('#answerSheet .checked').length;
        var total = $('#answerSheet .option ').length;

        var htmlMessage = '<div class="focus">Bạn thực sự muốn nộp bài?</div>';
            if(proccessed < total){
                htmlMessage+='<div class="text_error">Bạn mới chỉ hoàn thành <b>' +proccessed + '/'+ total+'</b> câu hỏi.'+'</div>';
            }else{
                htmlMessage+='<div>Bạn đã hoàn thành tất cả <b>'+ total +'</b> câu hỏi.</div>';
            }

        htmlMessage+='<div> Chú ý: Bài sau khi nộp không thể sửa chữa.</div>';


        if(end >0){
            BootstrapDialog.show({
                title: 'Nộp bài',
                message: htmlMessage,
                buttons: [
                    {
                    icon: 'glyphicon glyphicon-ban-circle',
                    label: 'Nộp bài',
                    cssClass: 'btn-primary',
                    action: function(){
                        document.location = finishUrl;
                    }
                },  {
                    label: 'Xem lại',
                    action: function(dialogItself){
                        dialogItself.close();
                    }
                }]
            });
        }else{
            document.location = finishUrl;
        }
    })

    <?php

    if ($remain >0) {
    ?>
    // Countdown
    var timer;
    timer = setInterval(showRemaining, 1000);
    <?php } ?>
});
</script>