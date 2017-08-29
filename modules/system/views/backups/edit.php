<?php
$formBase = new FormBase();
echo $formBase->create('system/backup/verifyRestore',array('class'=>'form-horizontal Form','id'=>'frmSolrRestore'));
$formBase->fillData($fillData);
echo $formBase->hidden('backup_id');
?>
<div class="screenView span7">

	<div id="statusRestoreMessage" class="alert alert-error" style="display: none;"></div>

	<div style="padding: 10px;"><strong>
			<?php echo __("LBL_RESTORE_FROM")?> <?php echo localDate($fillData->createdTime);?>
		</strong></div>

	<div class="section ">
		<div class="form-actions ">
			<?php echo $formBase->submit("LBL_YES",array('label'=>"LBL_YES"))?>
			<?php echo $formBase->close("LBL_NO",array('label'=>"LBL_NO",array('label'=>"LBL_NO")))?>
		</div>

	</div>
</div>
<div class="clear"></div>
<?php echo $formBase->end();?>
<script language="JavaScript">
	$('#frmSolrRestore').submit(function(){
		var ok = FormValidate.validator($('#frmSolrRestore').attr("id"));
		if(ok){
			systemController.verifyRestore();
		}
		return false;
	});
</script>
