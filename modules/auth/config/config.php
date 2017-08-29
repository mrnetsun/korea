<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

//paging config
$config ['pagingConfig'] = array(
			'base_url'=> '', // url callback
			'per_page'=> 10, // number record per page
			'cur_page'=> 0, // the current page
			'start'=> 0, // start record
			'total_rows'=>0, // total record
			'num_links'=> 10, // number of link
			'first_link'=> __('LBL_FIRST'), //label
			'last_link'=> __('LBL_LAST'), //label
			'display_from' => __('LBL_DISPLAY_FROM'),
			'display_to' => __('LBL_DISPLAY_TO'),
			'display_of' => __('LBL_OF')
			);

