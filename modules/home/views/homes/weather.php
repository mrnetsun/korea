<div class="gap"></div>
<div class="container">
    <div>
<?php
    echo pageHeader(sprintf('LBL_TILE_WEATHER'));
?>
 <div class="row">
     <div class="col-md-9"> <h4><?php echo sprintf(__("LBL_WEATHER_UPDATE_TIME"),date('d'),date('n'),date('Y'),date('h:i A'))?></h4></div>
    <div class="col-md-9">
        <div>
            <form onsubmit="return false;">
                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group form-group-icon-left"><i class="fa fa-location-arrow input-icon input-icon-hightlight"></i>
                                        <label>Nhập tên Tỉnh /Thành phố</label>
                                        <input type="text" name="location" id="locationFilter" class="form-control" onkeyup="Common.updateFilterList(this,'.booking-list .keyword','.weather-item')" onchange="Common.updateFilterList(this,'.booking-list .keyword','.weather-item')">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="gap gap-small"></div>
        <ul class="booking-list">
            <?php
            foreach($aryWeather as $item){
                $weather = json_decode($item->detail);
//                debug($weather,false);
                if(!empty($weather->value)) {
                    ?>
                    <li class="weather-item">
                        <a name="<?php echo to_slug($item->location); ?>">
                        <div class="keyword hidden"><?php echo $item->location; ?> <?php echo to_slug($item->location); ?> <?php echo $item->keyword?></div>
                        <?php echo $weather->style; ?>
                        <a class="booking-item">
                            <div class="row">
                                <div class="col-md-3 text-center">
                                    <div class="highlight">
                                    <h5 class="booking-item-title"><?php echo $item->location; ?></h5>
                                    <h6><b><?php echo 'Hôm nay<br>'.$weather->value[0]->label; ?></b></h6>
                                    <div class="icon_weather">
                                        <p class="text-small"><?php echo $weather->value[0]->icon; ?></p>
                                    </div>
                                    <p class="text-small"><?php echo $weather->value[0]->description; ?></p>
                                    <p class="text-small">
                                        <?php
                                        if(intval($weather->value[0]->low)){
                                            echo $weather->value[0]->low;
                                            echo " - ";
                                        }
                                         ?>
                                        <?php echo $weather->value[0]->high; ?></p>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <?php for($i=1;$i<5;$i++){
//                                            debug($weather->value[$i]->date);
                                            ?>
                                            <div class="col-md-3 text-center">
                                            <div><?php echo $weather->value[$i]->label; ?></div>
                                            <h6><?php echo 'Ngày '.$weather->value[$i]->date[0].'/'.$weather->value[$i]->date[1]?></h6>
                                            <div class="icon_weather">
                                                <p class="text-small"><?php echo $weather->value[$i]->icon; ?></p>
                                            </div>
                                            <p class="text-small"><?php echo $weather->value[$i]->description; ?></p>
                                            <p class="text-small"><?php echo $weather->value[$i]->low; ?>
                                                - <?php echo $weather->value[$i]->high; ?></p></div>
                                        <?php }?>
                                    </div>
                                </div>

                            </div>
                        </a>
                    </li>
                    <?php
                }
                }?>
        </ul>
    </div>
    <div class="col-md-3">
        <h4>Dự báo thời tiết</h4>
        <p class="mb30">
            Dữ liệu dự báo thời tiết được cập nhật liên tục trong ngày.
        </p>
        <h4>Việt Nam</h4>
        <ul class="weatherLocation mb30 clearfix">
            <?php
            foreach($aryWeather as $item){
                $weather = json_decode($item->detail);
                //                debug($weather,false);
                if(!empty($weather->value)) {
                    echo "<li>".anchor(current_url().'#'.to_slug($item->location),$item->location)."</li>";
                }

            }
            ?>

        </ul>
    </div>
</div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.weatherLocation a').click(function(){
            $('#locationFilter').val('');
            $('.booking-list li').show();
        });
    });

</script>
