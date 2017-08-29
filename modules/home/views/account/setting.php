<div class="gap"></div>
<div class="container">
<?php
$formBase = new FormBase();
$user_avatar = ($user->avatar)? ROOT_URL.$user->avatar:ROOT_URL.DEFAULT_AVATAR;

echo pageHeader('LBL_TITLE_SETTING');
?>
</div></div>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <?php $this->load->view('account/aside',array('user'=>$user,'active_menu'=>'account/setting'));?>
        </div>
        <div class="col-md-9 pageDetail">
            <div class="row">
                <div class="col-md-5">
                   <?php
                   $formBase->fillData($user);
                   echo $formBase->create('account/updateProfile',array('ajax'=>array('Callback'=>'Common.ajaxCallbackFront')));
                   ?>
                        <h4><?php echo __("LBL_MY_INFORMATION")?></h4>

                        <div class="form-group form-group-icon-left"><i class="fa fa-user input-icon"></i>
                            <label><?php echo __("LBL_FIRST_NAME")?> <span class="text_error">*</span></label>
                            <?php  echo $formBase->input('firstName',array('rules'=>'required|max_length[50]|isnull_or_white_space|alpha_space','class'=>'form-control'))?>
                        </div>
                        <div class="form-group form-group-icon-left"><i class="fa fa-user input-icon"></i>
                            <label><?php echo __("LBL_LAST_NAME")?> <span class="text_error">*</span></label>
                            <?php echo $formBase->input('lastName',array('rules'=>'required|max_length[50]|isnull_or_white_space|alpha_space','class'=>'form-control'));?>
                        </div>



                        <div class="form-group form-group-icon-left"><i class="fa fa-envelope input-icon"></i>
                            <label><?php echo __("LBL_EMAIL")?> <span class="text_error">*</span></label>
                            <?php echo $formBase->input('email',array('rules'=>'required|valid_email','class'=>'form-control'));?>
                        </div>
                        <div class="form-group form-group-icon-left"><i class="fa fa-phone input-icon"></i>
                            <label><?php echo __("LBL_PHONE")?></label>
                            <?php echo $formBase->input('phone',array('rules'=>'','class'=>'form-control'));?>
                        </div>

                    <div class="form-group form-group-icon-left"><i class="fa fa-facebook input-icon"></i>
                        <label><?php echo __("LBL_FACEBOOK")?></label>
                        <?php echo $formBase->input('facebook',array('rules'=>'url','class'=>'form-control'));?>
                    </div>
                    <div class="form-group form-group-icon-left"><i class="fa fa-linkedin-square input-icon"></i>
                        <label><?php echo __("LBL_LINKIN")?></label>
                        <?php echo $formBase->input('linkin',array('rules'=>'url','class'=>'form-control'));?>
                    </div>
                    <div class="form-group form-group-icon-left"><i class="fa fa-skype input-icon"></i>
                        <label><?php echo __("LBL_SKYPE")?></label>
                        <?php echo $formBase->input('skype',array('rules'=>'','class'=>'form-control'));?>
                    </div>





                    <hr>
                        <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'LBL_UPDATE_PROFILE' ,'class'=>'btn btn-primary') ); ?>
                        <?php echo $formBase->end();?>
                </div>
                <div class="col-md-4 col-md-offset-1">
                    <h4><?php echo __("LBL_CHANGE_PASSWORD")?></h4>
                    <?php echo $formBase->create('account/updatePassword',array('ajax'=>array('Callback'=>'ajaxCallback')));?>

                        <div class="form-group form-group-icon-left"><i class="fa fa-lock input-icon"></i>
                            <label><?php echo __("LBL_CURRENT_PASSWORD")?></label>
                            <?php
                            $rules = ($user->password)?'required|min_length[6]':'';
                            echo $formBase->password('oldPassword',array('rules'=>$rules,'class'=>'form-control'));?>
                        </div>
                        <div class="form-group form-group-icon-left"><i class="fa fa-lock input-icon"></i>
                            <label><?php echo __("LBL_NEW_PASSWORD")?></label>
                            <?php echo $formBase->password('newPassword',array('id'=>'newpassword','rules'=>'required|min_length[6]|matches[repassword]','class'=>'form-control'));?>
                        </div>
                        <div class="form-group form-group-icon-left"><i class="fa fa-lock input-icon"></i>
                            <label><?php echo __("LBL_CONFIRM_PASSWORD")?></label>
                            <?php echo $formBase->password('rePassword',array('id'=>'repassword','rules'=>'required|min_length[6]|matches[newpassword]','class'=>'form-control'));?>
                        </div>
                        <hr>
                        <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT' ,'class'=>'btn btn-primary') ); ?>
                        <?php echo $formBase->end();?>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="gap"></div>
<script>
    $(document).ready(function(){
        $('input[type=file]').attr('accept','image/jpg,image/jpeg,image/gif,image/png');
    });
    function ajaxCallback(data){
        try{
            var data = $.parseJSON(data);
            Common.closeOverlay();
            if(data.ok){
                Common.alert("xyz");
            }

        }catch(e){
            Common.jsonError(e);
        }
    }
</script>