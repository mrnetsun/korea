<div class="main"><div class="shell">
<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('system/roles/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
	<?php echo $formBase->input('roleName',array('placeholder'=>"Role Name"))?>
	<?php echo $formBase->dropdown('moduleId',array(
        							'options'=>getDBDropdown(array('table'=>'sys_module','key'=>'modulePath','val'=>'moduleName','empty'=>'--All Module--'))))?>				
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