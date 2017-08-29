<?php
$formBase = new FormBase();
$data_before = json_decode($fillData->data_before);
?>
	<div class="section ">
			<?php
				echo $formBase->view("Role",$data_before->roleName);
				echo $formBase->view("LBL_STATUS", intval($data_before->status)==1?__('LBL_ACTIVE'):__('LBL_DEACTIVE') );
				echo $formBase->view("LBL_CREATED", formatDate($data_before->createdTime) );
				echo $formBase->view("LBL_UPDATED", formatDate($data_before->updatedTime) );
			?>
	</div>