$('ul.slimmenu').slimmenu({
    resizeWidth: '992',
    collapserTitle: 'Main Menu',
    animSpeed: 250,
    indentChildren: true,
    childrenIndenter: ''
});


$('.btnShare').click(function(){
    elem = $(this);
    postToFeed(elem.data('title'), elem.data('desc'), elem.prop('href'), elem.data('image'));

    return false;
});


$('.btn').button();

$("[rel='tooltip']").tooltip();

$('.form-group').each(function() {
    var self = $(this),
        input = self.find('input');

    input.focus(function() {
        self.addClass('form-group-focus');
    })

    input.blur(function() {
        if (input.val()) {
            self.addClass('form-group-filled');
        } else {
            self.removeClass('form-group-filled');
        }
        self.removeClass('form-group-focus');
    });
});



$('input.date-pick, .input-daterange, .date-pick-inline').datepicker({
    todayHighlight: true
});



$('input.date-pick, .input-daterange input[name="start"]').datepicker('setDate', 'today');
$('.input-daterange input[name="end"]').datepicker('setDate', '+7d');

$('input.time-pick').timepicker({
    minuteStep: 15,
    showInpunts: false
})

$('input.date-pick-years').datepicker({
    startView: 2
});

 

$('div.bg-parallax').each(function() {
    var $obj = $(this);
    if($(window).width() > 992 ){
        $(window).scroll(function() {
            var animSpeed;
            if ($obj.hasClass('bg-blur')) {
                animSpeed = 10;
            } else {
                animSpeed = 15;
            }
            var yPos = -($(window).scrollTop() / animSpeed);
            var bgpos = '50% ' + yPos + 'px';
            $obj.css('background-position', bgpos);

        });
    }
});



$(document).ready(
    function() {
    $('#searchBox li:active').trigger("click");



    $('html').niceScroll({
        cursorcolor: "#000",
        cursorborder: "0px solid #fff",
        railpadding: {
            top: 0,
            right: 0,
            left: 0,
            bottom: 0
        },
        cursorwidth: "10px",
        cursorborderradius: "0px",
        cursoropacitymin: 0.2,
        cursoropacitymax: 0.8,
        boxzoom: true,
        horizrailenabled: false,
        zindex: 9999
    });


        // Owl Carousel
        var owlCarousel = $('#owl-carousel'),
            owlItems = owlCarousel.attr('data-items'),
            owlCarouselSlider = $('#owl-carousel-slider'),
            owlNav = owlCarouselSlider.attr('data-nav');
        // owlSliderPagination = owlCarouselSlider.attr('data-pagination');

        owlCarousel.owlCarousel({
            items: owlItems,
            navigation: true,
            navigationText: ['', '']
        });

        owlCarouselSlider.owlCarousel({
            slideSpeed: 300,
            paginationSpeed: 400,
            // pagination: owlSliderPagination,
            singleItem: true,
            navigation: true,
            navigationText: ['', ''],
            transitionStyle: 'fade',
            autoPlay: 4500
        });


    // footer always on bottom
    var docHeight = $(window).height();
   var footerHeight = $('#main-footer').height();
   var footerTop = $('#main-footer').position().top + footerHeight;
   
   if (footerTop < docHeight) {
    $('#main-footer').css('margin-top', (docHeight - footerTop) + 'px');
   }





    }




);


$('.nav-drop').dropit();


// Lighbox gallery
$('.popup-gallery').each(function() {
    $(this).magnificPopup({
        delegate: 'a.popup-gallery-image',
        type: 'image',
        gallery: {
            enabled: true
        }
    });
});

// Lighbox image
$('.popup-image').magnificPopup({
    type: 'image'
});

// Lighbox text
$('.popup-text').magnificPopup({
    removalDelay: 500,
    closeBtnInside: true,
    callbacks: {
        beforeOpen: function() {
            this.st.mainClass = this.st.el.attr('data-effect');
        }
    },
    midClick: true
});





$(document).ready(function(){




    $('.gotoTop').click(function(){
        $('html, body').animate({scrollTop: $('#topAnchor').offset().top}, 500);
    })

    $('.contact-company li').click(function(){
        $(this).parent().find('.active').removeClass('active');
        $(this).addClass('active');
    });

    $('#subscriber_form').submit(function(){
        var w_url = $(this).attr('action');
        if(!$('#subscriber_email').val()) return false;
        $('#subscriber_form_img').show();

        $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            data:$('#subscriber_form').serialize(),
            success: function(data){

                $('#subscriber_form_img').hide();
                Common.clearForm($('#subscriber_form'));
                if(data.ok){
                    Common.dialogAlert(data.smessage);
                }else{
                    Common.dialogError(data.serror);
                }

            }
        });

        return false;
    });

});

/* ============================================================================
 * jquery.clearsearch.js v1.0.3
 * https://github.com/waslos/jquery-clearsearch
 * ============================================================================
  */
(function($) {
    $.fn.clearSearch = function(options) {
        var settings = $.extend({
            'clearClass' : 'clear_input',
            'focusAfterClear' : true,
            'linkText' : '&times;'
        }, options);
        return this.each(function() {
            var $this = $(this), btn,
                divClass = settings.clearClass + '_div';

            if (!$this.parent().hasClass(divClass)) {
                $this.wrap('<div style="position: relative;" class="'
                    + divClass + '">' + $this.html() + '</div>');
                $this.after('<a style="position: absolute; cursor: pointer;" class="'
                    + settings.clearClass + '">' + settings.linkText + '</a>');
            }
            btn = $this.next();

            function clearField() {
                $this.val('').change();
                triggerBtn();
                if (settings.focusAfterClear) {
                    $this.focus();
                }
                if (typeof (settings.callback) === "function") {
                    settings.callback();
                }
            }

            function triggerBtn() {
                if (hasText()) {
                    btn.show();
                } else {
                    btn.hide();
                }
                update();
            }

            function hasText() {
                return $this.val().replace(/^\s+|\s+$/g, '').length > 0;
            }

            function update() {
                var width = $this.outerWidth(), height = $this
                    .outerHeight();
                btn.css({
                    top : height / 2 - btn.height() / 2,
                    left : width - height / 2 - btn.height() / 2 +10
                });
            }

            btn.on('click', clearField);
            $this.on('keyup keydown change focus', triggerBtn);
            triggerBtn();
        });
    };
})(jQuery);

var goFinishUrl = false;
function showRemaining()
{
    var end = parseInt($('#endTesttime').val(),10);

    var _second = 1;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour *24


    var distance = end - _second;
    $('#endTesttime').val(distance);

    if (distance < 0 ) {

        $('#countdown').html('Hết giờ!');
       if(!goFinishUrl){
           goFinishUrl = true;
           var finishUrl = $('#btnFinish').data('url');
           //alert(finishUrl);
           document.location = finishUrl;
       }

    }
    var days = Math.floor(distance / _day);
    var hours = Math.floor( (distance % _day ) / _hour );
    var minutes = Math.floor( (distance % _hour) / _minute );
    var seconds = Math.floor( (distance % _minute) / _second );

    if(hours && hours<10) hours ='0'+hours;
    if(minutes<10) minutes ='0'+minutes;
    if(seconds<10) seconds ='0'+seconds;

    var countdown = document.getElementById('countdown');
    countdown.innerHTML = '';

    if(hours) countdown.innerHTML += '' + hours+ ':';
    countdown.innerHTML +=  minutes+ ':';
    countdown.innerHTML +=  seconds;
}

function resizeWindow(){
    var h = $(window).height();

    sh = (h-160);
    $('#answerSheet').height(sh);
    $('#answerSheet .answerSheetContent').height(sh-30);
    $('.answerSheetContent').slimScroll({
        height: (sh-60)+'px'
    });
}

