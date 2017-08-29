<div class="main">
    <div class="shell">
        <div class="h20"></div>

      <?php
      $formBase = new FormBase();
      echo $formBase->create('member/upload',array('id'=>'frmImport','class'=>'form-horizontal','enctype'=>"multipart/form-data"));

     if($error) echo $formBase->view('','<span class="text_error">'.$error.'</span>');

     echo  $formBase->view('','Tải về file mẫu '. anchor(ROOT_URL.UPLOAD_DIR.'templates/member.xls','tại đây.'))

      ?>
      <?php echo $formBase->dropdown('clientId',
          array('label'=>'LBL_PARTNER','options'=>getDBDropdown(array('table'=>'client',
              'key'=>'id',
              'val'=>'name'
          ))
          ,'empty'=>'LBL_NON_CLIENT'));?>

        <hr>

        <?php echo $formBase->dropdown('expired',array('label'=>'LBL_PAYMENT','onchange'=>'changePaymentSetting(this)','options'=>getSystemDropdownByCode('PAYMENT_LEVEL'),'empty'=>'LBL_NOT_SET'));?>
        <div id="paymentSetting" style="display: none;">
        <?php echo $formBase->date('expired_from',array('label'=>'LBL_EXPIRED_FROM','value'=>date("Y-m-d")))?>
        <?php echo $formBase->yesno('overwrite',array('label'=>'LBL_OVERWRITE_PAYMENT'));
            echo $formBase->note('LBL_OVERWRITE_PAYMENT_NOTE');
        ?>
        </div>
        <?php
            echo $formBase->upload('fileCsv',array('label'=>'File','rules'=>'required'));
        ?>
        <div class="form-actions ">
        <?php
            echo $formBase->submit('submit',array('label'=>'BTN_SUBMIT'));
        ?>
        </div>
        <?php
      echo $formBase->end();
      ?>
    </div>
</div>
<script>
    function changePaymentSetting(obj){
        if($(obj).val()){
            $('#paymentSetting').show();
        }else{
            $('#paymentSetting').hide();
        }
    }
</script>