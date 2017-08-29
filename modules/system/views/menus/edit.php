<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/menu/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('menuId');
?>
    <div class="screenView span7">
        <div class="section ">            
						
				<?php echo $formBase->input('menuName',array('label'=>"Name",'class'=>"span4",'rules'=>"required"))?>		
				<?php echo $formBase->input('menuLink',array('label'=>"Link",'class'=>"span4",'rules'=>""))?>
				<?php
        		$parentOptions = array();
        		$parentOptions = getTreeOption(0,0,array('table'=>'sys_menu','key'=>'menuId','name'=>'menuName','parentId'=>parentId));
     		
        		echo $formBase->dropdown('parentId',array('label'=>"Parent",'options'=>$parentOptions,'empty'=>'--Root--','rules'=>"",'class'=>"span4"))?>
        		
				<?php echo $formBase->dropdown('moduleId',array('label'=>"Module",'class'=>"span4",'options'=>getDBDropdown(array('table'=>'sys_module','key'=>'modulePath','val'=>'moduleName')),'empty'=>'--Select Module--','rules'=>"required"))?>		
				<?php echo $formBase->dropdown('menuType',array('label'=>"Type",'rules'=>"required",'class'=>"span4",'options'=>getSystemDropdownByCode('MENUTYPE'),'rules'=>"required"))?>		
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required",'class'=>"span4",'options'=>getDropdownStatus(),'empty'=>'--Select Status--'))?>
				<?php echo $formBase->input('position',array('label'=>"Position",'class'=>"span4",'rules'=>""))?>
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>