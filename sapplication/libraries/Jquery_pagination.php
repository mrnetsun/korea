<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 4.3.2 or newer
 *
 * @package		CodeIgniter
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2006, EllisLab, Inc.
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * Pagination Class
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Pagination
 * @author		ExpressionEngine Dev Team
 * @link		http://codeigniter.com/user_guide/libraries/pagination.html
 */
class Jquery_pagination{

	var $base_url			= ''; // The page we are linking to
	var $total_rows  		= ''; // Total number of items (database results)
	var $per_page	 		= 10; // Max number of items you want shown per page
	var $num_links			=  10; // Number of "digit" links to show before/after the currently viewed page
	var $cur_page	 		=  0; // The current page being viewed
	var $first_link   		= '&lsaquo; First';
	var $next_link			= '&gt;';
	var $prev_link			= '&lt;';
	var $last_link			= 'Last &rsaquo;';
	var $uri_segment		= 3;
	var $full_tag_open		= '';
	var $full_tag_close		= '';
	var $first_tag_open		= '';
	var $first_tag_close	= '';
	var $last_tag_open		= '';
	var $last_tag_close		= '';
	var $cur_tag_open		= '<li class="page"><a class="button-blue" id="current_page">';
	var $cur_tag_close		= '</a></li>';
	var $next_tag_open		= '';
	var $next_tag_close		= '';
	var $prev_tag_open		= '';
	var $prev_tag_close		= '';
	var $num_tag_open		= '';
	var $num_tag_close		= '';
	var $js_rebind 			= '';
	var $captchaAnchor 		= 'captchaAnchor';
	
	var $display_from 		= 'Display form';
	var $display_to 		= 'to';
	var $display_of 		= 'of';
	
	// Added By Tohin
	var $div                = '';
	var $postVar             = '';
	//Added By Lucdt
	var $img_ajax 			= '';

	/**
	 * Constructor
	 *
	 * @access	public
	 * @param	array	initialization parameters
	 */
	function CI_Pagination($params = array())
	{
		if (count($params) > 0)
		{
			$this->initialize($params);		
		}
		
		log_message('debug', "Pagination Class Initialized");
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Initialize Preferences
	 *
	 * @access	public
	 * @param	array	initialization parameters
	 * @return	void
	 */
	function initialize($params = array())
	{
		if (count($params) > 0)
		{
			foreach ($params as $key => $val)
			{
				if (isset($this->$key))
				{

					$this->$key = __($val);
				}
			}		
		}
	}
	// --------------------------------------------------------------------
	
	/**
	 * Generate the pagination information
	 *
	 * @access	public
	 * @return	string
	 */	
	function pagingInfo(){
		if ($this->total_rows == 0 OR $this->per_page == 0)
		{
		   return '';
		}
		
		$this->cur_page = floor(($this->cur_page/$this->per_page) + 1);
		
	
		$from = ($this->cur_page - 1) * $this->per_page + 1;
		$from = ($from > 0)? $from : 1;
		
		$to = min($this->cur_page * $this->per_page,$this->total_rows );
		$to = ($to > 0)? $to : $this->total_rows;
		
		$str = "<div class='paging_display_info'>".$this->display_from." <b>".$from."</b> ".trim($this->display_to)." <b>" .$to. "</b> ".$this->display_of." <b class='total_record_display'>".$this->total_rows."</b></div>";
		return $str;
	}

	/**
	 * Generate the pagination information
	 *
	 * @access	public
	 * @return	string
	 */
	function pagingInfo2(){
		if ($this->total_rows == 0 OR $this->per_page == 0)
		{
			return '';
		}

//		$this->cur_page = floor(($this->cur_page/$this->per_page) + 1);


		$from = ($this->cur_page - 1) * $this->per_page + 1;
		$from = ($from > 0)? $from : 1;

		$to = min($this->cur_page * $this->per_page,$this->total_rows );
		$to = ($to > 0)? $to : $this->total_rows;

		$str = "<div class='paging_display_info'>".$this->display_from." <b>".$from."</b> ".trim($this->display_to)." <b>" .$to. "</b> ".$this->display_of." <b class='total_record_display'>".$this->total_rows."</b></div>";
		return $str;
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Generate the pagination links
	 *
	 * @access	public
	 * @return	string
	 */	
	function create_links($cur_page='')
	{
		// If our item count or per-page total is zero there is no need to continue.
		if ($this->total_rows == 0 OR $this->per_page == 0)
		{
		   return '';
		}

		// Calculate the total number of pages
		$num_pages = ceil($this->total_rows / $this->per_page);

		// Is there only one page? Hm... nothing more to do here then.
		if ($num_pages == 1)
		{
			return '';
		}

		// Determine the current page number.		
		/*$CI =& get_instance();	
		if ($CI->uri->segment($this->uri_segment) != 0)
		{
			$this->cur_page = (int)$CI->uri->segment($this->uri_segment);
			
			// Prep the current page - no funny business!
			
		}*/
		
		$this->cur_page = (int) $cur_page;

		$this->num_links = (int)$this->num_links;
		
		if ($this->num_links < 1)
		{
			show_error('Your number of links must be a positive number.');
		}
				
		if ( ! is_numeric($this->cur_page))
		{
			$this->cur_page = 0;
		}
		
		// Is the page number beyond the result range?
		// If so we show the last page
		if ($this->cur_page > $this->total_rows)
		{
			$this->cur_page = ($num_pages - 1) * $this->per_page;
		}
		
		$uri_page_number = $this->cur_page;
		$this->cur_page = floor(($this->cur_page/$this->per_page) + 1);

		// Calculate the start and end numbers. These determine
		// which number to start and end the digit links with
		/*$start = (($this->cur_page - $this->num_links) > 1) ? $this->cur_page - ($this->num_links - 1) : 1;
		$end   = (($this->cur_page + $this->num_links) < $num_pages) ? $this->cur_page + $this->num_links : $num_pages;*/
		
		$preLinks = ($this->num_links % 2 == 0) ? ($this->num_links / 2) : floor($this->num_links / 2);
		$nextLinks = ($this->num_links % 2 == 0) ? $preLinks : ($preLinks + 1);
		
		if ( ($this->cur_page - $preLinks) <= 1) {
			$nextLinks += 1 - ($this->cur_page - $preLinks);
			$preLinks = $this->cur_page - 1;
		}
		
		if ( ($this->cur_page + $nextLinks) >= $num_pages ) {
			$nextLinks = $num_pages - $this->cur_page;
		}
		
		$start = (($this->cur_page - $preLinks) > 1) ? $this->cur_page - ($preLinks - 1) : 1;
		$end = (($this->cur_page + $nextLinks) < $num_pages) ? $this->cur_page + $nextLinks : $num_pages;

		// Add a trailing slash to the base URL if needed
		$this->base_url = rtrim($this->base_url, '/') .'/';

  		// And here we go...
		$output = '';
		
		// Render the "First" link if the current link is greater than 1
		if ($this->cur_page > 1) {
			$output .= $this->first_tag_open
					.  $this->getAJAXlink('', $this->first_link)
					.  $this->first_tag_close;
		}
		
		// Render the "previous" link
		if ($this->cur_page != 1) {
			$i = $uri_page_number - $this->per_page;
			if ($i == 0) $i = '';
			$output .= $this->prev_tag_open
					.  $this->getAJAXlink($i, $this->prev_link)
					.  $this->prev_tag_close;
		}
		
		// Write the digit links
		for ($loop = $start -1; $loop <= $end; $loop++)
		{
			$i = ($loop * $this->per_page) - $this->per_page;
					
			if ($i >= 0)
			{
				if ($this->cur_page == $loop)
				{
					$output .= $this->cur_tag_open.$loop.$this->cur_tag_close; // Current page
				}
				else
				{
					$n = ($i == 0) ? '' : $i;
					$output .= $this->num_tag_open
						. $this->getAJAXlink( $n, $loop )
						. $this->num_tag_close;
				}
			}
		}

		// Render the "next" link
		if ($this->cur_page < $num_pages)
		{
			$output .= $this->next_tag_open 
				. $this->getAJAXlink( $this->cur_page * $this->per_page , $this->next_link )
				. $this->next_tag_close;
		}
		
		// Render the "Last" link
		if ($this->cur_page < $num_pages) {
			$i = (($num_pages * $this->per_page) - $this->per_page);
			$output .= $this->last_tag_open . $this->getAJAXlink($i, $this->last_link) . $this->last_tag_close;
		}

		// Kill double slashes.  Note: Sometimes we can end up with a double slash
		// in the penultimate link so we'll kill all double slashes.
		$output = preg_replace("#([^:])//+#", "\\1/", $output);

		// Add the wrapper HTML if exists
		$output = $this->full_tag_open.$output.$this->full_tag_close;
		
		return '<div class="paging_nav"><ul class="pagination clearfix">'.$output.'</ul></div>';		
	}

	function getAJAXlink( $count, $text) {
		if(!$count) $count = 0;
		return "<li class=\"page\"><a class=\"button-gray\"  href=\"#\" 
					onclick=\"$.post('". site_url($this->base_url . $count) ."', {'t' : 't'}, function(data){
					$('#".$this->div . "').parent().html(data);}); " . $this->js_rebind .";" .
							"$('html, body').animate({ scrollTop: $('#".$this->captchaAnchor."').offset().top }, 500);" .
							"return false;\">"
				. $text .'</a></li>';
	}

	function getAJAXlinkFront( $count, $text) {
		if(!$count) $count = 0;
		return '<a href="'.site_url($this->base_url . $count).'" onclick="return navClick(this);" class="ajaxPage" data-dest="'.$this->div.'" data-anchor="'.$this->captchaAnchor.'">'. $text .'</a>';
	}

	function getAJAXlinkFrontNoAjax( $count, $text) {
		if(!$count) $count = 0;
		return '<a href="'.site_url($this->base_url . $count).'" data-dest="'.$this->div.'" data-anchor="'.$this->captchaAnchor.'">'. $text .'</a>';
	}


	function pagination($cur_page='',$no_ajax = true){
		if(!intval($cur_page)) $cur_page = 1;

		if($no_ajax){
			$func = 'getAJAXlinkFrontNoAjax';
		}else{
			$func = 'getAJAXlinkFront';
		}

		$html = $this->pagingInfo2($cur_page);
		// If our item count or per-page total is zero there is no need to continue.
		if ($this->total_rows == 0 OR $this->per_page == 0)
		{
			return '';
		}

		// Calculate the total number of pages
		$num_pages = ceil($this->total_rows / $this->per_page);

		// Is there only one page? Hm... nothing more to do here then.
		if ($num_pages == 1)
		{
			return '';
		}

		// Determine the current page number.
		/*$CI =& get_instance();
		if ($CI->uri->segment($this->uri_segment) != 0)
		{
			$this->cur_page = (int)$CI->uri->segment($this->uri_segment);

			// Prep the current page - no funny business!

		}*/

		$this->cur_page = (int) $cur_page;


		$this->num_links = (int)$this->num_links;

		if ($this->num_links < 1)
		{
			show_error('Your number of links must be a positive number.');
		}

		if ( ! is_numeric($this->cur_page))
		{
			$this->cur_page = 1;
		}

		// Is the page number beyond the result range?
		// If so we show the last page
		if ($this->cur_page > $num_pages)
		{
			$this->cur_page = $num_pages;
		}

//		$uri_page_number = $this->cur_page;
//		$this->cur_page = floor(($this->cur_page/$this->per_page) + 1);

		$preLinks = ($this->num_links % 2 == 0) ? ($this->num_links / 2) : floor($this->num_links / 2);
		$nextLinks = ($this->num_links % 2 == 0) ? $preLinks : ($preLinks + 1);

		if ( ($this->cur_page - $preLinks) <= 1) {
			$nextLinks += 1 - ($this->cur_page - $preLinks);
			$preLinks = $this->cur_page - 1;
		}

		if ( ($this->cur_page + $nextLinks) >= $num_pages ) {
			$nextLinks = $num_pages - $this->cur_page;
		}

		$start = (($this->cur_page - $preLinks) > 1) ? $this->cur_page - ($preLinks - 1) : 1;
		$end = (($this->cur_page + $nextLinks) < $num_pages) ? $this->cur_page + $nextLinks : $num_pages;

		// Add a trailing slash to the base URL if needed
		$this->base_url = rtrim($this->base_url, '/') .'/';

		// And here we go...
		$output = '';

		// Render the "dot" link
		if ($start > 3) {
			$output .= '<li>'. $this->{$func}(1, 1) . '</li>';
			$output .= '<li class="dots">...</li>';
		}

		// Write the digit links
		for ($loop = $start; $loop <= $end; $loop++)
		{
//			$i = ($loop * $this->per_page) - $this->per_page;
			$i = $loop;

			if ($i >= 0)
			{
				if ($this->cur_page == $loop)
				{
					$output .= '<li class="active"><a>'.$loop.'</a></li>'; // Current page
				}
				else
				{
					$n = ($i == 0) ? '' : $i;
					$output .= '<li>'
						. $this->{$func}( $n, $loop )
						. '<li>';
				}
			}
		}

		// Render the "dot" link
		if ($this->cur_page < $num_pages && $loop <= $num_pages) {
			$output .= '<li class="dots">...</li>';
		}


		// Render the "Last" link
		if ($this->cur_page < $num_pages && $loop < $num_pages) {
//			$i = (($num_pages * $this->per_page) - $this->per_page);
			$output .= '<li>'. $this->{$func}($num_pages, $num_pages) . '</li>';
		}

		// Render the "next" link
		if ($this->cur_page < $num_pages)
		{
			$output .= '<li>'
				. $this->{$func}( $this->cur_page+1 , __("Next Page") )
				. '</li>';
		}

		// Kill double slashes.  Note: Sometimes we can end up with a double slash
		// in the penultimate link so we'll kill all double slashes.
		$output = preg_replace("#([^:])//+#", "\\1/", $output);


		$html .= '<ul class="pagination front-nav">
                                '.$output.'
                            </ul>';
		return $html;
	}
	
}
// END Pagination Class
?>