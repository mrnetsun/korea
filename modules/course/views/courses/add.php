<?php 
	$formBase = new FormBase();
	echo $formBase->create('course/course/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span8">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           
        		<?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
				<?php
				$parentOptions = getTreeOption(0,0,array('table'=>'course_category','key'=>'id','name'=>'cate_name','parent'=>'parent_id'));

				echo $formBase->dropdown('cate_id',array('label'=>"LBL_CATEGORY",'options'=>$parentOptions,'empty'=>'LBL_SELECT_ONE','rules'=>"",'class'=>"span4"))?>
			<?php echo $formBase->input('mentor',array('label'=>"LBL_MENTOR",'rules'=>"",'class'=>"span4"))?>

			<?php echo $formBase->texteditor('short',array('label'=>"LBL_SHORT_DESCRIPTION",'rules'=>"",'class'=>"span6 h100"))?>
			<?php echo $formBase->texteditor('description',array('label'=>"LBL_DETAIL",'rules'=>"",'class'=>"span6 h100"))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'checked'=>ACTIVE,'rules'=>""))?>
        <div class="form-actions ">			
			<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
			<?php echo $formBase->back('BTN_BACK',site_url('course/course'),array('label'=>'BTN_BACK')); ?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
