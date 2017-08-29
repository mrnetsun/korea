<!DOCTYPE HTML>
<html class="full">

<head>
    <title>TimDoanhNghiep.VN - Maintenance</title>


    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta name="keywords" content="<?php echo getDBConfig('META_KEYWORD')?>" />
    <meta name="description" content="<?php echo getDBConfig('META_DESCRIPTION')?>">
    <meta name="author" content="TimDoanhNghiep">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css'>
    <!-- /GOOGLE FONTS -->
    <link rel="stylesheet" href="<?php echo ROOT_URL?>themes/front/css/bootstrap.css">
    <link rel="stylesheet" href="<?php echo ROOT_URL?>themes/front/css/font-awesome.css">
    <link rel="stylesheet" href="<?php echo ROOT_URL?>themes/front/css/icomoon.css">
    <link rel="stylesheet" href="<?php echo ROOT_URL?>themes/front/css/styles.css">
    <link rel="stylesheet" href="<?php echo ROOT_URL?>themes/front/css/mystyles.css">
    <script src="<?php echo ROOT_URL?>themes/front/js/modernizr.js"></script>

    <style>

        .footer-social {
            bottom: 150px;
            position: absolute;
            text-align: center;
            width: 100%;
        }

    </style>

</head>

<body class="full">

<!-- FACEBOOK WIDGET -->
<div id="fb-root"></div>
<script>
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<!-- /FACEBOOK WIDGET -->
<div class="global-wrap">

    <div class="full-page text-center">
        <div class="bg-holder full">
            <div class="bg-mask-darken"></div>
            <div class="bg-img" style="background-image:url(<?php echo ROOT_URL?>themes/front/images/maintenance.jpg);"></div>
            <div class="bg-holder-content full text-white">
                <div class="gap-big"></div>
                <div>
                    <div class="container">

                        <p style="text-align: center">
                            <a  style="z-index: 999" href="<?php echo ROOT_URL?>">
                                <img src="<?php echo ROOT_URL?>themes/front/img/logo-invert.png" alt="TimDoanhNghiep_Logo" style="width: 250px;" title="Image Title" />
                            </a>
                        </p>
                        <div class="gap"></div>
                        <h2>Xin lỗi Website đang bảo trì</h2>
                        <div class="countdown countdown-lg" inline_comment="countdown" data-countdown="<?php echo getDBConfig('MAINTENANCE_TIME')?>" id="countdown"></div>
                        <div class="gap"></div>
                        <p><?php echo $message; ?></p>
                        <div><?php echo anchor('auth','Đăng nhập',array('class'=>'btn btn-danger'))?></div>

                    </div>
                </div>

                <?php
                $social = getDBConfig('SOCIAL_NETWORK','json');
                $facebook = $social[0][0];
                $twitter = $social[0][1];
                $google = $social[0][2];
                $linkedin = $social[0][3];
                $youtube = $social[0][4];

                ?>
                <ul class="list footer-social">
                    <?php if($facebook && $facebook!='#') { ?>
                        <li>
                            <a class="fa fa-facebook box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $facebook?>"></a>
                        </li>
                        <?php
                    }
                    if($twitter && $twitter!='#'){?>
                        <li>
                            <a class="fa fa-twitter box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $twitter?>"></a>
                        </li>
                        <?php
                    }
                    if($google && $google!='#'){?>
                        <li>
                            <a class="fa fa-google-plus box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $google?>"></a>
                        </li>
                        <?php
                    }
                    if($linkedin && $linkedin!='#'){?>
                        <li>
                            <a class="fa fa-linkedin box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $linkedin?>"></a>
                        </li>
                        <?php
                    }
                    if($youtube && $youtube!='#'){?>
                        <li>
                            <a class="fa fa-youtube-play box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $youtube?>"></a>
                        </li>
                        <?php
                    }
                    ?>
                </ul>

            </div>
        </div>
    </div>



    <script src="<?php echo ROOT_URL?>themes/front/js/jquery.js"></script>
    <script src="<?php echo ROOT_URL?>themes/front/js/bootstrap.js"></script>
    <script src="<?php echo ROOT_URL?>themes/front/js/slimmenu.js"></script>

    <script src="<?php echo ROOT_URL?>themes/front/js/nicescroll.js"></script>

    <script src="<?php echo ROOT_URL?>themes/front/js/countdown.js"></script>

    <script>
        $(document).ready(function(){
            // Countdown
            $('.countdown').each(function() {
                var count = $(this);
                $(this).countdown({
                    zeroCallback: function(options) {
                        var newDate = new Date(),
                            newDate = newDate.setHours(newDate.getHours() + 130);

                        $(count).attr("data-countdown", newDate);
                        $(count).countdown({
                            unixFormat: true
                        });
                    }
                });
            });
        });
    </script>
</div>

</body>

</html>


