<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/partner/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           
        		<?php echo $formBase->input('partnerName',array('label'=>"Name",'rules'=>"required",'class'=>'span3'))?>
		            <?php echo $formBase->upload_image('logo',array('label'=>"Logo",
		            		'data'=>array('resize'=>1,'width'=>100,'height'=>100,'pre_name'=>'partner_'),
		            		'rules'=>"required",'class'=>'btn'))?>	
		            <?php echo $formBase->note('Logo in 100x100 pixel')?>	
		            <?php echo $formBase->input('website',array('label'=>"Website",'rules'=>'url','class'=>'span3'))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required"))?>
        <div class="form-actions ">			
			<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'));?>
			<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
