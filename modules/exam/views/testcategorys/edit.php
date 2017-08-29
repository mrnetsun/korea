<?php 
	$formBase = new FormBase();
	echo $formBase->create('exam/testcategory/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('cate_test_id');
?>
    <div class="screenView span8">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('cate_name',array('label'=>"LBL_NAME",'rules'=>"required",'class'=>"span5"))?>
				<?php
				$options = getTreeOption(0,0,array('table'=>'test_category','key'=>'cate_test_id','name'=>'cate_name','parent'=>'parent_id'));
				echo $formBase->dropdown('parent_id',array('label'=>"LBL_PARENT",'options'=>$options,'empty'=>'LBL_ROOT','class'=>"span5"))?>
				<?php echo $formBase->texteditor('note',array('label'=>"LBL_NOTE",'rules'=>"",'class'=>"span5 h100"))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required"))?>
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>