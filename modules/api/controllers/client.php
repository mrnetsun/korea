<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Client extends MY_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'services_model';
	
	/**
	 * 
	 * @var Services_Model
	 */
	public $model;
	
	/**
	 * 
	 * @var RestClient
	 */
	public $RestClient;
	
	/**
	 * 
	 * @var ObjXML
	 */	
	public $ObjXML;
	
	public function __construct()
	{
		parent::__construct();
		$this->load->library('RestClient');
		$this->RestClient = new RestClient();
		
		$this->load->library('ObjXML');
		$this->ObjXML = new ObjXML();
	}
	
	public  function index(){
		$this->RestClient->set_option('base_url', site_url('api'));
		//$this->RestClient->set_option('username', 'admin');
		//$this->RestClient->set_option('password', '123456');
		
		$result = $this->RestClient->get("user",array('id'=>1));
		if($result->info->http_code == 200){
			$response = $result->response;
		}
		echo($response);
	}
	
	public  function getAddres($lat,$long){		
		$this->RestClient->set_option('base_url', 'http://maps.google.com/maps');
		$address = '';
		$result = $this->RestClient->get("geo?q=".$lat.",".$long."&sensor=false&key=ABQIAAAAC79wJseBo7_RL9_4fVSFOBScZy0qAvdKDthnPLbiHbalvwmwzhTR7KJSNln3vwobMZ7Mo2HBnzo4bw",array('language'=>'english'));
		if($result->info->http_code == 200){
			$response = $result->response;
		}
		
		if($response){
			$obj = json_decode($response);
			$address = $obj->Placemark[0]->address;
		}

		echo $address;
	}
	
}

//end of Client