<?php 
	$formBase = new FormBase();
	echo $formBase->create('course/category/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('cate_name',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
			<?php
			$parentOptions = getTreeOption(0,0,array('table'=>'course_category','key'=>'id','name'=>'cate_name','parent'=>'parent_id'));

			echo $formBase->dropdown('parent_id',array('label'=>"LBL_ROOT", 'options'=>$parentOptions,'empty'=>'LBL_ROOT','rules'=>"",'class'=>"span4"))?>
			<?php echo $formBase->texteditor('description',array('label'=>"LBL_DETAIL",'rules'=>"",'class'=>"span4"))?>

			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required",'class'=>"span4"))?>

			<div class="form-actions ">
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->back('BTN_BACK',site_url('course/category'),array('label'=>'BTN_BACK')); ?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>