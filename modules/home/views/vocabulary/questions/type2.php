<section class="question_<?php echo $k;?>">
<div class="questionItem vocabularyQ_<?php echo $question['type']?>">
    <div style="padding: 5px 10px;">
        <b>Câu <?php echo $k+1;?></b>
        <input type="hidden" name="question_id" value="<?php echo $k;?>">
    </div>

    <div>
        <?php echo mediaPlayer($question['audio']);?>
    </div>

    <div class="answerWrap">
        <?php
        //    debug($question['answer']);
        foreach($question['answer'] as $j=>$answer){

            $cStatus ='';
            $answer_select = (!is_null($question['member_answer']) && $question['member_answer'] == $j)?'checked':'';
            if($show_answer && !is_null($question['member_answer']) && $question['member_answer'] == $j){
                if($question['member_point']>0 ){
                    $cStatus = 'true';
                }else{
                    $cStatus = 'false';
                }
            }echo '
            <div><label><span class="control"><input type="radio" name="answer_'.$k.'" value="'.$j.'"/></span><a class="option '.$answer_select.' '.$cStatus.'">'.($j+1).'</a> '.$answer['meaning'].'</label></div>
            ';
        }
        ?>
    </div>
</div>
</section>