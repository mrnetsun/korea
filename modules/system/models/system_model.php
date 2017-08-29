<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class System_Model extends MY_Model{
    
   protected $main = array('table'=>'sys_module');
   protected $primary_key = 'moduleId';
	
    function __construct(){
        parent::__construct();
       
    }
	
    
}