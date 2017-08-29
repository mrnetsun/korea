<div class="main">
    <div class="shell">
        <div class="grid">
            <div class="">
<?php
    //echo ajax_link('cronjob/weather/updateWeather','<i class="icon-refresh"></i> '.__('LBL_UPDATE_WEATHER'),array('class'=>'btn btn-success','callBack'=>'cronjobController.weatherCallBack'));
?>
                <a class="btn btn-success" onclick="cronjobController.prepareWeather()"><?php echo '<i class="icon-refresh"></i> MSN Update';?></a>

            </div>



            <div class="border" style="margin: 10px 0px; padding: 10px;">
                <div class="col-1-2">
                    <div class="content" >

                        <?php foreach($location as $k=>$item){
                            ?>

                                    <div class="col-1-12"><?php echo $k+1?></div>
                                    <div class="col-5-12">
                                        <?php  echo ajax_link('cronjob/weather/getLocationWeather/'.$item->id,$item->location,array('class'=>'','callBack'=>'cronjobController.weatherCallBack')); ?>
                                    </div>

                            <?php
                        }?>

                    </div>
                </div>
                <div class="col-1-2">
                    <div class="content">
                        <h3>Kết quả</h3>
                        <div id="weatherResult">

                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>



        </div>
</div>
</div>
