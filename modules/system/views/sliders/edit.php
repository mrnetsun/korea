<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/slider/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('slide_id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
		        <?php echo $formBase->upload_image('image',array('label'=>"Image",'data'=>array('dir'=>UPLOAD_DIR,'resize'=>1,'width'=>1300,'height'=>475,'pre_name'=>'slide_'),'class'=>'btn','rules'=>"required"))?>
		        <?php echo $formBase->note('Image Size (1300px × 475px)');?>		
		        <?php echo $formBase->input('name',array('label'=>"Name",'rules'=>"",'class'=>'span4'))?>
		        <?php echo $formBase->input('url',array('label'=>"Url",'rules'=>"",'class'=>'span4'))?>
				<?php echo $formBase->textarea('descriptions',array('label'=>"Description",'rules'=>"",'class'=>'span4'))?>		
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>""))?>
		
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>