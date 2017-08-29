<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_TITLE",$fillData->title);?>
		
		<?php echo $formBase->view("LBL_LINK",$fillData->link);?>
		
		<?php echo $formBase->view("LBL_CODE",$fillData->code);?>
		
		<?php echo $formBase->view("LBL_MODE",$fillData->approve);?>
		
		<?php echo $formBase->view("LBL_CATEGORY",$fillData->cateId);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>