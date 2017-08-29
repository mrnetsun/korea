<?php
/**
 * Created by PhpStorm.
 * User: OSD
 * Date: 11/11/2015
 * Time: 11:25 AM
 */
$data_before = json_decode($fillData->data_before);

?>
<table class="tableList">
    <tr>
        <th class="span2 tl"><?php echo __("LBL_FIELD")?></th>
        <th class="span2 tl"><?php echo __("LBL_DATA")?></th>

    </tr>

    <?php
    foreach($data_before as $k=>$v){
            if(in_array($k,array('del_flag','createdId','createdTime','updatedId','updatedTime','password','isSA'))) continue;
            ?>
            <tr>
                <td><span><?php echo __(strtoupper('LBL_'.$fillData->controller.'_'.$k)) ?></span></td>
                <td>
                <?php if($k == 'status'){
                    $lv = ( $v )?'ACTIVE':'DEACTIVE';
                    echo __('LBL_'.$lv);
                }else{
                      print($v);
                } ?>
                </td>

            </tr>
            <?php

    }
    ?>
</table>
