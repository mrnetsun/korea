<!DOCTYPE html>
<html lang="en">
<head>
	<meta content="utf-8" http-equiv="encoding">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="HandheldFriendly" content="true">
	<link rel="shortcut icon" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>/favourite.png" type="image/vnd.microsoft.icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	<title><?php echo getDBConfig('APP_NAME'); ?> | <?php echo ($template['title'])?__($template['title']):'';?></title>
	<!--link rel="shortcut icon" type="image/x-icon" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/images/favicon.ico" /-->
	<link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/tables.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/messages.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/flexslider.css" type="text/css" media="all" />
	<link rel="stylesheet" HREF="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/ui.css" />
    <link rel="stylesheet" HREF="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/forms.css" />

    <link href="<?php  echo ROOT_URL; ?>styles/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
	<link href="<?php  echo ROOT_URL; ?>styles/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">


	<link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/bootstrap.icons.css">

    <link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/style.css">
    <link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/common.css">
	<link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/overlay.css">
	<link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/flags.css">
    <link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/simplegrid.css">
	<link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/ui.daterangepicker.css">
    <link rel="stylesheet" href="<?php  echo ROOT_URL; ?>styles/colorbox.css">
	<link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/font-awesome.css">

	<script src="<?php echo SCRIPTS_PATH?>jquery.min.js"></script>
	<script src="<?php echo SCRIPTS_PATH?>jquery-ui.min.js"></script>
	<script src="<?php echo SCRIPTS_PATH?>jquery.layout.min.js"></script>
	<script src="<?php echo SCRIPTS_PATH?>json2.min.js"></script>

    <script  src="<?php echo SCRIPTS_PATH?>jwysiwyg/jquery.wysiwyg.js"></script>
    <link rel="stylesheet" href="<?php  echo SCRIPTS_PATH; ?>jwysiwyg/jquery.wysiwyg.css">
	<!--[if lt IE 9]>
		<script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/modernizr.custom.js"></script>
	<![endif]-->

	<!--[if lt IE 10]>
	<script  src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/jquery.placeholder.js"></script>
	<script>
		$(function(){
			$('input[type=text]').placeholder({customClass: 'my-placeholder'});
		})

	</script>
	<![endif]-->

    <!--[if lt IE 9]>
    <script  type="text/javascript" src="<?php  echo ROOT_URL; ?>/scripts/ie_fixed.js"></script>
    <![endif]-->

	<script  src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script  src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/functions.js" type="text/javascript"></script>

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

        <script  src="<?php  echo ROOT_URL; ?>scripts/common/overlay.js"></script>
        <script  src="<?php  echo ROOT_URL; ?>scripts/common/taskSchedule.js"></script>
        <script  src="<?php  echo ROOT_URL; ?>scripts/common/jquery-ui-timepicker-addon.js"></script>
        <script  src="<?php  echo ROOT_URL; ?>scripts/jquery.colorbox-min.js"></script>
		<script  src="<?php  echo ROOT_URL; ?>scripts/bootstrap-tagsinput.min.js"></script>
		<script  src="<?php  echo ROOT_URL; ?>scripts/bootstrap-multiselect.js"></script>
        <script src="<?php  echo ROOT_URL; ?>scripts/ckeditor/ckeditor.js"></script>

		  <?php echo $template['metadata']; ?>

</head>
<?php //debug($this,false);?>
<body class="<?php echo 'M_'.$this->router->fetch_module().' C_'.$this->router->fetch_class().' '.$this->router->fetch_class().'_'.$this->router->fetch_method()?>">

	<!-- wrapper -->
	<div  id="wrapper">
		<!-- header -->
		<header>
			<div class="shell">
				<h1  id="logo">
                    <a href="<?php echo site_url('home/admin');?>">
                        <?php echo json_img(getDBConfig('LOGO'),array('height'=>50));?>
				</a></h1>

                <div id="util-nav"  style="z-index:50" class="non-printable">
                    <ul>
                    	 <?php

						 if($LoginData){?>
                        <li><span class="welcome"><?php echo __("LBL_HELLO")?></span> <span class="bold show_fullname"><?php echo $LoginData->firstName?> <?php echo $LoginData->lastName?></span></li>
                        <li>
													<a href="<?php echo site_url('member/profile')?>"><?php echo __("LBL_PROFILE");?></a>
												</li>
							 <li>
								 <a href="<?php echo site_url('home')?>"><?php echo __("LBL_FONT_END");?></a>
							 </li>
												<li>
													<a href="<?php echo site_url('auth/logout')?>"><?php echo __("LBL_LOGOUT");?></a>
												</li>
						<?php }else{?>
                    		<li><a class='non-printable' href="<?php echo site_url('auth')?>"><i class="icon-user"></i><?php echo __("LBL_LOGIN")?></a></li>
                    	<?php
						}
                    	$aryLang = $this->config->item('lang_avail');
                    	if(!empty($aryLang)){
                    	?>
                        <li id="langPicker" class="dropdown dropdownRight non-printable">
                            <a  data-toggle="dropdown" class="dropdown-toggle"><?php echo '<div class="flag flag-'.$this->lang->lang().'"></div>'.__(ucwords($aryLang[$this->lang->lang()]));?><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <?php

                                foreach($aryLang as $key=>$val){
                                	echo '<li>'.anchor($this->lang->switch_uri($key),'<div class="flag flag-'.$key.'"></div>'.__(ucwords($val))).'</li>';
                                }?>
                            </ul>
                        </li>
                        <?php }?>

                    </ul>

                </div>
			</div>
		</header>

