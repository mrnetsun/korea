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
<body>
<?php 
echo css('forms.css');
echo js('','gmapclient');
if(!$latlong){
	$latlong = IP2Geo();
}else{
	$latlong = explode('-',$latlong);
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
</style>

<form action="#" onsubmit="showAddress(this.address.value); return false" method="POST" id="formselectgoogle">  
    <label>{t}Search by Address or by Coordinates (lat. & long.) for better accuracy.{/t}</label><br />
    <input type="text"  size="60" name="address" value="" id="getaddress" />
    <input type="submit" value="<?php echo __("Search!")?>" class="button button-blue" id="viewlocation" /> 
    <input type="button" class="button button-gray" value="<?php echo __("Close")?>" onclick="parent.Common.closeOverlay();"/>
</form>
<div id="map" style="width: 730px; height: 400px"></div>
<div id="geo" style="width: 300px;position: absolute;left: 620px;top: 100px;" class="tekst"></div>

<script type="text/javascript">
	var geocoder = new GClientGeocoder();
	var setLat = 1.352083;
	var setLon = 103.819836;   
    var markers = [];
	
	function showAddress(address) {
      if(geocoder) {
        geocoder.getLatLng(
          address,
          function(point) {
            if (!point) {
              LBL_DISPLAY_TO(address + " not found");
            } else { 
                var latlngStr = address.split(',', 2);
                if(latlngStr[1]){
                    if(isNaN(latlngStr[1])){
                        var lat = point.lat();
                        var lng = point.lng();
                    }else{
                        var lat = parseFloat(latlngStr[0]);
                        var lng = parseFloat(latlngStr[1]);                          
                    }                
                }else{
                    var lat = point.lat();
                    var lng = point.lng();                      
                }               
                placeMarker(lat, lng);
            }
          }
        );
      }
    }
	function argItems (theArgName) {
		sArgs = location.search.slice(1).split('&');
    		r = '';
    		for (var i = 0; i < sArgs.length; i++) {
        		if (sArgs[i].slice(0,sArgs[i].indexOf('=')) == theArgName) {
            			r = sArgs[i].slice(sArgs[i].indexOf('=')+1);
            			break;
        		}
    		}
    	return (r.length > 0 ? unescape(r).split(',') : '')
	}
	
	
	function getCoordForAddress(response) {
	
		if (!response || response.Status.code != 200) {
	        LBL_DISPLAY_TO("{t}Sorry, we were unable to geocode that address{/t}");
	    } else {
			place = response.Placemark[0];
			setLat = place.Point.coordinates[1];
			setLon = place.Point.coordinates[0];
			setLat = setLat.toFixed(6);
			setLon = setLon.toFixed(6);

		}
		placeMarker(setLat, setLon)
    }
	
	
	function placeMarker(setLat, setLon) {
	
		var message = "geotagged geo:lat=" + setLat + " geo:lon=" + setLon + " ";		
		var messageRoboGEO = setLat + ";" + setLon + ""; 

		var map = new GMap(document.getElementById("map"));
		map.addControl(new GSmallMapControl()); // added		
		map.centerAndZoom(new GPoint(setLon, setLat), 3);
		
		var point = new GPoint(setLon, setLat);
		var marker = new GMarker(point);
		map.addOverlay(marker);
        if(point) {
			map.recenterOrPanToLatLng(point);
			var marker = new GMarker(point);
			map.addOverlay(marker);
			var matchll = /\(([-.\d]*), ([-.\d]*)/.exec( point );
			if( matchll){
				var lat = parseFloat( matchll[2] );
				var lon = parseFloat( matchll[1] );
				lat = lat.toFixed(6);
				lon = lon.toFixed(6);
				var message = '<b>{t}Lat:{/t} </b>' + lat + '<br /><b>{t}Long:{/t} </b>' + lon + '<br/><br/><button type="button" class="button button-orange" onclick="returnGeo('+lat+','+lon+');" >{t}Get location!{/t}</button>'; 
				var messageRoboGEO = lat + ";" + lon + ""; 
            }else { 
				var message = "<b>Error extracting info from</b>:" + point + ""; 
				var messagRoboGEO = message;
			}
			marker.openInfoWindowHtml(message);
		}   
		GEvent.addListener(map, 'click', function(overlay, point) {  
            if (overlay) {
				map.clearOverlays();        
            }else{
				map.clearOverlays();
                createMarker(point,map);
            }
            
		});
	}
    // Creates a marker whose info window displays the letter corresponding
    // to the given index.
    function createMarker(point,map) {        
		var marker = new GMarker(point);
		map.addOverlay(marker);
        var matchll = /\(([-.\d]*), ([-.\d]*)/.exec( point );     
		var lat = parseFloat( matchll[1] );
		var lon = parseFloat( matchll[2] );
		lat = lat.toFixed(6);
		lon = lon.toFixed(6);
		var message = '<b>{t}Lat:{/t} </b>' + lat + '<br /><b>{t}Long:{/t} </b>' + lon + '<br/><br/><button type="button" class="button button-orange" onclick="returnGeo('+lat+','+lon+');" >{t}Get location!{/t}</button>'; 
		var messageRoboGEO = lat + ";" + lon + "";                                      
        marker.openInfoWindowHtml(message);
        return marker;
    }               	
	function peviewImage(lat,lng){		
		var urlString = ['http://maps.googleapis.com/maps/api/staticmap?size=305x100&maptype=roadmap&markers=color:red|label:C|'];
		var markerString = [];
		for (var i = 0; i < 1; i++) {
			markerString.push(lat + ',' + lng );
		}
		urlString.push(markerString.join('|'));		
		document.getElementById('<?php echo $input;?>_preview').html('<img src="'+ urlString.join('') +'&sensor=false&zoom=14" />');
	}
	
	function findAddress() {
		myAddress = document.getElementById("address").value;
		geocoder.getLocations(myAddress, getCoordForAddress);
	
	}

	function returnGeo(lat,long){
		parent.Common.selectGEO('<?php echo $input;?>',lat.toFixed(3)+'-'+long.toFixed(3));
	}


	if(argItems("lat") == '' || argItems("lon") == '') {	  
	        setLat = <?php echo $latlong['lat']; ?>;
            setLon = <?php echo $latlong['long']; ?>;     
         
	   placeMarker(setLat, setLon);
    } else {
		var setLat = parseFloat( argItems("lat") );
		var setLon = parseFloat( argItems("lon") );
		setLat = setLat.toFixed(6);
	    setLon = setLon.toFixed(6);
		placeMarker(setLat, setLon);
    }
    //]]>
</script>
</body>
</html>