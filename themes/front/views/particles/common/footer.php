<?php //echo shareThis();?>
<footer id="main-footer" class="no-print">
            <div class="container">
                <div class="row row-wrap">
                    <div class="col-md-3">
                        <a class="logo" href="<?php echo ROOT_URL?>">
                            <img src="<?php  echo THEME_PATH.$userCurrentTheme; ?>img/logo-invert.png" alt="Image Alternative text" title="Image Title" />
                        </a>
                        <p class="mb20">Hệ thống Luyện thi tiếng Hàn Quốc theo chuẩn TOPIK cho người đi lao động xuất khẩu.</p>
                        <?php
                        $social = getDBConfig('SOCIAL_NETWORK','json');
                        $facebook = $social[0][0];
                        $twitter = $social[0][1];
                        $google = $social[0][2];
                        $linkedin = $social[0][3];
                        $youtube = $social[0][4];

                        ?>
                        <ul class="list list-horizontal list-space">
                            <?php if($facebook && $facebook!='#') { ?>
                                <li>
                                    <a class="fa fa-facebook bt-facebook box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $facebook?>"></a>
                                </li>
                            <?php
                            }
                            if($twitter && $twitter!='#'){?>
                            <li>
                                <a class="fa fa-twitter bt-twitter box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $twitter?>"></a>
                            </li>
                            <?php
                            }
                            if($google && $google!='#'){?>
                            <li>
                                <a class="fa fa-google-plus bt-google-plus box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $google?>"></a>
                            </li>
                            <?php
                            }
                            if($linkedin && $linkedin!='#'){?>
                            <li>
                                <a class="fa fa-linkedin bt-linkedin box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $linkedin?>"></a>
                            </li>
                            <?php
                            }
                            if($youtube && $youtube!='#'){?>
                            <li>
                                <a class="fa fa-youtube-play bt-youtube-play box-icon-normal round animate-icon-bottom-to-top" href="<?php echo $youtube?>"></a>
                            </li>
                            <?php
                            }
                             ?>
                        </ul>
                    </div>

                    <div class="col-md-3">
                        <h4><?php echo __("LBL_NEWSLETTER")?></h4>

                        <form class="form-horizontal Form" id="subscriber_form"
                              accept-charset="utf-8" method="post"
                              action="<?php echo site_url('home/home/subscriber')?>">

                            <label><?php echo __("LBL_INPUT_EMAIL")?><span class="required">*</span></label>
                            <div style="position: relative" class="newsletter_item">
                                <input type="text" placeholder="" class="form-control" rules="required|valid_email" id="subscriber_email" value="" name="data[home][email]">
                            </div>
                            <p class="mt5"><small><?php echo __("LBL_NEWSLETTER_NOTE")?></small>
                            </p>

                            <input type="submit" id="subscriber_form_1" placeholder="" class="btn btn-primary" value="Đăng ký" name="cmdNewsletter"><?php  echo img_ajax('subscriber_form_img','loadinfo2.gif');?>
                        </form>

                    </div>
                    <div class="col-md-2">
                        <?php
                        $aryMenu = getModuleMenu('', 0, array('menuType' => 'footer'));
                        ?>
                        <ul class="list list-footer">
                            <?php foreach($aryMenu as $m){?>
                            <li><?php echo anchor($m->menuLink,__($m->menuName));?></li>
                            <?php }?>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <div class="gotoTop">
                            <a title="<?php echo __("LBL_GOTTOP")?>"><i class="fa fa-arrow-up"></i></a>
                        </div>
                        <?php
                        $touch = getDBConfig('KEEP_IN_TOUCH','json');
                        $support_email = $touch[0][0];
                        $skype = $touch[0][2];
                        ?>
                        <h4><?php echo __("LBL_SUPPORT")?></h4>
                        <h4 class="text-color" style="color: #00AFFD!important;"><?php echo $touch[0][1]?></h4>
                        <h4><a href="mailto:<?php echo $support_email;?>" class="text-color"><?php echo $support_email;?></a></h4>
                        <p><?php echo __("LBL_SUPPORT_247");?><a href="skype:<?php echo $skype;?>?chat"><?php echo $skype;?></a></p>
                    </div>

                </div>
            </div>
        </footer>


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
