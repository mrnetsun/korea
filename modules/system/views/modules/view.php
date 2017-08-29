<div class='services'>
	<div class='shell'><h2> <?php echo __($fillData->moduleName);?> <?php echo __("Module")?></h2><br></div>
</div>
<div class='main'><div class='shell shellWrap'>
<?php $formBase = new FormBase();?>
<div class="screenView w800">
    <div class="section form-horizontal">
    <fieldset><legend><?php echo __("Basic Information")?></legend>
           
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Module Name");?>  
            </label>
               <div class="controls"> <?php echo __($fillData->moduleName);?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Module Description");?>  
            </label>
               <div class="controls"> <?php echo __($fillData->description);?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Module Type");?>  
            </label>
               <div class="controls"> <?php echo $fillData->moduleType;?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Module Path");?>  
            </label>
               <div class="controls"> <?php echo $fillData->modulePath;?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("LBL_STATUS");?>
            </label>
               <div class="controls"> <?php echo img_status($fillData->status);?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Created Date");?>  
            </label>
               <div class="controls"> <?php echo $fillData->createdTime;?></div>
            </div>
            <div class="control-group">
            <label class="control-label">
                <?php echo __("Updated Date");?>  
            </label>
               <div class="controls"> <?php echo $fillData->updatedTime;?></div>
            </div>           
        
      </fieldset>
     
      <fieldset><legend><?php echo __("Controllers")?></legend>
      	<?php 
      	echo anchor(site_url('system/module/getControllerForm/'.$fillData->moduleId),'<span class="icon-plus-sign"></span>'.__('Add Controller'),'class="btn pointer"');      
      	?>
      	<br/><br/>
      	<?php
      		
      	    $aryFiles = getControllerFiles($fillData->modulePath);
      	    foreach($aryFiles as $key=>$file) $aryFiles[$key] = array($file);
      	    //debug( $aryFiles,false);
      		echo buildHTMLTable(array(__('Controller'),__('Size'),__('Created Date')),$aryFiles);
      	?>      		
      	
      </fieldset>
      
        <div class="actions">
        	<?php echo $formBase->back('BTN_BACK',site_url('system/module'))?>
        </div>

</div>
</div></div>