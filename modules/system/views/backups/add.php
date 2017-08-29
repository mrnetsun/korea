<?php
$formBase = new FormBase();
echo $formBase->create('system/backup/doBackup',array('class'=>'form-horizontal Form','id'=>'frmSolrRestore'));
$formBase->fillData($fillData);
echo $formBase->hidden('backup_id');
?>
<div class="screenView span7">

    <div id="statusRestoreMessage" class="alert alert-error" style="display: none;"></div>
    <div class="section ">
        <?php echo $formBase->textarea('note_new',array('label'=>__('LBL_DESCRIPTION'),'rules'=>"required|isnull_or_white_space",'class'=>"span4"))?>
        <div class="form-actions ">
            <?php echo $formBase->submit("BTN_SUBMIT",array('label'=>"BTN_SUBMIT"))?>
            <?php echo $formBase->close("BTN_CLOSE",array('label'=>"BTN_CLOSE",array('label'=>"BTN_CLOSE")))?>
        </div>

    </div>
</div>
<div class="clear"></div>
<?php echo $formBase->end();?>
<script language="JavaScript">
    $('#frmSolrRestore').submit(function(){
        var ok = FormValidate.validator($('#frmSolrRestore').attr("id"));
        if(ok){
            systemController.performBackup();
        }

        return false;
    });
</script>