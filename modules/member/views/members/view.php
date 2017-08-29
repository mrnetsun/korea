<div class="memberProfile w630">
<div class="left w110">
    <?php
    $classAvatar = 'avartar';
    if (file_exists($fillData->avatar)) {
        $classAvatar = 'avartar_default';
    } else {
        $classAvatar = 'avartar';
    }
    ?>
	<div class="<?php echo $classAvatar; ?>">
		<?php
           if($fillData->avatar) echo base_img($fillData->avatar,array('width'=>100, 'height'=>100));
           ?>  	
	</div>
   
</div>
<div class="right ">
	<?php //debug($fillData,false);
			$formBase = new FormBase();
			echo $formBase->create('',array('class'=>'form-horizontal'));
			?>
	<div class=" span6 formView">
            
            <div class="control-group">
            <label class="control-label">
                <?php echo __("LBL_FIRST_NAME");?>
            </label>
               <div class="controls w200 word-wrap"> <?php echo $fillData->firstName;?></div>
            </div>
            <div class="control-group"> 
            <label class="control-label">
                <?php echo __("LBL_LAST_NAME");?>
            </label>
               <div class="controls w200 word-wrap"> <?php echo $fillData->lastName;?></div>
            </div>
             <div class="control-group"> 
            <label class="control-label">
                <?php echo __("LBL_USERNAME");?>
            </label>
               <div class="controls w200 word-wrap"> <?php echo $fillData->username;?></div>
            </div>
            <div class="control-group"> 
            <label class="control-label">
                <?php echo __("LBL_EMAIL");?>
            </label>
               <div class="controls "> <?php echo $fillData->email;?></div>
            </div>
            <!-- div class="control-group">
            <label class="control-label">
                <?php //echo __("Department");?>
            </label>
               <div class="controls "> <?php //echo $fillData->departmentName;?></div>
            </div -->
             <div class="control-group"> 
            <label class="control-label">
                <?php echo __("LBL_ROLES");?>
            </label>
               <div class="controls "> <?php 
               echo $role->roleName;
               ?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("LBL_CREATED_DATE");?>
            </label>
               <div class="controls "> <?php echo formatDate($fillData->createdTime); ?></div>
            </div>
        <?php echo $formBase->view("LBL_STATUS", intval($fillData->status)==1?__('LBL_ACTIVE'):__('LBL_DEACTIVE') );?>
           
        </div>
    <div class="clear"></div>
        <div class="form-action">
            <label class="control-label"></label><?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));?>
            </div>
         <?php 
         
         echo $formBase->end();?>
</div>
<div class="clear"></div>
</div>