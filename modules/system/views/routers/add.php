<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/router/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           
        		<?php echo $formBase->input('slug',array('label'=>"LBL_ALIAS",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('controller',array('label'=>"LBL_URI",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->number('position',array('label'=>"LBL_POSITION",'class'=>"span4"))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'checked'=>ACTIVE,'rules'=>""))?>
        <div class="form-actions ">			
			<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
			<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE')); ?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
