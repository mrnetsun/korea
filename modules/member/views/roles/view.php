<?php
			$formBase = new FormBase();
			echo $formBase->create('',array('class'=>'form-horizontal'));

?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("Role",$fillData->roleName);?>

		<div class="control-group">
			<label class="control-label">
				<?php echo __("LBL_CREATED");?>
			</label>
			<div class="controls "> <?php echo formatDate($fillData->createdTime) ?></div>
		</div>
		<div class="control-group">
			<label class="control-label">
				<?php echo __("LBL_UPDATED");?>
			</label>
			<div class="controls "> <?php echo formatDate($fillData->updatedTime) ;?></div>
		</div>
		<?php echo $formBase->view("LBL_STATUS", intval($fillData->status)==1?__('LBL_ACTIVE'):__('LBL_DEACTIVE') );?>
                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>
</div>
<div class="clear"></div>