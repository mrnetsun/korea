<?php
	$formBase = new FormBase();
?>
<div class="screenView w800">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<div class="even">
		<label>
			<?php echo __("Module");?>  
		</label>
		   <strong> <?php echo __($fillData->module);?></strong>
		</div>
		<div class="">
		<label>
			<?php echo __("Name");?>  
		</label>
		   <strong> <?php echo __($fillData->dropdownName);?></strong>
		</div>
		<div class="even">
		<label>
			<?php echo __("Code");?>  
		</label>
		   <strong> <?php echo __($fillData->dropdownCode);?></strong>
		</div>
		<div class="">
		<label>
			<?php echo __("Value");?>  
		</label>
		   <strong> <?php echo __($fillData->value);?></strong>
		</div>

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE');
		?>
	</div>

</div>