<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<div class="control-group">
		<label class="control-label">
			<?php echo __("City name");?>  
		</label>
		   <div class="controls "> <?php echo $fillData->location;?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Weather");?>
		</label>
		   <div class="controls "> <?php echo $fillData->crawler_url;?></div>
		</div>

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>