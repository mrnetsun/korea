<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Video extends Front_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'home_model';
	/**
	 * 
	 * @var Company_Model
	 */
	public $model;
	
	

	/**
	 * Company controller 
	 */
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	protected $after_edit = array();
	
	//action insert
	protected $before_insert = array();
	protected $after_insert = array();
	
	//action update
	protected $before_update = array();
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();
	
    public function __construct(){
        parent::__construct();  
        
    }
    
    public function index($slug='')
	{
		 
	}

	 

}

//end of video