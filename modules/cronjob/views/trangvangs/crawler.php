<div class="main">
    <div class="shell">
        <div class="grid">
            <h2>Company process</h2>
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
echo  $formBase->hidden('id');

echo $formBase->viewItem('company',array('config'=>array('id'=>'company_id','class'=>'bold'),'label'=>'LBL_COMPANY_NAME'));
echo $formBase->viewItem('found',array('config'=>array('id'=>'found_id','class'=>'bold'),'label'=>'LBL_FOUND','value'=>$totalCompany));
echo $formBase->end();
?>
<?php
echo $formBase->button('cmdContinue', array('label'=>'BTN_RUN','class'=>'btn btn-success','onclick'=>'doCrawler()'));
?><span> </span>
<?php
echo $formBase->button('cmdStop', array('label'=>'BTN_STOP','class'=>'btn btn-danger','onclick'=>'ajaxAbort();'));
?>
<br><br>
<h2>Category process</h2>
<?php
    echo $formBase->viewItem('total_category',array('config'=>array('id'=>'total_category','class'=>'bold'),'label'=>'LBL_TOTAL_CATEGORY','value'=>$totalCategory));
echo $formBase->viewItem('total_company_craw',array('config'=>array('id'=>'total_company_craw','class'=>'bold'),'label'=>'LBL_TOTAL_COMPANY','value'=>$totalCrawCompany));
    echo ajax_link('cronjob/trangvang/crawler_category',__('BTN_UPDATE'),array('class'=>'btn btn-success','callBack'=>'updateCategory'));
?>
            <div id="result" style="margin: 10px 0px;">

            </div>
</div>
    </div>
</div>
<script>
    var crawler_url = '<?php echo site_url('cronjob/trangvang/trangvangvietnam/'.$crawler->id)?>';
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

    function updateCategory(data){
        $('#result').html(data);
    }

    function getCrawler(url){
        ajaxObj = $.ajax({
            url: url,
            type:"POST",
            data:$('#frmCrawler').serialize(),
            dataType:"json",
            success:function(data){
                    if(data.ok){

                        $('#company_id').html(data.name);
						$('#found_id').html(data.total);

                        getCrawler(crawler_url);

                    }
                    else
                    {
                        Common.showError(data.serror);
                    }
            },
            error:function(){
                if(cmd == 1){
                    getCrawler('<?php echo site_url('cronjob/trangvang/trangvangvietnam/'.$crawler->id.'/next')?>');
                }

            }

        })
    }

</script>
