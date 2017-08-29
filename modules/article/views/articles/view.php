<?php
	$formBase = new FormBase();
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_TITLE",$fillData->title);?>
		
		<?php echo $formBase->view("LBL_SLUG",$fillData->slug);?>
		
		<?php echo $formBase->view("LBL_CATEGORY",$fillData->category_id);?>
		
		<?php echo $formBase->view("LBL_META_KEYWORD",$fillData->meta_keyword);?>
		
		<?php echo $formBase->view("LBL_META_DESCRIPTION",$fillData->meta_descrition);?>
		
		<?php echo $formBase->view("LBL_SHORT_DESCRIPTION",$fillData->short_description);?>
		
		<?php echo $formBase->view("LBL_CONTENT",$fillData->full_content);?>
		
		<?php echo $formBase->view("LBL_THUMBNAIL",$fillData->thumbnail);?>
		
		<?php echo $formBase->view("LBL_VIDEO",$fillData->video);?>
		
		<?php echo $formBase->view("LBL_GALLERY",$fillData->gallery);?>
		
		<?php echo $formBase->view("LBL_STATUS",$fillData->status);?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>