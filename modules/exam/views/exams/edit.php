<?php 
	$formBase = new FormBase();
	echo $formBase->create('exam/exam/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('exam_id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">
			<?php
			$parentOptions = array();
			$parentOptions = getTreeOption(0,0,array('table'=>'exam_category','key'=>'exam_category_id','name'=>'cate_name','parent'=>'parent_id'));
			?>
			<?php echo $formBase->input('title',array('label'=>"Tiêu đề",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->dropdown('status',array('label'=>"Trạng thái",'options'=>getSystemDropdownByCode('EXAM_STATUS'),'empty'=>'LBL_SELECT_ONE','class'=>"span4"))?>
			<?php echo $formBase->dropdown('cate_id',array('label'=>"Danh mục",'options'=>$parentOptions,'empty'=>'LBL_SELECT_ONE','rules'=>"required",'class'=>"span4"))?>

			<div class="control-group">
				<label class="control-label">Đề thi</label>
				<div class="controls">
					<?php echo ajax_link('exam/exam/addTest/'.$fillData->exam_id,'<i class="icon icon-plus"></i> Đề thi',array('overlay'=>'LBL_ADD_TEST','class'=>'btn btn-small btn-success'))?>
					<div id="examTest">
						<?php echo $testListHTML;?>
					</div>
					<div class="h10"></div>
					<div class="note" >Tổng : <span id="totalCountTest"  class="bold"><?php echo count(json_decode($fillData->tests));?></span> đề thi</div>
				</div>
			</div>


			<?php echo $formBase->yesno('limit_time_flag',array('label'=>"Giới hạn thời gian",'onclick'=>"examController.showExamTime(this);"));
			$timeExam = ($fillData->limit_time_flag)?'':'none';
			?>
			<div id="timeExam" style="display: <?php echo $timeExam?>">
			<?php echo $formBase->datetime('start_time',array('label'=>"Bắt đầu",'rules'=>"",'class'=>"span2"))?>
			<?php echo $formBase->datetime('end_time',array('label'=>"Kết thúc",'rules'=>"",'class'=>"span2"))?>
			</div>
			<?php echo $formBase->input('time_limit',array('label'=>"Thời gian làm bài",'rules'=>"numeric",'class'=>"span1",'unit'=>' Phút','config'=>array('min'=>-10,'max'=>10)))?>
			<?php echo $formBase->input('pass_point',array('label'=>"Điểm đạt",'rules'=>"numeric",'class'=>"span1","unit"=>' %','config'=>array('min'=>-10,'max'=>10)))?>

			<?php echo $formBase->yesno('show_point',array('label'=>"Hiển thị điểm",'rules'=>""))?>
			<?php echo $formBase->yesno('show_feedback',array('label'=>"Hiển thị FeedBack",'rules'=>""))?>
			<?php echo $formBase->yesno('show_checkAnswer',array('label'=>"Hiển thị check đáp án",'rules'=>""))?>
			<?php echo $formBase->yesno('show_result',array('label'=>"Hiển thị kết quả",'rules'=>""))?>

			<?php echo $formBase->input('limit_reset',array('label'=>"Lượt Reset",'rules'=>"numeric",'class'=>"span1",'unit'=>' Lượt'))?>
			<?php echo $formBase->input('cost',array('label'=>"Giá",'rules'=>"numeric",'class'=>"span1",'unit'=>' Đồng'))?>
			<?php echo $formBase->upload_image('thumbnail',array('label'=>"Ảnh đại diện",'rules'=>"",'class'=>"btn"))?>
			<?php echo $formBase->textarea('description',array('label'=>"Mô tả",'rules'=>"",'class'=>"span4 h100"))?>

		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->back('BTN_BACK',site_url('exam/exam'),array('label'=>'BTN_BACK')); ?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>