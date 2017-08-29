<!-- TOP AREA -->
 <div class="top-area show-onload " >
    <div class="bg-holder full">
        <div class="bg-mask"></div>
        <div class="bg-parallax" style="background-image:url(<?php  echo THEME_PATH.$userCurrentTheme; ?>images/slide/<?php echo rand(1,7)?>.jpg);"></div>
        <div class="bg-content boxSearchBg">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="search-tabs search-tabs-bg mt50">
                            <h1 style='font-size:36px;'><?php echo $greeting->messsage;?></h1>
                            <?php if(!empty($team)){
                                echo page_top_member($team);
                            }else{
                                ?>
                                <div class="col-md-7">
                                <div class="testimonial">
                                    <div class="testimonial-inner">
                                        <blockquote>
                                            <?php
                                                echo getDBConfig('EXTRA_TIP');
                                            ?>
                                        </blockquote>
                                    </div>
                                    <div class="testimonial-author">
                                        <?php echo base_img('asset/viethan.jpeg',array('width'=>50,'height'=>50))?>
                                        <p class="testimonial-author-name"><span style="color: #fff; font-size: 1.2em;">Ban biên tập</span><br>
                                        <span style="color: yellow;"><i class="fa fa-mobile"></i> 0986 188787</span>
                                        </p>
                                    </div>
                                </div>
                                </div>
                                <?php
                            }?>
                        </div>
                    </div>

                <div class="col-md-4">
                    <div class="loc-info text-right hidden-xs hidden-sm">
                        <?php
                        if($weather){
                            //echo $weather->detail->style;
                            $weatherToday = $weather->detail->value[0];

                            $key = date("g");
                            if(date("a")=='am'){
                                $key.='s';
                            }else{
                                $key.='c';
                            }

                            if($weatherToday->hourly){
                                $hours = $weatherToday->hourly->{$key};
                            }

                            $h = date("G");

                            if($h <= 11){
                                $label = "sáng";
                            }elseif($h > 11 && $h <=13){
                                $label = "trưa";
                            }elseif($h > 13 && $h <= 18){
                                $label = "chiều";
                            }elseif($h > 18 && $h < 22){
                                $label = "tối";
                            }elseif($h > 22){
                                $label = "đêm";
                            }

                            if(empty($hours)){
                                $hours = new stdClass();
                                $hours->label =  __('LBL_TODAY').','.$weatherToday->label.' '.date("d/m/Y");
                                $hours->description = $weatherToday->description;
                                $hours->icon = $weatherToday->icon;
                                $hours->high = '';
                                if(intval($weatherToday->low)>0) $hours->high.= $weatherToday->low.'-';
                                $hours->high .= $weatherToday->high;
                            }else{
                                $hours->label = date("g").' giờ '.$label;
                            }
                        ?>
                        <div class="row">
                            <div class="col-md-9" style="padding-right: 0px;">
                                <h3 class="loc-info-title"><a style="color: #fff;;" href="<?php echo site_url('home/weather')?>#<?php echo to_slug($weather->location);?>"><?php echo $weather->location;?></a></h3>
                                <div class="loc-info-weather">
                                    <div class="loc-info-weather-num" style="font-size: 0.9em;"><?php echo $hours->label;?></div>
                                    <div class="loc-info-weather-num" style="font-size: 1.1em;"><?php echo $hours->description;?></div>
                                </div>
                            </div>
                            <div class="col-md-3" style="padding-left: 10px;">
                                <div class="icon_weather">
                                <?php echo $hours->icon;?>
                                </div>
                                <div class="h10"></div>
                                <div class="loc-info-weather-num" style="text-align:center;font-size:<?php echo (intval($weatherToday->low)>0)?'1.5em':'1.7em'?>;"><?php
                                    echo $hours->high;
                                    ?></div>
                            </div>
                        </div>
                        <?php } ?>
                        <ul class="loc-info-list">
                            <?php
                            foreach($news as $new){
                                echo '<li>'.anchor('ban-tin/'.$new->slug,'<i class="fa  fa-star-o"></i> '.tokenTruncate($new->title,53)).'</li>';
                            }
                           ?>

                        </ul><a class="btn btn-white btn-ghost mt10" href="<?php echo site_url('tin-tuc')?>"><i class="fa fa-angle-right"></i><?php echo __("LBL_READ_MORE")?></a>
                        <div class="banner_home_wrap1">
                            <?php echo page_banner('HOMEPAGE1')?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- END TOP AREA  -->

<div class="bg-color text-white">
    <div class="container">
        <div class="gap"></div>
        <h4><i class="fa fa-lightbulb-o" style="color: yellow;"></i> <?php echo __("3STEP_LEARNING_TIP");?></h4>
        <div data-gutter="120" class="row row-wrap">
            <div class="col-md-4">
                <?php $config = getDBConfigObject('SEARCH_ENGINE');?>
                <div class="thumb">
                    <header class="thumb-header"><i class="fa fa-language box-icon-border round box-icon-white box-icon-big"></i>
                    </header>
                    <div class="thumb-caption">
                        <h4 class="thumb-title"><?php echo $config->configName?></h4>
                        <p class="thumb-desc">
                            <?php echo $config->configValue?>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <?php $config = getDBConfigObject('SEARCH_EXACT');?>
                <div class="thumb">
                    <header class="thumb-header"><i class="fa fa-trophy box-icon-border round box-icon-white box-icon-big"></i>
                    </header>
                    <div class="thumb-caption">
                        <h4 class="thumb-title"><?php echo $config->configName?></h4>
                        <p class="thumb-desc">
                            <?php echo $config->configValue?>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <?php $config = getDBConfigObject('SEARCH_EFFECT');?>
                <div class="thumb">
                    <header class="thumb-header"><i class="fa fa-graduation-cap  box-icon-border round box-icon-white box-icon-big"></i>
                    </header>
                    <div class="thumb-caption">
                        <h4 class="thumb-title"><?php echo $config->configName?></h4>
                        <p class="thumb-desc">
                            <?php echo $config->configValue?>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="gap gap-small"></div>
    </div>
</div>
<div class="banner_home_wrap2">
    <?php echo page_banner('HOMEPAGE2')?>
</div>
<?php if(!empty($company_news)){?>
<div class="bg-darken">
<div class="container homeArticle">
    <div class="gap"></div>
    <h2 class="text-center h2upper"><?php echo __("LBL_COMPANY_NEWS")?></h2>
    <div class="gap">
        <div class="row row-wrap">
            <?php foreach($company_news as $item){?>
            <div class="col-md-3 itemArticle">
                <div class="thumb">
                    <header class="thumb-header">
                        <a class="hover-img curved" href="<?php echo site_url("ban-tin/".$item->slug);?>">
                            <?php echo json_img($item->thumbnail)?>
                            <i class="fa fa-plus box-icon-white box-icon-border hover-icon-top-right round"></i>
                        </a>
                    </header>
                    <div class="thumb-caption">
                        <h4 class="thumb-title"><?php echo anchor("ban-tin/".$item->slug,$item->title,array('class'=>'linkGray'));?></h4>
                        <p class="thumb-desc"><?php echo $item->short_description;?></p>
                    </div>
                </div>
            </div>
            <?php }?>
        </div>
    </div>


</div>
</div>
<?php }?>