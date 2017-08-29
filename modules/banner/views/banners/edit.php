<?php 
	$formBase = new FormBase();
	//prepare
	if($fillData->position)$fillData->position = json_decode($fillData->position);
	if($fillData->categories_company)$fillData->categories_company = json_decode($fillData->categories_company);
	if($fillData->categories_article)$fillData->categories_article = json_decode($fillData->categories_article);
//	debug($fillData,false);

	$strPosition = @implode('|',$fillData->position);


	echo $formBase->create('banner/banner/update',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	$formBase->fillData($fillData);
	echo $formBase->hidden('banner_id');
?>
	<div class="screenView ">
		<div style="height:15px;"><h3></h3></div>
		<div class="section ">

			<?php echo $formBase->input('client_id',array('label'=>"LBL_CLIENT",'rules'=>"",'class'=>"span4"))?>
			<?php echo $formBase->input('title',array('label'=>"LBL_TITLE",'rules'=>"required",'class'=>"span4"))?>
			<?php echo $formBase->input('url',array('label'=>"LBL_LINK",'rules'=>"url",'class'=>"span4"))?>

			<?php
			$page =  getDBDropdown(array('table'=>'banner_position',
				'key'=>'code','val'=>'title',
				'where'=>array('status'=>ACTIVE)));
			echo $formBase->select('position[]',array('label'=>"LBL_POSITION",'multiple'=>true,
				'options'=>$page,'rules'=>"",'class'=>"span4"
			,'onchange'=>'bannerController.changePosition(this)'
			))?>

			<?php
				$display = (strpos($strPosition,'COM')!== false)?'':'none';
			?>
			<div id="companyWrap" style="display: <?php echo $display;?>">
				<?php
				$category = getDBDropdown(array('table'=>'category','key'=>'cateId','val'=>'name',
					'where'=>array('status'=>ACTIVE,'type'=>'COMPANY','parentId <>'=>0)),
					array('order_by'=>'name ASC')
				);
				//			debug($this->db->last_query());
				echo $formBase->select('categories_company[]',array('label'=>"LBL_CATEGORY_COMPANY",'multiple'=>true,'options'=>$category,'rules'=>"",'class'=>"span4"))?>

			</div>
			<?php
			$display = (strpos($strPosition,'NEW')!== false)?'':'none';
			?>
			<div id="articleWrap" style="display: <?php echo $display;?>;">
				<?php
				$category = getDBDropdown(array('table'=>'category','key'=>'cateId','val'=>'name',
					'where'=>array('status'=>ACTIVE,'type'=>'ARTICLE')),
					array('order_by'=>'name ASC')
				);
				//			debug($this->db->last_query());
				echo $formBase->select('categories_article[]',array('label'=>"LBL_CATEGORY_ARTICLE",'multiple'=>true,'options'=>$category,'rules'=>"",'class'=>"span4"))?>
			</div>
			<?php
			$campaign = getDBDropdown(array('table'=>'banner_campaign','key'=>'campaign_id','val'=>'title','where'=>array('status'=>ACTIVE)));
			echo $formBase->select('campaign',array('label'=>"LBL_CAMPAIGN",'options'=>$campaign,
				'empty'=>'LBL_SELECT_ONE','rules'=>"required",
				'onchange'=>"bannerController.checkSpecial(this)"
				))?>
			<?php echo $formBase->select('type',array('label'=>"LBL_TYPE",
				'options'=>getSystemDropdownByCode('BANNER_TYPE'),
				'empty'=>'LBL_SELECT_ONE',
				'onchange'=>'bannerController.changeBannerType(this)',
				'rules'=>"required",'class'=>"span4"))?>



			<?php $display = ($fillData->type == 1 || $fillData->type == 2 || $fillData->type == 4)?'':'none'?>
			<div id="typeImage" style="display: <?php echo $display?>;">
				<?php echo $formBase->upload_image('image',array('label'=>"LBL_IMAGE",'rules'=>"",'class'=>"btn"))?>
			</div>
			<?php

			$display = (strpos(json_encode($fillData->position),'"SEARCH1"')!== false || strpos(json_encode($fillData->position),'"SEARCH2"')!== false)?'':'none';

			?>
			<div id="searchKeyword" style="display: <?php echo $display?>;">
				<?php echo $formBase->tag('keyword',array('label'=>"LBL_KEYWORD",'rules'=>"",'class'=>"span3"))?>
			</div>
			<?php $display = ($fillData->type == 1 || $fillData->type == 2)?'':'none'?>
			<div id="typeText" style="display: <?php echo $display?>;">
				<?php echo $formBase->ckeditor('detail',array('label'=>"LBL_DETAIL",'rules'=>"",'class'=>"w600 h100"))?>
			</div>
			<?php $display = ($fillData->type == 3 || $fillData->type == 4)?'':'none'?>
			<div id="typeGoogleAds" style="display: <?php echo $display?>;">
				<?php echo $formBase->textarea('googleads',array('label'=>"LBL_GOOGLE_ADS",'rules'=>"",'class'=>"w600 h100"))?>
			</div>
			<?php echo $formBase->input('start_date',array('label'=>"LBL_START_DATE",'rules'=>"",'class'=>"span3",'unit'=>' <i class="icon icon-time"></i>'))?>
			<?php echo $formBase->note('LBL_NOTE_CAMPAIGN')?>
			<?php echo $formBase->input('end_date',array('label'=>"LBL_END_DATE",'rules'=>"",'class'=>"span3",'unit'=>' <i class="icon icon-time"></i>'))?>
			<?php echo $formBase->note('LBL_NOTE_CAMPAIGN')?>
			<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'checked'=>ACTIVE,'rules'=>""))?>
			<div class="form-actions ">
				<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
				<?php echo $formBase->back('BTN_BACK',site_url('banner/banner'),array('label'=>'BTN_BACK')); ?>
		</div>
		
        </div>    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>