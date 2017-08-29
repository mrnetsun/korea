<div class="container">
    <div class="booking-item-details">
        <header class="booking-item-header">
            <div class="row">
                <div class="col-md-9">
                    <h1><?php echo __("LBL_BY_KEYWORD");?>: <?php echo $slug;?></h1>
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

                    <div class="row banner_news2">
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
                    <div class="row banner_news3">
                        <?php echo page_banner('NEWS3')?>
                    </div>
                </div>
            </aside>




        </div>
    </div>
</div>
