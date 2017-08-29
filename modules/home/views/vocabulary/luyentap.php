<div class="gap-minis"></div>
<div class="row">
    <div class="col-md-6" style="padding: 10px">
        <a class="btn btn-default" href="<?php echo site_url('tu-vung/card/'.$category->id)?>"><i class="fa fa-book"></i> Học từ</a>
        <a class="btn btn-primary" href="<?php echo site_url('tu-vung/luyentap/'.$category->id)?>"><i class="fa fa-flag"></i> Luyện tập</a>
        <a class="btn btn-default" href="<?php echo site_url('tu-vung/kiemtra/'.$category->id)?>"><i class="fa fa-check-square-o"></i> Kiểm tra</a>
    </div>
</div>
<div class="gap-mini"></div>
<h3>Chủ đề: <?php echo $category->cate_name?></h3>
<div class="gap-mini"></div>
<div class="row">
    <div class="col-md-6">
    <div id="progress_id" class="progress">
        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="0"
             aria-valuemin="0" aria-valuemax="100" style="width:0%">
            0/<?php echo $total;?>
        </div>
    </div>
    </div>
</div>

<div class="gap"></div>
<div class="row">
    <div class="col-md-6">
        <div class="practiceQ">

            <div id="questionDetail">
                <?php
                    echo $html;
               ?>
            </div>

            <div class="answerStatus">
                <div id="dang_cham" style="display: none;"><?php echo img_ajax('dang_cham_img','load.gif',array('display'=>'inline-block'))?> Đang chấm...</div>
                <div id="answer_true" style="display: none"><i class="fa fa-check-circle"></i> Đúng</div>
                <div id="answer_false" style="display: none"><i class="fa fa-times"></i> Sai</div>
            </div>
        </div>

    </div>
    <div class="col-md-6">

    </div>
</div>

<script>
    $(document).ready(function() {
        $('.btnSound').click(function () {
            homeController.playSound(this);
        });
    });
</script>