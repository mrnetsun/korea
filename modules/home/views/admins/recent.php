<div class="panel span5">
    <div class="header">
        <h4><?php echo __("LBL_RECENT_UPDATE")?></h4>
    </div>

    <?php
    $aryLogType = array(0=>'info',1=>'warning',2=>'danger');
    foreach($recent_log as $log){

        ?>
        <div class="row mg5"><span class="span5">
                    <span class="label label-<?php echo $aryLogType[$log->type]?>"><?php echo __($aryLogType[$log->type])?></span>
                        <span class="bold"><?php echo $log->controller.'/'.$log->method;?></span>
                         <span class="">By <span class="bold"><?php echo $log->actor?></span></span>

                    <span class="note">At <?php echo formatDate($log->updatedTime)?></span>
                        </span>
        </div>

        <div class="h10"></div>
        <?php
    }
    ?>
</div>