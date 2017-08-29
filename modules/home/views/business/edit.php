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

<div class="pageDetail">
    <div style="padding: 10px 20px">
        <div class="row row-wrap">
        <div class="col-md-12">
            <h1>Bảng khai thông tin doanh nghiệp</h1>
        </div>
    </div>
        <hr>

    <div class="row row-wrap ">
        <div class="col-md-5">
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_NAME")?> <span class="text_error">*</span></label>
                <div class="img_company_check_div"><?php echo img_ajax('img_company_check')?></div>
                <?php echo $formBase->input('Company_Name',array('id'=>'Company_Name','onchange'=>'homeController.checkCompanyName()','rules'=>'required','class'=>'form-control'));?>
                <div><span id="company_existed"></span></div>
            </div>
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_LOGO")?> </label>
                <?php echo $formBase->upload_image('Company_Logo',array('rules'=>'','class'=>'btn btn-success','data'=>array('resize'=>1,'width'=>120,'height'=>50)));?>
            </div>
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_GOOGLE")?> </label>
                <?php
//                $geo = IP2Geo('42.114.154.95');  $latLong = $geo['lat'].','.$geo['long'];
                echo $formBase->latlong('LatLong',array('data'=>'Hanoi,VN','value'=>$latLong,'preview'=>'gmapPreview','rules'=>'','class'=>'form-control','function'=>'frontGoogleMap'));?>
            </div>
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_ADDRESS")?> <span class="text_error">*</span> </label>
                <?php echo $formBase->input('Company_Address',array('rules'=>'required','class'=>'form-control'));?>
            </div>
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_PROVINCE")?> </label>
                <?php echo $formBase->select('Province',array('rules'=>'required','options'=>getDBDropdown(array('table'=>'city','key'=>'location','val'=>'location'),array('order_by'=>'position ASC, location ASC')),'empty'=>'LBL_LOCATION','class'=>'form-control'));?>
            </div>
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_EMAIL")?> <span class="text_error">*</span> </label>
                <?php echo $formBase->input('Company_Email',array('rules'=>'required|valid_email','class'=>'form-control'));?>
            </div>
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_TELEPHONE")?> <span class="text_error">*</span> </label>
                <?php echo $formBase->json('Company_Tel',array('rules'=>'required','config'=>'["LBL_COMPANY_TELEPHONE"]','default'=>1,'max_item'=>5,'class'=>'form-control'));?>
            </div>
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_FAX")?></label>
                <?php echo $formBase->input('Company_Fax',array('rules'=>'','class'=>'form-control'));?>
            </div>
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_WEBSITE")?></label>
                <?php echo $formBase->input('Company_Website',array('rules'=>'url','class'=>'form-control'));?>
            </div>


            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_MST")?></label>
                <?php echo $formBase->input('MST',array('rules'=>'numberic','class'=>'form-control'));?>
            </div>


            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_ESTABLISH")?></label>
                <?php echo $formBase->input('Establish',array('msg'=>'Năm thành lập phải là số 4 chữ số','rules'=>'numberic|exact_length[4]|','class'=>'form-control'));?>
            </div>


            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_SIZE")?></label>
                <?php echo $formBase->dropdown('Company_Size',array('rules'=>'','options'=>getSystemDropdownByCode('COMPANY_SIZE'),'empty'=>'LBL_SELECT_ONE','class'=>'form-control'));?>
            </div>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-5">
            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_CATEGORY")?></label>
                <?php echo $formBase->json('Categories',array('rules'=>'required','config'=>'["Ngành nghề"]','default'=>3,'max_item'=>5,'class'=>'form-control'));?>
            </div>

            <!--div class="form-group">
                <label><?php //echo __("LBL_COMPANY_PRODUCT")?></label>
                <?php //echo $formBase->json('Products',array('rules'=>'required','config'=>'["Sản phẩm - dịch vụ"]','default'=>3,'max_item'=>16,'class'=>'form-control'));?>
            </div-->

            <div class="form-group">
                <label><?php echo __("LBL_COMPANY_PROFILE")?></label>
                <?php echo $formBase->textarea('Profiles',array('id'=>'company_profile','rows'=>10,'rules'=>'required','class'=>'form-control'));?>
            </div>

            <div class="form-group">
                <label><b><?php echo __("LBL_COMPANY_IN_TOUCH")?></b></label>
                <?php echo $formBase->json2('Get_In_Touch',array('id'=>'get_in_touch','config'=>'["Họ tên","Mobile","Email"]','class'=>'form-control'));?>
            </div>

        </div>

    </div>
        <div class="row">
            <div class="col-md-12">
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
    $('#company_profile').jqte();

    $(document).ready(function(){
        $('#Company_Name').change(function(){
            homeController.checkCompanyName();
        });
    });
</script>
