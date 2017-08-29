<?php echo $ckeditor;?>
<?php
	$formBase = new FormBase();
	echo $formBase->create('company/category/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('cateId');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">
			<?php echo $formBase->input('name',array('id'=>'titleId','label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4",))?>
			<?php echo $formBase->input('slug',array('id'=>'slugId','label'=>"LBL_SLUG",'rules'=>"",'class'=>"span4"))?>
			<?php
			$parentOptions = array();
			$parentOptions = getTreeOption(0,0,array('table'=>'category','key'=>'cateId','name'=>'name','parentId'=>'parentId','type'=>'COMPANY'));
			?>
			<?php echo $formBase->dropdown('parentId',array('label'=>"LBL_PARENT",'options'=>$parentOptions,'empty'=>__("LBL_ROOT"),'rules'=>"",'class'=>"span4"))?>

			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"",'class'=>"span4"))?>

		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
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
