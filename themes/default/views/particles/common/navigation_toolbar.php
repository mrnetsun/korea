<?php

	$viewdefs = $this->config->item(strtolower($currentController).'_viewdefs');


	$currentAction = $this->router->method;
	$curentToolbar = $viewdefs[$currentAction];

	$formId = ($curentToolbar['form'])?$curentToolbar['form']:_getBaseName('SaveAll_Form');

	if($curentToolbar):
?>
<div class="clr"></div>
<?php if(!$curentToolbar['noToolbar']){?>
<div class="webtoolbar services">
			<div class="shell">
<div id='nav-toolbar'>
<div class='toolbar_header'><h3>

	<?php
		if(!$curentToolbar['noModuleTitle']){
			//echo __($aryCurrentModule->moduleName);
		}
		?>

	<?php if($curentToolbar['title']):?>
		<?php
		if(!$curentToolbar['noModuleTitle']){
			//echo ':';
		}
		?>
		<span class="sub"><?php echo __($curentToolbar['title']);?></span>
	<?php endif;?>
	</h3></div>
<div class='toolbar-list'>
	<ul>
	<?php
//	debug($curentToolbar['items'],false);
		if(is_array($curentToolbar['items'] ))
		foreach($curentToolbar['items'] as $item){

			$button = '<li id="toolbar-new">
			<a class="toolbar" ';
			if($item['link']){
				$link = (strpos($item['link'],'http://')!== false)?$item['link']:site_url($item['link']);
				$button.=' href="'.$link.'"';
			}else{
				if($item['task']){

						$button .= 'onclick="return Common.formSubmit(this,\'' . $formId . '\',\'' . strtolower($item['task']) . '\',\'' . ' ' . '\',\'' . __('LBL_CONFIRM_MUL_DELETE') . '\');"';

				}else{
					if($item['onclick']) $button.= 'onclick="return '.$item['onclick'].';"';
				}

				if($item['ajax']){
					$button.=' data-url="'.$item['action'].'"';
				}else{
					$button.=' href="'.$item['action'].'"';
				}
			}

			$button.='>
			<span class="toolbar_icon toolbar_icon-32-'.$item['task'].' '.$item['class'].'">
			</span>
			'.__($item['label']).'
			</a>
			</li>';
			//Toolbar
			if(strpos($item['link'],'cronjob') !== false || checkPermissionUser($item,$LoginData->permission)) {
				echo $button;
			}
		}
	?>
	</ul>
</div>
<div class="clr"></div>
</div>
<div class="clr"></div>

</div>
</div>
<?php }?>
<?php
	$error = $this->session->flashdata('error');

		if(is_array($error)) $error = implode("\r\n",$error);
	$message = $this->session->flashdata('message');
		if(is_array($message)) $error = implode("\r\n",$message);

		$notice = $this->session->flashdata('notice');

		if(is_array($notice)) $notice = implode("\r\n",$notice);

?>
<div class="main system_alert" id='alertwrap' style="display:<?php echo ($error || $message ||$notice)?'':'none'?>;">
<div  class="shell">

                <!-- Main Section -->
				<!-- Message -->
				<div id="sys_message" class="msg msg-ok" style="display:<?php echo ($message)?'':'none'?>;"><p><strong>{t}success{/t}</strong>: <span class="message_content">
						<?php echo $message;?>
						</span></p>
				<a class="close" onclick="$('#sys_message').slideToggle('fast').hide()" href="#">{t}close{/t}</a></div>

				<!-- Notice -->
				<div id="sys_warn" class="msg msg-warn" style="display:<?php echo ($notice)?'':'none'?>;"><p><strong>{t}notice{/t}</strong>: <span class="message_content">
							<?php echo $notice;?>
							</span></p>
							<a class="close" onclick="$('#sys_warn').slideToggle('fast').hide()" href="#">{t}close{/t}</a>
				</div>

                <!-- Error -->
                <div id="sys_error" class="msg msg-error" style="display:<?php echo ($error)?'':'none'?>;"><p><strong>{t}error{/t}</strong>: <span class="error_content">
						<?php echo $error;?>
						</span></p>
                <a class="close" onclick="$('#sys_error').slideToggle('fast').parent().parent().hide()" href="#">{t}close{/t}</a></div>

</div>
</div>
<?php endif;?>
