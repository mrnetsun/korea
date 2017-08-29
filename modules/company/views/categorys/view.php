<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_TITLE",$fillData->name);?>
		
		<?php echo $formBase->view("LBL_SLUG",$fillData->slug);?>
		
		<?php echo $formBase->view("LBL_STATUS",$fillData->status);?>
		
		<?php echo $formBase->view("LBL_PARENT",$fillData->parentId);?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>