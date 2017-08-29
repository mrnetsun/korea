<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_CODE",$fillData->code);?>
		
		<?php echo $formBase->view("LBL_NAME",$fillData->name);?>
		
		<?php echo $formBase->view("LBL_ADDRESS",$fillData->address);?>
		
		<?php echo $formBase->view("LBL_TELEPHONE",$fillData->telephone);?>
		
		<?php echo $formBase->view("LBL_CONTACT",$fillData->contact);?>
		
		<?php echo $formBase->view("LBL_MOBILE",$fillData->mobile);?>
		
		<?php echo $formBase->view("LBL_EMAIL",$fillData->email);?>
		
		<?php echo $formBase->view("LBL_DETAIL",$fillData->note);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>