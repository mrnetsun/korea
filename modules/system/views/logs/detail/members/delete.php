<?php
$data_before = json_decode($fillData->data_before);
$formBase = new FormBase();
?>
<div class="memberProfile w630">
<div class="left w110">
    <?php
    $classAvatar = 'avartar';
    if (file_exists($data_before->avatar)) {
        $classAvatar = 'avartar_default';
    } else {
        $classAvatar = 'avartar';
    }
    ?>
	<div class="box-avatar-after <?php echo $classAvatar; ?>">
		<?php
           if($data_before->avatar) echo base_img($data_before->avatar,array('width'=>100, 'height'=>100));
           ?>  	
	</div>
   
</div>
<div class="right">
	<div class=" span6 formView">
        <?php
            echo $formBase->view("LBL_FIRST_NAME", $data_before->firstName );
            echo $formBase->view("LBL_LAST_NAME", $data_before->lastName );
            echo $formBase->view("LBL_USERNAME", $data_before->username );
            echo $formBase->view("LBL_EMAIL", $data_before->email );
            echo $formBase->view("LBL_ROLES", get_member_role($data_before->roleId) );
            echo $formBase->view("LBL_CREATED", formatDate( $data_before->createdTime ) );
            echo $formBase->view("LBL_UPDATED", formatDate( $data_before->updatedTime ));
            echo $formBase->view("LBL_STATUS", intval($fillData->status)==1?__('LBL_ACTIVE'):__('LBL_DEACTIVE') );
        ?>
        </div>
</div>
</div>