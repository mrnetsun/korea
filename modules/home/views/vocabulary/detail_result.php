<div class="gap"></div>
<?php
    echo pageHeader($anserSheet['topic']);
//debug($anserSheet);
?>
<div class="container">
<div class="row">
    <div class="col-md-2">
        <div class="memberAvatar">
        <?php echo base_img($anserSheet['memberInfo']['avatar'])?>
        </div>
    </div>
    <div class="col-md-4">
        <div class="row">
            <div class="col-md-5">Họ tên</div>
            <div class="col-md-7"><?php echo $anserSheet['memberInfo']['name']?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Mã đăng nhập</div>
            <div class="col-md-7"><?php echo $anserSheet['memberInfo']['username']?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Giờ vào</div>
            <div class="col-md-7"><?php echo date("<b>d/m/Y</b> H:i:s A",strtotime($anserSheet['start']))?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Nộp bài</div>
            <div class="col-md-7"><?php echo date("<b>d/m/Y</b> H:i:s A",strtotime($anserSheet['end_time']))?></div>
        </div>
        </div>
    <div class="col-md-4">

        <div class="row">
            <div class="col-md-5">Điểm thi</div>
            <div class="col-md-7"><?php echo floatval($anserSheet['member_point'])?>/<?php echo count($anserSheet['questions'])?></div>
        </div>
        <div class="row">
            <div class="col-md-5">Tình trạng</div>
            <div class="col-md-7"><?php echo ($anserSheet['passed'])?'<span class="text_ok"><i class="fa fa-check-circle"></i> Đạt</span>':'<span class="text_error"><i class="fa fa-times"></i> Không đạt</span>'?></div>
        </div>

        <div class="row">
            <div class="col-md-12">

                <?php echo anchor('tu-vung/kiemtra/'.$anserSheet['topic_id'],'<i class="fa fa-refresh"></i> Làm lại',
                    array(

                        'class'=>'btn btn-default btn-large'))?>
            </div>
        </div>

    </div>
    </div>
    <div class="row">
        <div class="gap"></div>
    <div class="col-md-12">

        <div class="">
            <div class="examQuestion">
                <?php
                $qIndex = 0;
                if($anserSheet['questions'])foreach($anserSheet['questions'] as $k=>$q){
                    $this->load->view('questions/type'.$q['type'],array('question'=>$q,'k'=>$k,'member_check'=>true,'show_answer'=>true));

                }
                ?>
            </div>
            <div class="gap-mini"></div>

        </div>

    </div>
</div>
</div>
<script>
    $(document).ready(function() {
        $('.btnSound').click(function () {
            homeController.playSound(this);
        });
    });
</script>