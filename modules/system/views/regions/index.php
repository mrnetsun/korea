<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="main">
    <div class="shell">
<div class="message warning">
<div class="searchWrap">
<div class="section">
<?php echo $formBase->create('system/region/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />			
				
				<?php echo $formBase->input('region_name',array('placeholder'=>"Region name",'class'=>"span2"))?>
				<?php echo $formBase->input('region_code',array('placeholder'=>"Region code",'class'=>"span2"))?>
				<?php echo $formBase->dropdown('country_code',
						array('placeholder'=>"Country",
								'options'=> getDBDropdown(array('table'=>'country','status'=>true,'key'=>'iso','val'=>'nicename')),
								'empty'=>'--All Country--',
								'class'=>"span2"))?>
			<?php echo $formBase->dropdown('status',array('placeholder'=>"LBL_STATUS",'options'=>getDropdownStatus('LBL_ALL_STATUS'),'class'=>"span2"))?>
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