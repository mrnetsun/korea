<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/department/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('departmentId');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('departmentName',array('label'=>"Name",'rules'=>"required",'class'=>'span4'))?>
				<?php echo $formBase->textarea('description',array('label'=>"Description",'rules'=>"",'class'=>'span4'))?>
				
				
		<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required"))?>
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>