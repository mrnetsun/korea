// JavaScript Document
//LBL_DISPLAY_TO('<?php echo __("Text for translation");?>');
var ajaxObj = null;
cronjobController = {
    weatherCallBack: function (data){
        var data = $.parseJSON(data);
        $('#weatherResult').append(data.smessage);
    },

    prepareNews:function(){
        var w_url = "<?php echo site_url('cronjob/news/prepare')?>";
        $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data){
                if(data.ok){
                    $('#weatherResult').html('');
                    cronjobController.updateNews();
                }

            }
        });
    },

    updateNews:function(){
        //doing ajax
        var w_url = "<?php echo site_url('cronjob/news/updateNews')?>";
        $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data){
                if(data.ok == 1 && data.url){
                    $.ajax({
                        type: "POST",
                        url: data.url,
                        dataType:'json',
                        success: function(data){
                            if(data.ok){
                                $('#articleResult').append(data.smessage);
                                cronjobController.updateNews();
                            }

                        }
                    });
                }else{
                    $('#articleResult').append(data.smessage);
                    cronjobController.crawlerArticle();
                }

            }
        });
    },

    prepareWeather:function(){
        //doing ajax
        var w_url = "<?php echo site_url('cronjob/weather/prepare')?>";
        $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data){
                if(data.ok){
                    $('#weatherResult').html('');
                    cronjobController.updateWeather();
                }

            }
        });
    },

    updateWeather:function(){
        //doing ajax
        var w_url = "<?php echo site_url('cronjob/weather/update')?>";
        $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data){
                if(data.ok){
                    $('#weatherResult').append(data.smessage);
                    cronjobController.updateWeather();
                }else{
                    $('#weatherResult').append(data.smessage);
                }

            }
        });
    },

    getNewCallBack:function(data){
        var data = $.parseJSON(data);
        $('#articleResult').html(data.smessage);

         cronjobController.crawlerArticle();

    },

    crawlerArticle:function(){
        var w_url = "<?php echo site_url('cronjob/news/crawlerArticle')?>";
        $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data){
                if(data.ok){
                    $('#articleResult').append(data.smessage);
                    cronjobController.crawlerArticle();
                }else{
                    $('#articleResult').append(data.smessage);
                }

            }
        });
    },

    solrIndexData:function(){
        $('#solr_processing').show();
        var w_url = "<?php echo site_url('cronjob/solr/indexData')?>";
        ajaxObj = $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data){
                $('#solr_processing').hide();
                $('#solrIndexResult').html(data.smessage);

                var solr_item_0 = $('#solr_item_0').text();
                var solr_item_1 = $('#solr_item_1').text();

                solr_item_0 = parseInt(solr_item_0,10) - parseInt(data.processed,10);
                solr_item_1 = parseInt(solr_item_1,10) + parseInt(data.processed,10);

                $('#solr_item_0').text(solr_item_0);
                $('#solr_item_1').text(solr_item_1);

                $('#itemName_YPVN').html(data.total_indexed);

                maxDoc =  parseInt($('#itemNameMax_YPVN').text(),10);
                if(maxDoc < data.total_indexed){
                    $('#itemNameMax_YPVN').text(data.total_indexed)
                }


                if(data.ok == 1){
                    cronjobController.solrIndexData();
                }else {
                    $('#solrIndexResult').append('<br>'+data.finish);
                }

            }

        });


    },

    solrFullIndex:function(){

        var w_url = "<?php echo site_url('cronjob/solr/PrepareFullIndex')?>";
        if(!confirm('Bạn thực sự reset dữ liệu trên Solr?')) return false;
        $('#solr_processing_full').show();
        ajaxObj = $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data) {
                $('#solr_processing_full').hide();
                $('#solrIndexResult').html(data.smessage);

                $('#solr_item_0').text(data.total);
                $('#solr_item_1').text(0);
                $('#itemName_YPVN').text(0);
                $('#itemNameMax_YPVN').text(0);


                if(data.ok){
                    //cronjobController.solrIndexData();
                }
            }
        });
    },

    solrSuggestData:function(){
        $('#solr_processing').show();
        var w_url = "<?php echo site_url('cronjob/suggest/indexData')?>";
        ajaxObj = $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data){
                $('#solr_processing').hide();
                $('#solrIndexResult').html(data.smessage);

                var solr_item_0 = $('#solr_item_0').text();
                var solr_item_1 = $('#solr_item_1').text();

                solr_item_0 = parseInt(solr_item_0,10) - parseInt(data.processed,10);
                solr_item_1 = parseInt(solr_item_1,10) + parseInt(data.processed,10);

                $('#solr_item_0').text(solr_item_0);
                $('#solr_item_1').text(solr_item_1);

                $('#itemName_YPVN').html(data.total_indexed);

                maxDoc =  parseInt($('#itemNameMax_YPVN').text(),10);
                if(maxDoc < data.total_indexed){
                    $('#itemNameMax_YPVN').text(data.total_indexed)
                }


                if(data.ok == 1){
                    cronjobController.solrSuggestData();
                }else {
                    $('#solrIndexResult').append('<br>'+data.finish);
                }

            }

        });


    },

    solrSuggestIndex:function(){

        var w_url = "<?php echo site_url('cronjob/suggest/PrepareFullIndex')?>";
        if(!confirm('Bạn thực sự reset dữ liệu trên Solr?')) return false;
        $('#solr_processing_full').show();
        ajaxObj = $.ajax({
            type: "POST",
            url: w_url,
            dataType:'json',
            success: function(data) {
                $('#solr_processing_full').hide();
                $('#solrIndexResult').html(data.smessage);
                if(data.ok){
                    //cronjobController.solrIndexData();
                }
            }
        });
    }
}
