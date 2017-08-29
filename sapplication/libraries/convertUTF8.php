<?php

require_once('is_utf8.php');

/**
 * 
 * @author Mario Wellner <mario.wellner@spectos.com>
 *
 */

class convertUTF8 {
	
	private $_fileContent;
	
	function __construct($content){
		
		if(is_file($content)){
		
			$this->_fileContent = file_get_contents($content);
			$this->_file = $content;
			
		}
		else {
			$this->_fileContent = $content;
		}
		
	}
	
	
	
	
	public function is_utf8() {
	
		return is_utf8($this->_fileContent);

	}
	
	
	
	
	function convertFile($utf8Conversion=false, $isoConversion=false){
	
		$fileContent = $this->_fileContent;
	
		// remove illegal UTF-8 BOM tags from file content
		if ( strstr($fileContent, '﻿') )
		{
			$fileContent = str_replace('﻿', '', $fileContent);
		}
	
		$fp = fopen($this->_file, 'w');
		if ( $utf8Conversion )
		{
			$fileContent = utf8_encode($fileContent);
		}
		elseif($isoConversion) {
			$fileContent = utf8_decode($fileContent);
		}
		fwrite($fp, $fileContent);
		fclose($fp);
	}
	
	
	function convertString($utf8Conversion=false, $isoConversion=false){
		
		$fileContent = $this->_fileContent;
	
		// remove illegal UTF-8 BOM tags from file content
		if ( strstr($fileContent, '﻿') )
		{
			$fileContent = str_replace('﻿', '', $fileContent);
		}
	
		if ( $utf8Conversion )
		{
			$fileContent = utf8_encode($fileContent);
		}
		elseif($isoConversion) {
			$fileContent = utf8_decode($fileContent);
		}
		
		return $fileContent;
		
	}
	
	
	
}




?>