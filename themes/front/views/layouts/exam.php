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

    <style type="text/css">
        #main-header{width: 100%; position: fixed; top:0px; left: 0px; z-index: 99;}

        .gotoTop2{background: #0154a0 none repeat scroll 0 0;
            border-radius: 30px;
            bottom: 5px;
            height: 30px;
            position: fixed;
            right: 5px;
            text-align: center;
            width: 30px;}
        .gotoTop2 a {width: 30px!important; height: 30px!important; border-radius: 30px; color: #fff; line-height: 2em}
    </style>
</head>

<body class="<?php echo 'M_'.$this->router->fetch_module().' C_'.$this->router->fetch_class().' '.$this->router->fetch_class().'_'.$this->router->fetch_method()?>">
<div class="clear" style="height: 110px;"></div>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-79495486-1', 'auto');
    ga('send', 'pageview');

</script>

<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function(){
        FB.init({
            appId: '460211880844481', status: true, cookie: true, xfbml: true });
    };
    (function(d, debug){var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
        if(d.getElementById(id)) {return;}
        js = d.createElement('script'); js.id = id;
        js.async = true;js.src = "//connect.facebook.net/en_US/all" + (debug ? "/debug" : "") + ".js";
        ref.parentNode.insertBefore(js, ref);}(document, /*debug*/ false));
    function postToFeed(title, desc, url, image){
        var obj = {method: 'feed',link: url, picture: 'http://www.url.com/images/'+image,name: title,description: desc};
        function callback(response){}
        FB.ui(obj, callback);
    }
</script>

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
                                <?php
                                /* $aryLang = $this->config->item('lang_avail');
                                 if(!empty($aryLang)){
                                     ?>
                                     <li  class="top-user-area-lang nav-drop">
                                         <a class="pointer"><?php echo '<div class="flag flag-'.$this->lang->lang().'"></div>'.__(ucwords($aryLang[$this->lang->lang()]));?><i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></a>
                                         <ul class="list nav-drop-menu">
                                             <?php
                                             foreach($aryLang as $key=>$val){
                                                 echo '<li>'.anchor($this->lang->switch_uri($key),'<div class="flag flag-'.$key.'"></div>'.__(ucwords($val))).'</li>';
                                             }?>
                                         </ul>
                                     </li>
                                 <?php }
                                */?>


                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
<div class="container">
    <div class="row">
        <a id="topAnchor2" name="topAnchor2"></a>
        <?php echo $template['body']; ?>
    </div>
</div>
<div class="gap"></div>
    <div id="main-footer">
        <div class="gotoTop2">
            <a title="Đầu trang"><i class="fa fa-arrow-up"></i></a>
        </div>
    </div>
    <?php echo shareThis();?>

    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/slimmenu.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/bootstrap-datepicker.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/bootstrap-timepicker.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/nicescroll.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/dropit.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/ionrangeslider.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/icheck.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/fotorama.js"></script>
    <!--        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>-->
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/typeahead.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/bootstrap-dialog.min.js"></script>

    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/magnific.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/owl-carousel.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/fitvids.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/tweet.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/countdown.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/gridrotator.js"></script>
    <script src="<?php  echo THEME_PATH.$userCurrentTheme; ?>js/custom.js"></script>

    <?php echo $template['footer_load'];?>
</div>

<div id="AppLoadding" class="non-printable">
    <div id="AppLoaddingContent">
        <img src="<?php  echo THEME_PATH.$userCurrentTheme; ?>images/loadding.gif" align="middle" style=" vertical-align:middle"  />
        {t}Loading...{/t}</div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        // grab the initial top offset of the navigation
        try{
            var stickyNavTop = $('.stickyNav').offset().top;
        }catch(e){

        }

        $('.gotoTop2').click(function(){
            $('html, body').animate({scrollTop: $('#topAnchor2').offset().top-30}, 500);
        })

        // our function that decides weather the navigation bar should have "fixed" css position or not.
        var stickyNav = function(){
            try{
                var scrollTop = $(window).scrollTop(); // our current vertical position from the top
                var type =  $('#searchType').val();
                // if we've scrolled more than the navigation, change its position to fixed to stick to top,
                // otherwise change it back to relative
                if (scrollTop > stickyNavTop) {
                    $('.stickyNav').addClass('sticky');
                    $('.stickyNav .tab-content').addClass('container');
                    $('.stickyNav .tabButton').addClass('container');

                    if(type == 'maps'){
                        $('.stickyNav .leftBox').removeClass('col-md-10').addClass('col-md-5');
                    }else{
                        $('.stickyNav .leftBox').removeClass('col-md-6').addClass('col-md-4');
                    }

                    $('.stickyNav .rightBox').removeClass('col-md-4').addClass('col-md-2');


                } else {
                    $('.stickyNav').removeClass('sticky');
                    $('.stickyNav .tab-content').removeClass('container');
                    $('.stickyNav .tabButton').removeClass('container');

                    if(type == 'maps'){
                        $('.stickyNav .leftBox').removeClass('col-md-5').addClass('col-md-10');
                    }else{
                        $('.stickyNav .leftBox').removeClass('col-md-4').addClass('col-md-6');
                    }
                    $('.stickyNav .rightBox').removeClass('col-md-2').addClass('col-md-4');
                }
            }catch(e){

            }

            $('.clearable').change();
        };

        stickyNav();
        // and run it again every time you scroll
        $(window).scroll(function() {
            stickyNav();
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#AppLoadding').ajaxStart(function () {
            $(this).show();
            $('#sys_message').fadeOut();
            $('#sys_error').fadeOut();
        });

        $('#AppLoadding').ajaxComplete(function (e, xhr, settings) {
            $('[rel=tooltip]').tooltip();
            $('.clearable').clearSearch({});
        });

        $('#AppLoadding').ajaxError(function(e, jqXHR, settings, exception){
            var msg = '';
            if (jqXHR.status === 0) {
                msg = '';//'Not connected. Please verify network is connected.'
            } else if (jqXHR.status == 404) {
                msg = 'Requested page not found.'
            } else if (jqXHR.status == 500) {
                msg = 'Internal Server Error.'
            } else if (exception === 'parsererror') {
                msg = 'Requested JSON parse failed.'
            } else if (exception === 'timeout') {
                msg = 'Time out error.'
            } else if (exception === 'abort') {
                msg = 'Ajax request aborted.'
            } else {
                msg = "Unknwon error";
            }

            if(msg){
                //open error => Close overlay.
                var closer = OverlayStack.pop();
                if(closer){
                    $closer = $('#'+closer);
                    $closer.find('.overlay').hide();
                    $closer.find('.modal').hide();
                }

                Common.error(msg)};

        });

        $('#AppLoadding').ajaxStop(function () {

            $('.Form').each(function(){
                FormValidate.bindEventRules($(this).attr("id"));
            });
            $(this).hide();
        });

        $('#AppLoadding').ajaxSuccess(function (e, xhr, settings) {
            try {
            } catch (e) { }
        });

        $('[rel=tooltip]').tooltip();

        $('.clearable').clearSearch({});

        //setup form validate
        FormValidate = new FormValidate();
        $('.Form').each(function(){
            FormValidate.bindEventRules($(this).attr("id"));
            $(this).submit(function(){
                return 	FormValidate.validator($(this).attr("id"));
            });
        });


    });
</script>
