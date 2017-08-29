<div class="main">
	<div class="shell system_alert" style="padding: 0px 0px;display: block;">
		<?php if( $this->session->flashdata('smessage') ){ ?>
			<div id="sys_message" class="msg msg-ok"><p><strong>success</strong>: <span class="message_content"><?php echo $this->session->flashdata('smessage');?></span></p>
				<a class="close" onclick="$(this).slideToggle('fast').parent().hide()" href="#">close</a></div>
		<?php } ?>
		<?php if( $this->session->flashdata('serror') ){ ?>
			<!-- Error -->
			<div id="sys_error" class="msg msg-error" style="display:none;"><p><strong>error</strong>: <span class="error_content"><?php echo $this->session->flashdata('serror');?></span></p>
				<a class="close" onclick="$(this).slideToggle('fast').parent().hide()" href="#">close</a></div>
		<?php } ?>
		<div class="signupWrap form-horizontal">
			<?php $formBase = new FormBase();
			$formBase->fillData($member);
			echo $formBase->create('member/profile/updateProfile',array('ajax'=>array('Callback'=>'ajaxCallback')));

			?>

			<div class="screenView formView">
				<div class="span8">

					<?php echo $formBase->view('LBL_EMAIL',$member->email);?>
					<div class="clear h10"></div>
					<?php echo $formBase->view('Password: ******',ajax_link('member/profile/changepass',__('LBL_CHANGE_PASSWORD'),array('overlay'=>__("LBL_CHANGE_PASSWORD"))));?>
					<div class="clear h10"></div>
<!--					<div class="clear h30"></div>-->
					<?php
					$options = getDBDropdown(array('table'=>'sys_role',
						'key'=>'roleId','val'=>'roleName'));
					//$roleId = json_decode($member->roleId);

					echo $formBase->view('LBL_ROLE',$options[$member->roleId]);

					?>

					<div class="imageUploadWrap span6">
						<div class="w100 h100 imagePreview" id="imagePreview">
							<table cellpadding="0" cellspacing="0"><tr><td class="w100 h100" valign="middle">
										<?php if($member->avatar) echo base_img($member->avatar);?>
									</td></tr></table>
						</div>
						<?php echo $formBase->upload_image('avatar',array('url'=>site_url("member/profile/avartaUpload"),'data'=>array('dir'=>MEMBER_AVATAR,'crop'=>1,'width'=>100, 'height'=>100,'pre_name'=>'avarta_'),'preview'=>'imagePreview','rules'=>"",'accept'=>"image/jpeg,image/gif,image/png",'class'=>'btn updateAvatarButton')); ?>
					</div>
					<div class="clear"></div>
					<?php echo $formBase->input('firstName',array('label'=>'LBL_FIRST_NAME','rules'=>'required|max_length[50]|isnull_or_white_space|alpha_space','class'=>'span3'));?>
					<div class="clear h10"></div>
					<?php echo $formBase->input('lastName',array('label'=>'LBL_LAST_NAME','rules'=>'required|max_length[50]|isnull_or_white_space|alpha_space','class'=>'span3'));?>
					<?php //echo $formBase->radio('sex',array('label'=>'Sex','class'=>'','checked'=>$member->sex,'options'=>array(1=>'Male',0=>'Female')))?>
					<?php //echo $formBase->input('phone',array('label'=>'Phone Number','rules'=>'','class'=>'span3'));?>
					<?php //echo $formBase->input('facebook',array('label'=>'Facebook','class'=>'span3'));?>


				</div>
				<div class="clear"></div>
				<div class="span8">


					<?php
					echo $formBase->divClear();?>
					<div class="form-actions">
						<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>__('LBL_UPDATE_PROFILE') ) ); ?>
					</div>
					<?php echo $formBase->end();?>

				</div>
			</div>

		</div>
		<div class="clear"></div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('input[type=file]').attr('accept','image/jpg,image/jpeg,image/gif,image/png');
	});
	function ajaxCallback(data){
		try{
			var data = $.parseJSON(data);
			Common.closeOverlay();
			if(data.ok){
				Common.load('<?php echo site_url('member/profile'); ?>')
			}
			//else
			//Common.alert(data.serror);
			//Common.load('<?php echo site_url('member/profile'); ?>')
			window.location.href = '<?php echo site_url('member/profile'); ?>';
		}catch(e){
			Common.jsonError(e);
		}
	}
</script>