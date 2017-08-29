<?php
$current_uri = strtolower($this->router->fetch_module().'/'.$this->router->fetch_class());

echo $template['partials']['header']; ?>

<?php echo $template['partials']['navigation_path']; ?>
<div class="page-wrapper">
    <?php if($current_uri != 'solr/solr' ){?>
    <div class="left-column">
    <div style="min-height: 470px;">
        <?php
            echo ($template['partials']['menu_left']);
        ?>
    </div>
    </div>

    <div class="right-column">
        <?php }else{?>
        <div class="clear">
        <?php }?>

<?php echo $template['partials']['navigation_toolbar']; ?>
<?php echo $template['body']; ?>
    </div>
</div>

<?php echo $template['partials']['footer']; ?>
