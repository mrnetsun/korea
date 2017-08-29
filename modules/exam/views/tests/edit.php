<?php 
	$formBase = new FormBase();
	echo $formBase->create('exam/test/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('test_id');
?>
    <div class="screenView ">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('test_name',array('label'=>"LBL_TEST_NAME",'rules'=>"required",'class'=>"span4"))?>
				<?php
				$options = getTreeOption(0,0,array('table'=>'test_category','key'=>'cate_test_id','name'=>'cate_name','parent'=>'parent_id'));
				echo $formBase->dropdown('cate_id',array('label'=>"LBL_CATEGORY",'options'=>$options,'empty'=>'LBL_SELECT_ONE','rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('time_limit',array('label'=>"LBL_TIME_LIMIT",'rules'=>"required",'class'=>"span1",'unit'=>' phút'))?>
				<?php echo $formBase->input('pass_point',array('label'=>"LBL_PASS_POINT",'rules'=>"required",'class'=>"span1",'unit'=>' %'))?>
			<?php echo $formBase->input('total_point',array('label'=>"LBL_TOTAL_POINT",'id'=>'total_point','readonly'=>"true",'class'=>"span1",'unit'=>' điểm'))?>

			<?php echo $formBase->texteditor('description',array('label'=>"LBL_DETAIL",'rules'=>"",'class'=>"span6"))?>

				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required",'class'=>"span4"))?>

			<div class="componentWrap">
				<div class="control-group">
					<label class="control-label" tooltip="">

					</label><div class="controls ">
						<?php echo ajax_link('exam/test/addComponent/'.$fillData->test_id,'<i class="icon icon-plus"></i> Thêm phần thi',array('overlay'=>'LBL_ADD_COMPONENT','class'=>'btn btn-small btn-success'))?>
						<div class="clear"></div>
						<div id="componentContent" class="span8">
							<?php
							include_once('component/component_list.php');
							?>
						</div>

					</div></div>
				<div>

				</div>

			</div>
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->back('BTN_BACK',site_url('exam/test/'),array('label'=>'BTN_BACK')); ?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>

