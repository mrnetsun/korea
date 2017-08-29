// JavaScript Document
//LBL_DISPLAY_TO('<?php echo __("Text for translation");?>');
examController = {
    cbFilterTestList: function(data){

        var jData = $.parseJSON(data);
        if(jData.ok){
            $('#addTestList').html(jData.html);
        }

    },

    cbInsertTest:function(data){
        var jData = $.parseJSON(data);
        if(jData.ok){
            examController.loadTest(data);
        }

        var count = $("#examTest .testItem").length;
        $('#totalCountTest').text(parseInt(count,10));
    },

    removeTest:function(obj){
        $(obj).closest('.testItem').remove();
        var count = $("#examTest .testItem").length;
        $('#totalCountTest').text(parseInt(count,10));
    },

    loadTest:function(data){
        var jData = $.parseJSON(data);
        $.ajax({
            url: '<?php echo site_url("exam/exam/loadTest")?>',
            type: "POST",
            data:'exam_id='+jData.exam_id,
            dataType:"json",
            success:function(oData){
                if(!data.closeOverlay){
                    Common.closeAllOverlay();
                }
                $('#examTest').html(oData.html);
            }
        });
    },

    showExamTime:function(obj){
        var val = $(obj).val();
        if(val==1){
            $('#timeExam').show();
        }else{
            $('#timeExam').hide();
        }
    }
}

questionController = {
    updateQuestionSub:function(data){
        var data = $.parseJSON(data);
        if(data.ok){
            $('#questionType11').load(data.url_reload);
        }
    }


}

testController = {
    reloadComponent: function(data){
        var data = $.parseJSON(data);

        $.ajax({
            url: '<?php echo site_url("exam/test/loadComponent")?>',
            type: "POST",
            data:'test_id='+data.test_id,
            success:function(html){
                if(!data.closeOverlay){
                    Common.closeAllOverlay();
                }
                $('#componentContent').html(html);
            }
        });

    },

    reloadQuestion: function(){
        $.ajax({
            url: '<?php echo site_url("exam/test/getQuestionList")?>',
            type: "POST",
            success:function(html){
                var data = $.parseJSON(html);
                $('#addQuestionsList').html(data.html);
            }
        });

    },

    cbFilterQuestionList:function(data){
        var data = $.parseJSON(data);
        if(data.ok){
            $('#addQuestionsList').html(data.html);
        }
    },

    updateTotalPoint:function(){
        //test point
        var total = 0;
        $('.question_point').each(function () {
            total+= parseFloat($(this).val(),10);
        })
        $('#total_point').val(total);

        //component point
        $('.component_item').each(function(){
            var total_c = 0;
            $(this).find('.question_point').each(function () {
                total_c+= parseFloat($(this).val(),10);
            });
            $(this).find('.component_point').text(total_c);
        })
    },
    cbInsertTestQuestion:function(data){

        var jData = $.parseJSON(data);
        if(jData.ok){
            testController.reloadQuestion();
            testController.reloadComponent(data);
        }

    },

    cbDeleteQuestion:function(data){

        var jData = $.parseJSON(data);
        if(jData.ok){
            $('.row_q'+jData.question_id).remove();
        }
        testController.updateTotalPoint();
    },

    cbDeleteComponent:function(data){
        var jData = $.parseJSON(data);
        if(jData.ok){
            $('.component_'+jData.component_id).remove();
        }
        testController.updateTotalPoint();
    },

    cbUpdateComponent:function(data){

        var jData = $.parseJSON(data);
        if(jData.ok){
            Common.closeOverlay();
           Common.alert(jData.smessage);
           setTimeout(testController.reloadComponent,2000,data);

        }else{
            Common.alert(jData.serror);
        }

    },

    clearCheck:function(obj){
        $(obj).closest('form').find('input[type=checkbox]').attr('checked',false);
    }
}