<?php
$formBase = new FormBase();
$data_before = json_decode($fillData->data_before);
$arrIdClass = array();
if( empty( $data_before->type ) ){
	$arrIdClass[] = $data_before->field_source_id;
	$arrIdClass[] = $data_before->field_destination_id;
}
if( !empty( $arrIdClass ) ){
	$dataClassName = get_class_copyfield( $arrIdClass );
}
?>
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            <?php if( empty( $data_before->type ) ){ ?>
			<div class="control-group">
				<label class="control-label">
					<?php echo __('LBL_TYPE'); ?>
				</label>
				<div class="controls "> <?php echo __('LBL_BASIC'); ?></div>
			</div>
			<?php echo $formBase->view("LBL_FIELD_SOURCE",$dataClassName[$data_before->field_source_id] );?>
			<?php echo $formBase->view("LBL_FIELD_DESTINATION", $dataClassName[$data_before->field_destination_id] );?>
            <?php echo $formBase->view("LBL_MAXCHAR",$data_before->maxchar);?>
			<?php echo $formBase->view("LBL_CREATED",formatDate($data_before->createdTime));?>
			<?php echo $formBase->view("LBL_UPDATED",formatDate($data_before->updatedTime));?>
			<?php echo $formBase->view("LBL_STATUS", intval($data_before->status)==1?__('LBL_ACTIVE'):__('LBL_DEACTIVE') );?>
			<?php }else{ ?>
				<div class="control-group">
					<label class="control-label">
						<?php echo __('LBL_TYPE'); ?>
					</label>
					<div class="controls "> <?php echo __('LBL_ADVANCED'); ?></div>
				</div>
				<?php echo $formBase->view("LBL_FIELD_SOURCE",limit_character($data_before->field_source_advanced,30));?>
				<?php echo $formBase->view("LBL_FIELD_DESTINATION",limit_character($data_before->field_destination_advanced, 30));?>
				<?php echo $formBase->view("LBL_MAXCHAR",$data_before->maxchar);?>
				<?php echo $formBase->view("LBL_STATUS", intval($data_before->status)==1?__('LBL_ACTIVE'):__('LBL_DEACTIVE') );?>
				<?php echo $formBase->view("LBL_CREATED",formatDate($data_before->createdTime));?>
			<?php } ?>
	</div>
