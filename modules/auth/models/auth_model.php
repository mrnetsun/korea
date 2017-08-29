<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Auth_Model extends MY_Model{
	
   protected $main = array('table'=>'sys_member');
   protected $primary_key = 'memberId';
	
    function __construct(){
        parent::__construct();
       
    }

    function get_user_provider($provider,$user){

		$key =  $user['uid'];
		
        $user = $this->find_where('',array('provider'=>$provider,'username'=>$key),
            array('from'=>'sys_member'));
        return $user;
    }

    function get_user_by_email($email){
        $objMember = $this->find_where('',array('email'=>$email),
            array('from'=>'sys_member'));

        return $objMember;
    }

    function login_oa2($objMember,$user,$provider=''){

//        debug($user);

        if(!empty($objMember)){
            if($objMember->status){
                //update avatar
                if($provider->name == 'facebook'){
                    $avatar  = 'https://graph.facebook.com/'.$user['uid'].'/picture?type=normal';
                }else{
                    $avatar = $user['image'];
                }

                $objMember->avatar = $avatar;
                $this->update('sys_member',array('avatar'=>$avatar),array('memberId'=>$objMember->memberId));

                $objMember->permission = $this->getMemberPermision($objMember);
                $CI = &get_instance();
                $CI->session->set_userdata('LoginData',$objMember);

                $this->add('sys_history',array(
                    'memberId'=>$objMember->memberId,
                    'memberName'=>$objMember->firstName.' '.$objMember->lastName,
                    'actionType'=>'Login',
                    'updateDate'=>date("Y-m-d H:i:s")
                ));

                $ok = 1;
            }else{
                $ok =  -1;
            }

        }else{
            $ok = 0;
        }

        return $ok;
    }

    public function create_user_oa2($user,$provider){

		$data = array('email'=>$user['email'],
            'provider'=>$provider,
            'username'=>$user['uid'],
            'firstName'=>$user['first_name'],
            'lastName'=>$user['last_name'],
            'status'=>ACTIVE,
            'roleId'=>ROLE_MEMBER,
			'avatar'=>$user['image']
        );
		
		if($provider == 'facebook'){
			$data['avatar'] = 'https://graph.facebook.com/'.$user['id'].'/picture?type=normal';
			if(!$data['firstName'] && !$data['last_name']) $data['firstName'] = $user['name'];
		} 
           

       $user_id = $this->add('sys_member',$data);

       return $user_id;
    }

    public function getDepartment($data){
    	$country = $data['country'];
    	$region = $data['regionId'];
    	
    	$department = $this->find_where('LBL_FIRST',array('country'=>$country,'region'=>$region),array('from'=>'sys_department'));
    	if(!$department) $departmentId = $this->find_where('LBL_FIRST',array('country'=>$country),array('from'=>'sys_department'));
    	
    	return $department->departmentId;
    }

    public function getMemberPermision($objMember){
        $rows = $this->find_where('list',
            array('mt.roleId'=>$objMember->roleId),
            array(
                'select'=>'mt.*,r.resource_name,r.resource_code',
                'from'=>'sys_role_permision',
                'join'=>array(
                    array('sys_resource as r','r.resource_id = mt.resourceId AND r.status='.ACTIVE,'left'),
                    array('sys_role as role','role.roleId = mt.roleId AND role.status='.ACTIVE,'right')//add such as select where into status
                ),
            ));
        $return = array();
        foreach($rows as $k=>$v){
            $new = new stdClass();
            $new->full = $v->full;
            $new->listView = $v->listView;
            $new->edit = $v->edit;
            $new->add = $v->add;
            $new->delete = $v->delete;
            $new->resource_name = $v->resource_name;
            $new->resource_code = $v->resource_code;
            $return[$v->resource_code] = $new;
        }

        return $return;
    }
    
}