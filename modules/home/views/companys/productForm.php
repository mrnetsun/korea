<?php
$formBase = new FormBase();
echo $formBase->create('home/company/addProduct/',array('id'=>'frmCompanyProduct','ajax'=>array('Callback'=>'homeController.cbAddProduct')));
//                $formBase->fillData($formEmail);
echo $formBase->hidden('company_id',array('value'=>$company_id));
?>
    <div class=""><?php echo __("MSG_SEND_MESSAGE_COMPANY");?></div>

    <div class="form-group">
        <?php echo $formBase->input('first_name',array('placeholder'=>'LBL_FIRST_NAME','class'=>'form-control','rules'=>'required'))?>
    </div>
    <div class="form-group">
        <?php echo $formBase->input('last_name',array('placeholder'=>'LBL_LAST_NAME','class'=>'form-control','rules'=>'required'))?>
    </div>
    <div class="form-group">
        <?php echo $formBase->input('email',array('placeholder'=>'LBL_EMAIL','class'=>'form-control','rules'=>'required|valid_emails'))?>
    </div>
    <div class="form-group">
        <?php echo $formBase->input('phone',array('placeholder'=>'LBL_TELEPHONE','class'=>'form-control','rules'=>'required|phone_number'))?>
    </div>

    <div class="form-group">
        <?php echo $formBase->textarea('content',array('placeholder'=>'LBL_CONTENT','rows'=>5,'class'=>'form-control','rules'=>'required'))?>
    </div>

<?php echo $formBase->submit('cmdSend',array('label'=>"BTN_SEND",'class'=>'btn btn-success')); echo ' '.img_ajax('formEnquiry_img')?>
<?php echo $formBase->button('btn_abort',array('label'=>'BTN_ABORT','class'=>'btn btn-default','onclick'=>'BootstrapDialog.closeAll();'))?>
<?php echo $formBase->end()?>