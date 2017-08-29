<?php
//echo pageHeader($page->title);
echo page_backgroup('<div class="text-center"><p><br></p><h2>Khách hàng có thể tìm thấy bạn?</h2>

Mỗi ngày hàng ngàn doanh nghiệp đã mất đi các khách hàng tiềm năng của mình<br>
bởi vì thông tin thiếu hoặc không chính xác trên các website và ứng dụng tìm kiếm phổ biến trên internet.<br>
<p><br></p></div>',ROOT_URL.'uploads/slide/about.jpg');
?>

<?php //echo page_client($team);?>

<?php echo page_container('<div class="text-center">
<br><br>
Nhằm hỗ trợ và đáp ứng nhu cầu cho các doanh nghiệp trong việc xây dựng và phát triển hình ảnh thương hiệu, Đội ngũ kỹ sư và chuyên gia của chúng
tôi đã làm việc miệt mài không ngừng nghỉ nhằm tạo ra một hệ thống tối ưu và mang lại hiệu quả nhất cho khách hàng.
<br><br>
<h4>Tiếp cận khách hàng và phát triển doanh nghiệp của bạn</h4>
<h4 class="bold">Hãy để chúng tôi giúp bạn!</h4></div>',array('title'=>'','class'=>'col-md-12'));?>
<div class="gap"></div>

<div class="bg-color text-white bg-blue">
    <div class="container">
        <div class="gap"></div>
        <div class="row row-wrap">
            <div class="col-md-6">
                 <h2>Tạo tài khoản miễn phí</h2>
                Với tài khoản này bản có thể:<br>
                <ul class="" style="line-height: 30px;">
                    <li>Đăng ký hoặc cập nhật thông tin doanh nghiệp lên hệ thống</li>
                    <li>Xem thống kê chi tiết doanh nghiệp</li>
                    <li>Quản lý tài khoản và các thanh toán</li>
                    <li>Tham gia các hoạt động tại website, đăng ký quảng cáo</li>
                </ul>
                <br>

                <?php echo anchor('auth/signup','Tạo tài khoản ngay',array('class'=>'btn btn-ghost btn-default btn-lg'))?>

            </div>
        </div>
        <div class="gap gap-small"></div>
    </div>
</div>