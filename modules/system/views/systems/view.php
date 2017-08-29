<div class="memberProfile w800">
<div class="left w200">
	<div class="avartar"></div>
    <div class="action">
    	<a href="">Set Password</a>
        <a href="">Edit</a>
    </div>
</div>
<div class="right">
	<div class="section ">
            
            <div>
            <label>
                <?php echo __("First Name");?>  
            </label>
               <strong> <?php echo $fillData->firstName;?></strong>
            </div>
            <div>
            <label>
                <?php echo __("Last Name");?>  
            </label>
               <strong> <?php echo $fillData->lastName;?></strong>
            </div>
            <div>
            <label>
                <?php echo __("Username");?>  
            </label>
               <strong> <?php echo $fillData->username;?></strong>
            </div>
            <div>
            <label>
                <?php echo __("Department");?>  
            </label>
               <strong> <?php echo $fillData->departmentName;?></strong>
            </div>
            <div>
            <label>
                <?php echo __("Roles");?>  
            </label>
               <strong> <?php echo $fillData->titleName;?></strong>
            </div>
            <div>
            <label>
                <?php echo __("LBL_JOIN_DATE");?>
            </label>
               <strong> <?php echo $fillData->createdTime;?></strong>
            </div>
             <div>
            <label>
                <?php echo __("LBL_STATUS");?>
            </label>
               <strong> <?php echo $fillData->status;?></strong>
            </div>
        </div>
</div>
</div>