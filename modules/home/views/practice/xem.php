<div class="gap-mini"></div>
<?php echo pageHeader($exam->title)?>
<?php if($exam->luot_thi){ ?>
<div><h3> <i class="fa fa-check-circle"></i> Đã có <?php echo intval($exam->luot_thi)?> lượt người tham gia thi</h3></div>
<?php }?>
<div>
<?php if($exam->description){
    echo $exam->description;
}else{
    ?>
    Các bài thi thử tiếng hàn giúp bạn có thể hoàn thành tốt hơn kỹ năng khi làm bài.
    <?php
} ?>
</div>
<div class="gap"></div>
<div class="row">
    <div class="col-md-2">

<?php echo anchor('luyen-thi/thi/'.$exam->exam_id,'<i class="fa fa-arrow-circle-right"></i> Vào thi',array('class'=>'btn btn-primary btn-large'))?>

    </div>
    <div class="col-md-5">
        <h5><i class="fa fa-clock-o"></i> Lịch sử thi của bạn</h5>
        <?php

            if($myHistory){
                foreach($myHistory as $my){

                    ?>
                    <div class="row">
                        <div class="col-md-5"><?php echo mongoDate($my['start_time'])?></div>
                        <div class="col-md-1"><?php echo floatval($my['member_test_point'])?>/<?php echo $my['test_detail']['total_point']?></div>
                        <div class="col-md-3"><?php echo ($my['member_pass_status'])?'<span class="text_ok"><i class="fa fa-check-circle"></i> Đạt</span>':'<span class="text_error"><i class="fa fa-times"></i> Không đạt</span>'?></div>
                        <div class="col-md-2"><?php echo anchor('luyen-thi/ketqua/'.$my['_id']->{'$id'},'<i class="fa fa-eye"></i> Xem')?></div>
                    </div>

                    <?php
                }
            }else{
                echo '<div class="note">Bạn chưa tham gia.</div>';
            }
        ?>
        </div>
    <div class="col-md-5">
        <h5><i class="fa fa-graduation-cap"></i> TOP thành viên</h5>
        <?php
        if($topMember){
            foreach($topMember['result'] as $top){
                ?>
                <div class="row">
                    <div class="col-md-1">
                        <div class="topMemberAvatar"><?php echo base_img($top['detail'][0]['memberInfo']['avatar'])?></div>
                    </div>
                    <div class="col-md-4">
                        <b><?php echo $top['detail'][0]['memberInfo']['name']?></b>
                        <div class="note"><?php echo $top['detail'][0]['memberInfo']['username']?></div>
                    </div>
                    <div class="col-md-4">
                        <?php echo floatval($top['max_score'])?> Điểm
                    </div>
                </div>
                <?php
            }
        }else{
            echo '<div class="note">Chưa đánh giá.</div>';
        }
        ?>
    </div>
</div>
