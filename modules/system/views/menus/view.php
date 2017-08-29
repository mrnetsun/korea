<?php
	$formBase = new FormBase();
?>
<div class="screenView form-horizontal w800">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<div class="control-group">
		<label class="control-label">
			<?php echo __("Module");?>  
		</label>
		   <div class="controls "> <?php echo __($fillData->moduleId);?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Name");?>  
		</label>
		   <div class="controls "> <?php echo __($fillData->menuName);?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Link");?>  
		</label>
		   <div class="controls "> <?php echo __($fillData->menuLink);?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Parent");?>  
		</label>
		   <div class="controls "> <?php echo __($fillData->parentId);?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("Type");?>  
		</label>
		   <div class="controls "> <?php echo __($fillData->menuType);?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("LBL_STATUS");?>
		</label>
		   <div class="controls "> <?php echo __($fillData->status);?></div>
		</div>
		<div class="control-group">
		<label class="control-label">
			<?php echo __("LBL_STATUS");?>
		</label>
		   <div class="controls "> <?php echo __($fillData->position);?></div>
		</div>

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>