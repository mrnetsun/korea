<?php
//debug($server);
?>

<div class="main">
    <div class="shell">
        <div class="grid">
            <div class="">
                <h3>Server: <?php echo $server['endpoint']['localhost']['host']?>:<?php echo $server['endpoint']['localhost']['port']?>
                    <?php echo anchor('http://'.$server['endpoint']['localhost']['host'].':'.$server['endpoint']['localhost']['port'].str_replace('/solr/','/solr/#/',$server['endpoint']['localhost']['path']),'<i>&gt;</i>',array('target'=>'_blank'))?>
                </h3>
            </div>


            <div class="border" style="margin: 10px 0px; padding: 10px;">
                <div class="col-1-2">
                    <h4><?php echo $server['endpoint']['localhost']['path']?></h4>
                    <div>
                        <fieldset><legend><?php echo __("LBL_COMPANY")?></legend>
                            <?php
//                            debug($company_statistic);
                            $Solr_Index = array();
                            foreach($company_statistic as $item){
                                $Solr_Index[$item->Solr_Index] = $item->total;
                            }
                            if(!$Solr_Index[1]){
                                $Solr_Index[1] = 0;
                            }
                            if(!$Solr_Index[0]){
                                $Solr_Index[0] = 0;
                            }
                            foreach($Solr_Index as $k=>$v){
                                ?>
                                <div class="row"  style="padding: 5px;">
                                    <span class="span2 w120 label"><?php echo ($k)? __("LBL_INDEXED"):__("LBL_NOT_INDEX_YET")?>
                                    </span><span class="span3"><b id="solr_item_<?php echo $k;?>"><?php echo $v;?></b> <?php echo __("LBL_RECORD")?></span>
                                </div>
                                <?php
                            }
                            ?><div class="row"  style="padding: 5px;">
                                <span class="span2 w120 ">
                                    <?php
                                    echo ' '.anchor('#','<i class="icon-refresh"></i> '.__('BTN_CLEAR'),
                                            array('class'=>'btn btn-danger','onclick'=>'cronjobController.solrSuggestIndex()'));
                                    ?>
                                    <?php echo img_ajax('solr_processing_full')?>
                                </span><span class="span3">
                                 <?php
                                 echo anchor('#','<i class="icon-refresh"></i> '.__('BTN_DAILY_UPDATE'),
                                     array('class'=>'btn btn-success','onclick'=>'cronjobController.solrSuggestData()'));


                                 ?>
                                    <?php echo img_ajax('solr_processing')?>
                                </span>
                            </div>

                        </fieldset>

                        <?php if($solr){
//                            debug($solr,false);
                            foreach($solr->status as $k=>$item){
                               ?>
                                <fieldset><legend><?php echo $item->name?></legend>
                                <div class="row"  style="padding: 5px;">
                                    <span class="span2 w120 label"><?php echo __("LBL_COLLECTION")?></span><span class="span3"><?php echo $item->name?></span>
                                </div>
                                <div class="row"  style="padding: 5px;">
                                    <span class="span2 w120 label"><?php echo __("LBL_NUMDOC")?></span><span class="span3" id="itemName_<?php echo $item->name?>"><?php echo $item->index->numDocs?></span>
                                </div>
                                <div class="row"  style="padding: 5px;">
                                    <span class="span2 w120 label"><?php echo __("LBL_MAXDOC")?></span><span class="span3" id="itemNameMax_<?php echo $item->name?>"><?php echo $item->index->maxDoc?></span>
                                </div>
                                <div class="row"  style="padding: 5px;">
                                    <span class="span2 w120 label"><?php echo __("LBL_DELETED")?></span><span class="span3"><?php echo $item->index->deletedDocs?></span>
                                </div>
                                <div class="row"  style="padding: 5px;">
                                    <span class="span2 w120 label"><?php echo __("LBL_SIZE")?></span><span class="span3"><?php echo $item->index->size?></span>
                                </div>
                                <div class="row"  style="padding: 5px;">
                                    <span class="span2 w120 label"><?php echo __("LBL_UPDATED")?></span><span class="span3"><?php echo $item->index->lastModified?></span>
                                </div>
                                </fieldset>
                                <?php

                            }
                        }else{
                            echo __("ERR_CANNOT_CONNECT_SERVER");
                        }?>
                    </div>
                </div>
                <div class="col-1-2">
                    <div class="content">
                        <h3>Kết quả</h3>
                        <div id="solrIndexResult">

                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>



        </div>
</div>
</div>
