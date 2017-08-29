<div class="gap-mini"></div>
<?php
echo pageHeader('Thi thử');
//debug($exams,false);
?>
<div class="row">
    <div class="col-md-6">
        <?php
        foreach($exams as $e){
            ?>
            <div class="testItem">
                <h5>
                    <?php echo anchor('thi-thu/xem/'.$e->exam_id,$e->title);?>
                    <div class="right doingExam">
                        <?php if($e->online) echo base_img('/asset/blink.gif',array('class'=>'doing')) .' Đang thi';?>
                    </div>
                </h5>
                <div>
                    <?php if($e->attempt){?>
                    <div class="note"> <?php echo 'Bạn đã thi <b>'.$e->attempt .'</b> lần.';?></div>
                    <?php }?>
                    <div>
                        <?php
                        $label = ($e->attempt>0)?'Thi lại':'Vào thi';
                        echo anchor('thi-thu/thi/'.$e->exam_id,$label,array('class'=>'btn btn-success'))?>
                        <div class="right">
                        <?php echo anchor('thi-thu/xem/'.$e->exam_id,'Chi tiết',array('class'=>'btn btn-default'))?>

                        <?php echo anchor('thi-thu/xem/'.$e->exam_id,'<i class="fa fa-facebook"></i> Chia sẻ',
                            array(
                                'data-title'=>$e->title,
                                'class'=>'btnShare btn btn-default'))?></div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <?php
        }
        ?>
    </div>
    <div class="col-md-4">

    </div>
</div>
