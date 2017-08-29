<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("Image",$fillData->image,'image');?>
		
		<?php echo $formBase->view("Name",$fillData->name);?>
		<?php echo $formBase->view("Url",$fillData->url);?>
		<?php echo $formBase->view("Description",$fillData->descriptions);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>