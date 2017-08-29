<div class="gap"></div>
<?php
$formBase = new FormBase();
echo pageHeader('LBL_TITLE_CONTACT');
?>
<div class="container">
	<div>
		<div class="cate-content">
			<div class="cate-list">
				<div class="row ">
<div class="col-md-8 contentWhite">
	<h4><?php echo __("LBL_CONTACT_FILL")?></h4>
	<div class="gap"></div>
	<div style="padding: 20px;">
		<?php
		echo $formBase->create('home/sendMail',array('class'=>'','ajax'=>array('Callback'=>'registerCallback')));
		?>
		<div class="row row-wrap">
			<div class="col-md-5">
				<div class="form-group">
					<label><?php echo __("LBL_FULL_NAME")?></label>
					<?php echo $formBase->input('fullName',array('rules'=>'required','class'=>'form-control'));?>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<div class="form-group">
					<label><?php echo __("LBL_CONTACT_COMPANY_NAME")?></label>
					<?php echo $formBase->input('companyName',array('rules'=>'required','class'=>'form-control'));?>
				</div>
			</div>

			<div class="col-md-11">
				<div class="form-group">
					<label><?php echo __("LBL_ADDRESS")?></label>
					<?php echo $formBase->input('address',array('rules'=>'required','class'=>'form-control'));?>
				</div>
			</div>

			<div class="col-md-5">
				<div class="form-group">
					<label><?php echo __("LBL_MOBILE")?></label>
					<?php echo $formBase->input('mobile',array('rules'=>'required|input','class'=>'form-control'));?>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<div class="form-group">
					<label><?php echo __("LBL_OFFICE")?></label>
					<?php echo $formBase->input('office',array('rules'=>'required|input','class'=>'form-control'));?>
				</div>
			</div>

			<div class="col-md-11">
				<div class="form-group">
					<label><?php echo __("LBL_REQUEST")?></label>
					<?php echo $formBase->textarea('request',array('rules'=>'required','class'=>'form-control','rows'=>6));?>
				</div>
			</div>
			<div class="col-md-11">
				<?php echo $formBase->submit('submit',array('label'=>'BTN_SEND','class'=>'btn btn-primary btn-large')); ?>
			</div>

		</div>
		<?php
		echo $formBase->end();
		?>
	</div>
</div>
					<div class="col-md-4">


						<?php
							$contact = getDBConfig('CONTACT_US','json');
//						debug($contact,false);
						?>
						<div class="googleMap">
							<?php

							$latLong = explode(',',$contact[0][5]);

							$MAP_OBJECT = new GoogleMapAPI('company_map');
							$MAP_OBJECT->setZoomLevel(15);
							$MAP_OBJECT->setWidth('100%');
							$MAP_OBJECT->setHeight('300');
							$MAP_OBJECT->center_lat = $latLong[0];
							$MAP_OBJECT->center_lon = $latLong[1];
							$MAP_OBJECT->addMarkerByCoords($latLong[1],$latLong[0],'C',$contact[0][0],'');
							?>
							<?php echo $MAP_OBJECT->getMapJS();?>

							<?php echo $MAP_OBJECT->printOnLoad();?>
							<?php echo $MAP_OBJECT->printMap();?>
						</div>
						<div class="gap"></div>
						<h4><?php echo $contact[0][0]?></h4>
						<div class="gap-mini clear"></div>
						<?php if($contact[0][1]) { ?>
							<h5 class="address"><i
									class="fa fa-map-marker round  box-icon-left animate-icon-border-rise round"></i><?php echo $contact[0][1] ?>
							</h5>
							<div class="gap-mini clear"></div>
						<?php
						}
						if($contact[0][2]){?>
						<h5 class="phone"><i class="fa fa-phone round  box-icon-left animate-icon-border-rise round"></i><?php echo $contact[0][2]?></h5>
						<div class="gap-mini clear"></div>
						<?php
						}
						if($contact[0][3]){?>
						<h5 class="fax"><i class="fa fa-fax round  box-icon-left animate-icon-border-rise round"></i><?php echo $contact[0][3]?></h5>
						<div class="gap-mini clear"></div>
						<?php
						}
						if($contact[0][4]){?>
						<h5 class="email"><i class="fa fa-envelope round  box-icon-left animate-icon-border-rise round"></i><?php echo $contact[0][4]?></h5>
						<div class="gap-mini clear"></div>
						<?php }?>




					</div>
					</div></div></div></div></div>
