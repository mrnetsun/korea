<?php
 /*
	iaTermark
	Created by Silvio Rainoldi
	www.ianaz.ch
 */
class ImageMask 
{	
	var $thumb_w = 172; // larghezza thumb
	var $thumb_h = 130; // altezza thumb
	var $max_w = 720; // larghezza max
	var $max_h = 540; // altezza max
	var $pos_x = "CENTER"; // posizione logo RIGHT, LEFT, CENTER
	var $pos_y = "MIDDLE"; // posizione logo BOTTOM, TOP, MIDDLE
	var $img_folder = ""; // cartella immagine grande
	var $thumb_folder = ""; // cartella immagine thumb
	var $saveBIG = 1; //salvare immagine grande
	var $saveTHUMB = 0; //salvare thumb
	var $name = ""; //nome immagine senza estensione
	var $ovride = false;
	var $mime ='';
	
	var $header_text = '';
	var $footer_text = '';

	function AddLogo($image, $logo = NULL)
	{
		
		$size = getimagesize($image);
		$this->mime = $size['mime'];
		
		$this->im = $this->createImage($image);
		$this->im_width = imagesx($this->im);
		$this->im_height = imagesy($this->im);
		$this->wt_x = $this->calc_pos_x($this->pos_x);
		$this->wt_y = $this->calc_pos_y($this->pos_y);
		$this->new_image = $this->resizeImg();
		
		$this->resizeForThumb();
		if($logo != NULL)
		{
			$this->createTheLogo($logo);				
		}
		if($this->name==""){
			$this->name = substr($image, 0 , strrpos($image, "."));
		}
		
		if(!$this->ovride){
			$overide = '_new';			
		}
		else{ 
			$overide ='';
		}
		
		$overide_thumb = '_thumb';
		
		if($this->saveBIG == 1)
		{	
			switch ($this->mime){
				case "image/gif":
					imagegif($this->new_image, $this->img_folder.$this->name.$overide.".gif");
					break;				
				case "image/png":
					imagepng($this->new_image, $this->img_folder.$this->name.$overide.".png");
					break;
				default:
					imagejpeg($this->new_image, $this->img_folder.$this->name.$overide.".jpg");
			}
		}
		if($this->saveTHUMB == 1)
		{
			switch ($this->mime){
				case "image/gif":
					imagejpeg($this->thumb, $this->thumb_folder.$this->name.$overide_thumb.".gif");
					break;
				case "image/png":
					imagejpeg($this->thumb, $this->thumb_folder.$this->name.$overide_thumb.".png");
					break;
				default:
					imagejpeg($this->thumb, $this->thumb_folder.$this->name.$overide_thumb.".jpg");
			}
			
		}
		
	}
	
	function createImage($image){
		$type = strtolower(substr($image, strrpos($image, "."), strlen($image)-strrpos($image, ".")));
		if($type==".jpeg" || $type==".jpg"){
			return imagecreatefromjpeg($image);
		}elseif($type==".gif"){
			return imagecreatefromgif($image);
		}elseif($type==".png"){
			return imagecreatefrompng($image);
		}else{
			die("Immagine non valida");
		}
	}
	
	function createTheLogo($logo)
	{
		$this->logo = $this->createImage($logo);
		$this->logo_width = imagesx($this->logo);
		$this->logo_height = imagesy($this->logo);
		$this->wt_x = $this->calc_pos_x($this->pos_x);
		$this->wt_y = $this->calc_pos_y($this->pos_y);
		imagecopy($this->new_image, $this->logo, $this->wt_x, $this->wt_y, 0, 0, $this->logo_width, $this->logo_height);
	}
        
        
	function resizeImg()
	{

		if($this->im_width > $this->max_w && $this->im_height < $this->max_h)
		{
		
			$rapporto = $this->max_w / $this->im_width;
			
			$this->new_im_w = $this->im_width * $rapporto;
			$this->new_im_h = $this->im_height * $rapporto;
			
		}
		
		else if($this->im_width < $this->max_w && $this->im_height > $this->max_h)
		{
		
			$rapporto = $this->max_h / $this->im_height;
			
			$this->new_im_w = $this->im_width * $rapporto;
			$this->new_im_h = $this->im_height * $rapporto;
		
		}
		else if($this->im_width > $this->max_w && $this->im_height > $this->max_h)
		{
		
			$rapporto_1 = $this->max_w / $this->im_width;
			$rapporto_2 = $this->max_h / $this->im_height;
				if($rapporto_1 > $rapporto_2)
				{
					$rapporto = $rapporto_2;
				}
				else
				{
					$rapporto = $rapporto_1;
				}
					
					$this->new_im_w = $this->im_width * $rapporto;
					$this->new_im_h = $this->im_height * $rapporto;
		
		}
		
		else
		{
			$this->new_im_w = $this->im_width;
			$this->new_im_h = $this->im_height;
		}
		
		$exten_height = 0;
		if($this->header_text) $exten_height += 20;		
		if($this->footer_text) $exten_height += 20;
		
		$this->new_image = imagecreatetruecolor($this->new_im_w, $this->new_im_h+ $exten_height);
		$white = imagecolorallocate($this->new_image, 255, 255, 255);
		$black = imagecolorallocate($this->new_image, 0, 0, 0);
		imagefill($this->new_image, 0, 0, $white);
		
		
		
		$font = realpath(dirname(__FILE__))."/fonts/arial.ttf"; 	
		
		$start = ($this->header_text)?20:0;
		
		imagecopyresized($this->new_image, $this->im, 0, $start, 0, 0, $this->new_im_w, $this->new_im_h, $this->im_width, $this->im_height);
		
		//$header_text = "ID:5024242";
		if($this->header_text){
			imagettftext($this->new_image, 25, 0, 20, 30, $black, $font, $this->header_text);
		}
		
		if($this->footer_text){
		$y = ($this->header_text)? 30:10;		
		imagettftext($this->new_image, 25, 0, 20, $this->new_im_h + $y, $black, $font, $this->footer_text);
		}
		
		return $this->new_image;

	}
	
	function resizeForThumb(){
		$thumb_w = $this->thumb_w;
		$thumb_h = $this->thumb_h;
		if($this->im_width > $this->im_height)
		{
			$rapporto = $this->im_height / $this->im_width;
			$thumb_h = $this->thumb_h * $rapporto;
			$thumb_w = $this->thumb_w * $rapporto;
		}	
		else if($this->im_width < $this->im_height)
		{
			$rapporto = $this->im_width / $this->im_height;
			$thumb_w = $this->thumb_w * $rapporto;
		}
		else
		{
			$thumb_w = $this->thumb_w;
			$thumb_h = $this->thumb_h;
		}
		$this->thumb = imagecreatetruecolor($thumb_w, $thumb_h);
		imagecopyresized($this->thumb, $this->new_image, 0, 0, 0, 0, $thumb_w, $thumb_h, $this->new_im_w, $this->new_im_h);
	}
		
	function calc_pos_x($position_x)
        {
		$x = 0;
		switch($position_x)
		{
			case 'LEFT':
			    $x = 0;
			    break;
			case 'CENTER':
			    $x = @$this->new_im_w / 2 - @$this->logo_width / 2;
			    break;
			case 'RIGHT':
			    $x = @$this->new_im_w - @$this->logo_width;
			    break;
			default:
			    $x = 0;
		}
            return $x;
        
        }
        
        function calc_pos_y($position_y)
        {
		$y = 0;
		switch($position_y)
		{
			case 'TOP':
			    $y = 0;
			    break;
			case 'MIDDLE':
			    $y = @$this->new_im_h / 2 - @$this->logo_height / 2;
			    break;
			case 'BOTTOM':
			    $y = @$this->new_im_h - @$this->logo_height;
			    break;
			default:
			    $y = 0;
		}
	return $y;
        
        }
        
}
    
?> 