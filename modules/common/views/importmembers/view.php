<?php
	$formBase = new FormBase();
?>
<div class="screenView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<div class="control-group">
		<label class="control-label">
			<?php echo __("First Name");?>  
		</label>
		   <div class="controls "> <?php echo $fillData->firstName;?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("LBL_EMAIL");?>
		</label>
		   <div class="controls "> <?php echo $fillData->email;?></div>
		</div>

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>