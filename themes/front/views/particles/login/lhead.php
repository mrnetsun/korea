<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="HandheldFriendly" content="true">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	<title>HandyTrail.com | <?php echo ($template['title'])?$template['title']:__('Inspiring new way');?></title>
	<link rel="shortcut icon" type="image/x-icon" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/images/favicon.ico" />
	<link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/flexslider.css" type="text/css" media="all" />
	<link rel="stylesheet" HREF="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/ui.css" />
    <link rel="stylesheet" HREF="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/forms.css" />
    
    <link href="<?php  echo ROOT_URL; ?>styles/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
	<link href="<?php  echo ROOT_URL; ?>styles/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">

	<link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/common.css">
	<link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/overlay.css">
	<link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/flags.css">
	<link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/bootstrap.icons.css">

	<script src="<?php echo SCRIPTS_PATH?>jquery.min.js"></script>
<script src="<?php echo SCRIPTS_PATH?>jquery-ui.min.js"></script>
	<!--[if lt IE 9]>
		<script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/modernizr.custom.js"></script>
	<![endif]-->
	<script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/functions.js" type="text/javascript"></script>
    
    <script language="javascript">
        //JAVA SCRIPT
			 var ROOT_URL 			= '<?php echo ROOT_URL?>';
			 var BASE_URL 			= '<?php echo site_url().$this->lang->lang().'/'?>';
			 var THEME_PATH			= '<?php echo THEME_PATH.$userCurrentTheme;?>';
			 var SCRIPTS_PATH 		= '<?php echo SCRIPTS_PATH?>';
			 var STYLES_PATH 		= '<?php echo STYLES_PATH?>';
			 var DEFAULT_CONTROLLER = '<?php echo DEFAULT_CONTROLLER?>';

			//init for Common Callback function
			 var CommonCallBack = [];

			 //init for Form vaidate Callback function
			 var FormValidateCallBack = [];
		
        </script>
        
        <script defer src="<?php  echo ROOT_URL; ?>scripts/common/overlay.js"></script>
        <script defer src="<?php  echo ROOT_URL; ?>scripts/common/taskSchedule.js"></script>
        <script defer src="<?php  echo ROOT_URL; ?>scripts/common/jquery-ui-timepicker-addon.js"></script>
<?php echo $template['metadata']; ?>
</head>
<body>
	<!-- wrapper -->
	<div  id="wrapper">
		<!-- header -->
		<header>
			<div class="shell">
				<h1 id="logo"><a href="<?php echo ROOT_URL;?>"></a></h1>
                <?php if($LoginData):?>
                <div id="util-nav">
                    <ul>
                        <li>{t}Welcome{/t} <?php echo $LoginData->firstName?> <?php echo $LoginData->lastName?>:</li>
                        <li>
													<a href="<?php echo site_url('member/setting')?>"><?php echo __("Setting");?></a>
												</li>
												<li>
													<a href="<?php echo site_url('auth/logout')?>"><?php echo __("Logout");?></a>
												</li>
                    </ul>
                    
                </div>
                <?php endif;?>
				<div class="contact clear">               	
                
					<p class="ico phone-ico"><span></span>+132 456 789</p>
					<p class="ico mail-ico"><span></span><a href="#">contact@handytrail.com</a></p>
                   
				</div>
			</div>	
		</header>
