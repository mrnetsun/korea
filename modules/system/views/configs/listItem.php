
<div class="mg5 span7">
<?php
    $formBase = new FormBase();
    $params = json_decode($fillData->params);
    $data = json_decode($fillData->configValue);
?>
<div class="wrap">
    <h4 style="padding-left: 15px;"><?php echo $fillData->configName;?></h4>
    <div class="content span6" style="line-height: 26px;">
        <?php
            $i = 0;
            foreach($params as $k=>$item){
                $i=1-$i;
                echo '<div class="row row_'.$i.'">';
                echo "<div class='span2 bold'>".__($item)."</div>";
                echo "<div class='span4'>".$data[0][$k]."</div>";
                echo '</div>';
            }
        ?>

    </div>
    <div class="clear"></div>
</div>
    <div class="tc">
    <?php
        echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
    ?>
    </div>

</div>
<div class="clear"></div>