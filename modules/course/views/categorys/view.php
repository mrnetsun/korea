<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_TITLE",$fillData->cate_name);?>
		
		<?php echo $formBase->view("LBL_DETAIL",$fillData->description);?>
		
		<?php echo $formBase->view("LBL_ROOT",$fillData->cate_name);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php echo $formBase->back('BTN_BACK',site_url('course/category'),array('label'=>'BTN_BACK')); ?>
	</div>

</div>
<div class="clear"></div>