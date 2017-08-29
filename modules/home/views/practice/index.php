<div class="gap-mini"></div>
<?php
echo pageHeader('Luyện thi');
//debug($exams,false);
?>
<div class="row">
    <div class="col-md-6">
        <?php
        foreach($categories as $c){
            ?>
            <div class="testItem">
                <h5>
                    <?php echo anchor('luyen-thi/chuyende/'.$c->exam_category_id,$c->cate_name);?>

                </h5>
                <div>

                    <div>
                        <?php
                        $label = ($e->attempt>0)?'Thi lại':'Vào thi';
                        echo anchor('luyen-thi/chuyende/'.$c->exam_category_id,'chi tiết',array('class'=>'btn btn-success'))?>

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
