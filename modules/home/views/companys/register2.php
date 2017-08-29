<?php
//echo pageHeader($page->title);
echo page_backgroup('<div class="text-center"><p><br></p><h2>'.__('TITLE_UPATE_COMPANY').'</h2>

Mỗi ngày hàng ngàn doanh nghiệp đã mất đi các khách hàng tiềm năng của mình<br>
bởi vì thông tin thiếu hoặc không chính xác trên các website và ứng dụng tìm kiếm phổ biến trên internet.<br>
<p><br></p></div>',ROOT_URL.'uploads/slide/register.jpg');
?>
<div class="gap"></div>

<?php

if(!$LoginData){
    ?><div class="container">
<div class="alert alert-danger">
    <i class="fa fa-warning  box-icon-left box-icon-warning box-icon-to-warning animate-icon-top-to-bottom round"></i>

    <h4>Cảnh báo</h4>
    <button data-dismiss="alert" type="button" class="close"><span aria-hidden="true">×</span></button>
    <p>
    Bạn chưa đăng nhập, Hãy <?php echo anchor('auth','đăng nhập')?> để quản lý thông tin về doanh nghiệp sau khi đăng ký. Chưa có tài khoản ? Hãy <?php echo anchor('auth/signup','đăng ký tại đây')?>.
    </p>
    </div>
    </div>
    <div class="gap"></div>
<?php
}
?>

<div class="container">
<?php
//echo pageHeader('TITLE_ADD_COMPANY');
$formBase  = new FormBase();
echo $formBase->create('home/business/update');

if($company->Company_Logo){
    $json = json_decode($company->Company_Logo);
    if(!$json){
        $json = json_encode(array('real_name'=>$company->Company_Logo));
        $company->Company_Logo = $json;
    }
}

if($company->Lat || $company->Long){
    $company->LatLong = $company->Lat.LATLONG_SPLIT. $company->Long;
}

$contact = json_decode($company->Contact);
if($contact){
    $company->Company_Address = $contact->Address;
    $company->Company_Tel = json_encode(array_values(explode('*',$contact->Tel)));
    $company->Company_Fax = $contact->Fax;
    $company->Company_Email = $contact->Email;
    $company->Company_Website = $contact->Website;
    $company->Company_Facebook = $contact->Facebook;
}

$company->Products = $company->Product_Serivces;
$company->Profiles = $company->Company_Profile;

$company->Province = trim($company->Province);

$touch = json_decode($company->Get_In_Touch);
$company->Get_In_Touch = $touch;

//debug($company,false);

$formBase->fillData($company);
echo $formBase->hidden('id');
?>

<div class="pageDetail viewForm">
    <div style="padding: 10px 20px">
        <div class="row row-wrap">
        <div class="col-md-12">
            <h1>Bảng khai thông tin doanh nghiệp</h1>
        </div>
    </div>
        <hr>

        <div class="row row-wrap">
            <div class="col-md-2">
                <div class="controls">
                    <div style="width: 120px; height: auto;"><?php echo json_img($company->Company_Logo)?></div>
                </div>
            </div>
            <div class="col-md-10">
            <h5><?php echo $formBase->viewItem('Company_Name',array('id'=>'Company_Name','onchange'=>'homeController.checkCompanyName()','rules'=>'required','class'=>'form-control'));?>
            </h5>
                <div>
                    <i class="fa fa-map-marker"></i> <?php echo $company->Company_Address;?>
                </div>
                <div>
                    <i class="fa fa-phone"></i> <?php echo implode('-',json_decode($company->Company_Tel));?>
                </div>
                <div>
                    <i class="fa fa-globe"></i> <?php echo $company->Company_Website;?>
                </div>
            </div>
        </div>
        <div class="gap"></div>
    <div class="row row-wrap ">

        <div class="col-md-2"><label><?php echo __("LBL_COMPANY_CATEGORY")?></label> </div>

        <div class="col-md-6">
            <div class="form-group">
                <?php echo $formBase->json('Categories',array('rules'=>'required','config'=>'["Ngành nghề"]','default'=>3,'max_item'=>5,'class'=>'form-control'));?>
            </div>

        </div>
    </div>


        <div class="row row-wrap ">

            <div class="col-md-2"><label><?php echo __("LBL_COMPANY_PRODUCT")?></label> </div>

            <div class="col-md-6">
                <div class="form-group">
                    <?php //echo $formBase->json('Products',array('rules'=>'required','config'=>'["Sản phẩm - Dịch vụ"]','default'=>3,'max_item'=>5,'class'=>'form-control'));?>
                    <a id="btnAddProduct" data-title="Thêm sản phẩm" class="btn btn-success"><i class="fa fa-plus-circle"></i> Thêm nhóm sản phẩm</a>
                    <div id="productWrap">

                    </div>
                </div>

            </div>
        </div>

    </div>
        <div class="row">
            <div style="padding:5px 20px;">
                <?php echo $formBase->submit('submit',array('label'=>'BTN_UPDATE','class'=>'btn btn-primary btn-large')); ?>
            </div>
        </div>
    </div>
</div>
</div>
<?php

echo $formBase->end();?>
<div class="gap"></div>
<script>

    $(document).ready(function(){
        $('#Company_Name').change(function(){
            homeController.checkCompanyName();
        });

        $('#btnAddProduct').click(function(){
            homeController.addProduct(this);
        });
    });
</script>
