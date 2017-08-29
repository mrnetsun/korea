<?php 
	$formBase = new FormBase();
	echo $formBase->create('banner/position/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('page',array('label'=>"LBL_PAGE",'rules'=>"",'class'=>"span4"))?>
				<?php echo $formBase->input('code',array('label'=>"LBL_CODE",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->number('number',array('label'=>"LBL_NUMBER_BANNER",'rules'=>""))?>
			<?php echo $formBase->status('rotate',array('label'=>"LBL_ROTATE",'rules'=>""))?>
			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>""))?>
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>