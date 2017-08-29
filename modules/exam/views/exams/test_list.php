 <div class="headerTableFix">
    <table class="tableList" width="100%">
        <tr ><th class="w30"><input type="checkbox" onclick="Common.checkAll(this)"></th>
            <th class="w40"><?php echo __("LBL_ID")?></th>
            <th class="span3 tl"><?php echo __("LBL_TITLE")?></th>
            <th class="tl"><?php echo __("LBL_CATEGORY")?></th>
            <th class="w70"><?php echo __("LBL_POINT")?></th>
            <th class="w70"><?php echo __("LBL_TIME_LIMIT")?></th>

        </tr>

    </table>
</div>
<div class="headerTableBody">
    <table class="tableList" width="100%">


        <?php
        if($tests) foreach($tests as $k=>$q){
            ?>
            <tr class="row_<?php echo $k%2;?>">
                <td class="tc w30"><?php
                    echo '<input type="checkbox" value="'.$q->test_id.'" name="data[exam][test_id][]">';
                    ?></td>
                <td class="tc w40"><?php echo anchor('exam/test/edit/'.$q->test_id,$q->test_id,array('target'=>'_blank'))?></td>
                <td class="span3">
                    <div><?php echo $q->test_name?></div>
                </td>
                <td><?php echo $q->cate_name?></td>
                <td class="tc w70"><?php echo  $q->total_point;?></td>
                <td class="tc w70"><?php echo $q->time_limit;?> Phút</td>

            </tr>
            <?php
        }else{
            ?>
            <tr><td colspan="7"><?php echo __("LBL_NO_RECORD")?></td></tr>
            <?php
        }?>
    </table>
</div>
