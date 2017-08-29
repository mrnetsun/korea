<?php
$formBase = new FormBase();
$data_before = json_decode($fillData->data_before);
?>
<div class="section ">
	<?php echo $formBase->view( __('LBL_CATEGORY'), $data_before->classifications );?>
</div>