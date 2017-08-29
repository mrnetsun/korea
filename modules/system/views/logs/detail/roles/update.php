<?php
$formBase = new FormBase();
$data_before = json_decode($fillData->data_before);
$data_after = json_decode( $fillData->data_after );
?>

<div class="section ">
	<?php
		echo $formBase->view("Role",$data_after->roleName? $data_after->roleName:$data_before->roleName );
		if( isset($data_after->roleName) && strcmp($data_after->roleName,$data_before->roleName ) ){
			echo $formBase->view('',$data_before->roleName,'',array('class'=>'line-through-old'));
		}

		echo $formBase->view("LBL_STATUS", intval($data_after->status)==1?__('LBL_ACTIVE'):__('LBL_DEACTIVE') );
		if( isset($data_after->status) && strcmp($data_after->status,$data_before->status ) ) {
			echo $formBase->view("", intval($data_before->status) == 1 ? __('LBL_ACTIVE') : __('LBL_DEACTIVE'), '', $data_after->status !== '' ? array('class' => 'line-through-old') : array());
		}

		echo $formBase->view("LBL_CREATED",formatDate($data_before->createdTime));
	?>
</div>