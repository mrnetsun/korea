<?php
$formBase = new FormBase();
$data_before = json_decode( $fillData->data_before );
$data_after = json_decode( $fillData->data_after );
?>
<div class="memberProfile w630">
<div class="left w110">
    <?php
    $classAvatar = 'avartar';
    if (file_exists($data_after->avatar)) {
        $classAvatar = 'avartar_default';
    } else {
        $classAvatar = 'avartar';
    }
    if( $data_after->avatar ) {
        ?>
        <div class="box-avatar-after <?php echo $classAvatar; ?>">
            <?php
                echo base_img($data_after->avatar, array('width' => 100, 'height' => 100));
            ?>
        </div>

        <?php
    }

    if( !$data_after->avatar && $data_before->avatar ) {
        if (file_exists($data_before->avatar)) {
            $classAvatar = 'avartar_default';
        } else {
            $classAvatar = 'avartar';
        }
        ?>
        <div class="box-avatar-after <?php echo $classAvatar; ?>">
            <?php
            echo base_img($data_before->avatar, array('width' => 100, 'height' => 100));
            ?>
        </div>
        <?php
    }

    $classAvatar = 'avartar';
    if (file_exists($data_before->avatar)) {
        $classAvatar = 'avartar_default';
    } else {
        $classAvatar = 'avartar';
    }
    ?>
    <?php if( !empty($data_after->avatar) && strcmp($data_before->avatar,$data_after->avatar) ){ ?>
        <div class="box-avatar <?php echo $classAvatar; ?>">
            <?php
                echo base_img($data_before->avatar,array('width'=>100, 'height'=>100));
            ?>
        </div>
    <?php } ?>
</div>
<div class="right ">

	<div class=" span6 formView">

        <?php
        echo $formBase->view("LBL_FIRST_NAME", isset($data_after->firstName)? $data_after->firstName : $data_before->firstName );
        if( isset($data_after->firstName) && strcmp( $data_after->firstName, $data_before->firstName ) ) {
            echo $formBase->view("", $data_before->firstName,'', array('class' => 'line-through-old'));
        }

        echo $formBase->view("LBL_LAST_NAME", isset($data_after->lastName)? $data_after->lastName : $data_before->lastName );
        if( isset($data_after->lastName) && strcmp( $data_after->lastName, $data_before->lastName ) ) {
            echo $formBase->view("", $data_before->lastName,'', array('class' => 'line-through-old'));
        }

        echo $formBase->view("LBL_USERNAME", isset($data_after->username)? $data_after->username : $data_before->username );
        if( isset($data_after->username) && strcmp( $data_after->username, $data_before->username ) ) {
            echo $formBase->view("", $data_before->username,'', array('class' => 'line-through-old'));
        }

        echo $formBase->view("LBL_EMAIL", isset($data_after->email)? $data_after->email : $data_before->email );
        if( isset($data_after->email) && strcmp( $data_after->email, $data_before->email ) ) {
            echo $formBase->view("", $data_before->email, '',array('class' => 'line-through-old'));
        }

        echo $formBase->view("LBL_ROLES", isset($data_after->roleId)? get_member_role($data_after->roleId) : get_member_role($data_before->roleId) );
        if( isset($data_after->roleId) && strcmp( $data_after->roleId, $data_before->roleId ) ) {
            echo $formBase->view("", get_member_role($data_before->roleId), '',array('class' => 'line-through-old'));
        }

        echo $formBase->view("LBL_STATUS", intval($data_after->status)==1?__('LBL_ACTIVE'):__('LBL_DEACTIVE') );
        if( isset($data_after->status) && strcmp($data_after->status,$data_before->status ) ) {
            echo $formBase->view("", intval($data_before->status) == 1 ? __('LBL_ACTIVE') : __('LBL_DEACTIVE'), '', $data_after->status !== '' ? array('class' => 'line-through-old') : array());
        }

        echo $formBase->view("LBL_CREATED",formatDate($data_before->createdTime));
        ?>
        </div>
</div>
</div>