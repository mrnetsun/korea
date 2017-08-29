<?php
	$formBase = new FormBase();
	$formBase->fillData($fillData);
?>
<div class="screenView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<div class="control-group">
		<label class="control-label">
			<?php echo __("Name");?>  
		</label>
		   <div class="controls "> <?php echo  $fillData->partnerName;?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Logo");?>  
		</label>
		   <div class="controls "> <?php echo  base_img($fillData->logo,array('width'=>100,'height'=>100));?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Website");?>  
		</label>
		   <div class="controls "> <?php echo  $fillData->website;?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("LBL_STATUS");?>
		</label>
		   <div class="controls "> <?php echo img_status($fillData->status);?></div>
		</div>

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>
	
</div>
<div class="clear"></div>