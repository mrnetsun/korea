<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('article/article/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
			<?php echo $formBase->input('title',array('placeholder'=>"LBL_TITLE",'class'=>"span2"))?>
	<?php
	$parentOptions = array();
	$parentOptions = getTreeOption(0,0,array('table'=>'category','key'=>'cateId','name'=>'name','parentId'=>'parentId','type'=>'ARTICLE'));
	?>
	<?php echo $formBase->dropdown('category_id',array('options'=>$parentOptions,'empty'=>__("LBL_CATEGORY"),'rules'=>"",'class'=>"span2"))?>


	<?php echo $formBase->dropdown('feature',
		array('options'=>getDropdownStatus()
		,'empty'=>'LBL_FEATURE'));?>
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