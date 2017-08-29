<?php 
	$formBase = new FormBase();
	echo $formBase->create('member/client/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('code',array('label'=>"LBL_CODE",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('name',array('label'=>"LBL_NAME",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('address',array('label'=>"LBL_ADDRESS",'rules'=>"",'class'=>"span4"))?>
				<?php echo $formBase->input('telephone',array('label'=>"LBL_TELEPHONE",'rules'=>"",'class'=>"span4"))?>
				<?php echo $formBase->input('contact',array('label'=>"LBL_CONTACT",'rules'=>"",'class'=>"span4"))?>
				<?php echo $formBase->input('mobile',array('label'=>"LBL_MOBILE",'rules'=>"",'class'=>"span4"))?>
				<?php echo $formBase->input('email',array('label'=>"LBL_EMAIL",'rules'=>"",'class'=>"span4"))?>
			<?php echo $formBase->texteditor('note',array('label'=>"LBL_DETAIL",'rules'=>"",'class'=>"span4"))?>
			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"",'class'=>"span4"))?>


			<div class="form-actions ">
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>