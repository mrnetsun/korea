<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_CLIENt",$fillData->client_id);?>
		
		<?php echo $formBase->view("LBL_TITLE",$fillData->title);?>
		
		<?php echo $formBase->view("LBL_CAMPAIGN",$fillData->campaign);?>
		
		<?php echo $formBase->view("LBL_CATEGORY",$fillData->categories);?>
		
		<?php echo $formBase->view("LBL_IMAGE",$fillData->image);?>
		
		<?php echo $formBase->view("LBL_TYPE",$fillData->type);?>
		
		<?php echo $formBase->view("LBL_DETAIL",$fillData->detail);?>
		
		<?php echo $formBase->view("LBL_START_DATE",$fillData->start_date);?>
		
		<?php echo $formBase->view("LBL_END_DATE",$fillData->end_date);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>