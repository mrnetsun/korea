<h2>getCompanyList</h2>
<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 3/6/2016
 * Time: 2:13 PM
 */
$formBase = new FormBase();
$formBase->fillData($crawler);
echo  $formBase->create('',array('id'=>'frmCrawler'));
echo $formBase->viewItem('name',array('config'=>array('id'=>'name_id'),'label'=>'LBL_NAME'));
echo $formBase->viewItem('cralwer_url',array('config'=>array('id'=>'crawler_url'),'label'=>'LBL_CODE'));
echo $formBase->viewItem('number',array('config'=>array('id'=>'number_id'),'label'=>'LBL_NUMBER'));
echo $formBase->viewItem('inserted',array('config'=>array('id'=>'inserted_id'),'label'=>'LBL_INSERTED'));

echo $formBase->end();
?>
<?php
echo $formBase->button('cmdContinue', array('label'=>'BTN_RUN','class'=>'btn btn-success','onclick'=>'doCrawler()'));
?><span> </span>
<?php
echo $formBase->button('cmdStop', array('label'=>'BTN_STOP','class'=>'btn btn-danger','onclick'=>'ajaxAbort();'));
?>

<script>
    var crawler_url = '<?php echo site_url('home/crawler/buildCompanyList')?>';
    var ajaxObj = null;
    var cmd = 1;
//    getCrawler(crawler_url);

//    function

    function  ajaxAbort(){
        cmd = 0;
        if(ajaxObj) ajaxObj.abort();
    }

    function doCrawler(){
        cmd = 1;
        getCrawler(crawler_url);
    }

    function getCrawler(url){
        ajaxObj = $.ajax({
            url: url,
            type:"POST",
            data:$('#frmCrawler').serialize(),
            dataType:"json",
            success:function(data){
                    if(data.ok){
                        $('#crawler_url').html(data.crawler_url);
                        $('#number_id').html(data.number);
                        $('#name_id').html(data.name);
                        $('#inserted_id').html(data.inserted);

                        if(data.continue){
                            getCrawler(crawler_url);
                        }else {
                            alert('Completed!');
                        }

                    }
                    else
                    {
                        Common.showError(data.serror);
                    }
            },
            error:function(){
                //getCrawler(crawler_url);
            }

        })
    }

</script>
