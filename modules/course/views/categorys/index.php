<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('course/category/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
	<?php echo $formBase->input('cate_name',array('placeholder'=>"LBL_NAME",'class'=>"span2"))?>
	<?php
	$parentOptions = getTreeOption(0,0,array('table'=>'course_category','key'=>'id','name'=>'cate_name','parent'=>'parent_id'));

	echo $formBase->dropdown('parent_id',array('options'=>$parentOptions,'empty'=>'LBL_ROOT','class'=>"span2"));

	?>
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