<?php
	$formBase = new FormBase();
?>
<div class="screenView w800">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<div class="control-group">
		<label class="control-label">
			<?php echo __("Role name");?>  
		</label>
		   <div class="controls "> <?php echo __($fillData->roleName);?></div>
		</div>

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE');
		?>
	</div>

</div>