<?php
$code = strtolower($group->code);
if($group->rotate){
    //slide
    if($banners) {
        ?>
        <div id="banner_carousel_<?php print $code; ?>" class="carousel slide" data-ride="carousel"
             data-interval="5000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <?php foreach ($banners as $k => $v) {
                    $active = ($k == 0) ? 'class="active"' : '';
                    ?>
                    <li data-target="#banner_carousel_<?php print $code; ?>"
                        data-slide-to="<?php echo $k; ?>" <?php echo $active ?>></li>
                <?php } ?>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <?php foreach ($banners as $k => $v) {
                    $active = ($k == 0) ? 'active' : '';
                    $banner_content = '';
                    switch($v->type) {
                        case 1:
                            $image = json_img($v->image);
                            if($v->url){
                                $banner_content = anchor('home/banner/'.$v->banner_id, $image, array('target' => '_blank'));
                            }else{
                                $banner_content = $image;
                            }
                            break;
                        case 2:
                            $banner_content = $v->detail;
                            break;
                        case 3:
                            $banner_content = $v->googleads;
                            break;
                        case 4:
                            $banner_content = $banner->googleads;
                            break;
                    }

                    ?>
                    <div class="item <?php echo $active ?>">
                        <?php echo $banner_content;?>
                    </div>
                <?php } ?>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#banner_carousel_<?php print $code; ?>" role="button" data-slide="prev">
                <span class="fa fa-chevron-left" aria-hidden="true"></span>
                <span class="sr-only"><?php echo __("Previous"); ?></span>
            </a>
            <a class="right carousel-control" href="#banner_carousel_<?php print $code; ?>" role="button" data-slide="next">
                <span class="fa fa-chevron-right" aria-hidden="true"></span>
                <span class="sr-only"><?php echo __("Next"); ?></span>
            </a>
        </div>
        <?php
    }
}else{
    //list
    ?>
    <ul class="bannerWrap banner_<?php echo $code;?>">
        <?php

        foreach($banners as $banner){
            $banner_content = '';
            switch($banner->type) {
                case 1:
                    $image = json_img($banner->image);
                    if($banner->url){
                    $banner_content = anchor('home/banner/'.$banner->banner_id, $image, array('target' => '_blank'));
                    }else{
                        $banner_content = $image;
                    }
                    break;
                case 2:
                    $banner_content = $v->detail;
                    break;
                case 3:
                    $banner_content = $banner->googleads;
                    break;
                case 4:
                    $image = json_decode($banner->image);
                    $banner_content = '<div class="bg-holder">
                        <div class="bg-mask"></div>
                        <div class="bg-parallax" style="background-image:url('.ROOT_URL.$image->real_name.')"></div>
                        <div class="bg-content">
                            <div class="container ">
                                <div class="gap gap-big text-center text-white">
                                    <div class="adContent">
                                    '.$banner->googleads.'
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    ';
                    break;
            }
            ?>
            <li>
                <div><?php echo $banner_content?></div>
            </li>
        <?php }?>
    </ul>

    <?php
}