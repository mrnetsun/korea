<?php

/**
  * Parse HTML Attributes
  *
  * Turns an array of attributes into a string
  *
  * @access		private
  * @param		array		attributes to be parsed
  * @return		string 		string of html attributes
  */
function _parse_asset_html($attributes = NULL)
{
	$attribute_str = '';

	if(is_string($attributes))
	{
		$attribute_str = $attributes;
	}
	
	else if(is_array($attributes) || is_object($attributes))
	{
		foreach($attributes as $key => $value)
		{
			$attribute_str .= ' '.$key.'="'.$value.'"';
		}
	}

	return $attribute_str;
}

function css($asset_name, $attributes = array(),$type='')
{	
	global $CI;
	$attribute_str = _parse_asset_html($attributes);

	if(!preg_match('/rel="([^\"]+)"/', $attribute_str))
	{
		$attribute_str .= ' rel="stylesheet"';
	}
	if($type =='1'){
		return '<link href="'.STYLES_PATH.$asset_name.'" type="text/css"'.$attribute_str.' />' . "\n";
	}else{
		return '<link href="'.THEME_PATH.$CI->userTheme.'css/'.$asset_name.'" type="text/css"'.$attribute_str.' />' . "\n";
	}
}

function base_img($image_name, $attributes = array(),$default='asset/no-image.jpg'){


	// No alternative text given? Use the filename, better than nothing!
	if(isset($attributes['alt'])) list($attributes['alt']) = explode('.', $image_name);
//	die(FCPATH.$image_name);
	if(strpos($image_name,'http://')=== false && strpos($image_name,'https://')=== false){
		if(!$image_name || !file_exists(FCPATH.$image_name)){
			if($default===0) return;
			else $image_name = $default;
		}
	}
	
	list($width, $height) = @getimagesize($image_name);
	if(!$width) $width=1;
    if(!$height) $height=1;
	
	if(isset($attributes['width']) && isset($attributes['width'])){
		$final_height = $height * ($attributes['width'] / $width);

		if ($final_height > $attributes['height']) {
			$attributes['width'] = $width * ($attributes['height'] / $height);
		} else {
			$attributes['height'] = $final_height;
		}
	}
	
	$attribute_str = _parse_asset_html($attributes);

	if(strpos($image_name,'http://')=== false && strpos($image_name,'https://')=== false){
		$image_name = ROOT_URL.$image_name;
	}

	return '<img src="'.$image_name.'"'.$attribute_str.' />'."\n";
}

function base_document($item,$data = array()){

    if(!is_object($item)){
        $item = json_decode($item);
    }

    $html = '<a class="file_icon" href="'.ROOT_URL.'/'.$item->real_name.'">'.$item->client_name.'</a>';

    return $html;
}

function base_img64($image_name, $attributes = array()){

	// No alternative text given? Use the filename, better than nothing!
	if(isset($attributes['alt'])) list($attributes['alt']) = explode('.', $image_name);

	if(!file_exists($image_name)) $image_name = 'asset/no-image.jpg';

	$size = @getimagesize($image_name);
	$width = $size['width'];
	$height = $size['height'];
	if(!$height) $height=1;
	if(!$width) $width=1;
	
	$mime = $size['mime'];
	$bin = @file_get_contents($image_name);
	

	if(isset($attributes['width']) && isset($attributes['width'])){
		$final_height = $height * ($attributes['width'] / $width);

		if ($final_height > $attributes['height']) {
			$attributes['width'] = $width * ($attributes['height'] / $height);
		} else {
			$attributes['height'] = $final_height;
		}
	}

	$attribute_str = _parse_asset_html($attributes);

	return '<img src="data:'.$mime.';base64,'.base64_encode($bin).'"'.$attribute_str.' />'."\n";
}

function image($image_name, $attributes = array())
{
	global $CI;
	// No alternative text given? Use the filename, better than nothing!
	if(empty($attributes['alt'])) list($attributes['alt']) = explode('.', $image_name);
	
	$attribute_str = _parse_asset_html($attributes);

	return '<img src="'.THEME_PATH.$CI->userTheme.'images/'.$image_name.'"'.$attribute_str.' />'."\n";
}

function img($image_name, $attributes = array()){
	return image($image_name, $attributes);
}

function img_lock($attributes=''){
	return image('icon_lock.png', $attributes);
}

function img_status($status,$url='',$prefix=''){
	if(!$url){
		return '<img src="'.STYLES_PATH.'images/'.$prefix.'icon_'.$status.'.png"/>';
	}else{
		return '<a href="'.$url.'" onclick="return Common.changStatus(this)"><img src="'.STYLES_PATH.'images/'.$prefix.'icon_'.$status.'.png"/></a>';
	}
}

/**
 * 
 * @param url $js_name
 * @param type $type www,theme
 * @return string
 */
function js($js_name='',$type='script')
{
	global $CI;
	switch($type){		
		case 'www':
			$script = '<script type="text/javascript" src="'.$js_name.'"></script>'."\n";
			break;
		case 'theme':
			$script = '<script type="text/javascript" src="'.THEME_PATH.$CI->userTheme.'js/'.$js_name.'"></script>'."\n";
			break;
		default:
			$script = '<script type="text/javascript" src="'.SCRIPTS_PATH.$js_name.'"></script>'."\n";
	}
	return $script;
}

function js_local($filename,$module=''){
	$loadvar = "/$filename.js";
	if($module) $loadvar.= "/$module";
	return '<script type="text/javascript" src="'.site_url("/common/loadjs/".$loadvar).'"></script>'."\n";
}

function css_local($filename,$module=''){
	$loadvar = "/$filename.css";
	if($module) $loadvar.= "/$module";
	return '<script type="text/javascript" src="'.site_url("/common/loadcss".$loadvar).'"></script>'."\n";
}

function endcodePath($strJSPath){
	return str_replace('/','-',$strJSPath);	
}

function decodePath($strJSPath){
	return str_replace('-','/',$strJSPath);	
}

function getIP(){
	if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	} else {
		$ip = $_SERVER['REMOTE_ADDR'];
	}

	return $ip;
}

function js_content($js_name) {
	return file_get_contents(SCRIPTS_PATH . $js_name);
}

function css_content($css_name) {
	return file_get_contents(STYLES_PATH . $css_name);
}


function random_password($length = 8) {
	//settings
	$chars="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
    $randomword ='';
	//rest of script
	$escapecharplus=0;
	while ($escapecharplus < $length)
	{
		$randomword .= $chars[mt_rand(1, strlen($chars)-1)];
		$escapecharplus += 1;
	}
	
	return $randomword;
}

function send_text_mail($from, $to, $bcc, $subject, $text, $reply=false) {

	if (!$reply) $reply = $from;

	// headers
	$headers = '';
	$headers .= 'From: "'.$from.'" <'.$from.'>'."\n";
	$headers .= "Reply-To: ".$reply."\n";
	$headers .= "Return-Path: <".$reply.">\n";
	$headers .= "X-Sender: <".$from.">\n";
	if ( $bcc ) $headers .= 'BCC: "'.$bcc.'" <'.$bcc.'>'."\n";
	$headers .= "X-Mailer: PHP\n";
	$headers .= "X-Priority: 3\n";
	$headers .= "Content-Type: text/plain; charset=\"UTF-8\"\n";
	
	return mail_utf8($to, $subject, $text, $headers);
}

function mail_utf8($to, $subject = '(No subject)', $message = '', $header = '') {
	$header_ = 'MIME-Version: 1.0' . "\r\n" . 'Content-type: text/plain; charset=UTF-8' . "\r\n";
	return mail($to, '=?UTF-8?B?'.base64_encode($subject).'?=', $message, $header_ . $header);
}

function isEmail($email) {
	return preg_match('|^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]{2,})+$|i', $email);
};


function accessDenied(){
	redirect('common/accessdenied');
}

function ajax_link($url,$title,$params = array()){

    $overlay = ($params['overlay'])? 'overlay:true,':'';
    $Callback = ($params['callBack'])?',callBack:'.$params['callBack'].'':'';
    $tooltip = ($params['tooltip'])? 'rel="tooltip"':'';
	$messageConfirm = ($params['messageConfirm'])? $params['messageConfirm']:'';
	if( !empty( $messageConfirm )){
		$link = '<a title="'.__($params['title']).'" '.$tooltip.' class="pointer '.$params['class'].'"
   			onclick="return Common.linkSetup2(this,{ajax:true,'.$overlay.'title:\''.strip_tags(__($params['overlay'])).'\'';
		$link.= $Callback;
		$link.=',messageConfirm:'."'$messageConfirm'".'})" data-url="'.site_url($url).'">'.$title.'</a>';
	}else{
		$link = '<a title="'.__($params['title']).'" '.$tooltip.' class="pointer '.$params['class'].'"
   			onclick="return Common.linkSetup(this,{ajax:true,'.$overlay.'title:\''.strip_tags(__($params['overlay'])).'\'';
		$link.= $Callback;
		$link.='})" data-url="'.site_url($url).'">'.$title.'</a>';
	}

    return $link;
}

function img_ajax($id='',$img = "loadinfo.gif",$param=array()){

	$width= ($param['width'])?$param['width']:'18px';
	$height= ($param['height'])?$param['height']:'18px';
	$display = (!is_null($param['display']))?$param['display']:'none';

    return '<img id="'.$id.'"  class="ajaxImage" style="display:'.$display.'; width:'.$width.'; height:'.$height.';" src="'.ROOT_URL.'styles/images/'.$img.'"/>';
}

function json_img($json,$data = array(),$link=''){
    $image = json_decode($json);

    $str = '';
    if(is_array($image)){
        foreach($image as $img){
            $img = json_decode($img);
            $str .= base_img($img->real_name,$data);
        }
    }else{
        $str .= base_img($image->real_name,$data);
    }

	if($link){
		$str = anchor($link,$str);
	}
    return $str;
}

function json_document($json,$data = array()){
    return base_document($json,$data);
}

function json_documents($json,$data = array()){
    $documents = json_decode($json);
    $html = '';
    foreach($documents as $item){
        $html.= base_document($json,$data);
    }
    return $html;
}

function upload_task_document($name,$params = array()){
    $html = '';

    $input_name = uniqid( $name.'_');

    $params['data']['file_type'] = 'document';

    $uploadfile = ($params['config'])?$params['config']:'uploadfile';

    $url = site_url('doing/task/uploadAttachment');

    if($params['label']){
        $html.='<div class="control-group"><label class="control-label">'.__($params['label']).'</label><div class="controls ">';
    }
    $html.= '<a id="'.$name.'_upload" title="Upload" rel="tooltip" class="'.$params['class'].'"><i class="icon-plus-sign"></i></span></a>';

    if(!$params['preview']){
        $html.='<div class="clear"><div id="'.$name.'_documentPreview" class="documentInputUpload">';
        $html.='</div></div>';
    }

    $divPreview =($params['preview']) ? $params['preview'] : $name.'_documentPreview';

    $html.= '<script type="text/javascript">
		$(function(){


		var btnUpload=$("#'.$name.'_upload");
		new AjaxUpload(btnUpload, {
			action: "'.$url.'",
			name: "'.$uploadfile.'",
			onSubmit: function(file, ext){';
    if($params['data']) $html.=' this.setData('.json_encode($params['data']).');';
    $html.= '},
			onComplete: function(file, response){
				//On completion clear the status
				var data = $.parseJSON(response);
				if(data.ok){
                    $("#taskAttachment_'.$params['task_id'].'").load("'.site_url('doing/task/loadTaskAttach/'.$params['task_id']).'");
				}else{
					Common.error(data.serror);
				}
			}
		});

	});
	</script>';
    if($params['label']){
        $html.='</div></div>';
    }
    return $html;
}


function isWeekend($date) {
    $weekDay = date('w', strtotime($date));
    return ($weekDay == 0 || $weekDay == 6);
}

function isSunday($date){
    $date = strtolower(date("l", strtotime($date)));
    return ($date == "sunday")?true:false;
}


function pageHeader($title,$params=array()){
	$id = ($params['id'])? 'id="'.$params['id'].'"':'';
	if(!$params['tag']) $params['tag'] = 'H1';
	$html = '<div class="headTitleWrap">
	<div class="headTitle">
		<'.$params['tag'].' '.$id.'>'.__($title).'</'.$params['tag'].'>
    </div>
	<div class="cl-title cl-title-line">
		<span class="clt"></span>
		<div class="clearfix"></div>
	</div>
	<div class="gap"></div>
	</div>

	';
	return $html;
}

/**
 * @param $str
 * @return mixed|string
 */
function to_slug($str) {
	//convert utf-8 vietnamese
	$str = trim(mb_strtolower($str));
	$str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/u', 'a', $str);
	$str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/u', 'e', $str);
	$str = preg_replace('/(ì|í|ị|ỉ|ĩ)/u', 'i', $str);
	$str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/u', 'o', $str);
	$str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
	$str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/u', 'y', $str);
	$str = preg_replace('/(đ)/u', 'd', $str);
	$str = preg_replace('/[^a-z0-9-\s]/u', '', $str);
	$str = preg_replace('/([\s]+)/u', '-', $str);

	//clean
	$str = preg_replace("/[\/_|+ -]+/", '-', $str);
	return $str;
}

/**
 * @param $str
 * @return string
 */
function getStandardText($str){
	$str = trim(preg_replace('/\s+/u', ' ',$str));
	return $str;
}

/**
 * @param $url
 * @return mixed
 */
function curl_get_content($url){
	$agent= 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13';

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_VERBOSE, true);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_USERAGENT, $agent);
	curl_setopt($ch, CURLOPT_URL,$url);
	$result=curl_exec($ch);
	return $result;
}

function trimArray($Input){
	if (!is_array($Input)){
		return trim($Input);
	}


	return array_map('trimArray', $Input);
}

function today(){
	return '<b>'.date("H:i A").'</b> '.__(date("l")).' '.__("LBL_DATE").' '.date("d/m/Y");
}

function getCityByIp(){
	$ip = getIP();
	$query = @unserialize(file_get_contents('http://ip-api.com/php/'.$ip));
	return $query['city'];
}

function getImageExt($mime){
	$mime_types = array(
		'image/png'=>'png',
		'image/jpeg'=>'jpg',
		'image/gif'=>'gif',
		'image/bmp'=>'bmp',
		 'image/tiff'=>'tif',
		'image/svg+xml'=>'svg'
	);
	$ext =  $mime_types[strtolower($mime)];
	if(!$ext) $ext = 'png';
	return $ext;
}

function base64_encode_image ($filename='') {

	if ($filename) {
		$info = pathinfo($filename);
		$filetype = $info['extension'];
		$imgbinary = file_get_contents($filename);
		$html =  '<img src="'.'data:image/' . $filetype . ';base64,' . base64_encode($imgbinary).'"/>';

		return $html;
	}
}

function save_image ($filename='',$path,$pre='pic_') {

	if ($filename) {
		$info = pathinfo($filename);
		$filetype = $info['extension'];
		$img_content = file_get_contents($filename);

		$new_file = $path.uniqid($pre).'.'.$filetype;
		$f = fopen($new_file,"w+");
		fwrite($f,$img_content);
		fclose($f);

		$html =  '<img src="'.$new_file.'"/>';

		return $html;
	}
}
?>
