<div id="examHeader">
    <div class="container">
        <div class="row examHeader">
            <div class="col-md-7">
                <h1><div class="float_left"><i class="fa fa-book"></i> </div>
                    <div style="margin-left: 20px;" class="float_left">
                        <div class="title"><a href="<?php echo site_url('tu-vung/card/'.$category->id)?>"> <?php echo $category->cate_name?></a></div>
                        <div class="time"><?php echo $exam_status['time_limit']?> Phút</div>
                    </div>
                </h1>
            </div>

            <div class="col-md-2">
                <div class="timeStart"><i class="fa fa-flag"></i> Bắt đầu: <?php echo date("H:i:s",strtotime($exam_status['start']))?></div>
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
                    <button class="btn btn-success" id="btnFinish" data-url="<?php echo site_url('tu-vung/finish/'.$exam_status['_id']->{'$id'})?>">Nộp bài</button>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="endTesttime" value="<?php echo $remain?>"/>
<input type="hidden" name="sheet_id" id="sheetId" value="<?php echo $exam_status['_id']?>">

<div class="row">
    <div class="col-md-4">
        <div id="answerSheet" class="answerSheet">
            <h3 class="text-center">Bảng trả lời</h3>
            <div class="answerSheetContent">
                <?php
                $qIndex = 0;$totalFinished=0;


                    if($exam_status['questions'])foreach($exam_status['questions'] as $k=>$q){

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


                            echo '<a href="#question_'.$k.'" class="item qIndex_'.$k.'" data-question="'.$k.'"><span class="index">'.$qIndex.'</span>'.$option.'</a> ';


                    }

                ?>
            </div>
            <div class="text-center answerSheetProccess">
                <span id="totalFinished"><?php echo $totalFinished;?></span>/<span id="totalOverall"><?php echo $qIndex;?></span>
            </div>
        </div>

    </div>
    <div class="col-md-8">
        <div class="vocabularyTest">
            <div class="gap"></div>
            <?php
                foreach($exam_status['questions'] as $k=>$q){

                    $this->load->view('questions/type'.$q['type'],array('question'=>$q,'k'=>$k));

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

       $('.btnSound').click(function(){
            homeController.playSoundQ($(this));
       }) ;

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
                url: '<?php echo site_url("tu-vung/updateQuestion")?>',
                type: "POST",
                data:strData+'&sheet_id='+$('#sheetId').val(),
                dataType:'json',
                success:function(data){
                    if(data.remain < 0){
                        var finishUrl = $('#btnFinish').data('url');
                        document.location = finishUrl;
                    }
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
