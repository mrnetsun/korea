<div class="main"><div class="shell">
<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="message warning">
<?php echo $formBase->create('system/module/getList',array('ajax'=>_getBaseName('List')));?>
	<input type="hidden" name="search" value="1" />
	<?php echo $formBase->input('moduleName',array('placeholder'=>__('Name')));?>
    <?php echo $formBase->submit('search')?>
    <?php echo $formBase->clear('clear')?>
<?php echo $formBase->end();?>
</div>

<div id="<?php echo _getBaseName('List') ?>" class='table-list'>
<?php echo $htmlList;?>
</div>
</div></div>