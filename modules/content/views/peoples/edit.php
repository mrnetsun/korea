<?php 
	$formBase = new FormBase();
	echo $formBase->create('content/people/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">
			<?php echo $formBase->dropdown('code',array('label'=>"LBL_CODE",'options'=>sysDropdown('PEOPLE_TYPE',FALSE),'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->upload_image('image',array('label'=>"LBL_IMAGE",'rules'=>"required",'class'=>"btn"))?>
			<?php echo $formBase->texteditor('text',array('label'=>"LBL_DETAIL",'rules'=>"required",'class'=>"span4 h100"))?>
			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>""))?>
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>