<?php 
	$formBase = new FormBase();
	echo $formBase->create('article/article/update',array('ajax'=>_getBaseName('List'),'ckeditor'=>1,'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('article_id');
?>
    <div class="screenView span10">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">
			<?php echo $formBase->input('title',array('id'=>'titleId','label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span6"))?>
			<?php echo $formBase->input('slug',array('id'=>'slugId','label'=>"LBL_SLUG",'rules'=>"",'class'=>"span6"))?>
			<?php
			$parentOptions = array();
			$parentOptions = getTreeOption(0,0,array('table'=>'category','key'=>'cateId','name'=>'name','parentId'=>'parentId','type'=>'ARTICLE'));
			?>
			<?php echo $formBase->dropdown('category_id',array('label'=>"LBL_CATEGORY",'options'=>$parentOptions,'empty'=>'LBL_SELECT_ONE','rules'=>"required",'class'=>"span6"))?>
			<?php echo $formBase->ckeditor('short_description',array('label'=>"LBL_SHORT_DESCRIPTION",'config'=>array('uploadfile'=>true),'rules'=>"required",'class'=>"span6 h100"))?>
			<?php echo $formBase->ckeditor('full_content',array('label'=>"LBL_CONTENT",'config'=>array('uploadfile'=>true),'rules'=>"required",'class'=>"span6 h100"))?>
			<?php echo $formBase->upload_image('thumbnail',array('label'=>"LBL_THUMBNAIL",'rules'=>"",'class'=>"btn"))?>
			<?php echo $formBase->input('video',array('label'=>"LBL_VIDEO",'rules'=>"",'class'=>"span6"))?>
			<?php echo $formBase->upload_photos('gallery',array('label'=>"LBL_GALLERY",'rules'=>"",'class'=>"btn"))?>
			<?php echo $formBase->input('author',array('label'=>"LBL_AUTHOR",'class'=>"span6"))?>
			<?php echo $formBase->datetime('public',array('label'=>"LBL_PUBLIC",'rules'=>""))?>
			<?php echo $formBase->tag('tags',array('label'=>"LBL_TAGS",'class'=>""))?>
			<?php echo $formBase->textarea('meta_keyword',array('label'=>"LBL_META_KEYWORD",'rules'=>"",'class'=>"span6 h100"))?>
			<?php echo $formBase->textarea('meta_descrition',array('label'=>"LBL_META_DESCRIPTION",'rules'=>"",'class'=>"span6 h100"))?>


			<?php echo $formBase->yesno('feature',array('label'=>"LBL_FEATURE",'rules'=>""))?>
			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>""))?>
			<div class="form-actions ">
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
				<?php echo $formBase->back('BTN_BACK',site_url('article/'),array('label'=>'BTN_BACK')); ?>
			</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
<script>
	$(document).ready(function(){

		$('#titleId').live("keyup",function(){

			var slug = Common.slug($(this).val());

			$('#slugId').val(slug);
		});
	});

</script>
