<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('company/category/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
			<?php echo $formBase->input('name',array('placeholder'=>"LBL_TITLE",'class'=>"span2"))?>
			<?php echo $formBase->dropdown('status',array('placeholder'=>"LBL_STATUS",'options'=>getDropdownStatus(),'empty'=>'LBL_ALL_STATUS','class'=>"span2"))?>
			<?php

			$parentOptions = getTreeOption(0,0,array('table'=>'category','key'=>'cateId','name'=>'name','parentId'=>'parentId','type'=>'COMPANY'));
			$options = array('0'=>__("Root"));
			foreach($parentOptions as $k=>$v) $options[$k] = $v;
			//debug($parentOptions);
			?>
			<?php echo $formBase->dropdown('parentId',array('options'=>$options,'selected'=>$last_category,'empty'=>__("LBL_ALL_STATUS"),'rules'=>"",'class'=>"span2"))?>

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