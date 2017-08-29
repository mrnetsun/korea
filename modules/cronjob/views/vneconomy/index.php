<div class="main">
    <div class="shell">
        <div class="grid">
            <div class="">
                <h3><?php echo strtoupper($item->code)?></h3>
            </div>


            <div class="border" style="margin: 10px 0px; padding: 10px;">
                <div class="col-1-2">
                    <div class="content" >
                        <div class="row" style="padding: 3px;">
                        <span class="span2 w120 label"><?php echo __("LBL_TITLE")?></span><span class="span3"><?php echo $item->title?></span>
                        </div>
                        <div class="row"  style="padding: 5px;">
                            <span class="span2 w120 label"><?php echo __("LBL_LINK")?></span><span class="span3"><?php echo $item->link?></span>
                        </div>
                        <div class="row"  style="padding: 5px;">
                            <span class="span2 w120 label"><?php echo __("LBL_CODE")?></span><span class="span3"><?php echo $item->code?></span>
                        </div>

                        <div class="row"  style="padding: 5px;">
                            <span class="span2 w120 label"><?php echo __("LBL_MODE")?></span><span class="span3"><?php echo ($item->approve)? __("LBL_AUTO"):__("LBL_MANUAL")?></span>
                        </div>

                        <div class="row"  style="padding: 5px;">
                            <span class="span2 w120 label"><?php echo __("LBL_CATEGORY")?></span><span class="span3"><?php echo $item->cate_name;?></span>
                        </div>
                        <div class="row"  style="padding: 5px;">
                            <span class="span2 w120 label"><?php echo __("LBL_UPDATED")?></span><span class="span3"><?php echo localDate($item->updatedTime);?></span>
                        </div>
                        <div class="row">
                            <span class="span2 w120"></span>
                            <span class="span3">
                            <?php
                            echo ajax_link('cronjob/vneconomy/getArticleLink/'.$item->id,'<i class="icon-refresh"></i> '.__('BTN_UPDATE'),array('class'=>'btn btn-success','callBack'=>'cronjobController.getNewCallBack'));
                            ?>
                           </span>
                        </div>

                        <?php
                            if(!empty($other_topic)){
                                ?>
                                <div class="row">
                                    <span class="span2 w120"></span>
                                    <span class="span3">
                                    <h4>Topic khác</h4>
                                        <ul>
                                    <?php
                                        foreach($other_topic as $topic){
                                            echo '<li>'.anchor('cronjob/vneconomy/index/'.$topic->id,$topic->title).'</li>';
                                        }
                                    ?></ul>
                                     </span>
                                </div>
                                <?php
                            }
                        ?>
                    </div>
                </div>
                <div class="col-1-2">
                    <div class="content">
                        <h3>Kết quả</h3>
                        <div id="articleResult">

                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>



        </div>
</div>
</div>
