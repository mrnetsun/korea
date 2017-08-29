<div class="gap-mini"></div>
<?php
echo pageHeader($cate->cate_name);
//debug($exams,false);
?>
<div class="row">
    <div class="col-md-12">
    <?php
    echo $pagination->pagination($start);
    ?>
    </div>
</div>
<div class="row">

        <?php
        foreach($exams as $e){
            ?>
            <div class="col-md-4">
            <div class="testItem testItemPractice">
                <h5>
                    <?php echo anchor('luyen-thi/xem/'.$e->exam_id,$e->title);?>
                    <div class="right doingExam">
                        <?php if($e->online) echo base_img('/asset/blink.gif',array('class'=>'doing')) .' Đang thi';?>
                    </div>
                </h5>
                <div>

                    <div class="note testItemNote"><?php if($e->attempt){?> <?php echo 'Bạn đã luyện <b>'.$e->attempt .'</b> lần.';?> <?php }?></div>

                    <div>
                        <?php
                        $label = ($e->attempt>0)?'Làm lại':'Vào luyện';
                        echo anchor('luyen-thi/thi/'.$e->exam_id,$label,array('class'=>'btn btn-success'))?>
                        <div class="right">
                            <?php echo anchor('luyen-thi/xem/'.$e->exam_id,'Chi tiết',array('class'=>'btn btn-default'))?>

                            <?php echo anchor('luyen-thi/xem/'.$e->exam_id,'<i class="fa fa-facebook"></i> Chia sẻ',
                                array(
                                    'data-title'=>$e->title,
                                    'class'=>'btnShare btn btn-default'))?></div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            </div>
            <?php
        }
        ?>

</div>
<div class="row">
    <div class="col-md-12">
    <?php
    echo $pagination->pagination($start);
    ?>
    </div>
</div>