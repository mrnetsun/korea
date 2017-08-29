<?php 
	$formBase = new FormBase();
	echo $formBase->create('exam/test/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">

			<?php echo $formBase->input('test_name',array('label'=>"LBL_TEST_NAME",'rules'=>"required",'class'=>"span4"))?>
			<?php
			$options = getTreeOption(0,0,array('table'=>'test_category','key'=>'cate_test_id','name'=>'cate_name','parent'=>'parent_id'));
			echo $formBase->dropdown('cate_id',array('label'=>"LBL_CATEGORY",'options'=>$options,'empty'=>'LBL_SELECT_ONE','rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('time_limit',array('label'=>"LBL_TIME_LIMIT",'rules'=>"required",'class'=>"span1",'unit'=>' phút'))?>
			<?php echo $formBase->input('pass_point',array('label'=>"LBL_PASS_POINT",'rules'=>"required",'class'=>"span1",'unit'=>' %'))?>

			<?php echo $formBase->texteditor('description',array('label'=>"LBL_DETAIL",'rules'=>"",'class'=>"span6"))?>

			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'checked'=>ACTIVE,'rules'=>"required",'class'=>"span4"))?>

			<div class="form-actions ">
			<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_NEXT')); ?>
			<?php echo $formBase->back('BTN_BACK',site_url('exam/test/'),array('label'=>'BTN_BACK')); ?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
