<div class="subQuestion">
<?php
if($question->sub_questions) foreach($question->sub_questions as $k=>$q){
    ?>
    <h6><?php echo anchor('exam/question/edit/'.$q->question_id,'<span class="label">ID:'.$q->question_id.'</span> '.$q->title,array('target'=>'_blank')); ?></h6>
    <div class="detail">
    <?php
    echo displayQuestion($q);
    ?>
    </div>
    <div class="answer">
        <?php echo displayQuestionAnswer($q,1)?>
    </div>

    <?php
}
?>
</div>
