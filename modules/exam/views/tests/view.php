<?php
	$formBase = new FormBase();
?>
<input type="hidden" id="maxPlay" name="maxPlay" value="0"/>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_TEST_NAME",$fillData->test_name);?>
		
		<?php echo $formBase->view("LBL_CATEGORY",$fillData->cate_id);?>
		
		<?php echo $formBase->view("LBL_TIME_LIMIT",$fillData->time_limit.' Phút');?>
		
		<?php echo $formBase->view("LBL_PASS_POINT",$fillData->pass_point.' %');?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		
		<?php echo $formBase->view("LBL_DETAIL",$fillData->description);?>
		

                    
	</div>

	<div class="session component_preview">
		<?php
		if($component)foreach($component as $c){
//			debug($c);
			?>
			<div class="component_item">
			<h5><?php echo $c->title;?></h5>
			<div class=" note">
				<span class="component_note">Điểm liệt <?php echo $c->point_failure?></span>
				<span class="component_note"><?php echo img_status($c->display_random)?>Hiển thị Ngẫu nhiên </span>
				<span class="component_note"><?php echo img_status($c->show_title)?>Hiển thị Tiêu đề</span>
				<span class="component_note"><?php echo img_status($c->show_description)?>Hển thị Chi tiết </span>
				<span class="component_note"><b>Tổng số câu hỏi <?php echo $c->total_question?></b></span>
				<span class="component_note"><b>Tổng điểm <?php echo $c->total_point?></b></span>

			</div>
				<div class="question_preview">
					<?php
					foreach($c->questions as $q){
						?>
						<div class="questionWrap">
							<h6><?php echo anchor('exam/question/edit/'.$q->question_id,'<span class="label">ID:'.$q->question_id.'</span> '.$q->title,array('target'=>'_blank')); ?></h6>
							<div class="detail">
							<?php

							echo displayQuestion($q);?>
							</div>
							<div class="answer">
							<?php echo displayQuestionAnswer($q,1)?>
							</div>
						</div>
					<?php
					}
					?>
				</div>
			</div>
			<?php
		}else{
			echo '<div class="component_item">'.__('LBL_NO_COMPONENT').'</div>';
		}
		?>
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->back('BTN_BACK',site_url('exam/test'),array('label'=>'BTN_BACK'));
		?>
	</div>

</div>
<div class="clear"></div>