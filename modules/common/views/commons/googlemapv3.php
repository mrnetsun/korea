<?php $MAP_OBJECT = new GoogleMapAPI('select'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>Google Map</title>
<?php echo $MAP_OBJECT->printHeaderJS();?>
<?php 
echo js('jquery.min.js');
echo css('forms.css');
echo css('bootstrap/css/bootstrap.css','',1);
echo css('bootstrap/css/bootstrap-responsive.css','',1);
if(!$latlong){
	$latlong = IP2Geo();
}else{
	$latlong = explode(LATLONG_SPLIT,$latlong);
	$latlong = array('lat'=>$latlong[0],'long'=>$latlong[1]);
}
?>
<style type="text/css">
	html {
	margin: 0;
	padding: 0;
	}
body { 
	font: 75% arial, sans-serif;
	line-height: 1.88889;
	color: #555753; 
	background: #fff url(blossoms.jpg) no-repeat bottom right; 
	margin: 0; 
	padding: 0;
	}
p { 
	margin-top: 0; 
	text-align: justify;
	}
h3 { 
	font: italic normal 1.4em georgia, sans-serif;
	letter-spacing: 1px; 
	margin-bottom: 0; 
	color: #7D775C;
	}
a:link { 
	font-weight: bold; 
	text-decoration: none; 
	color: #B7A5DF;
	}
a:visited { 
	font-weight: bold; 
	text-decoration: none; 
	color: #D4CDDC;
	}
a:hover, a:focus, a:active { 
	text-decoration: underline; 
	color: #9685BA;
	}
.googleMap {
    border: 1px solid #CCCCCC;
    padding: 3px;
}

.infoMarker{ margin:10px 0px;}
#glat, #glong{ width:70px; display:inline-block;}
</style>
<body>

<?php 
$MAP_OBJECT->setZoomLevel(14);
$MAP_OBJECT->setWidth(550);
$MAP_OBJECT->setHeight(320);
$MAP_OBJECT->enableLocalSearch();
$MAP_OBJECT->buttonClose = true;

$MAP_OBJECT->maker_draggable = true;


//$MAP_OBJECT->center_lat = $latlong['lat'];
//$MAP_OBJECT->center_lon= $latlong['long'];
$lat = number_format($latlong['lat'], 6, '.', '');
$lon = number_format($latlong['long'], 6, '.', '');
$html = '<b>Lat:</b> ' . $lat . '<br /><b>Long:</b> ' . $lon . '<br/><br/><button type="button" class="button button-orange" onclick="returnGeo('.$lat.','.$lon.');" ><?php echo __("Get location!")?></button>';
$marker_id = $MAP_OBJECT->addMarkerByCoords($latlong['long'],$latlong['lat'],'C',$html,'Tooltip');
//$MAP_OBJECT->addMarkerOpener($marker_id, 'openWindowMarker_id');
//$MAP_OBJECT->addMarkerByAddress('Hanoi,VN');

$MAP_OBJECT->_onloadCustomerCode = "\r\n google.maps.event.addListener(map".$MAP_OBJECT->map_id.", 'click', function(event) {   						
   					  markersselect[0].setPosition(event.latLng);
   					  lat = markersselect[0].getPosition().lat().toFixed(5);
					  lon = markersselect[0].getPosition().lng().toFixed(5);
					  
			          showAddress(markersselect[0].getPosition());
			          
				});

				google.maps.event.addListener(markersselect[0], 'dragend', function () {
					  lat = markersselect[0].getPosition().lat().toFixed(5);
					  lon = markersselect[0].getPosition().lng().toFixed(5);
					  
			          showAddress(markersselect[0].getPosition());
			     });

			   google.maps.event.addListener(markersselect[0], 'click', function () {
					  lat = markersselect[0].getPosition().lat().toFixed(5);
					  lon = markersselect[0].getPosition().lng().toFixed(5);
					  				  
			          showAddress(markersselect[0].getPosition());
			          
			     });
			     
			     
			  
";

$MAP_OBJECT->callBackSearch = " 
					  markersselect[0].setPosition(geoCoder.firstItem.geometry.location);
					  lat = geoCoder.firstItem.geometry.location.lat().toFixed(5);
					  lon = geoCoder.firstItem.geometry.location.lng().toFixed(5);
					  showAddress(markersselect[0].getPosition()); ";

?>
<?php echo $MAP_OBJECT->getMapJS('var poly; var geodesicPoly;');?>
<?php echo $MAP_OBJECT->printOnLoad();?>
<?php echo $MAP_OBJECT->printMap();?>
<script>
	function showAddress(location){
		$('#glat').html(location.lat().toFixed(5));
		$('#glong').html(location.lng().toFixed(5)) ;
		
		geoCoder.geocode({'latLng': location}, function(results, status) {
			
		    if (status == google.maps.GeocoderStatus.OK) {
		    	if (results[0]) {		    			
		    			$('#gaddress').html(results[0].formatted_address);
		    					    			
		    	}
		    }else{
		    	$('#gaddress').html('No address found.');	
			}
		    infowindow.setContent('<b>Lat:</b> ' + lat + '<br /><b>Long:</b> ' + lon + '<br/><div><span style=\'display:table-cell;\'>Address:</span><b id=\'windowAddress\' style=\'width:200px;display:table-cell;\'>'+$('#gaddress').html()+'</b></div><br/><button type=\"button\" class=\"button button-orange\" onclick=\"returnGeo('+lat+','+lon+');\" ><?php echo __("Get location!")?></button>');
		    infowindow.open(map<?php echo $MAP_OBJECT->map_id?>,markersselect[0]);
		});

		
		
	}
	function returnGeo(lat,long){
		parent.Common.selectGEO('<?php echo $input;?>',lat.toFixed(5)+'<?php echo LATLONG_SPLIT?>'+long.toFixed(5),'<?php echo $preview;?>');

		/*try {
			BootstrapDialog.closeAll();
		}
		catch (err) {}*/
	}
	$(document).ready(function(){
		<?php if($address){
			echo "var address = parent.Common.getElementVal('$address');
				if(address){
					$('#".$MAP_OBJECT->map_id."_inputAddress').val(address);
					$('#".$MAP_OBJECT->map_id."_submitSearch').trigger('click');
				}
			";
		}?>
	});
	
</script>
<div class="infoMarker">
	Lat: <b id="glat"><?php echo $lat?></b> Long: <b id="glong"><?php echo $lon?></b><br>Address: <b id="gaddress"><?php echo $MAP_OBJECT->getAddressFromLatLong($lat,$lon)?></b>
</div>
</body>
</html>