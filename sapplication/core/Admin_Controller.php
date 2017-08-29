<?php 
class Admin_Controller extends Member_Controller {
   
    function __construct()
    {
        parent::__construct();
		$this->is_mobile = $this->agent->is_mobile();
        $this->checkLogin();
		
    }
		
}
?>