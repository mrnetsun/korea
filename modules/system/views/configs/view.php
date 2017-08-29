<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
		<?php echo $formBase->view("Name",$fillData->configName);?>
		
		<?php echo $formBase->view("Code",$fillData->configCode);?>
		
		<?php echo $formBase->view("Value",$fillData->configValue);?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>