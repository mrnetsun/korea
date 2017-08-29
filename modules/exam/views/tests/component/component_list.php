<?php
$questionType = getSystemDropdownByCode('QUESTION_TYPE');
if($component) foreach($component as $c){
    ?>
    <div class="component_item component_<?php echo $c->test_component_id;?>">
    <div class="head">
        <div><h5><?php echo $c->title;?>

                <span class="right"><?php echo '<span class="component_point">'.$c->total_point. '</span> '. __('LBL_POINT')?></span></h5></div>
        <div><?php echo ajax_link('exam/test/addTestQuestion/'.$c->test_id.'/'.$c->test_component_id,'<i class="icon icon-plus"></i> '.__("LBL_QUESTION"),array('overlay'=>'LBL_ADD_QUESTION','class'=>'btn btn-small btn-default'))?>
            <?php echo ajax_link('exam/test/editComponent/'.$c->test_component_id,'<i class="icon icon-edit"></i>',array('overlay'=>'LBL_EDIT_COMPONENT','callBack'=>'testController.cbUpdateComponent','class'=>'btn btn-small btn-default'))?>
            <?php echo ajax_link('exam/test/deleteComponent/'.$c->test_component_id,'<i class="icon icon-trash"></i>',array('callBack'=>'testController.cbDeleteComponent','class'=>'btn btn-small btn-default'))?>

        </div>
        <div class="h10"></div>
    </div>
        <div class="questionsList">
            <table class="tableList" width="100%">
                <tr><th class="w30"><?php echo __("LBL_STT")?></th>
                    <th class="w40"><?php echo __("LBL_ID")?></th>
                    <th class="span2"><?php echo __("LBL_QUESTION")?></th>
                    <th><?php echo __("LBL_CATEGORY")?></th>
                    <th class="w70"><?php echo __("LBL_POINT")?></th>
                    <th class="w70"><?php echo __("LBL_SUBPOINT")?></th>
                    <th class="w30"></th></tr>

            <?php
            if($c->questions) foreach($c->questions as $k=>$q){
                ?>
                <tr class="row_q<?php echo $q->question_id;?>">
                    <td><?php echo $k+1;
                        echo '<input type="hidden" value="'.$q->question_id.'" name="data[test][question_id]['.$c->test_component_id.'][]">';
                        ?></td>
                    <td><?php echo anchor('exam/question/edit/'.$q->question_id,$q->question_id,array('target'=>'_blank'))?></td>
                    <td><div><?php echo $q->title?></div>
                        <div class="note"><?php echo $questionType[$q->question_type];?></div>
                    </td>
                    <td><?php echo $q->cate_name?></td>
                    <td class="question_point_wrap"><?php
                        $question_point = is_null($q->question_point)?$q->point:$q->question_point;
                        echo '<input type="text" placeholder="Point" class="span1 question_point" rules="required|numeric" onkeyup="testController.updateTotalPoint()" value="'.$question_point.'" name="data[test][question_point]['.$c->test_component_id.'][]">';?></td>
                    <td class="question_point_wrap"><?php
                        $question_sub_point = is_null($q->question_sub_point)?$q->point_sub:$q->question_sub_point;
                        echo '<input type="text" placeholder="Point" class="span1 question_sub_point" rules="required" value="'.$question_sub_point.'" name="data[test][question_sub_point]['.$c->test_component_id.'][]">';?></td>
                    <td>
                        <?php echo ajax_link('exam/test/removeQuestion/'.intval($c->test_component_id).'/'.$q->question_id,'<i class="icon icon-trash"></i>',array('class'=>'btn btn-small','callBack'=>'testController.cbDeleteQuestion'))?>
                    </td>
                </tr>
                <?php
            }else{
                ?>
                <tr><td colspan="7"><?php echo __("LBL_NO_RECORD")?></td></tr>
                <?php
            }?>
            </table>
        </div>

    </div>
    <?php
}else{
    echo '<div class="component">'.__('LBL_NO_COMPONENT').'</div>';
}
?>
<script>
    $(document).ready(function(){
        testController.updateTotalPoint();
    });
</script>

