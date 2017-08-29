<div class="answerWrap">
<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 7/3/2016
 * Time: 7:54 PM
 */

$answer = json_decode($question->answer);
//debug($answer,false);

foreach($answer as $k=>$a){
    $answer_select = '';
    if($show_answer){
        if($a->true_plan) $answer_select='selected';
    }

    echo '<div class="span1"><a class="option '.$answer_select.'">'.$k.'</a>'.$a->plan_a.'</div>';

}
?>
<div class="clear h5"></div>
</div>
