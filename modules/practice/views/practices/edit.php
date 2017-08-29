<?php 
	$formBase = new FormBase();
	echo $formBase->create('practice/practice/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php
				$parentOptions = getTreeOption(0,0,array('table'=>'vocabulary_category','key'=>'id','name'=>'cate_name','parent'=>'parent_id'));

				echo $formBase->select('cate_id[]',array('label'=>"LBL_CATEGORY",'multiple'=>true,'options'=>$parentOptions,'selected'=>json_decode($fillData->cate_id),'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('title',array('label'=>"LBL_WORD",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('meaning',array('label'=>"LBL_MEANING",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('pronounce',array('label'=>"LBL_PRONOUNCE",'rules'=>"required",'class'=>"span4"))?>
				<?php echo $formBase->input('audio',array('label'=>"LBL_AUDIO",'id'=>'audio_url','rules'=>"required",'unit'=>'<button type="button" class="btn btn-small" onclick="openKCFinder_audio(\'#audio_url\')">Audio</button> <i class="pointer playSound fa fa-volume-up"></i>','class'=>"span4"))?>
				<?php echo $formBase->input('slow_audio',array('label'=>"LBL_SLOW_AUDIO",'id'=>'slow_audio_url','rules'=>"",'unit'=>'<button type="button" class="btn btn-small" onclick="openKCFinder_audio(\'#slow_audio_url\')">Audio</button> <i class="pointer playSound fa fa-volume-up"></i>','class'=>"span4"))?>
		            <?php echo $formBase->upload_image('image',array('label'=>"LBL_IMAGE",'rules'=>"",'class'=>"btn"))?>
			<?php echo $formBase->textarea('detail',array('label'=>"LBL_DETAIL",'rules'=>"",'class'=>"span4 h100"))?>
			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>""))?>
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->back('BTN_BACK',site_url('practice/practice'),array('label'=>'BTN_BACK'))?>
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

