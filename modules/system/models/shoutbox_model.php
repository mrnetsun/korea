<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Shoutbox_Model extends MY_Model{
    
   protected $main = array('table'=>'shoutbox');
   protected $primary_key = 'id';
	
    function __construct(){
        parent::__construct();
       
    }
	
    
}