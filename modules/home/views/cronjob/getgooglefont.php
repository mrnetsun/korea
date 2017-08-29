<?php
$formBase = new FormBase();
echo $formBase->create('cronjob/doGetGoogefont');
?>
<div class="form-group">
    <label><?php echo __("Google Font URL")?></label>
<?php
echo $formBase->input('url',array('class'=>'form-control'));
?>
</div>
<?php
echo $formBase->submit('submit',array('label'=>'BTN_SUBMIT'));
echo $formBase->end();