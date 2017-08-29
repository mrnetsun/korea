<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('banner/position/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
			<?php echo $formBase->input('title',array('placeholder'=>"LBL_TITLE",'class'=>"span2"))?>
	<?php echo $formBase->input('code',array('placeholder'=>"LBL_CODE",'class'=>"span2"))?>

	<?php echo $formBase->dropdown('page',array('placeholder'=>"LBL_PAGE",'class'=>"span2",
		'options'=>$aryPage,'empty'=>'LBL_ALL_PAGE'
		))?>
				<?php echo $formBase->dropdown('status',
        			array('options'=>getDropdownStatus()
        			,'empty'=>'LBL_STATUS'));?>
			
    <?php echo $formBase->submit('search',array('label'=>'BTN_SEARCH'))?>
    <?php echo $formBase->clear('clear',array('label'=>'BTN_CLEAR'))?>
	
<?php echo $formBase->end();?>
</div>
</div>
</div>

<div id="<?php echo _getBaseName('List') ?>" class='table-list'>
<?php echo $htmlList;?>
</div>
</div></div>