<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('practice/practice/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
			<?php echo $formBase->input('title',array('placeholder'=>"LBL_WORD",'class'=>"span2"))?>
				<?php echo $formBase->input('meaning',array('placeholder'=>"LBL_MEANING",'class'=>"span2"))?>
	<?php
	$parentOptions = getTreeOption(0,0,array('table'=>'vocabulary_category','key'=>'id','name'=>'cate_name','parent'=>'parent_id'));

	echo $formBase->dropdown('cate_id',array('options'=>$parentOptions,'empty'=>'Chuyên mục','class'=>"span2 inlineBlock"))?>

	<?php echo $formBase->dropdown('status',
        			array('options'=>array(''=>'Trạng thái','0'=>'Không hiển thị','1'=>'Hiển thị',2=>'Chờ duyệt')
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