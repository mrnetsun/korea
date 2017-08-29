<div class="container">
    <div class="booking-item-details">
        <header class="booking-item-header">
            <div class="row">
                <div class="col-md-9">
                    <h1><?php echo __("LBL_NEWS");?></h1>
                </div>
                <div class="col-md-3">
                    <div class="today"><?php echo today()?></div>
                </div>
                </div>
        </header>
    </div>

</div>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="row article post">
                <div class="col-md-9">
                     <!--feature -->
                      <?php
                        if(!empty($feature)){
                        ?>
                    <div class="row">
                        <div class="col-md-8">
                            <?php
                                if($feature[0]->thumbnail){
                                    echo ' <a class="hover-img curved" href="'.site_url('ban-tin/'.$feature[0]->slug).'">'.json_img($feature[0]->thumbnail).'<i class="fa fa-plus box-icon-white box-icon-border hover-icon-top-right round"></i></a>';

                                    echo '<div class="gap-mini"></div>';
                                }
                            ?>
                            <h4>
                            <?php
                                echo anchor('ban-tin/'.$feature[0]->slug,$feature[0]->title);
                            ?>
                            </h4>
                            <ul class="post-meta">
                                <li><i class="fa fa-tag"></i><?php echo anchor('tin-tuc/'.$feature[0]->cate_slug,$feature[0]->cate_name,array('class'=>'linkGray upper'));?></li>
                                <li><i class="fa fa-calendar"></i><a>
                                        <?php echo display_time_ago($feature[0]->createdTime);?>
                                </a>
                                </li>
                                <li><i class="fa fa-user"></i><?php echo anchor('tac-gia/'.to_slug($feature[0]->author),$feature[0]->author);?>
                                </li>
                            </ul>
                            <div>
                                <?php echo $feature[0]->short_description; ?>
                            </div>
                            <h4>
                                <?php
                                echo anchor('ban-tin/'.$feature[1]->slug,$feature[1]->title);
                                ?>
                            </h4>
                            <ul class="post-meta">
                                <li><i class="fa fa-tag"></i><?php echo anchor('tin-tuc/'.$feature[1]->cate_slug,$feature[1]->cate_name,array('class'=>'linkGray upper'));?></li>
                                <li><i class="fa fa-calendar"></i><a>
                                        <?php echo display_time_ago($feature[1]->createdTime);?>
                                    </a>
                                </li>
                                <li><i class="fa fa-user"></i><?php echo anchor('tac-gia/'.to_slug($feature[1]->author),$feature[1]->author);?>
                                </li>
                            </ul>
                            <div>
                                <?php echo $feature[1]->short_description; ?>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <?php
                            for($i=2;$i<count($feature);$i++){
                                ?>
                                <?php
                                if($feature[$i]->thumbnail)echo ' <a class="hover-img curved" href="'.site_url('ban-tin/'.$feature[$i]->slug).'">'.json_img($feature[$i]->thumbnail).'<i class="fa fa-plus box-icon-white box-icon-border hover-icon-top-right round"></i></a>';;
                                ?>
                                <h6><?php echo anchor('ban-tin/'.$feature[$i]->slug,$feature[$i]->title)?></h6>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                            <?php
                        }
                      ?>
                     <!--end feature -->
                    <hr>
                    <div class="row banner_news1">
                        <?php echo page_banner('NEWS1')?>
                    </div>
                    <!--list -->
                    <a name="captchaAnchor" id="captchaAnchor"></a>
                    <div id="articleListWrap">

                    <?php
                    if(!empty($article_list)){
                       echo $article_list;
                    }
                    ?>

                    </div>
                    <!--end list -->


                </div>
                <div class="col-md-3 no-print">

                    <h4><?php echo __("LBL_LATEST_NEWS")?></h4>
                    <ul class="thumb-list">
                        <?php foreach($latest as $k=>$item){  ?>
                            <li>
                                <div class="thumb-list-item-caption">

                                    <h5 class="thumb-list-item-title"><a href="<?php echo site_url('ban-tin/'.$item->slug)?>"><?php echo $item->title?></a></h5>
                                    <p class="thumb-list-item-meta"><?php echo display_time_ago($item->createdTime)?></p>
                                </div>
                            </li>
                        <?php }?>
                    </ul>

                    <div class="banner_news2">
                        <?php echo page_banner('NEWS2')?>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <aside class="sidebar-right">
                <div class="sidebar-widget">
                    <!-- Search -->
                    <?php echo page_search_article();?>
                </div>
                <div class="sidebar-widget">
                    <!-- Category -->
                    <h4><?php echo __("LBL_CATEGORY")?></h4>
                    <ul class="icon-list list-category">
                        <?php foreach($categories as $item){?>
                            <li>
                                <?php echo anchor('tin-tuc/'.$item->slug,$item->name);?>
                            </li>
                        <?php }?>
                    </ul>
                </div>
                <div class="sidebar-widget">
                    <!-- Top Hist -->
                    <h4><?php echo __("LBL_TOP_HIT")?></h4>
                    <ul class="thumb-list">
                        <?php foreach($topView as $item){  ?>
                            <li>
                                <a href="<?php echo site_url('ban-tin/'.$item->slug)?>">
                                    <?php echo json_img($item->thumbnail)?>
                                </a>
                                <div class="thumb-list-item-caption">

                                    <h5 class="thumb-list-item-title"><a href="<?php echo site_url('ban-tin/'.$item->slug)?>"><?php echo $item->title?></a></h5>
                                    <p class="thumb-list-item-meta"><?php echo display_time_ago($item->createdTime)?></p>
                                </div>
                            </li>
                        <?php }?>
                    </ul>
                </div>
                <div class="sidebar-widget">
                    <div class="banner_news3">
                <?php echo page_banner('NEWS3')?>
                    </div>
                </div>
            </aside>




        </div>
    </div>
</div>
