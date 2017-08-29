// JavaScript Document
//LBL_DISPLAY_TO('<?php echo __("Text for translation");?>');
bannerController = {
	changePosition:function(obj){

        var selected = $(obj).val();
        $('#articleWrap').hide();
        $('#companyWrap').hide();
        $('#searchKeyword').hide();

        if(selected){
            selected = selected.toString();
            var p = selected.indexOf('NEWS');

            if(p!= -1){
                $('#articleWrap').show();
            }

            var p = selected.indexOf('COM');
            if(p!= -1){
                $('#companyWrap').show();
            }

            var p = selected.indexOf('SEARCH');
            if(p!= -1){
                $('#searchKeyword').show();
            }
        }

    },
    changeBannerType: function(obj){
        var val = $(obj).val();
        $('#typeImage').hide();
        $('#typeText').hide();
        $('#typeGoogleAds').hide();

        if(val){
            val = parseInt(val,10);
            if(val == 1){
                $('#typeImage').show();
                $('#typeText').show();
            }

            if(val == 2){
                $('#typeText').show();
            }

            if(val ==3){

                $('#typeGoogleAds').show();
            }

            if(val == 4){
                $('#typeImage').show();
                $('#typeGoogleAds').show();
            }
        }
    },

    checkSpecial:function(obj){
        var val = $(obj).val();
        $('#typeSpecial').hide();
        if(val == 7){
            $('#typeSpecial').show();
        }
    }
}
