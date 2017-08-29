<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_CATEGORY",$fillData->cate_id);?>
		
		<?php echo $formBase->view("LBL_WORD",$fillData->title);?>
		
		<?php echo $formBase->view("LBL_MEANING",$fillData->meaning);?>
		
		<?php echo $formBase->view("LBL_PRONOUNCE",$fillData->pronounce);?>
		
		<?php echo $formBase->view("LBL_AUDIO",$fillData->audio);?>
		
		<?php echo $formBase->view("LBL_SLOW_AUDIO",$fillData->slow_audio);?>
		
		<?php echo $formBase->view("LBL_IMAGE",$fillData->image);?>
		
		<?php echo $formBase->view("LBL_DETAIL",$fillData->detail);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>