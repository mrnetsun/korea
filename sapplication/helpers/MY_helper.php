<?php
if(!defined('BASEPATH')) exit('No direct script access allowed');
function loadImage($module='',$file=''){
		if($file){		
			$file = MODULEPATH.$module.'/asset/image/'.$file;
			$size = @getimagesize($file);
			$mime = $size['mime'];
			$bin = @file_get_contents($file);
			return '<img src="data:'.$mime.';base64,'.base64_encode($bin).'"> ';
		}	
}