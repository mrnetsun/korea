// JavaScript Document
//LBL_DISPLAY_TO('Text for translation');
var ajaxAbort = null;

homeController = {

    playCardSound: function(divObject,flag){

        var audio = parseInt($('.audioSetting :checked').val(),10);

        if(audio == 0) return;

        var obj = $(divObject).find('.sound a');
        if(!flag){
            if(audio == 1){
                var url_audio = obj.data('audio');
            }else{
                var url_audio = obj.data('slow');
            }

        }else{
            var url_audio = obj.data('slow');
        }

        if(url_audio){
            var mySound = soundManager.createSound({
                url: ROOT_URL + url_audio
            });
            mySound.play();
        }

    },

    playObjectSound:function(obj,flag){

        var audio = parseInt($('.audioSetting :checked').val(),10);

        if(audio == 0) return;

        var parent = $(obj).closest('.card');
        parent.find('.soundEffect').addClass('soundOn');
        if(!flag){
            if(audio == 1){
                var url_audio =  $(obj).data('audio');
            }else{
                var url_audio =  $(obj).data('slow');
            }
        }else{
            var url_audio = $(obj).data('slow');
        }


        if(url_audio){
            var mySound = soundManager.createSound({
                url: ROOT_URL + url_audio,
                onfinish: function() {
                    parent.find('.soundEffect').removeClass('soundOn');
                }
            });
            mySound.play();
        }
    },


    playSound:function(obj,flag){

        $(obj).addClass('soundOn');
        if(!flag){
            var url_audio =  $(obj).data('audio');
        }else{
            var url_audio = $(obj).data('slow');
        }

        $('.pronounce span').show();

        if(url_audio){
            try{

                var mySound = soundManager.createSound({
                    url: ROOT_URL + url_audio,
                    onfinish: function() {
                        $('.soundEffect').removeClass('soundOn');
                        $('.pronounce span').hide();
                    }
                });
                if(mySound) mySound.play();
            }catch(e){

            }
        }
    },

    playSoundQ:function(obj){

        $('.soundOn').removeClass('soundOn');
        $(obj).addClass('soundOn');

        var url_audio =  $(obj).data('audio');

        if(url_audio){
            try{

                var mySound = soundManager.createSound({
                    url: ROOT_URL + url_audio,
                    onfinish: function() {

                    }
                });
                if(mySound) mySound.play();
            }catch(e){

            }
        }
    },

    changeCardDisplaySetting:function(){
        var type = parseInt($('.displaySetting :checked').val(),10);
        switch (type){
            case 2:
                $('.card').removeClass('cardBoth');
                $('.card').removeClass('cardKr');
                $('.card').addClass('cardVi');
                break;
            case 3:
                $('.card').removeClass('cardKr');
                $('.card').removeClass('cardVi');
                $('.card').addClass('cardBoth');
                break;
            default:
                $('.card').removeClass('cardBoth');
                $('.card').removeClass('cardVi');
                $('.card').addClass('cardKr');
        }

    }


}
