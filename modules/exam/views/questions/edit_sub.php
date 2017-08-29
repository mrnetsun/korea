<?php 
	$formBase = new FormBase();
	echo $formBase->create('exam/question/updateSub',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('question_id');
?>
    <div class="screenView span10">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">
			<?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
			   <?php echo $formBase->dropdown('question_type',array('label'=>"LBL_QUESTION_TYPE",'options'=>getSystemDropdownByCode('QUESTION_TYPE'),'empty'=>'LBL_SELECT_ONE','rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('point',array('label'=>"LBL_POINT",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('point_sub',array('label'=>"LBL_SUBPOINT",'rules'=>"",'class'=>"span4"))?>
				<?php echo $formBase->texteditor('content',array('label'=>"LBL_DETAIL",'rules'=>"required",'class'=>"span8"))?>
				<?php echo $formBase->input('media',array('label'=>"LBL_MEDIA",'rules'=>"",'class'=>"span4"))?>
			<div class="control-group">
				<label class="control-label" tooltip=""><?php echo __("LBL_ANSWER")?><span class="required">*</span></label>
				<div class="controls">
					<div id="questionType<?php echo $fillData->question_type;?>" class="answerWrap">
					<?php include_once ('type/type_'.$fillData->question_type.'.php')?>
					</div>
				</div></div>

			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required",'class'=>"span4"))?>
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>