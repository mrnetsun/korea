<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Profile extends Member_Controller {
	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'member_model';
	/**
	 * 
	 * @var Member_Model
	 */
	public $model;
	
	

	/**
	 * Member controller 
	 */
	
	
	protected $before_insert = array();
	
	protected $before_update = array();
	
	protected $after_view = array();

	
    public function __construct(){
        parent::__construct();
        //$this->session->sess_destroy();
    }

	protected function sort_input_data($input_data){
		$input=explode(",",$input_data);

		$arr_input=array();
		foreach($input as $key=>$val){
			$arr_val=explode(" ", $val);
			if (count($arr_val))foreach($arr_val as $key=>$w){
				if($w==="")unset($arr_val[$key]);
			}
			$str_val=implode(" ",$arr_val);
			if($str_val) $arr_input[]= $str_val;
		}
		asort($arr_input);

		$str_input=implode(",",$arr_input);
		if(substr($str_input, 0,1) == ",") $str_input=substr($str_input, 1, strlen($str_input));
		return $str_input;
	}
    
    public function index(){
    	
    	$member = $this->model->get($this->LoginData->memberId);
    	$this->template->set('member',$member);
    	
    	$this->view('profiles/index');
    	
    }
    
    public function updateProfile(){
    	$aryData = array('ok'=>true);
    	unset($this->postData['isSA']);
    	unset($this->postData['status']);
    	unset($this->postData['email']);
    	unset($this->postData['username']);
    	unset($this->postData['roleId']);
		$postData = $this->postData;
		$postData['firstName'] = $this->sort_input_data(trim($this->postData['firstName']));
		$postData['lastName'] = $this->sort_input_data((trim($this->postData['lastName'])));
    	$ok = $this->model->update('sys_member', $postData ,array('memberId'=>$this->LoginData->memberId));
    	$aryData['ok'] = $ok;
		$dataSession = $this->LoginData;
		$dataSession->firstName = $postData['firstName'];
		$dataSession->lastName = $postData['lastName'];
		$this->session->set_userdata('LoginData',$dataSession);
    	if(!$ok){
    		$aryData['serror'] = __('Cannot update your profile. Please try again later.');
			$this->session->set_flashdata('serror', __('Cannot update your profile. Please try again later.') );
    	}else{
    		$aryData['smessage'] = __('Update successful.');
			$this->session->set_flashdata('smessage', __('Update successful.') );
    	}

    	echo json_encode($aryData);
    }
    
    public function avartaUpload(){
    	$upload_dir = FCPATH.MEMBER_AVATAR; // Relative to the root
    	 
    	$new_file_name = uniqid('avatar_');
    	 
    	$aryData['ok'] = true;
    	 
    	$config = array();
    	$config['upload_path'] = $upload_dir;
    	$config['allowed_types'] = 'jpg|jpeg|gif|png';
    	$config['max_size'] = '6048';
    	 
    	$config['file_name'] = $new_file_name;
    	$config['overwrite'] = true;
    	 
    	$this->load->library('upload');
    	$this->upload = new CI_Upload($config);
    	 
    	// Output json as response
    	if ( ! $this->upload->do_upload('uploadfile'))
    	{
    		$aryData['ok'] = false;
    		$aryData['serror'] = str_replace("The filetype you are","Your avatar is",$this->upload->display_errors('',''));
			//$aryData['serror'] = 'rttttt';
    	}
    	else
    	{
    		$config2['image_library'] = 'gd2';
    		$config2['source_image'] = $this->upload->upload_path.$this->upload->file_name;
    		$config2['new_image'] = $this->upload->upload_path;
    		$config2['maintain_ratio'] = TRUE;
    		$config2['create_thumb'] = TRUE;
    		$config2['thumb_marker'] = '';
    		$config2['width'] = 100;
    		$config2['height'] = 100;
    
    		$this->load->library('image_lib');
    
    		$this->image_lib = new CI_Image_lib($config2);
    
    		if ( !$this->image_lib->resize()){
    			$aryData['ok'] = false;
    			$aryData['serror'] = str_replace("The filetype you are","Your avatar is",$this->image_lib->display_errors('', ''));
    		}
    
    		$aryData['fileName'] = $this->upload->file_name;
    		$aryData['preview'] = ROOT_URL.MEMBER_AVATAR.$this->upload->file_name;
    		$aryData['value'] = MEMBER_AVATAR.$this->upload->file_name;
    		
    		$this->model->update('sys_member',array('avatar'=>$aryData['value']),array('memberId'=>$this->LoginData->memberId));
    	}

    	echo json_encode($aryData);
    	 
    }
    
    public function logoUpdate(){
    	$upload_dir = FCPATH.MEMBER_AVATAR; // Relative to the root
    
    	$new_file_name = uniqid('logo_');
    
    	$aryData['ok'] = true;
    
    	$config = array();
    	$config['upload_path'] = $upload_dir;
    	$config['allowed_types'] = 'jpg|jpeg|gif|png';
    	$config['max_size'] = '6048';
    
    	$config['file_name'] = $new_file_name;
    	$config['overwrite'] = true;
    
    	$this->load->library('upload');
    	$this->upload = new CI_Upload($config);
    
    	// Output json as response
    	if ( ! $this->upload->do_upload('uploadfile'))
    	{
    		$aryData['ok'] = false;
    		$aryData['serror'] =  $this->upload->display_errors('','');
    	}
    	else
    	{
    		$config2['image_library'] = 'gd2';
    		$config2['source_image'] = $this->upload->upload_path.$this->upload->file_name;
    		$config2['new_image'] = $this->upload->upload_path;
    		$config2['maintain_ratio'] = TRUE;
    		$config2['create_thumb'] = TRUE;
    		$config2['thumb_marker'] = '';
    		$config2['width'] = 100;
    		$config2['height'] = 100;
    
    		$this->load->library('image_lib');
    
    		$this->image_lib = new CI_Image_lib($config2);
    
    		if ( !$this->image_lib->resize()){
    			$aryData['ok'] = false;
    			$aryData['serror'] = $this->image_lib->display_errors('', '');
    		}
    
    		$aryData['fileName'] = $this->upload->file_name;
    		$aryData['preview'] = ROOT_URL.MEMBER_AVATAR.$this->upload->file_name;
    		$aryData['value'] = MEMBER_AVATAR.$this->upload->file_name;
    
    		$this->model->update('sys_member',array('logo'=>$aryData['value']),array('memberId'=>$this->LoginData->memberId));
    	}
    
    	echo json_encode($aryData);
    
    }
    
    
    
    public function changePass(){
    	
    	$this->view('profiles/changePass');
    }
    
    public function updatePass(){
    	$aryData = array('ok'=>true);
    	if(strlen($this->postData['newPassword'])>=6 && $this->postData['newPassword'] == $this->postData['rePassword']){
    		$password  = password($this->postData['oldPassword']);
    		$newpass = password($this->postData['newPassword']);
    		if($password == $this->LoginData->password){
    			$ok = $this->model->update('sys_member',
    					array('password'=>$newpass),
    					array('memberId'=>$this->LoginData->memberId));
    			$aryData['ok'] = $ok;
    			$aryData['smessage'] = __('MSG_UPDATE_SUCCESSFUL');
    			
    			//login with new pass
    			$this->LoginData->password = $newpass;
    			
    		}else{
    			$aryData['ok'] = false;
    			$aryData['serror'] = __('ERR_OLD_PASSWORD_WRONG.');
    		}
    	}else{
    		$aryData['ok'] = false;
    		$aryData['serror'] = __('ERR_PASSWORD_NOT_MATCHED');
    	}
    	echo json_encode($aryData);
    }
}