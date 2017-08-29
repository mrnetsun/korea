<?php 
	$formBase = new FormBase();
	echo $formBase->create('content/content/insert',array('ajax'=>_getBaseName('List'),'ckeditor'=>1,'class'=>'form-horizontal'));?>
    <div class="screenView span10">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           
        		<?php echo $formBase->input('title',array('id'=>'titleId','label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span7"))?>
				<?php echo $formBase->input('slug',array('id'=>'slugId','label'=>"LBL_SLUG",'rules'=>"",'class'=>"span7"))?>
				<?php echo $formBase->ckeditor('detail',array('label'=>"LBL_CONTENT",'rules'=>"required",'class'=>"span8 h100"))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'checked'=>1))?>
				<div class="form-actions ">
					<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT')); ?>
					<?php echo $formBase->back('BTN_BACK',site_url('content/content'),array('label'=>'BTN_BACK')); ?>
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