<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Shoutbox extends Admin_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'shoutbox_model';
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
    
    public  function shoutForm($code=''){
        $this->template->set('code',$code);
    	$this->baseView('shouts/shout_add');
    }

    public function insert(){
        $aryData = array('ok'=>'false','code'=>$this->postData['code']);

        $data = array();
        $data['code'] = $this->postData['code'];
        $data['message'] = $this->postData['message'];
        $data['documents'] = json_encode($this->postData['files']);
        $data['createdId'] = $this->LoginData->memberId;
        $data['createdTime'] = date("Y-m-d H:i:s");
        $data['updatedTime'] = date("Y-m-d H:i:s");
        $data['userInfo'] = json_encode(
            array('id'=>$this->LoginData->memberId,
            'name'=>$this->LoginData->firstName.' '.$this->LoginData->lastName,
            'avatar'=>$this->LoginData->avatar));

        $ok = $this->model->add('shoutbox',$data);
        $aryData['ok'] = $ok;
        if(!$ok){
            $aryData['serror'] = __("Error, try again!");
        }
        echo json_encode($aryData);
    }

    public function load($code,$start=''){
        $shouts = $this->model->find_where('list'
            ,array('code'=>$code)
            ,array('offset'=>$start,'limit'=>10,'fixed_sort'=>'updatedTime DESC'));
        $this->template->set('shouts',$shouts);
        $this->baseView('shouts/shout_list');
    }
}