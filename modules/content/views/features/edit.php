<?php 
	$formBase = new FormBase();
	echo $formBase->create('content/feature/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">
			<?php echo $formBase->input('company_id',array('label'=>"LBL_COMPANY_ID",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('company_name',array('label'=>"LBL_COMPANY_NAME",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->datetime('start_date',array('label'=>"LBL_START_DATE",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->datetime('end_date',array('label'=>"LBL_END_DATE",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('position',array('label'=>"LBL_POSITION",'rules'=>"",'class'=>"span4"))?>
			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required"))?>
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>