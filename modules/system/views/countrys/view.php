<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<div class="control-group">
		<label class="control-label">
			<?php echo __("Code");?>  
		</label>
		   <div class="controls "> <?php echo $fillData->iso;?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Country name");?>  
		</label>
		   <div class="controls "> <?php echo $fillData->nicename;?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Phone code");?>  
		</label>
		   <div class="controls "> <?php echo $fillData->phonecode;?></div>
		</div>

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>