<?php 
	$formBase = new FormBase();
	echo $formBase->create('cronjob/news/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('id');
?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
        <div class="section ">
			<?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('link',array('label'=>"LBL_LINK",'rules'=>"required|url",'class'=>"span4"))?>
			<?php echo $formBase->dropdown('code',array('label'=>"LBL_CODE",'options'=>getSystemDropdownByCode('CRAWLER_CODE'),'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->dropdown('domain',array('label'=>"LBL_CODE",'options'=>getSystemDropdownByCode('CRAWLER_SITE'),'rules'=>"required",'class'=>"span4"))?>

			<?php echo $formBase->radio('approve',array('label'=>"LBL_MODE",'options'=>array(1=>'LBL_AUTO',0=>'LBL_MANUAL'),'class'=>"span4"))?>

			<?php
			$categories = array();
			$categories = getTreeOption(0,0,array('table'=>'category','key'=>'cateId','name'=>'name','parentId'=>'parentId','type'=>'ARTICLE'));
			?>
			<?php echo $formBase->dropdown('cateId',array('label'=>"LBL_CATEGORY",'options'=>$categories,'empty'=>'LBL_UNCATEGORY','class'=>"span4"))?>
			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"",'checked'=>ACTIVE,'class'=>"span4"))?>

			<div class="form-actions ">
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>