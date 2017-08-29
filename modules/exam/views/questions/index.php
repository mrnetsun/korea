<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('exam/question/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
			<?php echo $formBase->input('title',array('placeholder'=>"LBL_TITLE",'class'=>"span2"))?>
	<?php
	$options = getTreeOption(0,0,array('table'=>'question_category','key'=>'cate_id','name'=>'cate_name','parent'=>'parent_id'));
	echo $formBase->dropdown('cate_id',array('options'=>$options,'empty'=>'LBL_ALL_CATEGORY','class'=>"span2"))?>
	<?php echo $formBase->dropdown('question_type',
		array('class'=>"span2",'options'=>getSystemDropdownByCode('QUESTION_TYPE')
		,'empty'=>'LBL_ALL_QUESTION_TYPE'));?>
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