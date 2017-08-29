<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Member extends Member_Controller {
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

	/** @var  Excel */
	public $excel;

	/**
	 * Member controller
	 */

	protected $before_add = array('getListRole');
	protected $before_insert = array('prepaire_insert');

	protected $before_edit = array('getListRole', 'check_if_locked');
	protected $before_update = array('prepaire_update');

	protected $after_view = array();


    public function __construct(){
        parent::__construct();
		$this->load->library('excel');
		$this->excel = new Excel();
        //$this->session->sess_destroy();
    }

   /**
    * Prepaire data before insert to database
    */

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

	protected function getListRole(){
		$aryData = array('ok'=>true,'list_role'=>'');
		$arrRole = array(''=>__('--Select one--'));
		$arrDataRole = $this->model->find_where('list',
			array('status'=>ACTIVE,'del_flag'=>NOT_DELETED),
			array('from'=>'sys_role',
				'select'=>array('roleId','roleName')
			)
		);
		foreach( $arrDataRole as $key=>$value ){
			$arrRole[$value->roleId] = $value->roleName;
		}
		asort($arrRole);
		$aryData['list_role'] = $arrRole;
		return $aryData;
	}

    protected function  prepaire_insert(){
    	$aryData = array('ok'=>true);
    	//check duplicate username
    	$user = $this->model->find_where('',array('username'=>$this->postData['username']));
    	if($user){
    		$aryData['ok'] = false;
    		$aryData['serror'] = __('Username is existed.');
    		return $aryData;
    	}
    	//check duplicate email
    	$user = $this->model->find_where('',array('email'=>$this->postData['email']));
    	if($user){
    		$aryData['ok'] = false;
    		$aryData['serror'] = __('Email is existed.');
    		return $aryData;
    	}

    	$this->postData['status'] = (isset($this->postData['status']))?$this->postData['status']:ACTIVE;
		$this->postData['firstName'] = $this->sort_input_data(trim($this->postData['firstName']));
		$this->postData['lastName'] = $this->sort_input_data(trim($this->postData['lastName']));
     	//$this->postData['roleId'] = json_encode($this->postData['roleId']);
    	$this->postData['password'] = password($this->postData['password']);
		$this->postData['cuc'] = 'how do you get home from work!';
    	return $aryData;
    }
    /**
     * * Prepaire data before insert to database
     * @return multitype:boolean Ambigous <unknown, string> |multitype:boolean NULL Ambigous <unknown, string>
     */
    protected  function prepaire_update(){
    	$aryData = array('ok'=>true);

    	//check duplicate username
    	$user = $this->model->find_where('',array('username'=>$this->postData['username'],
    											  'memberId !='=>$this->postData['memberId']));

    	if($user){
    		$aryData['ok'] = false;
    		$aryData['serror'] = __('Username is existed.');
    		return $aryData;
    	}

    	//check duplicate email
    	$user = $this->model->find_where('',array('email'=>$this->postData['email'],
    										'memberId !='=>$this->postData['memberId']));
    	if($user){
    		$aryData['ok'] = false;
    		$aryData['serror'] = __('Email is existed.');
    		return $aryData;
    	}

    	$this->postData['status'] = (isset($this->postData['status']))?$this->postData['status']:ACTIVE;
    	//$this->postData['roleId'] = json_encode($this->postData['roleId']);
		$this->postData['firstName'] = $this->sort_input_data(trim($this->postData['firstName']));
		$this->postData['lastName'] = $this->sort_input_data(trim($this->postData['lastName']));
    	if($this->postData['password']){
    		$this->postData['password'] = password($this->postData['password']);
    	}else{
    		unset($this->postData['password']);
    	}

    	return $aryData;
    }



    /**
     *  Search condition
     * @see MY_Controller::_buildCondition()
     */
    protected function _buildCondition(){
    	$aryCondition = array();
    	//debug($this->postData);
    	if(!empty($this->postData)){
    		 if($this->postData['q']){
    		 	$aryCondition['and'][] =  '((CONCAT(firstName,\' \',lastName) LIKE "%'.trim($this->postData['q']).'%")
    		 	OR (email = "'.trim($this->postData['q']).'")
    		 	OR (username = "'.trim($this->postData['q']).'")
    		 	)';
    		 }

    		 if($this->postData['roleId']){
    		 	$aryCondition['and'][] =  array("roleId"=> $this->postData['roleId']);
    		 }

    		 if($this->postData['letter']){
    		 	$aryCondition['and'][] =  array("REPLACE(UPPER(SUBSTRING(lastname,1,1)),'?','D')"=>$this->postData['letter']);
    		 }
			if($this->postData['clientId']!=''){
				$aryCondition['and'][] =  array("mt.clientId"=>$this->postData['clientId']);
			}


    		 if($this->postData['status']!=''){
    		 	$aryCondition['and'][] =  array("mt.status"=>$this->postData['status']);
    		 }

    	}
    	return $aryCondition;
    }

    /**
     * get data for grid
     * @see MY_Controller::_getDataList()
     */
    protected function _getDataList($aryCondition=array(),$start='',$sort = array()){

    	$rows = $this->model->_getDataMember($aryCondition,$this->pagingConfig['per_page'], $start, $sort);

        //debug($this->db->last_query());

    	foreach($rows as $key=>$row){
    		//init Role
    		$aryRoleId = json_decode($row->roleId);

    		if($aryRoleId){
    			$aryRole = $this->model->find_where('list',
    					array('IN'=>array('roleId'=>$aryRoleId)),
    					array('from'=>'sys_role'));
    		}else{
    			$aryRole = array();
    		}
    		$aryRoleName = array();
    		foreach($aryRole as $role) $aryRoleName[] = $role->roleName;

    		$rows[$key]->aryRoleName =  $aryRoleName;
			$rows[$key]->locked_myself=($this->LoginData->memberId==$row->memberId);
    	}
		$rows = $this->mergeGetList($rows);

    	return $rows;
    }

    /**
     * You cannot delete user isSA
     * @see MY_Controller::delete()
     */
    public function delete($cid='',$return = false){

    	$aryData = array('ok'=> true);

    	if(!is_array($cid)) $cid = array($cid);

		//store log
		foreach($cid as $id){
			$data = $this->model->get($id);
			$logData = array('data_before' => json_encode($data));
			$logData['task'] = 'delete';
			$this->model->addLog($logData);
		}

    	$ok = $this->model->delete($cid,array('isSA'=>0));

    	if($ok){
    		$aryData ['smessage']= __("MSG_DELETE_SUCCESS");


    	}else{
    		$aryData ['ok'] = false;
    		$aryData ['serror'] = __("ERR_CANNOT_DELETE");
    	}

    	if($return){
    		return $aryData;
    	}else{
    		echo json_encode($aryData);
    	}
    }

    /**
     * Upload avatar image
     */
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
    		$aryData['serror'] =  str_replace("The filetype you are","Your avatar is",$this->upload->display_errors('','') );
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
    	}

    	echo json_encode($aryData);

    }

    /**
     * Do setting member profiles
     */
    public function setting(){

    	$memberId = $this->LoginData->memberId;
    	$fillData = $this->model->get($memberId);

    	$aryRoleId = json_decode($fillData->roleId);
    	$aryRole = $this->model->find_where('list',array('IN'=>array('roleId'=>$aryRoleId)),array('from'=>'sys_role'));
    	$fillData->aryRole = $aryRole;

    	$this->template->set('fillData',$fillData);
    	$this->view('members/setting');
    }

	function detail($id = '')
	{
		$fillData = $this->model->get($id);
		$role = $this->model->get($fillData->roleId,array('from'=>'sys_role'));
		$this->template->set('role',$role);
		parent::detail($id); // TODO: Change the autogenerated stub
	}

	/**
     * Check duplicate email or username
     */
    function suggestions()
    {

        $term = $this->input->get('term',TRUE);

        $rows = $this->model->_getAutoComplete(array('keyword' => $term));

        $jsonUsername = array();
        $jsonId = array();
        foreach ($rows as $row)
        {
            array_push($jsonUsername, $row->username);
            array_push($jsonId, $row->memberId);
        }
        $member = array(
            "id" => $jsonId,
            "username" => $jsonUsername,
        );
        echo json_encode($member);
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
    			$aryData['serror'] = __("ERR_USERNAME_EXISTED");
    		}
    	}

    	if($email){
    		$aryWhere = array('email'=>$email);
    		if($memberId) $aryWhere['memberId !='] = $memberId;

    		$user = $this->model->find_where('',$aryWhere);
    		if($user){
    			$aryData['ok'] = false;
    			$aryData['serror'] = __("ERR_EMAIL_EXISTED");
    		}
    	}

    	echo json_encode($aryData);

    }

	function check_if_locked($id=''){
		$aryData=array('ok'=>true, 'locked'=>
				$locked=($this->LoginData->memberId==$id));
		return $aryData;
	}

	function export(){
		set_time_limit(0);
		$aryCondition = $this->session->userdata(_getBaseName('getList.filter'));
		$members = $this->model->find_where('list',$aryCondition,array(
			'select'=>'mt.*,dv.name as client',
			'from'=>'sys_member','join'=>array(array('client as dv','dv.id = mt.clientId','left'))));

		header('Content-Type: application/csv');
		header('Content-Disposition: attachment; filename=member.csv');
		header('Pragma: no-cache');
		$head = array('memberId','firstName','lastName','email','phone','status','client','expired','coin','createdTime');
		$csv = '';
		$csv .= '"' . implode('","', $head) . '"' . PHP_EOL;
		foreach ($members as $m){
			$data = array($m->memberId,$m->firstName,$m->lastName,$m->email,$m->phone,$m->status,$m->client,$m->expired,$m->coin,$m->createdTime);
			$csv .= '"' . implode('","', $data) . '"' . PHP_EOL;
		}

		echo $csv;
	}

	public function upload(){

		if(!empty($this->postData)){


			 if($_FILES){
				 $fileName = $_FILES['data']['name']['member']['fileCsv'];
				 $tmp_name = $_FILES['data']['tmp_name']['member']['fileCsv'];
				 $ext = end(explode('.',$fileName));
				 if($ext=='xls'){
					 try{
						 move_uploaded_file($tmp_name, FCPATH.UPLOAD_DIR.'csv/'.$fileName);
						 $status = $this->_import(FCPATH.UPLOAD_DIR.'csv/'.$fileName,$this->postData);
//						 $this->template->set('status',$status);

						 $this->session->set_flashdata('message','<span class="message"> Đã thêm <b>'.$status['inserted'].'</b> bản ghi và cập nhật <b>'.$status['updated'].'</b> bản ghi</span>');
						 redirect('member');
					 }catch(Exception $e){
						 $error = $e->getMessage();
					 }



				 }else{
					 $error = 'Hệ thống chỉ chấp nhận file xls.';
				 }
			 }else{
				 $error = 'Hãy upload file định dạng Excel theo mẫu.';
			 }



		}
		$this->template->set('error',$error);

		$this->view('members/upload');
	}

	private function _import($file,$params){

		$inserted = 0; $updated = 0;

		$clientId=$params['clientId'];
		$expired=$params['expired'];

		$expired_from = ($params['expired_from'])?strtotime($params['expired_from']):time();
		$overwrite = $params['overwrite'];

		$aryData = $this->excel->load($file,2);//Input file path,Rows Start

//		debug($aryData);

		if($aryData['data']){

			foreach($aryData['data'] as $data){

				$member = array(
					'firstName'=>trim($data[1]),
					'lastName'=>trim($data[2]),
					'username'=>strtolower(trim($data[3])),
					'password'=>password(trim($data[4])),
					'email'=>trim($data[5]),
					'phone'=>trim($data[6]),
					'birdthday'=>trim($data[7])
				);

				if($clientId){ $member['clientId'] = $clientId;}


				$check = $this->model->find_where('',array('username'=>$member['username']),array('from'=>'sys_member'));
				if(empty($check)){
					//insert
					if($expired){
						$member['expired'] = date("Y-m-d H:i:s",strtotime('+'.$expired.' days',$expired_from));
					}
					$inserted++;
					$member['roleId'] = ROLE_MEMBER;
					$this->model->add('sys_member',$member);
				}else{
					//update
					if($expired){
						if(!$check->expired){
							$member['expired'] = date("Y-m-d H:i:s",strtotime('+'.$expired.' days',$expired_from));
						}else{
							if($check->expired < date("Y-m-d")){
								$member['expired'] = date("Y-m-d H:i:s",strtotime('+'.$expired.' days',$expired_from));
							}else{
								if($overwrite){
									$member['expired'] = date("Y-m-d H:i:s",strtotime('+'.$expired.' days',$expired_from));
								}else{
									if($check->expired > $params['expired_from']){
										$member['expired'] = date("Y-m-d H:i:s",strtotime('+'.$expired.' days',strtotime($check->expired)));
									}else{
										$member['expired'] = date("Y-m-d H:i:s",strtotime('+'.$expired.' days',$expired_from));
									}

								}

							}
						}

					}
					$updated++;
					$this->model->update('sys_member',$member,array('memberId'=>$check->memberId));
				}
			}
		}
		return array('inserted'=>$inserted,'updated'=>$updated);
	}

}


?>