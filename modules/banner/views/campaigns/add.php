<?php 
	$formBase = new FormBase();
	echo $formBase->create('banner/campaign/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           
        		<?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->number('clicks',array('label'=>"LBL_CLICK",'rules'=>"numeric",'class'=>"span4",'config'=>array('min'=>0,'max'=>100000)))?>
			<?php echo $formBase->note('LBL_NOTE_UNLIMITED')?>
			<?php echo $formBase->number('impression',array('label'=>"LBL_IMPRESSION",'rules'=>"numeric",'class'=>"span4",'config'=>array('min'=>0,'max'=>100000)))?>
			<?php echo $formBase->note('LBL_NOTE_UNLIMITED')?>
			<?php echo $formBase->number('days',array('label'=>"LBL_DAY",'rules'=>"numeric",'class'=>"span4",'config'=>array('min'=>0,'max'=>1000)))?>
			<?php echo $formBase->note('LBL_NOTE_UNLIMITED')?>
			<?php echo $formBase->input('start_date',array('label'=>"LBL_START_DATE",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->note('LBL_NOTE_CAMPAIGN')?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'checked'=>ACTIVE,'rules'=>""))?>
        <div class="form-actions ">			
			<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
			<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE')); ?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
