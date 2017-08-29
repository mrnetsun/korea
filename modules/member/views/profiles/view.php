<div class="main">
    <div class="shell shellWrap">
    
    <div class="signupWrap form-horizontal">
    <?php $formBase = new FormBase();
    
	?>
	
<div class="screenView formView">
	<div class="span8">
	<?php echo $formBase->fieldset('Account');?>
	<?php echo $formBase->view('Email',$member->email);?>
	<?php echo $formBase->view('Password: ******',ajax_link('member/profile/changepass','Change Password',array('overlay'=>__("Change password"))));?>
	
	<div class="clear h30"></div>
	<?php 
		$options = getDBDropdown(array('table'=>'sys_role',
							'key'=>'roleId','val'=>'roleName',
							'where'=>'roleId in ('.ROLE_MERCHANT.','.ROLE_TD.','.ROLE_VOLUN.')'));
		//$roleId = json_decode($member->roleId);
		
		echo $formBase->view('Member Type',$options[$member->roleId]);
		
	?>
	<div class="clear h10"></div>
	<?php echo $formBase->fieldset_end();?>
	<?php echo $formBase->fieldset('Payment Settings');?>
	<?php echo $formBase->view('Paypal account',$member->paypal)?>
	<?php echo $formBase->fieldset_end();?>
	
	
     	
	<?php echo $formBase->fieldset('Personal Information');?>
	<div class="imageUploadWrap span6">
	<div class="w100 h100 imagePreview" id="imagePreview">
		<?php if($member->avatar) echo base_img($member->avatar);?>
		
	</div>
	<?php echo $formBase->upload_image('avatar',array('url'=>site_url("member/profile/avartaUpload"),'data'=>array('dir'=>MEMBER_AVATAR,'crop'=>1,'width'=>100, 'height'=>100,'pre_name'=>'avarta_'),'preview'=>'imagePreview','rules'=>"",'class'=>'btn updateAvatarButton'))?>
	</div>
	<div class="clear h10"></div>
	<?php echo $formBase->view('First Name',$member->firstName);?>
    <?php echo $formBase->view('Last Name',$member->lastName);?>
    <?php echo $formBase->view('Phone Number',$member->phone);?>
    
    <?php 
    $options = array(1=>'Male',0=>'Female');
    echo $formBase->view('Sex',$options[$member->sex])?>
    
    <?php 
    $options = getDBDropdown(array('table'=>'country','status'=>true,'key'=>'iso','val'=>'nicename'));
    echo $formBase->view("Contry",$options[$member->country])?>
    
    <?php 
    $options = getDBDropdown(array('table'=>'country_region','key'=>'city_id','val'=>'city_name','where'=>array('country_code'=>$member->country)));
    echo $formBase->view("States/Region",$options[$member->regionId])?>    
    
    <?php 
    $options = getDBDropdown(array('table'=>'city','key'=>'region_id','val'=>'region_name','where'=>array('country_code'=>$member->country)));
    echo $formBase->view("City",$options[$member->cityId])?>    
    
    <?php echo $formBase->fieldset_end();?>
	</div>
	<div class="clear"></div>
	<div class="span8">
	<?php echo $formBase->fieldset('Others Information');?>
	<?php echo $formBase->view('Address',$member->address);?>
	<?php echo $formBase->view('Website URL',$member->website);?>
	
	<?php echo $formBase->view('Facebook URL',$member->facebook);?>
	
	<?php echo $formBase->view('Your story',$member->profile);?>
     <?php echo $formBase->fieldset_end();?>
     </div>
    </div>
    
    </div>
    <div class="clear"></div>
</div>
</div>