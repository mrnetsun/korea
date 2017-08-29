<div class="main"><div class="shell">
<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('system/menu/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
			
	<?php echo $formBase->input('menuName',array('placeholder'=>"Name",'class'=>'span2'))?>
	<?php echo $formBase->dropdown('moduleId',array('placeholder'=>"Module",
			'options'=>getDBDropdown(array('table'=>'sys_module','key'=>'modulePath','val'=>'moduleName'))
			,'empty'=>'--All Module--','class'=>'span2'))?>
	<?php echo $formBase->dropdown('status',array('placeholder'=>"LBL_STATUS",
			'options'=>getDropdownStatus(),'empty'=>'LBL_ALL_STATUS','class'=>'span2'))?>
	<?php echo $formBase->dropdown('type',
			array('placeholder'=>"Type",'options'=>getSystemDropdownByCode('MENUTYPE'),'empty'=>'--All Type--','class'=>'span2'))?>
		
    <?php echo $formBase->submit('search')?>
    <?php echo $formBase->clear('clear')?>

<?php echo $formBase->end();?>
</div>
</div>
</div>

<div id="<?php echo _getBaseName('List') ?>" class='table-list'>
<?php echo $htmlList;?>
</div>
</div></div>