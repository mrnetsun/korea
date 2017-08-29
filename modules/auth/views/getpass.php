	<div class="services blueDiv">
	<div class="shell">
	<h2>{t}Get pasword{/t}</h2>
        <div class="clear"></div>
    </div>
</div>
<div class="main">
    <div class="shell">
	<?php
    	$error = $this->session->flashdata('error');
	?>
    <div class="notice" id="notice" style="display:<?php echo ($error)?'':'none';?>;">
		<a href="#" onclick="Common.fadeOut('#notice')" class="close">close</a>
		<p class="warn"><?php echo $error;?></p>
	</div>
	<div class="lostpassWrap">
	<h2><?php 
		if($aryData['ok']){
			echo $aryData['smessage'];
		}else{
			echo $aryData['serror'];
						
		}
	?></h2>
	
	

	<?php 
	if($aryData['ok']){
		?>
		<div style="margin-left: 90px;">{t}Back to login {/t}<?php echo anchor(site_url('auth'),__('Here'))?></div>
		<?php		
	}else{
		?>
		{t}Back to resend a active key from {/t}<?php echo anchor(site_url('auth/forgot'),__('Here'))?>
		<?php
	}
	?>
	</div>
    </div>