<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_TITLE",$fillData->title);?>
		
		<?php echo $formBase->view("LBL_CLICK",$fillData->clicks);?>
		
		<?php echo $formBase->view("LBL_IMPRESSION",$fillData->impression);?>
		
		<?php echo $formBase->view("LBL_DAY",$fillData->days);?>
		
		<?php echo $formBase->view("LBL_START_DATE",$fillData->start_date);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>