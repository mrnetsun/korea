<!DOCTYPE HTML>
<html>

<head>
    <title><?php echo getDBConfig('APP_NAME'); ?> | <?php echo ($template['title'])?__($template['title']):'';?></title>
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta name="keywords" content="<?php echo getDBConfig('META_KEYWORD')?>" />
    <meta name="description" content="<?php echo getDBConfig('META_DESCRIPTION')?>">
    <meta name="author" content="Tsoy">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>images/favourite.png" type="image/vnd.microsoft.icon"/>
    <!-- GOOGLE FONTS -->
<!--    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>-->
<!--    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css'>-->
    <!-- /GOOGLE FONTS -->
<!--    <link rel="stylesheet" href="--><?php // echo THEME_PATH.$userCurrentTheme; ?><!--fonts/roboto/roboto.css">-->
    <link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/bootstrap.css">
    <link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/font-awesome.css">
    <link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/icomoon.css">
    <link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/styles.css">
    <link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/bootstrap-dialog.min.css">
    <link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/mystyles.css">
    <link rel="stylesheet" href="<?php  echo THEME_PATH.$userCurrentTheme; ?>css/forms.css">
    <link rel="stylesheet" href="<?php  echo STYLES_PATH; ?>common.css">
    <link rel="stylesheet" href="<?php  echo STYLES_PATH; ?>flags.css">


    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/modernizr.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/jquery.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/bootstrap.js"></script>

    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/jquery-scrolltofixed-min.js"></script>

    <!-- JS file -->
    <script src="<?php  echo SCRIPTS_PATH; ?>/easy_autocomplete/jquery.easy-autocomplete.min.js"></script>
    <link rel="stylesheet" href="<?php  echo SCRIPTS_PATH; ?>/easy_autocomplete/easy-autocomplete.min.css">
    <link rel="stylesheet" href="<?php  echo SCRIPTS_PATH; ?>/easy_autocomplete/easy-autocomplete.themes.min.css">

    <script defer src="<?php  echo SCRIPTS_PATH; ?>bootstrap-tagsinput.min.js"></script>
    <script defer src="<?php  echo SCRIPTS_PATH; ?>bootstrap-multiselect.js"></script>
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

            //stack overlay
            var OverlayStack = [];


    </script>
	<?php echo $template['metadata']; ?>
</head>

<body class="<?php echo 'M_'.$this->router->fetch_module().' C_'.$this->router->fetch_class().' '.$this->router->fetch_class().'_'.$this->router->fetch_method()?>">
<!--<script>-->
<!--    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){-->
<!--            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),-->
<!--        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)-->
<!--    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');-->
<!---->
<!--    ga('create', 'UA-79495486-1', 'auto');-->
<!--    ga('send', 'pageview');-->
<!---->
<!--</script>-->
<a id="topAnchor" name="topAnchor"></a>
<div id="fb-root"></div>
<!--<script>-->
<!--    window.fbAsyncInit = function(){-->
<!--        FB.init({-->
<!--            appId: '460211880844481', status: true, cookie: true, xfbml: true });-->
<!--    };-->
<!--    (function(d, debug){var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];-->
<!--        if(d.getElementById(id)) {return;}-->
<!--        js = d.createElement('script'); js.id = id;-->
<!--        js.async = true;js.src = "//connect.facebook.net/en_US/all" + (debug ? "/debug" : "") + ".js";-->
<!--        ref.parentNode.insertBefore(js, ref);}(document, /*debug*/ false));-->
<!--    function postToFeed(title, desc, url, image){-->
<!--        var obj = {method: 'feed',link: url, picture: 'http://www.url.com/images/'+image,name: title,description: desc};-->
<!--        function callback(response){}-->
<!--        FB.ui(obj, callback);-->
<!--    }-->
<!--</script>-->

    <div class="global-wrap">
        <header id="main-header">
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <a class="logo" href="<?php echo site_url('home');?>">
                                <img src="<?php  echo THEME_PATH.$userCurrentTheme; ?>img/logo-invert.png" alt="Logo" title="Trang chủ" />
                            </a>
                        </div>
                        <div class="col-md-2">

                        </div>
                        <div class="col-md-7">
                            <div class="top-user-area clearfix no-print">
                                <ul class="top-user-area-list list list-horizontal list-border ">
								 <?php

                                 if($LoginData){
                                     $avatar = ($LoginData->avatar)?$LoginData->avatar:"asset/user_medium.png";
                                     ?>
                                    <li class="top-user-area-avatar">
                                        <a href="<?php echo site_url('account/profile')?>">
                                            <?php echo base_img($avatar,array('class'=>'origin round'))?>
                                            <?php echo $LoginData->firstName?> <?php echo $LoginData->lastName?></a>
                                     </li>
                                     <?php
//                                     debug($LoginData);
                                     if($LoginData->roleId == 1){?>
                                     <li>
                                         <?php echo anchor('home/admin',__('LBL_ADMINCP'));?>
                                     </li>
                                     <?php }?>
                                    <li>
                                        <?php echo anchor('auth/logout','<i class="fa fa-sign-out"></i> '.__("LBL_LOGOUT"),array('class'=>'btn btn-danger'));?></a>
                                    </li>
                                     <?php }else{?>
										<li><a class='non-printable btn btn-ghost btn-default btn-login' href="<?php echo site_url('auth')?>"><i class="fa fa-sign-in"></i> <?php echo __("LBL_LOGIN")?></a></li>
									<?php
									} ?>


                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>