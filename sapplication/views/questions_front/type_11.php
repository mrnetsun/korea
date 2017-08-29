<div class="answer">
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
    echo '<div class="span2"><span class="option">'.$k.'</span></div>';
}
?>
</div>
