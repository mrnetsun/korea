<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('home/cronlog/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
			<?php echo $formBase->input('comment',array('placeholder'=>"LBL_DESCRIPTION",'class'=>"span2"))?>
	<?php echo $formBase->dropdown('type',array('options'=>array(''=>'All Type','0'=>'Info','1'=>'Warning','2'=>'Error'),'class'=>"span2"))?>
				 	<?php echo $formBase->daterange('updatedTime',array('placeholder'=>"LBL_UPDATED",'class'=>"w180"))?>
			
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