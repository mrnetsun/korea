<?php
$questionType = getSystemDropdownByCode('QUESTION_TYPE');
?>
<div class="headerTableFix">
    <table class="tableList" width="100%">
        <tr ><th class="w30"><input type="checkbox" onclick="Common.checkAll(this)"></th>
            <th class="w40"><?php echo __("LBL_ID")?></th>
            <th class="span3 tl"><?php echo __("LBL_QUESTION")?></th>
            <th class="tl"><?php echo __("LBL_CATEGORY")?></th>
            <th class="w70"><?php echo __("LBL_POINT")?></th>
            <th class="w70"><?php echo __("LBL_SUBPOINT")?></th>

        </tr>

        </table>
        </div>
    <div class="headerTableBody">
            <table class="tableList" width="100%">


                <?php
                if($questions) foreach($questions as $k=>$q){
                    ?>
                    <tr class="row_<?php echo $k%2;?>">
                        <td class="tc w30"><?php
                            echo '<input type="checkbox" value="'.$q->question_id.'" name="data[test][question_id][]">';
                            ?></td>
                        <td class="tc w40"><?php echo anchor('exam/question/edit/'.$q->question_id,$q->question_id,array('target'=>'_blank'))?></td>
                        <td class="span3">
                            <div><?php echo $q->title?></div>
                            <div class="note"><?php echo $questionType[$q->question_type]?></div>
                        </td>
                        <td><?php echo $q->cate_name?></td>
                        <td class="tc w70"><?php echo  $q->point;?></td>
                        <td class="tc w70"><?php echo $q->point_sub;?></td>

                    </tr>
                    <?php
                }else{
                    ?>
                    <tr><td colspan="7"><?php echo __("LBL_NO_RECORD")?></td></tr>
                    <?php
                }?>
            </table>
    </div>
