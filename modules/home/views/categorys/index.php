<div class="container">

    <h3 class="booking-title">
        <?php
        echo $category->name;
        ?></h3>
    <div class="row">
        <div class="col-md-8">
            <div class="row">
                <?php echo $company_list?>
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
                    <div class="banner_com2">
                        <?php echo page_banner('COM2')?>
                    </div>
                </div>
            </aside>

        </div>
    </div>

</div>
<div class="gap"></div>