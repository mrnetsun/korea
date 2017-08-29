<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_COMPANY_ID",$fillData->company_id);?>
		
		<?php echo $formBase->view("LBL_COMPANY_NAME",$fillData->company_name);?>
		
		<?php echo $formBase->view("LBL_START_DATE",$fillData->start_date);?>
		
		<?php echo $formBase->view("LBL_END_DATE",$fillData->end_date);?>
		
		<?php echo $formBase->view("LBL_POSITION",$fillData->position);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>