<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/log/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('log_id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('log_id',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('module',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('controller',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('method',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('actor',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('data_before',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('data_after',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('del_flag',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('status',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
				<?php echo $formBase->input('updatedTime',array('label'=>"{fieldLabel}",'rules'=>"{fieldRules}"))?>
		
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>