<?php
	$formBase = new FormBase();
	$status = getSystemDropdownByCode('EXAM_STATUS');
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("Tiêu đề",$fillData->title);?>
		
		<?php if($fillData->limit_time_flag){
			echo $formBase->view("Giới hạn thời gian",img_status($fillData->limit_time_flag));
		?>
		
		<?php echo $formBase->view("Bắt đầu",$fillData->start_time);?>
		
		<?php echo $formBase->view("Kết thúc",$fillData->end_time);
		}
		?>
		
		<?php echo $formBase->view("Trạng thái",$status[$fillData->status]);?>
		
		<?php echo $formBase->view("Danh mục",$fillData->cate_name);?>
		
		<?php echo $formBase->view("Thời gian làm bài",$fillData->time_limit);?>
		<?php echo $formBase->view("Điểm đạt",$fillData->pass_point);?>

		
		<?php echo $formBase->view("Hiển thị điểm",img_status($fillData->show_point));?>
		<?php echo $formBase->view("Hiển thị FeedBack",img_status($fillData->show_feedback));?>
		<?php echo $formBase->view("Hiển thị kết quả",img_status($fillData->show_result));?>
		<?php echo $formBase->view("Hiển thị check đáp án",img_status($fillData->show_checkAnswer));?>


		<?php echo $formBase->view("Lượt Reset",$fillData->limit_reset);?>
		
		<?php echo $formBase->view("Giá",$fillData->cost);?>
		
		<?php echo $formBase->view("Ảnh đại diện",$fillData->thumbnail);?>
		
		<?php echo $formBase->view("Mô tả",$fillData->description);?>
		


                    
	</div>
  
	<div class="actions">
		<?php echo $formBase->back('BTN_BACK',site_url('exam/exam'),array('label'=>'BTN_BACK')); ?>
	</div>

</div>
<div class="clear"></div>