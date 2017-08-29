<div class="gap"></div>
<center>
<?php
//echo pageHeader(__('ERR_SERVER_OVERLOAD'));
echo page_container('

<h1>'.__('ERR_SERVER_OVERLOAD').'</h1>
Xin lỗi hiện tại server đang quá tải vui lòng thử lại trong giây lát

',array('class'=>'md-col-12'));
?>
<div>
    <?php echo base_img('asset/information-overload.png');?>
</div>
</center>