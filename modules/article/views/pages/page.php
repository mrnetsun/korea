<div class="container">
    <div class="booking-item-details">
        <header class="booking-item-header">
            <div><?php echo anchor('tin-tuc/'.$page->cate_slug,$page->cate_name,array('class'=>'post-category text-gray'));?></div>
            <h1><?php echo $page->title;?></h1>
        </header>
    </div>

</div>
<div class="container ">
    <div class="row">
        <div class="col-md-9">
            <div class="row article post articleDetail">
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-md-10">
                        <ul class="post-meta">
                            <li><i class="fa fa-calendar"></i><a>
                                    <?php echo date("H:i A",strtotime($page->createdTime)).' '.__(date("l",strtotime($page->createdTime))).' '.__("LBL_DATE").' '.date("d/m/Y",strtotime($page->createdTime));?>

                                </a>
                            </li>
                            <?php if($page->author){?>
                            <li><i class="fa fa-user"></i><a href="<?php echo site_url('tac-gia/'.to_slug($page->author))?>"><?php echo $page->author?></a>
                            </li>
                            <?php }?>
                        </ul>
                        </div>
                        <div class="col-md-2 no-print">
                        <?php echo button_print();?>
                        </div>
                    </div>
                    <h2 class="short_description">
                        <?php echo $page->short_description;?>
                    </h2>
                    <?php echo json_img($page->thumbnail);?>
                    <?php if($page->thumbnail_caption){

                        echo "<div class='thumbnail_caption'>".$page->thumbnail_caption."</div>";
                    }?>

                    <?php echo $page->full_content;?>

                    <?php
                        if($page->author_site){
                            echo "<div class='gap-mini'></div><div class='author_site'>".__("LBL_FOLLOW_UP").' <strong>'.$page->author_site.'</strong></div><div class=\'gap-mini\'></div>';
                        }
                    ?>
                    <div class='gap'></div>
                    <div class="postTag">
                        <?php
                        if($page->tags){
                            echo page_tags('tu-khoa/',$page->tags);
                        }

                        ?>
                    </div>
                    <div class="gap-mini"></div>

                    <div class="postComment">
                        <?php echo page_comment();?>
                    </div>

                    <div class="gap-mini"></div>
                </div>
                <div class="col-md-3 no-print">
                    <h4><?php echo __("LBL_TOP_HIT")?></h4>
                    <ul class="thumb-list">
                        <?php foreach($topView as $k=>$item){  ?>
                            <li>
                                <?php if($k ==0){?>
                                <a class="articleThumb" href="<?php echo site_url('ban-tin/'.$item->slug)?>">
                                    <?php echo json_img($item->thumbnail)?>
                                </a>
                                <?php }?>
                                <div class="thumb-list-item-caption">

                                    <h5 class="thumb-list-item-title"><a href="<?php echo site_url('ban-tin/'.$item->slug)?>"><?php echo $item->title?></a></h5>
                                    <p class="thumb-list-item-meta"><?php echo date("d/m/Y",strtotime($item->createdTime))?></p>
                                </div>
                            </li>
                        <?php }?>
                    </ul>
                    <div class="gap"></div>
                    <h4><?php echo __("LBL_LATEST_NEWS")?></h4>
                    <ul class="thumb-list">
                        <?php foreach($latest as $k=>$item){  ?>
                            <li>
                                <?php if($k ==0){?>
                                    <a class="articleThumb" href="<?php echo site_url('ban-tin/'.$item->slug)?>">
                                        <?php echo json_img($item->thumbnail)?>
                                    </a>
                                <?php }?>
                                <div class="thumb-list-item-caption">

                                    <h5 class="thumb-list-item-title"><a href="<?php echo site_url('ban-tin/'.$item->slug)?>"><?php echo $item->title?></a></h5>
                                    <p class="thumb-list-item-meta"><?php echo date("d/m/Y",strtotime($item->createdTime))?></p>
                                </div>
                            </li>
                        <?php }?>
                    </ul>
                </div>
            </div>


        </div>
        <div class="col-md-3 no-print">
            <aside class="sidebar-right">
                <div class="sidebar-widget">
                    <!-- Search -->
                    <?php
                        echo page_search_article();
                    ?>
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
                    <!-- Banner -->
                    <div class="banner_article1"
                    <?php echo page_banner('ARTICLE1')?>
                </div>
                </aside>
        </div>
    </div>

</div>
