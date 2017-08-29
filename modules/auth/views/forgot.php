<?php echo pageHeader("LBL_TITLE_FORGOT_PASSWORD");?>
<div class="main">
    <div class="shell">
	<?php
		
    	$error = $this->session->flashdata('error');
	?>
		<div class="msg msg-ok" id="notice-ok" style="display:<?php echo ($error)?'':'none';?>;">
			<a href="#" onclick="Common.fadeOut('#notice')" class="close">close</a>
			<p class="warn"><?php echo $error;?></p>
		</div>
    <div class="msg msg-error" id="notice" style="display:<?php echo ($error)?'':'none';?>;">
		<a href="#" onclick="Common.fadeOut('#notice')" class="close">close</a>
		<p class="warn"><?php echo $error;?></p>
	</div>
	<div class="lostpassWrap">
	

	<!-- Primary Page Layout -->
	<?php $formBase = new FormBase();?>
	
	
		<?php echo $formBase->create('auth/initforgot',array('ajax'=>array('Callback'=>'callbackForgot')))?>			
				
				<div class="row row-wrap">
					<div class='col-md-12'>

					<div class="form-group">
					<h4><?php echo __("LBL_INPUT_YOUR_REGISTERED_EMAIL")?></h4>
					 </div>
					<div class="form-group col-md-4" style="padding-left: 0px;">
						<label><?php echo __("LBL_EMAIL")?></label>
						<?php echo $formBase->input('email',array('rules'=>'required|valid_email','class'=>'form-control','msg'=>' '));?>
					</div>
						<div class="gap"></div>
					<div class="form-group">
					<?php echo $formBase->submit('submit',array('class'=>"btn btn-primary",'label'=>'BTN_SEND_REQUEST'));?>
					</div>



						</div>
					</div>
				
		<?php echo $formBase->end();?>	
		
	</div>
	
		
    
 <script lang="javasript">
 	var callbackForgot = function (data){
		$('.msg').css({'display':'none'});
 		try{
			var data = $.parseJSON(data);
			
			if(data.ok){
				if(data.smessage){
					$('#notice-ok .warn').html(data.smessage);
					Common.fadeIn('#notice-ok');
					$('.email').val('');	
				}
			}else{
				if(data.serror){
					$('#notice .warn').html(data.serror);
					 Common.fadeIn('#notice');
				}
			}
 		}catch(e){
			Common.alert('<?php echo __('Systerm Error.');?>');
 	 	}
 	}
 </script>
 </div></div>