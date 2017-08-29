<?php 
$formBase = new FormBase();
echo $formBase->create('member/profile/updatePass',array('class'=>'form-horizontal','ajax'=>array('Callback'=>'Common.ajaxCallback')));
?>
<div class="fromView span6">
<div class="clear h20"></div>
<?php echo $formBase->password('oldPassword',array('label'=>'LBL_OLD_PASSWORD','rules'=>'required'));?>
<?php echo $formBase->password('newPassword',array('label'=>'LBL_NEW_PASSWORD','id'=>'new_password','rules'=>'required|min_length[6]|max_length[50]|password_special'));?>
<?php echo $formBase->password('rePassword',array('label'=>'LBL_CONFIRM_PASSWORD','id'=>'confirmpassword','rules'=>'required|matches[new_password]'));?>
<div class="form-actions">
<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>&nbsp;
<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));?>
</div>
</div>

<?php 
echo $formBase->end();
?>
<div class="clear"></div>