<?php 
	$formBase = new FormBase();
	echo $formBase->create('member/role/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('roleId');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('roleName',array('label'=>"LBL_ROLE",'rules'=>"required|isnull_or_white_space|max_length[50]",'class'=>"span4"))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required"))?>
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>