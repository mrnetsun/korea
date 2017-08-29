<?php echo pageHeader("LBL_LOGIN");?>
<div class="main">
    <div class="shell">
	<?php
    	$error = $this->session->flashdata('error');
    	$message = $this->session->flashdata('message');
	?>
	<div id="notice" class="msg warn msg-error"  style="display:<?php echo ($error)?'':'none';?>;">	
		<a href="#" onclick="Common.fadeOut('#notice')" class="close">close</a>
		<p class="warn"><?php echo $error;?></p>
	</div>
	<!-- Message -->
                <div id="sys_message" class="msg msg-ok" style="display:<?php echo ($message)?'':'none'?>;"><p><strong>{t}success{/t}</strong>: <span class="message_content">
                <?php echo $message;?>
                </span></p>
                <a class="close" onclick="$('#sys_message').slideToggle('fast').parent().parent().hide()" href="#">{t}close{/t}</a></div>
	
	
<div class="span4">
	<!-- Primary Page Layout -->
	<?php 
		$formBase = new FormBase();
	?>
	<div class="row">
		
		<div class="col-md-4">
			<?php echo $formBase->create('auth/check')?>

			<div class="form-group">
				<label><?php echo __("LBL_EMAIL")?></label>
				<?php echo $formBase->input('username',array('id'=>'username',
															'class'=>'form-control',
															'placeholder'=>'LBL_EMAIL',
															'value'=>$saveLogin->username,
															'rules'=>'required',
															'msg'=>''))?>
				</div>
			<div class="form-group">
				<label><?php echo __("LBL_PASSWORD")?></label>
				<?php echo $formBase->password('password',array('id'=>'password',
															'class'=>'form-control',
															'placeholder'=>'LBL_PASSWORD',
															'value'=>'',
															'rules'=>'required',
															'msg'=>''))?>
				
				</div>

			<label>
				<input name="autologin" style="margin: -2px 0px 0 0;" type="checkbox" <?php if(!empty($saveLogin)){ echo 'checked="checked"';} ?>/>
				<span  class="pointer" style="display: inline-block;margin: 0 0 5px 0;line-height: 25px;"><?php echo __("LBL_REMEMBER_ME")?></span>
			</label>
				<!-- <button type="submit"></button> -->
			<?php echo $formBase->submit('Login',array('class'=>"btn btn-primary btn-large",'label'=>'LBL_LOGIN'))?>
			<?php echo $formBase->end();?>
			<div class="gap"></div>
			<div><p class="forgot"><a href="<?php echo site_url('auth/forgot')?>"><i class="fa fa-question-circle"></i> <?php echo __("LBL_FORGOT_PASSWORD")?></a></p></div>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-3">

			<h4><?php echo __("LBL_QUICK_LOGIN")?></h4>
			<a class="btn btn-social btn-facebook btn-block" href="<?php echo site_url('auth/session/facebook')?>"><i class="fa fa-facebook"></i> <?php echo __("LBL_FACEBOOK_LOGIN")?></a>
			<a class="btn btn-social btn-google-plus btn-block" href="<?php echo site_url('auth/session/google')?>"><i class="fa fa-google-plus"></i> <?php echo __("LBL_GOOGLE_LOGIN")?></a>
			<div class="gap"></div>
			<div class=""><?php echo __("LBL_NOT_ACCOUNT")?></div>
			<a title="" class="btn btn-default btn-block" href="<?php echo site_url('auth/signup')?>"><?php echo __("LBL_REGISTER_NOW")?></a>

		</div>
		<div class="clearfix"></div>



		
	</div><!-- container -->
	</div>
  </div>
 </div>   
 <script lang="javasript">

 var loginCallback = function(data){
	 var getData=$.parseJSON(data);
     //LBL_DISPLAY_TO(getData.message);
		if(getData.check == 1)
     	{
			document.location = getData.callback_url;
			//success
         //document.location = '<?php echo site_url(DEFAULT_CONTROLLER);?>';
     	}
		else
		{
			  
			$('#notice .warn').html(getData.message);
			Common.fadeIn('#notice');
		}
	}
 
 </script>
