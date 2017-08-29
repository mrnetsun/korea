<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/module/update',array('ajax'=>_getBaseName('List')));
	$formBase->fillData($fillData);
	echo $formBase->hidden('moduleId');
?>
    <div class="formView w600 form-horizontal">
        
        <div class="section ">
            <div><h2> <?php echo __($fillData->moduleName);?></h2></div>
            <div class="even">
            <label>
                <?php echo __("Module Name");?>  
            </label>
               <strong> <?php echo $formBase->input('moduleName',array('class'=>'span4'));?></strong>
            </div>
            <div >
            <label>
                <?php echo __("Module Description");?>  
            </label>
               <strong> <?php echo $formBase->textarea('description',array('class'=>'span4'));?></strong>
            </div>
            <div class="even">
            <label>
                <?php echo __("Module Type");?>  
            </label>
               <strong> <?php 
               echo $formBase->dropdown('moduleType',array('options'=>array('extend'=>'extend','core'=>'core'),'class'=>'span4'));
               ?></strong>
            </div>
            <div >
            <label>
                <?php echo __("Module Path");?>  
            </label>
               <strong> <?php echo $formBase->input('modulePath',array('class'=>'span4'));?></strong>
            </div>
            <div class="even">
            <label>
                <?php echo __("LBL_STATUS");?>
            </label>
               <strong> <?php echo $formBase->dropdown('status',array('options'=>getDropdownStatus(),'class'=>'span4'));?></strong>
            </div>
                     
        </div>
        
<div class="actions ">
    
            <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
            <?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'))?>
    
</div> 
<!-- End of .content -->
    
    
</div>

<?php echo $formBase->end();?>
			
