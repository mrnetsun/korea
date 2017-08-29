<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_TITLE",$fillData->title);?>
		
		<?php echo $formBase->view("LBL_CATEGORY",$fillData->cate_id);?>
		
		<?php echo $formBase->view("LBL_SHORT_DESCRIPTION",$fillData->short);?>
		
		<?php echo $formBase->view("LBL_DETAIL",$fillData->description);?>
		
		<?php echo $formBase->view("LBL_MENTOR",$fillData->mentor);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php echo $formBase->back('BTN_BACK',site_url('course/course'),array('label'=>'BTN_BACK')); ?>
	</div>

</div>
<div class="clear"></div>