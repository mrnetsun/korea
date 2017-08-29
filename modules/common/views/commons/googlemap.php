<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

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

<title>Google Map</title>
<body>
<?php echo css('forms.css');
if(!$center){
	$latlong = IP2Geo();
}else $latlong = $center;
?>
<script src="http://maps.google.com/maps?file=api&v=2&key=ABQIAAAA-LkP4ZmaDuN17VgCdSpmihS54bqGuHQ6GAn7_3oVUkPj6pvB3BShn1ros_ZOql0LDmawu_l2y2cOQQ" type="text/javascript"></script>
<script language="javascript" defer="true">
		function initializeLatLng() {
			if (GBrowserIsCompatible()) {
				var googleMap = new GMap2(document.getElementById("google_canvas"));
				googleMap.addControl(new GSmallMapControl());
				var center_latlnginput = new GLatLng(<?php echo $latlong['lat']?>, <?php echo $latlong['long']?>);
				googleMap.setCenter(center_latlnginput, 13);
				var marker_latlnginput = new GMarker(center_latlnginput, {draggable: true});
				googleMap.addOverlay(marker_latlnginput);
				GEvent.addListener(marker_latlnginput, "dragend", function() {
					var latlng = marker_latlnginput.getLatLng();
					var lat = latlng.lat();
					var lng = latlng.lng();
					document.getElementById('inputLatLong').value = lat.toFixed(3) + "-" + lng.toFixed(3);
				});
				
			}
		}

		function returnGeo(){
			parent.Common.selectGEO('<?php echo $input;?>',document.getElementById('inputLatLong').value);
		}
		
		if(window.addEventListener) { window.addEventListener("load", initializeLatLng, false); }
		else if(window.attachEvent) { window.attachEvent("onload", initializeLatLng); }
</script>
<div id="google_canvas" style="margin-top: 2px; height: 340px; width: 710px;"></div>
<div style="margin-top:10px;">
Latitude/Longitude: <input type="text" name="latlong" id="inputLatLong" value="40.737/-73.994" readonly/>
<input type="button" class="button button-blue" value="<?php echo __("Select")?>" onclick="returnGeo();"/>
<input type="button" class="button button-gray" value="<?php echo __("Close")?>" onclick="parent.Common.closeOverlay();"/>
</div>
</body>
</html>
