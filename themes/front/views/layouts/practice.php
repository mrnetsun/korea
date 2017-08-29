<?php
echo $template['partials']['header'];
echo $template['partials']['navigation_path'];
?>
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
