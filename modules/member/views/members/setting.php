	<div class="services">
	<div class="shell">
	<h2>{t}Settings{/t}</h2><br />
    </div>
</div>
<div class="main">
    <div class="shell shellWrap">
<div class="memberProfile w630">
<div class="left w110">
	<div class="avartar">
		<?php 
           if($fillData->avatar) echo base_img(MEMBER_AVATAR.$fillData->avatar,array('width'=>100, 'height'=>100));
           ?>  	
	</div>
   
</div>
<div class="right screenView">
	<?php //debug($fillData,false);
			$formBase = new FormBase();
			echo $formBase->create('',array('class'=>'form-horizontal'));
			?>
	<div class=" section ">
            
            <div class="control-group">
            <label class="control-label">
                <?php echo __("First Name");?>  
            </label>
            <div class="controls"><strong> <?php echo $fillData->firstName;?></strong></div>              
            </div>
            <div class="control-group"> 
            <label class="control-label">
                <?php echo __("Last Name");?>  
            </label>
               <div class="controls"><strong> <?php echo $fillData->lastName;?></strong></div>
            </div>
             <div class="control-group"> 
            <label class="control-label">
                <?php echo __("Username");?>  
            </label>
               <div class="controls"><strong> <?php echo $fillData->username;?></strong></div>
            </div>
            <div class="control-group"> 
            <label class="control-label">
                <?php echo __("LBL_EMAIL");?>
            </label>
               <div class="controls"><strong> <?php echo $fillData->email;?></strong></div>
            </div>
            
             <div class="control-group"> 
            <label class="control-label">
                <?php echo __("LBL_ROLES");?>
            </label>
               <div class="controls"><strong> <?php 
               $aryRoleName = array();              
               foreach ($fillData->aryRole as $role) $aryRoleName[] = $role->roleName;
               echo implode(', ', $aryRoleName);
               ?></strong></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("LBL_JOIN_DATE");?>
            </label>
               <div class="controls"><strong> <?php echo $fillData->createdTime;?></strong></div>
            </div>
              <div class="control-group"> 
            <label class="control-label">
                <?php echo __("LBL_STATUS");?>
            </label>
               <div class="controls"><strong> <?php echo img_status($fillData->status);?></strong></div>
            </div>
           <div class="actions"><?php echo $formBase->back('BTN_BACK',site_url(),array('value'=>'BTN_BACK'));?></div>
        </div>
        
         <?php 
         
         echo $formBase->end();?>
</div>
<div class="clear"></div>
</div>
</div></div>