<?php

class Front_Controller extends MX_Controller
{

    /*******************************************************/
    /**
     * @var CI_User_agent
     */
    var $agent;
    /**
     * @var CI_Benchmark
     */
    var $benchmark;
    /**
     * @var CI_Calendar
     */
    var $calendar;
    /**
     * @var CI_Cart
     */
    var $cart;
    /**
     * @var CI_Config
     */
    var $config;
    /**
     * @var CI_DB_driver
     */
    var $db;
    /**
     * @var CI_Email
     */
    var $email;
    /**
     * @var CI_Encrypt
     */
    var $encrypt;
    /**
     * @var CI_Form_validation
     */
    var $form_validation;
    /**
     * @var CI_FTP
     */
    var $ftp;
    /**
     * @var CI_Image_lib
     */
    var $image_lib;
    /**
     * @var CI_Input
     */
    var $input;
    /**
     * @var MY_Language
     */
    var $lang;
    /**
     * @var CI_Output
     */
    var $output;
    /**
     * @var CI_Pagination
     */
    var $pagination;
    /**
     * @var CI_Parser
     */
    var $parser;
    /**
     * @var CI_Session
     */
    var $session;
    /**
     * @var CI_Table
     */
    var $table;
    /**
     * @var CI_Trackback
     */
    var $trackback;
    /**
     * @var CI_Typography
     */
    var $typography;
    /**
     * @var CI_Unit_test
     */
    var $unit;
    /**
     * @var CI_Upload
     */
    var $upload;
    /**
     * @var CI_URI
     */
    var $uri;
    /**
     * @var CI_Xmlrpc
     */
    var $xmlrpc;
    /**
     * @var CI_Xmlrpcs
     */
    var $xmlrpcs;
    /**
     * @var CI_Zip
     */
    var $zip;
    /**
     * @var CI_Loader
     */
    var $load;
    /**
     * @var CI_Cookie
     */
    var $cookie;
    /**
     * @var Ciqrcode
     * @var unknown_type
     */
    var $ciqrcode;
    /**
     *
     * @var Pdf
     */
    var $Pdf;
    /**
     * @var Template
     */
    var $template;

    /**
     *
     * @var FormValidate
     */
    var $validate;

    /**
     * @var Mongo_db
     */
    var $mongo_db;

    /**
     * Store current member themes
     * @var string
     */
    public $userTheme = 'front/';
    /**
     * Store current language
     */
    public $language = "vi";
    /**
     * Store curent session of login User
     * @var LoginData
     */
    public $LoginData = NULL;
    /**
     * Strore all error of page
     * @var ArrayIterator
     */
    /**
     * @var Breadcrumbs
     */
    public $breadcrumbs;
    private $errors = array();
    /**
     * Store all message of page
     * @var ArrayIterator
     */
    private $messages = array();
    /**
     * Store view scan
     * @var ArrayIterator
     */
    public $_ci_view_paths = array();

    /**
     * Store current Module,Controller,Action,Info
     * @var ArrayIterator
     */
    public $aryCurrent = array();

    public $postData = array();
    public $postAllData = array();

    /**
     * Store flag Mobile detech
     * @var int
     */
    public $is_mobile = 0;

    /**
     * init Object
     */

    /**
     * The name of the module that this controller instance actually belongs to.
     *
     * @var string
     */
    public $module;

    /**
     * The name of the controller class for the current class instance.
     *
     * @var string
     */
    public $controller;

    /**
     * The name of the method for the current request.
     *
     * @var string
     */
    public $method;
    /**
     * Store edit object fill to Form
     * @var unknown_type
     */
    public $fillData = array();

    /**
     * Model
     * @var string
     */
    public $model_name = '';
    /**
     *
     * @var mix
     */
    public $model;

    /**
     * @var boolean
     */
    public $isMaintenance;

    /*
     * Callbacks, should contain an array of methods
    */
    //show
    protected $before_add = array();
    protected $after_add = array();

    protected $before_edit = array();
    protected $after_edit = array();

    protected $before_insert = array();
    protected $after_insert = array();

    protected $before_update = array();
    protected $after_update = array();

    protected $before_view = array();
    protected $after_view = array();

    public $pagingConfig = array(
        'base_url' => '', // url callback
        'per_page' => 10, // number record per page
        'cur_page' => 0, // the current page
        'start' => 0, // start record
        'total_rows' => 0, // total record
        'num_links' => 10, // number of link
        'first_link' => 'First', //label
        'last_link' => 'Last', //label
        'div' => '', // DOM element that displays the search result, that will auto fill
        'display_from' => 'From',
        'display_to' => 'to',
        'display_of' => 'of'
    );


    public function __construct()
    {
        parent::__construct();



        //init
        $ci =& get_instance();
        $this->template = $ci->template;

        $this->agent = $ci->agent;
        $this->session = $ci->session;
        $this->config = $ci->config;
        $this->input = $ci->input;
        $this->cookie = $ci->cookie;
        $this->lang = $ci->lang;
        $this->uri = $ci->uri;
        $this->db = $ci->db;
        $this->output = $ci->output;
        $this->breadcrumbs = $ci->breadcrumbs;
        $this->validate = new FormValidate();
        $this->mongo_db = $ci->mongo_db;


        //init Model
        if ($this->model_name) {
            $this->load->model($this->model_name);
            $this->model = $this->{$this->model_name};
        }

        //$this->template = new Template();
        $this->is_mobile = $this->agent->is_mobile();
        $this->LoginData = $this->session->userdata('LoginData');

        // Work out module, controller and method and make them accessable throught the CI instance
        $this->module = $ci->router->fetch_module();
        $this->controller = $ci->router->fetch_class();
        $this->method = $ci->router->fetch_method();

        //check maintenance
        $this->isMaintenance = getDBConfig('MAINTENANCE');
        if($this->isMaintenance && $this->module !='common' && $this->module !='auth'){
            show_maintenance();
        }

        //init post data
        $postData = $this->input->post();

        $this->postData = $postData['data'][strtolower($this->controller)];
        $this->postAllData = $postData['data'];

        //init pageing
        if (file_exists(MODULEPATH . $this->module . '/config/config.php')) {
            $this->load->config('config');
            $pagingConfig = $this->config->item('pagingConfig');
        }


        if (!empty($pagingConfig)) $this->pagingConfig = $pagingConfig;
        $this->pagingConfig['base_url'] = site_url($this->module . '/' . $this->controller . '/getList');

        //init language
        $this->lang->load('system');
        $this->lang->load($this->module);
        $this->lang->load($this->controller);

        $numberListShowing = $this->session->userdata('getList.showing');
        if ($numberListShowing) $this->pagingConfig['per_page'] = $numberListShowing;

    }

    public function checkPostSecure($formName)
    {
        return true;
        //debug($formName);
        $__token = $this->input->post('__token');

        if (!$this->postData || !$__token) return false;


        $token_data = $this->session->userdata("formSession[" . $formName . "]");

        //unset sesion
        $this->session->unset_userdata("formSession[" . $formName . "]");

        return ($__token == $token_data) ? 1 : 0;

    }

    protected final function view($view_url, $data = NULL, $return = false, $layout = 'default')
    {

        $result = NULL;
        $data = (array)$data;

        $isAjax = $this->input->get_post('ajax');
        if (!$isAjax) $isAjax = $this->input->is_ajax_request();

        $data['userCurrentTheme'] = $this->userTheme;
        $data['LoginData'] = $this->LoginData;

        //$data['lang_avail'] = $this->config->item('lang_avail');
        //$data['lang_selected'] = $this->config->item('lang_selected');

        //get current module of system
        $aryModules = $this->common_model->getMemberModules();
        $this->template->set('aryModules', $aryModules);

        $this->load->model('common/module_model');
        $aryCurrentModule = $this->module_model->find_where('', array('modulePath' => $this->router->fetch_module()));

        $this->template->set('aryCurrentModule', $aryCurrentModule);
        $this->template->set('currentController', $this->controller);

        // set layout and partials

        $this->template->set_theme($this->userTheme);

        //change layout if is Ajax call
        if ($isAjax) {
            $this->template->set_layout('ajax');
        } else {
            $this->template->set_layout($layout);
        }

        $this->loadModuleJs('common.js', 'common');
        $this->loadModuleJs('validate.js', 'common');
        $this->loadModuleJs('ajaxupload.3.5.js', 'common');
        $this->loadModuleJs('daterangepicker.jquery.js', 'common');

        $this->loadModuleJs($this->module . '.js');
        $this->loadModuleCss('style.css');

        $this->template->set_partial('header', 'particles/common/header.php', $data);
        $this->template->set_partial('footer', 'particles/common/footer.php', $data);

        $this->template->set_partial('navigation_path', 'particles/common/navigation_path.php', $data);

        $this->template->set_partial('navigation_toolbar', 'particles/common/navigation_toolbar.php', $data);

        $this->template->set_partial('menu_left', 'particles/common/left_menu.php', $data);

        $result = $this->template->build($view_url, $data, true);

        if ($return) {
            return $result;
        } else {
            if ($isAjax) {
                echo json_encode(array('html' => $result));
            } else {
                echo $result;
            }
        }
    }

    /**
     * return view with main content only
     * @param string $view_url
     * @param string $data
     * @param string $return
     * @param string $layout
     * @return Ambigous <void, unknown, mixed>
     */
    protected final function baseView($view_url, $data = NULL, $return = false, $layout = 'ajax')
    {

        $result = NULL;

        $data['LoginData'] = $this->LoginData;
        // set layout and partials
        $this->template->set_theme($this->userTheme);
        $this->template->set_layout($layout);

        $result = $this->template->build($view_url, $data, TRUE);


        if ($return) {
            return $result;
        } else {
            echo $result;
        }
    }

    /**
     * Display Login Screen
     * @param string $view_url
     * @param mixed $data
     * @param string $return
     * @param string $layout
     */
    protected final function loginView($view_url, $data = NULL, $return = false, $layout = 'login')
    {

        $result = NULL;
        $data = (array)$data;

        $data['userCurrentTheme'] = $this->userTheme;
        $data['LoginData'] = $this->LoginData;

        // set layout and partials
        $this->template->set_theme($this->userTheme);
        $this->template->set_layout($layout);

        $this->loadModuleJs('common.js', 'common');
        $this->loadModuleJs('validate.js', 'common');

        $this->template->set_partial('header', 'particles/common/header.php', $data);
        $this->template->set_partial('navigation_path', 'particles/common/navigation_path.php', $data);
        $this->template->set_partial('navigation_toolbar', 'particles/common/navigation_toolbar.php', $data);
        $this->template->set_partial('footer', 'particles/common/footer.php', $data);

        $result = $this->template->build($view_url, $data, TRUE);

        if ($return) {
            return $result;
        } else {
            echo $result;
        }
    }

    /**
     * Load a js file by module
     * @param string $jsFile
     * @param string $module
     */
    public function loadModuleJs($jsFile, $module = '',$action='')
    {
		$this->load->library('minify','','minify');
        $module = ($module) ? $module : $this->module;

        if($jsFile){
            $module = ($module)?$module:$this->module;
//			 debug($module);
            $lang = $this->lang->get_lang_name($this->lang->lang());
            $lang_path = MODULEPATH.$module.'/language/'.$lang.'/';

            if($module)$this->lang->getModuleLang($module,$lang_path);
            $file_js = MODULEPATH.$module.'/asset/js/'.$jsFile;
            $cache_path = CACHE_PATH.$module.'/'.$this->lang->lang().'/';

            //write cache
            if(!file_exists($cache_path.$jsFile)){
                if(!is_dir($cache_path)){
                    @mkdir( $cache_path, 0777, true );
                }
                file_put_contents($cache_path.$jsFile,$this->load->file($file_js,true));

            }

        }

        $script = "<script type=\"text/javascript\" src=\"" . BASE_URL.'cache/'.$module.'/'.$this->lang->lang().'/'.$jsFile. "\"></script>";
        $this->template->append_footerLoad($script);

    }

    /**
     * Load a js file by module
     * @param string $jsFile
     * @param string $module
     */
    public function loadJs($jsFile)
    {

        $script = "<script type=\"text/javascript\" src=\"" . SCRIPTS_PATH .  $jsFile . "\"></script>";
        $this->template->append_metadata($script);

    }

    public function addHeader($str)
    {
        $this->template->append_metadata($str);
    }

    /**
     * Load css file by module
     * @param string $cssFile
     * @param string $module
     */
    public function loadModuleCss($cssFile, $module = '')
    {

        $module = ($module) ? $module : $this->load->_module;
        $cssLink = "<link type=\"text/css\" rel=\"stylesheet\" href=\"" . ROOT_URL . MODULE_FOLDER . $module . "/asset/css/" . $cssFile . "\">";

        $this->template->append_metadata($cssLink);

    }

    public function loadCss($cssFile)
    {
        $cssLink = "<link type=\"text/css\" rel=\"stylesheet\" href=\"" . STYLES_PATH . $cssFile . "\">";

        $this->template->append_metadata($cssLink);
    }

    /**
     * Load a js file by module
     * @param string $jsFile
     * @param string $module
     */
    public function assetCss($cssFile,$flag = false)
    {

        $cssLink = "<link type=\"text/css\" rel=\"stylesheet\" href=\"" . SCRIPTS_PATH . $cssFile . "\">";
        if(!$flag){
            $this->template->append_metadata($cssLink);
        }else{
            return $cssLink;
        }
    }


    /**
     * Assign a error for screen
     * @param unknown_type $error
     */
    public function set_error($error = '')
    {
        if ($error) $this->errors[] = $error;
    }

    /**
     * Store message to stack
     * @param string $message
     */
    public function set_message($message = '')
    {
        if ($message) $this->messages[] = $message;
    }

    /**
     * Get All Error assigned
     */
    public function display_errors()
    {
        $str = '';
        if (isset($this->errors) && count($this->errors)) {
            foreach ($this->errors as $error) {
                $str .= "<p class='error-message'>" . $error . '</p>';
            }
        }
        return $str;
    }

    /**
     * Get All screen Messeage assigned
     * @return string
     */
    public function display_messages()
    {
        $str = '';
        if (isset($this->messages) && count($this->messages)) {
            foreach ($this->messages as $msg) {
                $str .= "<p class='notice'>" . $msg . '</p>';
            }
        }
        return $str;
    }

    /**
     * return header utf-8
     */
    public function headerUTF8()
    {
        header('content-type: text/html; charset: utf-8');
    }


    /**
     * Run the specific callbacks, each callback taking a $data
     * variable and returning it
     */
    protected function _callbacks($name, $params = array())
    {
        $data = (isset($params[0])) ? $params[0] : FALSE;

        if (!empty($name)) {
            $count_err=0;
            $count_time=0;
            $old_data=array('ok'=>'', 'serror'=>'');
            $data=array();
            foreach ($name as $method) {
                $count_time++;

                $new_data = call_user_func_array(array($this, $method), $params);

                $data=array_merge($old_data, $new_data);

//				if(!$data['ok']) break;
                // update data before loop

                if (!$data['ok']) {
                    $count_err++;// count error number
                    $data['serror'] = $old_data['serror'].$new_data['serror'] ;
                }else{
                    $data['serror'] = $old_data['serror'].$new_data['serror'];
                }
                if($count_time>1){//do not merge result at first time
                    $data['ok'] = ($old_data['ok'] && $new_data['ok']);
                }
                $old_data=$data;
            }
        }
        if($count_err>1){
            $data['serror']= $data['serror'];
        }
//        debug($data);
        return $data;
    }

    /**
     * Build a Condition where for search
     * @return mixed:
     */
    protected function _buildCondition()
    {
        $aryCondition = array();
        return $aryCondition;
    }

    /**
     * Get single data by id
     * @param int $id
     */
    protected function _getData($id, $permission = 'all')
    {
        if ($this->model) {
            $key = $this->model->get_primary_key();
            $condition = array($key => $id);
            switch ($permission) {
                case 'owner':
                    $condition['createdId'] = $this->LoginData->memberId;
                    break;
            }
            return $this->model->find_where('', $condition);
        }
    }

    protected function index()
    {

        if ($this->model) {
            $arySearch = $this->session->userdata(_getBaseName('getList.search'));
            $this->template->set('arySearch', $arySearch);

            $htmlList = Modules::run($this->controller . '/getList');
            $htmlList = str_replace('id="' . _getName('Form') . '"', 'id="' . _getBaseName('GetList_Form') . '"', $htmlList);
            $this->template->set('htmlList', $htmlList);
            $this->view($this->controller . 's/index');
        }


    }

    /**
     * Get data for List screen
     * @param array $aryCondition
     * @param int $start
     * @return mixed
     */
    protected function _getDataList($aryCondition = array(), $start = '', $sort = array(), $params = array())
    {
        if ($this->model) {
            if (!$params['all']) {
                if (!$params['limit']) $params['limit'] = $this->pagingConfig['per_page'];
                $params['offset'] = $start;
            }
            if ($sort) {
                $params['order_by'] = $sort;
            }
            $rows = $this->model->find_where('list', $aryCondition, $params);
//			echo $this->model->db->last_query();
            if(empty($rows)){
                $start = $this->session->userdata(_getBaseName('getList.start'));
                $per = $this->pagingConfig['per_page'];
                 if($start>0){
                     $start = $start - $per;
                     $this->session->set_userdata(_getBaseName('getList.start'),$start);
                     $params['offset'] = $start;
                     $rows = $this->model->find_where('list', $aryCondition, $params);
                 }
            }

            return $rows;
        }
    }


    /**
     * Show content of List screen (Table List)
     * @param int $start
     */
    protected function getList($start = '')
    {
        //$this->session->unset_userdata(_getBaseName('getList.filter'));
        //$this->session->sess_destroy();
        //debug(_getBaseName('getList.start'));
        if ($this->postData['numberListShowing']) {
            $this->pagingConfig['per_page'] = $this->postData['numberListShowing'];
            $this->session->set_userdata('getList.showing', $this->postData['numberListShowing']);
        }

        if ($this->model) {
            if ($start !== '') {
                $this->session->set_userdata(_getBaseName('getList.start'), $start);
            }

            $aryCondition = $this->session->userdata(_getBaseName('getList.filter'));
            if (!$aryCondition) {
                //build search
                $aryCondition = $this->_buildCondition();
                $this->session->set_userdata(_getBaseName('getList.filter'), $aryCondition);
            }

            if ($this->input->post('search')) {
                $aryCondition = $this->_buildCondition();
                $this->session->set_userdata(_getBaseName('getList.filter'), $aryCondition);
                //debug($this->input->post());
                $this->session->set_userdata(_getBaseName('getList.search'), $this->postData);

                $this->session->unset_userdata(_getBaseName('getList.start'));
            }
            //debug(_getBaseName('getList.start'));

            if ($this->input->get_post('sort')) {
                $sort = $this->input->get_post('sort');
                $dir = ($this->input->get_post('dir') == 'asc') ? 'asc' : 'desc';
                $this->session->set_userdata(_getBaseName('getList.sort'), array($sort => $dir));
            }

            //get start page
            $start = intval($this->session->userdata(_getBaseName('getList.start')));

            $sort = $this->session->userdata(_getBaseName('getList.sort'));
            if (!$sort) {

                $viewdefs = $this->config->item(strtolower($this->controller) . '_viewdefs');
                if ($viewdefs['getList']['order_by']) {
                    $sort = $viewdefs['getList']['order_by'];
                }

            }


            $this->template->set('sort', $sort);

            $aryCondition = $this->session->userdata(_getBaseName('getList.filter'));

            //init result of list

            $aryData = $this->_getDataList($aryCondition, $start, $sort);
            //debug($this->db->last_query());
            $start = intval($this->session->userdata(_getBaseName('getList.start')));

            $total = $this->_getDataTotal($aryCondition);
            $this->pagingConfig['total_rows'] = $total;


            $this->template->set('aryData', $aryData);


            //init paging infomation
            $this->pagingConfig['div'] = _getBaseName('SaveAll_Form');
            $this->pagingConfig['captchaAnchor'] = _getBaseName('List');
            $this->pagingConfig['cur_page'] = $start;
            //debug($this->pagingConfig,false);
            $this->jquery_pagination->initialize($this->pagingConfig);
            $this->template->set('pagination', $this->jquery_pagination);

            $this->template->set('start', $start);

            $this->template->set('pagingConfig', $this->pagingConfig);
            $this->baseView($this->controller . 's/getList');
        }
    }

    protected function getListTask($start = '', $projectID = '')
    {

        //$this->session->unset_userdata(_getBaseName('getList.filter'));
        //$this->session->sess_destroy();
        //debug(_getBaseName('getList.start'));
        if ($this->model) {
            if ($start !== '') {
                $this->session->set_userdata(_getBaseName('getList.start'), $start);
            }

            $aryCondition = $this->session->userdata(_getBaseName('getList.filter'));
            if (!$aryCondition) {
                //build search
                $aryCondition = $this->_buildCondition();
                $this->session->set_userdata(_getBaseName('getList.filter'), $aryCondition);
            }

            if ($this->input->post('search')) {
                $aryCondition = $this->_buildCondition();
                $this->session->set_userdata(_getBaseName('getList.filter'), $aryCondition);
                //debug($this->input->post());
                $this->session->set_userdata(_getBaseName('getList.search'), $this->postData);

                $this->session->unset_userdata(_getBaseName('getList.start'));
            }
            //debug(_getBaseName('getList.start'));

            if ($this->input->get_post('sort')) {
                $sort = $this->input->get_post('sort');
                $dir = ($this->input->get_post('dir') == 'asc') ? 'asc' : 'desc';
                $this->session->set_userdata(_getBaseName('getList.sort'), array($sort => $dir));
            }

            //get start page
            $start = intval($this->session->userdata(_getBaseName('getList.start')));

            $sort = $this->session->userdata(_getBaseName('getList.sort'));
            if (!$sort) {

                $viewdefs = $this->config->item(strtolower($this->controller) . '_viewdefs');
                if ($viewdefs['getList']['order_by']) {
                    $sort = $viewdefs['getList']['order_by'];
                }

            }


            $this->template->set('sort', $sort);

            $aryCondition = $this->session->userdata(_getBaseName('getList.filter'));

            //init result of list

            $aryData = $this->_getDataListTask($aryCondition, $start, $sort, $projectID);
            //debug($this->db->last_query());

            $total = $this->_getDataTotal($aryCondition);
            $this->pagingConfig['total_rows'] = $total;


            $this->template->set('aryData', $aryData);


            //init paging infomation
            $this->pagingConfig['div'] = _getBaseName('SaveAll_Form');
            $this->pagingConfig['captchaAnchor'] = _getBaseName('List');
            $this->pagingConfig['cur_page'] = $start;
            //debug($this->pagingConfig,false);
            $this->jquery_pagination->initialize($this->pagingConfig);
            $this->template->set('pagination', $this->jquery_pagination);

            $this->template->set('start', $start);

            $this->baseView($this->controller . 's/getListTask');
        }
    }

    /**
     * get Total of data
     * @param mixed $aryCondition
     */
    protected function _getDataTotal($aryCondition = array(), $params = array())
    {
        if ($this->model) {
            return $this->model->count_where($aryCondition, $params);
        }
    }



    protected function _getTree($parentId = 0, $level = 0, $params = array())
    {
        $rows = $this->model->find_where('list',
            array($params['parent'] => $parentId, 'status' => ACTIVE),
            array('from' => $params['table'], 'select' => $params['select']));
        $tree = array();
        $rows = langObject($rows);
        foreach ($rows as $row) {
            $row->level = $level;
            $level++;
            $row->children = $this->_getTree($row->{$params['key']}, $level, $params);
            $tree[] = $row;
            $level--;
        }

        return $rows;

    }

    protected function check_status($id=''){
        $query= $this->db->get_where("sys_member",array('memberId' =>$id,'del_flag' => 0));
        $row= $query->row();
        $status=$row->status;
        if(!$status) {
            redirect("auth/logout");
        }else{
            return true;
        }

    }
}

?>