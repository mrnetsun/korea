<!--<div class="panel span5">-->
<?php $server_info =  $server_info['data']?>

<div class="row mg5"><span class="span1">
            <span class="label"><?php echo __("LBL_CPU")?></span>
        </span>
        <span class="span3">
        <?php echo $server_info['cpu'] ?>
        </span></div>
<div class="row mg5"><span class="span1">
            <span class="label"><?php echo __("LBL_RAM")?></span>
        </span>
        <span class="span3">
        <?php echo  displaySpace($server_info['memory']['used']*1024) ?>/<?php echo displaySpace($server_info['memory']['total']*1024)?> ~ <?php echo $server_info['memory']['useage'];?>
        </span></div>
<div class="row mg5"><span class="span1">
            <span class="label"><?php echo __("LBL_DISK")?></span>
        </span>
        <span class="span3">
        <?php echo displaySpace($server_info['disk']['used']*1024)."/".displaySpace($server_info['disk']['total']*1024)." ~ ".$server_info['disk']['useage'];?>
        </span></div>
<!--</div>-->