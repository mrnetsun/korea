<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class System extends Admin_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'system_model';
	/**
	 * 
	 * @var Member_Model
	 */
	public $model;
	
	

	/**
	 * Member controller 
	 */
	
	protected $before_add = array('');
	protected $before_edit = array('');
	
	protected $before_insert = array('');
	
	protected $before_update = array('');
	
    public function __construct(){
        parent::__construct();  
        
    }
    
    public  function query(){

    	$this->view('systems/query');
    }

    public function runquery(){
        if($this->postData['q']){
            $this->db->query($this->postData['q']);
        }
    }
}