<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Account extends Front_Controller {
    /**
     * Model
     * @var string
     */
    public $model_name  = 'account_model';
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
        if(!$this->LoginData){
            accessDenied();
        }
    }

    public function index(){
        $this->profile();
    }

    public function profile(){
        $user = $this->model->get($this->LoginData->memberId,array('from'=>'sys_member'));


        $this->template->set('totalSearch',$totalSearch);
        $this->template->set('totalCompany',$totalCompany);
        $this->template->set('totalBanner',$totalBanner);

        $this->template->set('user',$user);


        $this->view('account/profile','','','auth');
    }

    public function setting(){
        $user = $this->model->get($this->LoginData->memberId,array('from'=>'sys_member'));
        $this->template->set('user',$user);
        $this->view('account/setting','','','auth');
    }

    public function updateProfile(){
        $aryData = array('ok'=>true);


        $data = array(
            'firstName'=>$this->postData['firstName']
            ,'lastName'=>$this->postData['lastName']
            ,'title'=>$this->postData['title']
            ,'email'=>$this->postData['email']
            ,'phone'=>$this->postData['phone']
            ,'facebook'=>$this->postData['facebook']
            ,'linkin'=>$this->postData['linkin']
            ,'skype'=>$this->postData['skype']
         );

        $ok = $this->model->update('sys_member',$data);

        $aryData['ok'] = $ok;
        if($ok){
            $aryData['smessage'] = __("MSG_UPDATE_SUCCESSFUL");
        }else{
            $aryData['serror'] = __("ERR_CANNOT_UPDATE");
        }

        echo json_encode($aryData);
    }

    public function updatePassword(){
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


    public function business($start=0){

        $limit = 10;
        if($start<=0) $start = 1;
        $offset = ($start-1)*$limit;

        $user = $this->model->get($this->LoginData->memberId,array('from'=>'sys_member'));
        $this->template->set('user',$user);

        $where = array('mt.memberId'=>$this->LoginData->memberId);

        $company = $this->model->find_where('list',$where,array(
            'select'=>'c.*',
            'from'=>'company_manager',
            'join'=>array(array('company as c','mt.companyId = c.id')),
            'offset'=>$offset,'limit'=>$limit,
            'order_by'=>array('mt.createdTime'=>'DESC')
        ));

        $total = $this->model->count_where($where,array(
            'from'=>'company_manager',
            'join'=>array(array('company as c','mt.companyId = c.id'))
        ));

        $config['div'] = 'companyList';
        $config['anchor'] = 'captchaAnchor';
        $config['base_url'] = '/account/business';
        $config['total_rows'] = $total;
        $config['per_page'] = $limit;
        $config['cur_page'] = $start;
        $config['display_from'] = "Display from";
        $config['display_to'] = "to";
        $config['display_of'] = "of";
        $this->template->set('start',$start);

        $this->jquery_pagination->initialize($config);
        $this->template->set('pagination',$this->jquery_pagination);

        $this->template->set('company',$company);

        $this->view('account/business','','','auth');

    }


}

//end of Home