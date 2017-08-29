<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/resource/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('resource_id');
?>
	<div class="screenView span7">
		<div style="height:15px;"><h3></h3></div>
		<div class="section ">

			<?php echo $formBase->dropdown('moduleId',array('label'=>"Module",'class'=>"span4",
					'options'=>getDBDropdown(array('table'=>'sys_module','key'=>'modulePath','val'=>'moduleName')),
					'empty'=>'--Select Module--','rules'=>"required"))?>
			<?php echo $formBase->input('resource_name',array('label'=>"Resoure Name",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('resource_code',array('label'=>"Resoure Code",'rules'=>"required",'class'=>"span4"))?>

			<?php echo $formBase->checkbox('permissions',array('label'=>'LBL_ACTION','options'=>array('full'=>'Full','listview'=>'List/view','add'=>'Add','edit'=>'Edit','delete'=>'Delete')))?>

			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required",'class'=>"span4"))?>

			<div class="form-actions ">
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE')); ?>
			</div>
		</div>

	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>