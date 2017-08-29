<?php
$formBase = new FormBase();
echo $formBase->create('exam/question/insert',array('ajax'=>_getBaseName('List'),'ckeditor'=>1,'class'=>'form-horizontal'));
?>
	<div class="screenView span10">
		<div style="height:15px;"><h3></h3></div>
		<div class="section ">
			<?php
			$parentOptions = array();
			$parentOptions = getTreeOption(0,0,array('table'=>'question_category','key'=>'cate_id','name'=>'cate_name','parent'=>'parent_id'));

			?>
			<?php echo $formBase->dropdown('cate_id',array('label'=>"LBL_CATEGORY",'options'=>$parentOptions,'empty'=>'LBL_SELECT_ONE','rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->dropdown('question_type',array('label'=>"LBL_QUESTION_TYPE",'selected'=>2,'options'=>getSystemDropdownByCode('QUESTION_TYPE'),'empty'=>'LBL_SELECT_ONE','rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('point',array('label'=>"LBL_POINT",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('point_sub',array('label'=>"LBL_SUBPOINT",'rules'=>"",'class'=>"span4"))?>
			<?php echo $formBase->ckeditor('content',array('label'=>"LBL_DETAIL",'rules'=>"required",'class'=>"span8"))?>

			<?php echo $formBase->input('media',array('id'=>'audio_url','label'=>"LBL_MEDIA",'rules'=>"",'class'=>"span4",'unit'=>'<button type="button" class="btn btn-small" onclick="openKCFinder_audio(\'#audio_url\')">Audio</button> <i class="pointer playSound fa fa-volume-up"></i>'))?>

			<div class="control-group">
				<label class="control-label" tooltip=""><?php echo __("LBL_ANSWER")?></label>
				<div class="controls">
					<div id="questionType2" class="answerWrap">
						<?php include_once ('type/type_2.php')?>
					</div>
				</div></div>

			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required",'class'=>"span4"))?>

			<div class="form-actions ">
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->back('BTN_BACK',site_url('exam/question'),array('label'=>'BTN_BACK')); ?>
			</div>

		</div>
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>

<script>

	$('.playSound').click(function(){
		var url_audio = $(this).closest('.controls').find('input[type=text]').val();
		if(!url_audio) return;

		if(url_audio.indexOf('http://')== -1){
			url_audio = ROOT_URL + url_audio
		}
		var obj = $(this);
		obj.addClass('soundOn');

		var mySound = soundManager.createSound({
			url:url_audio ,
			onfinish: function() {
				obj.removeClass('soundOn');
			}
		});
		mySound.play();
	});

</script>
