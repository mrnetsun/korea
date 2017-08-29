<div class='main'><div class='shell'>
<?php 
	$formBase = new FormBase();
	$formBase->fillData($arySearch);
	
?>
<div class="message warning">

<?php echo $formBase->create('system/dropdown/getList',array('ajax'=>_getBaseName('List'),'class'=>'form-inline'));?>
	<input type="hidden" name="search" value="1" />
		
                <?php echo $formBase->dropdown('moduleId',array('options'=>getModuleArray('--All Module--')))?>
            
                <?php echo $formBase->input('dropdownCode',array('placeholder'=>__("Code")))?>
                       
                <?php echo $formBase->input('dropdownName',array('placeholder'=>__("Name")))?>
           
			
    <?php echo $formBase->submit('search')?>
    <?php echo $formBase->clear('clear')?>
    
<?php echo $formBase->end();?>

</div>

<div id="<?php echo _getBaseName('List') ?>" class='table-list'>
<?php echo $htmlList;?>
</div>
</div></div>