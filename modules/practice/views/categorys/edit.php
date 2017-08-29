<?php 
	$formBase = new FormBase();
	echo $formBase->create('practice/category/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">            
				<?php echo $formBase->input('cate_name',array('label'=>"LBL_NAME",'rules'=>"required",'class'=>"span4"))?>

				<?php
				$parentOptions = getTreeOption(0,0,array('table'=>'vocabulary_category','key'=>'id','name'=>'cate_name','parent'=>'parent_id'));

				echo $formBase->dropdown('parent_id',array('label'=>"LBL_ROOT",'options'=>$parentOptions,'rules'=>"required",'class'=>"span4"))
				?>

			<?php echo $formBase->input('position',array('label'=>"LBL_POSITION",'rules'=>"",'class'=>"span4"))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>""))?>
		
		<div class="form-actions ">			
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>