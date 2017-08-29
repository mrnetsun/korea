<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Admin extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'admin_model';
	/**
	 *
	 * @var Home_Model
	 */
	public $model;



	/**
	 * Home controller
	 */

	//form add
	protected $before_add = array();

	//form edit
	protected $before_edit = array();

	//action insert
	protected $before_insert = array();
	protected $after_insert = array();

	//action update
	protected $before_update = array();
	protected $after_update = array();

	//form view
	protected $before_view = array();
	protected $after_view = array();

	/**
	 * @var SSH2
	 */
	protected $ssh2;

	public function __construct(){
		parent::__construct();

		$this->load->library('ssh2');
		$this->load->config('ssh');

	}

	public function index(){
		$this->view('admins/index');
	}


}

//end of Home