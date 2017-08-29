<div class="main">
    <div class="shell">
        <div class="grid">
            <div class="">
                <h3><?php echo strtoupper($item->code)?></h3>
            </div>


            <div class="border" style="margin: 10px 0px; padding: 10px;">
                <div class="col-1-2">
                    <div class="content" >
                        <table width="100%">
                            <?php foreach($links as $k=>$item){ ?>
                            <tr>
                                <td class="w30"><?php echo $k+1;?></td>
                                <td class="span3"><?php echo $item->title;?></td>
                                <td id="topic_<?php echo $item->id?>"><?php echo display_time_ago($item->updatedTime);?></td>
                            </tr>
                            <?php }?>
                        </table>
                        <div class="row">
                            <span class="span2 w120"></span>
                            <span class="span3">
                            <?php
                            echo anchor('#','<i class="icon-refresh"></i> '.__('BTN_UPDATE'),array('class'=>'btn btn-success','onclick'=>'cronjobController.prepareNews()'));
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
