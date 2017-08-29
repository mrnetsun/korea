<div class="answerWrap">
<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 7/3/2016
 * Time: 7:54 PM
 */

$answer = json_decode($question['answer']);
//debug($question,false);

foreach($answer as $k=>$a){
    $answer_select = '';$cStatus = '';
    if($params['show_answer']){
        if($a->true_plan) $answer_select='checked';
    }

    if($params['member']){
        if(!is_null($question['member_answer']) && $k == intval($question['member_answer'])){
            $answer_select='checked';
            if($params['show_checkAnswer']){
                if($question['member_point']>0){
                    $cStatus = 'true';
                }else{
                    $cStatus = 'false';
                }
            }
        }


    }

    echo '<div class="col-md-1"><label><span class="control"><input type="radio" name="answer_'.$question['question_id'].'" value="'.$k.'"/></span><a class="option '.$answer_select.' '.$cStatus.'">'.($k+1).'</a>'.$a->plan_a.'</label></div>';

}


?>
    <div class="col-md-2 questionFeedback" id="feeadback_q<?php echo $question['question_id']?>">
        <?php
            if($params['show_checkAnswer']){
                if(!is_null($question['member_point'])){
                    if($question['member_point']>0){
                        echo '<span class="text_ok"><i class="fa fa-check-circle"></i> Đúng</span>';
                    }else{
                        echo '<span class="text_error"><i class="fa fa-times"></i> Sai</span>';
                    }
                }
            }
        ?>
    </div>
<div class="clear h5"></div>
</div>
