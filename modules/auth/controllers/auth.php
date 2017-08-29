<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Auth extends Front_Controller {
	/**
	 *
	 * @var CI_Encrypt
	 */
	public $encrypt;

	/**
	 * Model
	 * @var string
	 */
	public $model_name  = 'auth_model';
	/**
	 *
	 * @var Auth_Model
	 */
	public $model;

	/**
	 * @var OAuth2
	 */
	public $oauth2;


	public function __construct(){
		parent::__construct();
		$this->load->model('auth_model');
		$this->load->library('encrypt');
		$this->load->library('cookie');

		$this->encrypt = new CI_Encrypt();

	}
	public function index()
	{
		//debug($this->LoginData);
		$this->loadModuleJs('validate.js','common');
		if($this->LoginData){
			if($this->isMaintenance){
				redirect('home/admin');
			}else{
				redirect(DEFAULT_CONTROLLER);
			}

		}else{
			$adminCookie = $this->cookie->userdata('adminCookie');

			if($adminCookie){
				$saveLogin = json_decode($this->encrypt->decode($adminCookie));

				//Automatic login
//				$embasePassword = $saveLogin->password.SALT;
//				$embasePassword = md5($embasePassword);
//				$objMember = $this->model->find_where('',array('username'=>$saveLogin->username,'password'=>$embasePassword));
//
//				if($objMember){
//					$objMember->permission = $this->model->getMemberPermision($objMember);
//
//					$this->session->set_userdata('LoginData',$objMember);
//					redirect('');
//				}

			}


			$this->template->title(__("Login"));
			$this->template->set('saveLogin',$saveLogin);
			$this->loginView('login_form');

		}


	}

	public function forgot(){
		$this->loadModuleJs('validate.js','common');
		$this->template->title(__("Forgot Your Password"));
		$this->loginView('forgot');
	}

	protected function checkMemberBlocked($username,$addressIp){
		$dataMember = $this->model->find_where('top',
			array( 'username' => $username, 'addressIp' => $addressIp ),
			array('from'=>'sys_member_blocked',
				'select'=>array('id','updatedTime')
			)
		);
		return $dataMember;
	}

	protected function loginJoinSystem($username=null,$password=null,$autologin=mull,$memberBlock=null,$addressIp= null){
		/* Encryption password*/
		$embasePassword = password($password);

		$objMember = $this->auth_model->find_where('',array('and'=>'(username ="'.$username.'" OR email="'.$username.'")'));
		//debug($this->db->last_query());
		$message = "";
		$check = -1;
		 
		if(empty($objMember)){
			$message = __("Invalid a login account.");
			$check = 0;
		}else{
			//check password
			if($objMember->password == $embasePassword)
			{
				
				//check status
				if($objMember->status == 1)
				{
					$check = 1;
					$message = __("Login successful.");

					$objMember->permission = $this->auth_model->getMemberPermision($objMember);
//						debug($objMember);
					//Set SESSION cho user
					$this->session->set_userdata('LoginData',$objMember);

					$this->model->add('sys_history',array(
						'memberId'=>$objMember->memberId,
						'memberName'=>$objMember->firstName.' '.$objMember->lastName,
						'actionType'=>'Login',
						'updateDate'=>date("Y-m-d H:i:s")
					));

					//Duy tri dang nhap
					if($autologin){
						$this->cookie->set_userdata('adminCookie',$this->encrypt->encode(json_encode(array('username'=>$username,'password'=>$password))));
					}else{
						$this->cookie->unset_userdata('adminCookie');
					}

				}else{
					$check = 0;
					$message = __("Sorry. Your account is not Active");
				}
			}else{
				$message = __("Invalid password.");
				if( !$this->session->userdata('member_block') ){
					$userBlocked = array($username=>1);
					$this->session->set_userdata('member_block',$userBlocked);
				}
				else{
					$numberSiginError =  $this->session->userdata('member_block');
					if (array_key_exists($username, $numberSiginError))
						//if user first try login
						$numberSiginError[$username]++;
					else
						// user second or user n try login
						$numberSiginError[$username] = 1;
					$this->session->set_userdata('member_block',$numberSiginError );
				}
				$numberSiginError =  $this->session->userdata('member_block');
				if( $numberSiginError[$username] >= MEMBER_NUMBER_LIMIT_LOGIN ){
					$datetimeBlock = date_create($memberBlock->updatedTime);
					$datetimeCurrent = date_create(date("Y-m-d h:i:s"));
					$timeBlocked = date_diff( $datetimeBlock, $datetimeCurrent );
					$timeBlocked = $timeBlocked->i;
					$timeGoingBlocked = TIME_DELETE_BLOCKED_MEMBER - $timeBlocked;
					$message = __("MSG_USER_BLOCKED");//__('Your username has blocked! You can login again then '.$timeGoingBlocked.' minutes');
					//check number perform of member login with limit system
					if($memberBlock->updatedTime){
						//if exits then update time of member with last perform
						//total time such as minutes has blocked
					}else{
						$this->model->add('sys_member_blocked',array('username'=>$username,'updatedTime'=>date("Y-m-d h:i:s"),'createdTime'=>date("Y-m-d h:i:s"), 'addressIp'=>$addressIp ));
					}
				}
				$check = 0;

			}
		}

		$return = array(
			'check'=>$check,
			'message'=>$message,
		);
		return $return;

	}

	public function check(){

		$callback = $this->session->userdata('solr.callback');
		
		//debug($this->postData);

		$aryData = array( 'check'=>-1,'message'=>'' );
		$username = $this->postData['username'];
		$password = $this->postData['password'];
		$autologin = $this->input->post('autologin');
		$addressIp = $_SERVER['REMOTE_ADDR'];
		$memberBlock = $this->checkMemberBlocked( $username, $addressIp );
		$datetimeBlock = date_create($memberBlock->updatedTime);
		$datetimeCurrent = date_create(date("Y-m-d h:i:s"));
		$timeBlocked = date_diff( $datetimeBlock, $datetimeCurrent );
		//total time such as minutes has blocked
		$timeBlocked = $timeBlocked->i;
		
		if( $memberBlock->updatedTime ){
			//case exits member blocked
			if( intval($timeBlocked) >= TIME_DELETE_BLOCKED_MEMBER ){
				//case time blocked >= TIME_DELETE_BLOCKED_MEMBER we will delete member is blocked
				$this->session->unset_userdata('member_block' );
				$this->model->delete_primary($memberBlock->id,'',array('from'=>'sys_member_blocked'));
				$result = $this->loginJoinSystem( $username,$password,$autologin,$memberBlock,$addressIp );
				$aryData['check'] = $result['check'];
				$aryData['message'] = $result['message'];
			}else{
				//case detect member has time blocked < TIME_DELETE_BLOCKED_MEMBER
				$aryData['check'] = 0;
				$timeGoingBlocked = TIME_DELETE_BLOCKED_MEMBER - $timeBlocked;
				$aryData['message'] = __('Your username has blocked! You can login again then '.$timeGoingBlocked.' minutes');
			}
		}else{
			 
			//case member not block continue login
			$result = $this->loginJoinSystem( $username,$password,$autologin,$memberBlock,$addressIp );
			
			$aryData['check'] = $result['check'];
			$aryData['message'] = $result['message'];
		}
		$return = $aryData;
		if($callback && $return['check']==1){
			$this->session->set_userdata('solr.callback','');
			$return['callback_url']= $callback;
		}else{
			if($this->isMaintenance){
				$return['callback_url']= site_url('home/admin');
			}else{
				$return['callback_url']= site_url(DEFAULT_CONTROLLER);
			}

		}
		if($return['check']){
			redirect($return['callback_url']);
		}else{
			$this->session->set_flashdata('error',$aryData['message']);
			redirect('auth/');
		}
		
		
	}

	public function initforgot(){

		$ok = true;
		$aryData = array();

		$email = $this->postData['email'];
		$user = $this->model->find_where('LBL_FIRST',array('email'=>$email));
		if($user){
			$key = random_password(10);
			$code = sys_encrypt(json_encode(array('code'=>$key,'date'=>date('Y-m-d'))));

			$this->model->save(array('activeKey'=>$code,'memberId'=>$user->memberId));

			$link_confirm = site_url('auth/getpass/'.$user->username.'/'.$code);
			$html_email = $this->baseView('email_fogot_content',array('code'=>$code,'link_confirm'=>$link_confirm),true);
			//debug($html_email);
			$ok = sendMailQueue($email,__('Confirm reset password from').' ' .$this->config->item('app_name'),$html_email);

			if($ok)
			{

				$aryData['smessage'] =  __('Your Active code has been sent to you through email. Please check email and confirm that.');
			}
			else
			{
				$ok = false;
				$aryData['serror'] = __('System Cannot send email. Please try again later.');

			}
		}else{
			$ok = false;
			$aryData['serror'] = __('Cannot find email. You need provider a registered email.');
		}

		$aryData['ok'] = $ok;
		echo json_encode($aryData);

	}

	public function getpass($username,$code){
		$aryData = array('ok'=>true);

		if(!$username || !$code){
			redirect(DEFAULT_CONTROLLER);
		}

		$user = $this->model->find_where('LBL_FIRST',array('username'=>$username));

		if($user->activeKey == $code){
			$key = json_decode(sys_decrypt($code));

			//reset active code
			$this->model->update('sys_member',array('activeKey'=>''), array ('username'=>$username));

			//check status of active key
			if(date("Y-m-d",strtotime('+10 days',strtotime($key->date))) > date("Y-m-d")){
				//active
				$newpass= random_password(8);

				$newpass_embase = password($newpass);
				$this->model->save(array('password'=>$newpass_embase,'memberId'=>$user->memberId));


				$html_email = $this->baseView('send_new_password',array('newpass'=>$newpass,'username'=>$user->username),true);


				$this->template->set('html_email',$html_email);


				$ok = sendMailQueue($user->email,__('New password from').' ' .$this->config->item('app_name'),$html_email);

				if($ok)
				{
					$aryData['ok'] = true;
					$aryData['smessage'] =  __('New password has been sent to you through email.');
				}
				else
				{
					$aryData['ok'] = false;
					$aryData['serror'] = __('System Cannot send email. Please try again later.');

				}

			}else{
				//expried
				$aryData['ok'] = false;
				$aryData['serror'] = __("Your key has been expired.");
			}
		}else{
			//expried
			$aryData['ok'] = false;
			$aryData['serror'] = __("Your key has been expired.");
		}

		$this->template->set('aryData',$aryData);
		$this->loginView('getpass');

	}

	public function logout(){
		$objMember = $this->session->userdata('LoginData');
		//$this->cookie->unset_userdata('adminCookie');
		if(!empty($objMember)){
			$this->model->add('sys_history'
					,array(
							'memberId'=>$objMember->memberId,
							'memberName'=>$objMember->firstName.' '.$objMember->lastName,
							'actionType'=>'Logout',
							'updateDate'=>date("Y-m-d H:i:s")
					));
		}


		$this->session->unset_userdata('LoginData');
		$this->session->sess_destroy();
		//$this->cookie->unset_userdata('adminCookie');
		redirect('auth');
	}

	public function signup(){
		$this->loginView('signup');
	}

	public function register(){
		$aryData = array('ok'=>true,'url'=>ROOT_URL);

		$aryRules = array(
			'email'=>array('rule'=>'not_empty|is_email'),
			'firstName'=>array('rule'=>'not_empty'),
			'lastName'=>array('rule'=>'not_empty'),
			'password'=>array('rule'=>'not_empty'),
			'roleId'=>array('rule'=>'not_empty'),
		);

		$this->validate->setRules($aryRules);


		if(!empty($this->postData) && $this->validate->validate($this->postData)){
			$this->postData['roleId'] = ROLE_MEMBER;
			$this->postData['isSA'] = 0;
			$this->postData['createdTime'] = date("Y-m-d H:i:s");
			$this->postData['status'] = ACTIVE;

			$this->postData['password'] = password($this->postData['password']);


			//Create key active
			$key = random_password(10);
			$keyactive = sys_encrypt(json_encode(array('code'=>$key,'date'=>date('Y-m-d'))));
			$this->postData['activeKey'] = $keyactive;

			$user = $this->model->find_where('LBL_FIRST',array('email'=>$this->postData['email']),array('from'=>'sys_member'));
			if(!$user){

				$this->model->add('sys_member', $this->postData);

				//send email
				$html_email = $this->baseView('emails_register',array('data'=>$this->postData),true);
				sendMailQueue($user->email,__('LBL_REGISTER_SUCCESS').' ' .$this->config->item('app_name'),$html_email);

				$objMember = $this->model->find_where('LBL_FIRST',array('email'=>$this->postData['email']),array('from'=>'sys_member'));
				$this->session->set_userdata('LoginData',$objMember);
				$aryData['url'] = site_url('member/profile');

			}else{
				$aryData['ok'] = false;
				$aryData['serror'] = __("Email is in use by other member.");
			}
		}else
		{
			$aryData['ok'] = false;
			$aryData['serror'] = implode('\r\n', $this->validate->getErrorMsg());
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
		}

		echo json_encode($aryData);
	}

	public function checkDuplicate(){
		$email = $this->input->post('email');
		$username = $this->input->post('username');
		$memberId = $this->input->post('memberId');
		$aryData = array('ok'=>true);
		if($username){
			$aryWhere = array('username'=>$username);
			if($memberId) $aryWhere['memberId !='] = $memberId;

			$user = $this->model->find_where('',$aryWhere);
			if($user){
				$aryData['ok'] = false;
				$aryData['serror'] = __("Username is in used by other user.");
			}
		}

		if($email){
			$aryWhere = array('email'=>$email);
			if($memberId) $aryWhere['memberId !='] = $memberId;

			$user = $this->model->find_where('',$aryWhere);
			if($user){
				$aryData['ok'] = false;
				$aryData['serror'] = __("Email is in used by other user.");
			}
		}

		echo json_encode($aryData);
	}

	/**
	 * auto active email
	 * @param email,$activekey
	 * @return multitype:boolean Ambigous <unknown, string> |multitype:boolean NULL Ambigous <unknown, string>
	 */
	public function activeaccount($id,$activekey){
		$aryData = array('ok'=>true);

		if(!$id || !$activekey){
			redirect(DEFAULT_CONTROLLER);
		}

		$user = $this->model->find_where('LBL_FIRST',array('memberId'=>$id));

		if($user->activeKey == $activekey){
			$ok = $this->model->update('sys_member',
				array('status'=>ACTIVE),
				array('memberId'=>$id)
			);
			$this->session->set_flashdata('message',__('Your account actived'));
			redirect('auth');
		}
	}


	public function session($provider_name,$register='')
	{
		 $this->load->library('oauth2/OAuth2');
		 $this->load->config('oauth2', TRUE);
		$this->oauth2 = new OAuth2();
		$provider = $this->oauth2->provider($provider_name, array(
			'id' => $this->config->item($provider_name.'_id', 'oauth2'),
			'secret' => $this->config->item($provider_name.'_secret', 'oauth2'),
		));


		if ( ! $this->input->get('code'))
		{
			// By sending no options it'll come back here
			$provider->authorize();
		}
		else
		{
			// Howzit?
			try
			{
				//$token = $provider->access($_GET['code']);
				$token = $provider->access($this->input->get('code'));

				$user = $provider->get_user_info($token);

				if(empty($user['email'])) $user['email'] = $user['uid'];



				if ($this->LoginData) {									// logged in
					redirect(DEFAULT_CONTROLLER);

				}else{ //already registered

					$objMember = $this->model->get_user_by_email($user['email']);

					if($objMember){
						$status = $this->model->login_oa2($objMember,$user,$provider);
						if($status ==1) {	
							redirect(DEFAULT_CONTROLLER);

						}elseif($status == -1) {
							$this->session->set_flashdata('serror',__("ERR_BLOKED_USER"));
							redirect('auth/');
						}
					}else{
						$this->model->create_user_oa2($user,$provider_name);
						$objMember = $this->model->get_user_by_email($user['email']);
						$status = $this->model->login_oa2($objMember,$user,$provider);
						if($status ==1) {
							if($register){
								redirect('account/setting');
							}else{
								redirect(DEFAULT_CONTROLLER);
							}


						}elseif($status == -1) {
							$this->session->set_flashdata('serror',__("ERR_BLOKED_USER"));
							redirect('auth/');
						}
						

					}

				}

			}

			catch (OAuth2_Exception $e)
			{
				show_error('Lỗi: '.$e);
			}

		}
	}
}

