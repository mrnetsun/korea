<div class="panel span5">
    <div class="header">
        <h4><?php echo __("LBL_SOLR_CRONJOB")?><div class="float_rigt">
                <?php echo anchor('home/cronlog','<i class="icon icon-list-alt"></i>');?>
            </div></h4>

    </div>

    <?php
    $aryLogType = array(0=>'info',1=>'warning',2=>'danger');
    foreach($update_log as $log){

        ?>
        <div class="row mg5"><span class="span5">
                    <span class="label label-<?php echo $aryLogType[$log->type]?>"><?php echo __($aryLogType[$log->type])?></span> <span class="note"><?php echo formatDate($log->updatedTime)?></span>
                        <p><?php echo $log->comment;?></p>
                </span>
        </div>

        <?php
    }
    ?>

</div>