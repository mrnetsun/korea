<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Image Cropper Class
 *
 * @license		http://opensource.org/licenses/gpl-license.php GNU Public License
 * @author		WookieMonster
 * @link		http://github.com/wookiemonster
 */
class Image_cropper {

	private $original_image_path;
	private $original_image;
	private $cropped_image;
	private $separator;
	private $marker;
	private $quality;
	private $destination;
	private $filename;
	private $raw_filename;
	private $width;
	private $height;
	private $CI;
	private $imagetype;

	/**
	 * Constructor
	 * 
	 * @access	public
	 * @return	null
	 */
	public function __construct()
	{
		$this->separator = '_';
		$this->marker = 'thumb';
		$this->quality = 100;
		$this->CI =& get_instance();
		$this->CI->load->helper('string');
	}

	/**
	 * Load image resource identifier
	 * 
	 * @access	public
	 * @param	string
	 * @return	object
	 */
	public function load($image = FALSE)
	{
		$this->original_image_path = $image;
		
		if ($image !== FALSE)
		{
			$type = exif_imagetype($image);
			$this->imagetype = $type;
			
			if ($type == IMAGETYPE_GIF)
			{
				$this->original_image = @imagecreatefromgif($image);
			}

			if ($type == IMAGETYPE_JPEG)
			{
				$this->original_image = @imagecreatefromjpeg($image);
			}

			if ($type == IMAGETYPE_PNG)
			{
				$this->original_image = @imagecreatefrompng($image);
			}
		}

		return $this;
	}

	/**
	 * Load image resource identifier
	 * 
	 * @access	public
	 * @param	array	(width, height)
	 * @return	object
	 */
	public function crop($dimensions = array(100, 100))
	{
		$this->width = $dimensions[0];
		$this->height = $dimensions[1];
		
		$orig_width = imagesx($this->original_image);
		$orig_height = imagesy($this->original_image);

		$orig_aspect_ratio = $orig_width / $orig_height;
		$thumb_aspect_ratio = $dimensions[0] / $dimensions[1];

		if ($orig_aspect_ratio >= $thumb_aspect_ratio)
		{
			// wider image
			$new_height = $dimensions[1];
			$new_width = $orig_width / ($orig_height / $dimensions[1]);
		}
		else
		{
			// taller image
			$new_width = $dimensions[0];
			$new_height = $orig_height / ($orig_width / $dimensions[0]);
		}

		$canvas = imagecreatetruecolor($dimensions[0], $dimensions[1]);

		$dst_x = 0 - ($new_width - $dimensions[0]) / 2;
		$dst_y = 0 - ($new_height - $dimensions[1]) / 2;

		imagecopyresampled(
			$canvas,
			$this->original_image,
			$dst_x,
			$dst_y,
			0, 0,
			$new_width, $new_height,
			$orig_width, $orig_height
		);

		$this->cropped_image = $canvas;
		return $this;
	}
	
	/**
	 * Set marker at end of image (e.g. image_thumb.jpg where s is marker)
	 * 
	 * @access	public
	 * @param	string
	 * @return	object
	 */
	public function set_raw_filename($raw_filename = '')
	{
		$this->raw_filename = $raw_filename;
		return $this;
	}
	
	/**
	 * Set marker at end of image (e.g. image_thumb.jpg where s is marker)
	 * 
	 * @access	public
	 * @param	string
	 * @return	object
	 */
	public function set_marker($marker = '')
	{
		$this->marker = $marker;
		return $this;
	}

	/**
	 * Set the output quality of images
	 * 
	 * @access	public
	 * @param	integer
	 * @return	object
	 */
	public function set_quality($quality = 100)
	{
		$this->quality = $quality;
		return $this;
	}

	/**
	 * Save cropped image to directory
	 * 
	 * @access	public
	 * @param	string
	 * @return	boolean
	 */
	public function save($destination)
	{
		$thumb =($this->marker)? $this->separator.$this->marker:'';
		

		$this->destination = $destination;
		$this->filename = $filename;
		
		
		if ($this->imagetype == IMAGETYPE_GIF)
		{
			$filename = basename($this->original_image_path, '.gif').$thumb.'.gif';
			imagegif($this->cropped_image, $destination.$filename);
		}
		
		if ($this->imagetype == IMAGETYPE_JPEG)
		{
			$filename = basename($this->original_image_path, '.jpg').$thumb.'.jpg';
			imagejpeg($this->cropped_image, $destination.$filename, $this->quality);
			
		}
		
		if ($this->imagetype == IMAGETYPE_PNG)
		{
			$filename = basename($this->original_image_path, '.png').$thumb.'.png';
			imagepng($this->cropped_image, $destination.$filename,9);
		}
		
		return $this;
		
	}

	/**
	 * Save cropped image to directory
	 * 
	 * @access	public
	 * @param	string
	 * @return	link resource (?)
	 */
	public function output()
	{
		return imagejpeg($this->cropped_image, NULL, $this->quality);
	}

	/**
	 * Return useful data about current image
	 * 
	 * @access	public
	 * @return	array
	 */
	public function data()
	{
		$data = array();
		$data['filename'] = $this->filename;
		$data['destination'] = $this->destination;
		$data['marker'] = $this->marker;
		$data['width'] = $this->width;
		$data['height'] = $this->height;

		return $data;
	}
}

/**
 * Batch Cropper Class
 *
 * @license		http://opensource.org/licenses/gpl-license.php GNU Public License
 * @author		WookieMonster
 * @link		http://github.com/wookiemonster
 */
class Batch_cropper {

	/**
	 * Run batch cropper
	 * 
	 * @access	public
	 * @param	string
	 * @param	string
	 * @param	array	see example in controllers/image_cropper_tests.php
	 * @param	integer
	 * @param	string
	 * @return	array
	 */
	public static function run($image, $destination, $sizes, $quality = 100)
	{
		if ( ! file_exists($image) || ! is_array($sizes))
		{
			return FALSE;
		}

		$Image_cropper = new Image_cropper();
		$data = array();
		
		foreach ($sizes as $marker => $dimensions)
		{
			$data[] = $Image_cropper
				->load($image)
				->set_marker($marker)
				->set_quality($quality)
				->crop($dimensions)
				->save($destination)
				->data();
		}

		return $data;
	}
}

/* End of file Image_cropper.php */
/* Location: ./application/libraries/Image_cropper.php */