<?php
	$formBase = new FormBase();

$questionType = getSystemDropdownByCode('QUESTION_TYPE');
?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            
					<?php echo $formBase->view("LBL_CATEGORY",$fillData->category->cate_name);?>
		
		<?php echo $formBase->view("LBL_TITLE",$fillData->title);?>
		
		<?php echo $formBase->view("LBL_STATUS",img_status($fillData->status));?>
		
		<?php echo $formBase->view("LBL_POINT",$fillData->point);?>
		
		<?php echo $formBase->view("LBL_SUBPOINT",$fillData->point_sub);?>
		
		<?php echo $formBase->view("LBL_DETAIL",$fillData->content);?>
		
		<?php echo $formBase->view("LBL_MEDIA",$fillData->media);?>
		
		<?php echo $formBase->view("LBL_ANSWER",'<div class="answer">'.displayQuestionAnswer($fillData,true).'</div>');?>
		
		<?php echo $formBase->view("LBL_QUESTION_TYPE",$questionType[$fillData->question_type]);?>
		
		<?php echo $formBase->view("LBL_FEEDBACK",$fillData->feedback);?>
		

                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->back('BTN_BACK',site_url('exam/question'),array('label'=>'BTN_BACK'));
		?>
	</div>

</div>
<div class="clear"></div>