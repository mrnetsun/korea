<?php 
	$formBase = new FormBase();
	echo $formBase->create('exam/examcategory/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span8">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
			<?php
			$parentOptions = array();
			$parentOptions = getTreeOption(0,0,array('table'=>'exam_category','key'=>'exam_category_id','name'=>'cate_name','parent'=>'parent_id'));
			?>
        		<?php echo $formBase->input('cate_name',array('label'=>"LBL_NAME",'rules'=>"required",'class'=>"span5"))?>
				<?php echo $formBase->dropdown('parent_id',array('label'=>"LBL_PARENT",'options'=>$parentOptions,'empty'=>'LBL_ROOT','class'=>"span5"))?>
				<?php echo $formBase->texteditor('note',array('label'=>"LBL_NOTE",'rules'=>"",'class'=>"span5"))?>
				<?php echo $formBase->input('status',array('label'=>"LBL_STATUS",'rules'=>"required",'class'=>"span5"))?>
		       
        <div class="form-actions ">			
			<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
			<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE')); ?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
