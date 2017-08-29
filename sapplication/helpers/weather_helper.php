 <?php
 if(!defined('BASEPATH')) {exit('No direct script access allowed');}
 /**
  * @param $url
  * @return array|string
  */
function getWeather($url){
	$aryWeather = array();
	
	$html_string = curl_get_content($url);

	if(!$html_string) return '';
	
	$html = str_get_html($html_string);


	$styles = $html->find('style');
	$style_weather = "";
	foreach($styles as $s){
		
		$sText = $s->innertext;
		if(strpos($sText,'images/icons-numbered')){
			$style_weather = $sText;
			break;
		}
	}

	$style = '<style type="text/css">'.$style_weather.'</style>';
	
	$aryWeather['style'] = $style;

	$weather_days = $html->find('div[id=feed-tabs] li');
//	echo $url;	debug($weather_days);
	foreach($weather_days  as $w){
		$text = $w->innertext;
		
		$doc = new DOMDocument();
		$doc->loadHTML(mb_convert_encoding($text, 'HTML-ENTITIES', 'UTF-8'));
				
		//day label		
		$day_name = $doc->getElementsByTagName('h3');
		$key = getStandardText($day_name->item(0)->textContent);	
		switch(to_slug(strtolower($key))){
			case 't2':
			case 'hai':
				$label = "Thứ Hai";
				break;
			case 't3':
			case 'ba':
				$label = "Thứ Ba";
				break;
			case 't4':
			case 'tu':
				$label = "Thứ Tư";
				break;
			case 't5':
			case 'nam':
				$label = "Thứ Năm";
				break;
			case 't6':
			case 'sau':
				$label = "Thứ Sáu";
				break;
			case 't7':
			case 'bay':
				$label = "Thứ Bảy";
				break;
			case 'cn':
				$label = "Chủ Nhật";
				break;
			case 'h.nay':
				$label = "Hôm Nay";
				break;
			default:
			$label = $key;
		}
		//get date
		$date = $doc->getElementsByTagName('h4');
		$date_label = getStandardText(str_replace("Thg","Tháng ",$date->item(0)->textContent));
		$date = explode(' ',$date_label);
		
		//get icon
		 preg_match_all('#<div class="icon (.*?)"><\/div>#is', $text, $match_icon);
		 $icon = $match_icon[0][0];
		
		//get description
		
		$tmp = $doc->getElementsByTagName('span');
		$description = $tmp->item(0)->textContent;
		 
		//get High Temperature
		$tmp = $doc->getElementsByTagName('strong');
		$high = getStandardText($tmp->item(0)->textContent);
		 
		//get Low Temperature
		$tmp = $doc->getElementsByTagName('span');
		$low = getStandardText(str_replace('T','',$tmp->item(2)->textContent));
		 
		$aryWeather['value'][] = array('label'=>$label,'date'=>$date,'icon'=>$icon,'description'=>$description,'high'=>$high,'low'=>$low);
	};
	
	return $aryWeather;
}

 function getWeatherMSN($url){

	 $aryWeather = array();
	 if(!$url) return '';

	 $html_string = curl_get_content($url);

//	debug($html_string);

	 if(!$html_string) return '';

	 $html = str_get_html($html_string);

	 $aryWeather['style'] = '';

	 $houseList = $html->find('div[id="hrchart"] li');
	 $aryHouse = array();
	 foreach($houseList as $k => $hour){
		 $icon = $hour->find('img',0);
		 $key = $hour->find('p[class="time"]',0);
		 $key = $key->innertext;
		 $description = $icon->attr['title'];
		 $icon = '<img class="image skyimg" title = "'.$description.'" src="'. $icon->attr['src'].'"/>';

		 $temp = $hour->find('p[class="temp"]',0);
		 $high = $temp->innertext;

		 $aryHouse[$key] = array('label'=>$key,'icon'=>$icon,'description'=>$description,'high'=>$high);
	 }

	 $dayList = $html->find('ul[class=forecast-list] li');
	 foreach($dayList as $k => $day){
		 $icon = $day->find('img[class="skyimg"]',0);
		 $label = $day->find('div[class="dt"] span',0);
		 $label = $label->innertext;
		 $date = array(date("j",strtotime($k.' days')),"Tháng ". date("n",strtotime($k.' days')));

		 $description = $icon->attr['title'];
		 $icon = '<img class="image skyimg" title = "'.$description.'" src="'. $icon->attr['src'].'"/>';

		 $temp = $day->find('p');
		 $high = $temp[0]->innertext;
		 $low = $temp[1]->innertext;

		 switch(to_slug(strtolower($label))){
			 case 't2':
			 case 'hai':
				 $label = "Thứ Hai";
				 break;
			 case 't3':
			 case 'ba':
				 $label = "Thứ Ba";
				 break;
			 case 't4':
			 case 'tu':
				 $label = "Thứ Tư";
				 break;
			 case 't5':
			 case 'nam':
				 $label = "Thứ Năm";
				 break;
			 case 't6':
			 case 'sau':
				 $label = "Thứ Sáu";
				 break;
			 case 't7':
			 case 'bay':
				 $label = "Thứ Bảy";
				 break;
			 case 'cn':
				 $label = "Chủ Nhật";
				 break;
			 case 'h.nay':
				 $label = "Hôm Nay";
				 break;
			 default:
				 $label = $key;
		 }

		 $detail = array('label'=>$label,'date'=>$date,'icon'=>$icon,'description'=>$description,'high'=>$high,'low'=>$low);
		 if($k==0){
			 $detail['hourly'] = $aryHouse;
		 }
		 $aryWeather['value'][] = $detail;
	 }

	 return $aryWeather;
 }

function getLocationWeather($location,$date=''){
	$CI = &get_instance();
	if(!$date) $date = date("Y-m-d");
	$CI->db->like('keyword',$location);
	$weather = $CI->db->get_where('weather_detail', array('status' => ACTIVE,'date'=>$date))->row();
	if($weather){
		$weather->detail = json_decode($weather->detail);
	}
	return $weather;
}

//$aryWeather = getWeather($url);
//debug($aryWeather);
