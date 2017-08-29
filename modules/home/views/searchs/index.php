<div class="container ">

        <h3 class="booking-title">
            <?php
            if($total) {
                echo __("LBL_RESULT_FOR") ?>
                <?php echo $keyword;
                if ($location) {
                    echo __("LB_AT_LOCATION");
                    echo $location;
                }
            }else{
                echo sprintf(__('LBL_RESULT_NOT_FOUND_FOR'),$keyword);
            }
            ?></h3>
    <div class="row">
        <div class="col-md-8">
            <div class="row">
                <?php echo $company_list;

//                debug($results['response']['docs']);
                ?>
            </div>
        </div>
        <div class="col-md-4">
            <aside class="sidebar-right">
                <div class="sidebar-widget">
                    <div class="googleMap">


                        <div id="map" style="width: 100%; height: 400px;"></div>

                        <script type="text/javascript">

                            var map = new google.maps.Map(document.getElementById('map'), {
                                zoom: 5,
                                center: new google.maps.LatLng(16.042238476794882, 106.79101562500001),
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            });

                            google.maps.Map.prototype.markers = new Array();

                            google.maps.Map.prototype.getMarkers = function() {
                                return this.markers
                            };

                            google.maps.Map.prototype.clearMarkers = function() {
                                for(var i=0; i<this.markers.length; i++){
                                    this.markers[i].setMap(null);
                                }
                                this.markers = new Array();
                            };

                            google.maps.Marker.prototype._setMap = google.maps.Marker.prototype.setMap;

                            google.maps.Marker.prototype.setMap = function(map) {
                                if (map) {
                                    map.markers[map.markers.length] = this;
                                }
                                this._setMap(map);
                            }

                        </script>
                    </div>
                </div>

                <div class="sidebar-widget">
                    <div class=" banner_search2">
                        <?php echo page_banner('SEARCH2')?>
                    </div>
                </div>

                <div class="sidebar-widget rightFeature">
                    <ul class="booking-list ">
                        <?php foreach($feature_company as $item){
//                    debug($item);
                            ?>
                            <li  class="feature_item">
                                <div class="content">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <div class="feature_logo">
                                                <?php echo anchor('doanh-nghiep/'.$item->Slug,base_img($item->Company_Logo),array('class'=>'hover-img'));?>
                                            </div>
                                        </div>
                                        <div class="col-xs-8">
                                            <h5 class="item-title"><?php echo anchor('doanh-nghiep/'.$item->Slug,$item->name,array('class'=>'linkGray'))?></h5>
                                            <?php
                                            $rate = json_decode($item->Rate);
                                            echo page_star($rate->Value,$rate->Total);?>
                                            <div class="clear cateName">
                                                <?php $category = json_decode($item->Categories);
                                                if($category[0]){
                                                    echo anchor('nganh-nghe/'.to_slug($category[0]),$category[0]);
                                                }
                                                ?>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </li>
                        <?php }?>
                    </ul>
                </div>
            </aside>

        </div>
    </div>

</div>
<div class="gap"></div>