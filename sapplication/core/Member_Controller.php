<?php

class Member_Controller extends MY_Controller
{
    /**
     * @var array
     */
    //var $action_list = array('index', 'getlist', 'detail');
    var $action_listview = array('index', 'getlist', 'detail','getlistrecentupdate');
    /**
     * @var array
     */
    var $action_add = array('add', 'insert', 'index', 'getlist','saveall','checkDuplicate','prepaire_insert','detail');
    /**
     * @var array
     */
    var $action_edit = array('edit', 'update', 'dataswitch', 'index', 'getlist', 'detail', 'publish', 'unpublish','saveall','checkDuplicate','prepaire_update','changepass','updateprofile','updatepass');
    /**
     * @var array
     */
    var $action_delete = array('index', 'getlist', 'delete','saveall','detail');

    protected $before_edit = array();

    protected $before_update = array("check_is_related");
    protected $after_update = array();

    function __construct()
    {
        parent::__construct();
        $this->is_mobile = $this->agent->is_mobile();
        $this->checkLogin();

        if (!$this->checkPermission()) {
            accessDenied();
        }
        $this->check_status($this->LoginData->memberId);

    }

    protected function checkLogin()
    {
        /* Check User Online */
        if (!$this->LoginData) {
            $this->session->set_userdata('solr.callback',current_url());
            redirect('auth');
        }
    }

    protected function checkPermission()
    {
        return true;
//		debug($this->LoginData->permission,false);

        if ($this->LoginData->isSA) return true;

        $ok = false;

        $module = strtolower($this->module);
        $controller = strtolower($this->controller);
        $action = strtolower($this->method);

        if ($module == 'home'&& $controller == 'home') return true;
        if ($module == 'member' && $controller == 'profile' ) return true;

        $permission = $this->LoginData->permission[$module . '/' . $controller];

        if (!empty($permission)) {
            if ($permission->full) return true;
            //debug($action );
            if ($permission->edit && in_array($action, $this->action_edit)) {
                return true;
            }

            if ($permission->delete && in_array($action, $this->action_delete)) {
                return true;
            }

            if ($permission->add && in_array($action, $this->action_add)) {
                return true;
            }

            if ($permission->listView && in_array($action, $this->action_listview)) {
                return true;
            }
        }


        return $ok;
    }

    protected function checkDeploy(){
        $controller = strtolower($this->controller);
        $action = strtolower($this->method);
        if( in_array($action,array('insert','update','dataswitch','saveall','delete'))){
            setDeployFlag(1);
        }
    }

    /**
     * Main of screen (List)
     */
    public function index()
    {

        return parent::index();

    }

    public function getList($start = '')
    {
        return parent::getList($start);
    }

    /**
     * Show add form
     */
    public function add()
    {
        if ($this->model) {
            if (!empty($this->before_add)) {
                $params = func_get_args();
                $data = $this->_callbacks($this->before_add, $params);
                $this->template->set(data, $data);
            }

            $this->view($this->controller . 's/add');
        }

    }

    /**
     * Insert new record
     */
    public function insert($return = false)
    {
        if ($this->model) {
            //check post data
            $aryData = array('ok' => true);

            $ok = $this->checkPostSecure(_getName('form'));

            if ($ok) {
                if (!empty($this->before_insert)) {
                    $params = func_get_args();
                    $aryData = $this->_callbacks($this->before_insert, $params);
                }
                if ($aryData ['ok']) {
                    $aryData = $this->saveAll('add', '', '', '', FALSE);

                    $log = array('data_before' => json_encode($this->model->get($aryData['ok'])));
                    $log['task'] = 'insert';
                    $this->model->addLog($log);

                    if (!empty($this->after_insert)) {
                        $params = func_get_args();
                        $this->_callbacks($this->after_insert, array($this->model->insert_id()));

                    }
                }
            } else {
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("ERR_SECURITY_REQUIRED");
            }
            if ($return) return $aryData;
            else echo json_encode($aryData);
        }
    }

    /**
     * Show edit form
     * @param int $id
     */
    public function edit($id = '', $permission = 'all')
    {
        if ($this->model) {
            $fillData = new stdClass();
            $recordId = ($id) ? $id : $this->postData[cid][0];
            $do_read = true;

//            if ($this->module !== 'member') $do_read = $this->do_read_record($recordId);
            $do_read = $this->do_read_record($recordId);
            if ($do_read) {// check locked record
                if (!empty($this->before_edit)) {
                    $params = func_get_args();
                    $data = $this->_callbacks($this->before_edit, $params);
                    $this->template->set(data, $data);
                }

                if (!$id) {
                    $id = $this->postData['cid'][0];
                }
                $fillData = $this->_getData($id, $permission);

                if (!empty($this->after_edit)) {
                    $this->_callbacks($this->after_edit, array($fillData));
                }

                $this->template->set('fillData', $fillData);
                $this->view($this->controller . 's/edit');
            } else {
                $fillData->ok = false;
                $fillData->serror = __("LBL_ALREADY_READ");
                $fillData->html = "<div class='content-msg' style='margin: 50px 0;'><strong class='required'>" . __("LBL_ALREADY_READ") . "</strong></div>";
                $this->template->set('fillData', $fillData);
                echo json_encode($fillData);
            }

        }
    }

    /**
     * Update record by Id
     * @param int $id
     */
    public function update($id = '', $return = false)
    {
        if (!$id) $id = $this->postData[$this->model->get_primary_key()];
        if ($this->model) {

            //check post data
            $aryData = array('ok' => true);

            $ok = $this->checkPostSecure(_getName('form'));
            if ($ok) {
                $is_related = $this->check_is_related($this->postData);
                if ($is_related && !$this->postData['status']) {
                    $aryData ['ok'] = false;
                    $aryData ['serror'] = __("LBL_IS_RELATED");
                } else {
                    // do it
                    $recordId = ($id) ? $id : $this->postData[cid][0];
                    $canWriteRecord = $this->do_write_record($recordId);
                    if ($canWriteRecord) {
                        if (!empty($this->before_update)) {
                            $params = func_get_args();
                            $aryData = $this->_callbacks($this->before_update, $params);
                        }

                        if ($aryData ['ok']) {

//                            $data_before = $this->model->get($id);
                            $aryData = $this->saveAll('save', $id, '', '', FALSE);
                            $data_after = $this->postData;
                            unset($data_after['__token']);

//                            $log = array('data_before' => json_encode($data_before), 'data_after' => json_encode($data_after));
//                            $log['task'] = 'update';
//                            $this->model->addLog( $log );

                            //clear global checkin
//                            $this->db->where(array('module'=>$this->module,
//                                'controller'=>$this->controller,
//                                'recordId'=>$id));
//                            $this->db->delete('sys_global_checkin');


                            if (!empty($this->after_update)) {

                                $params = func_get_args();

                                $this->_callbacks($this->after_update, $params);
                            }
                        }

                    } else {
                        $aryData ['ok'] = false;
                        $aryData ['serror'] = __("LBL_ALREADY_READ");
                    }
                }

            } else {
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("ERR_SECURITY_REQUIRED");
            }

            if ($return) {
                return $aryData;
            } else {
                echo json_encode($aryData);
            }
        }

    }

    /**
     * Screen View detail a Record data
     * @param int $id
     */
    public function detail($id = '')
    {
        if ($this->model) {
            if (!empty($this->before_view)) {
                $params = func_get_args();
                $data = $this->_callbacks($this->before_view, $params);
                $this->template->set(data, $data);
            }

            if (!$id) {
                $id = $this->postData['cid'][0];
            }
            $fillData = $this->_getData($id);

            if (!empty($this->after_view)) {
                $data = $this->_callbacks($this->after_view, array($fillData));
                $fillData = $data['fillData'];
            }

            $this->template->set('fillData', $fillData);
            $this->view($this->controller . 's/view');
        }
    }

    /**
     * Switch a field with status (0 or 1)
     * @param int $id
     * @param string $field
     */
    public function dataSwitch($cid = '', $field = '', $val = '', $return = false)
    {

        $data = null;
        $num_of_success = 0;
        $num_of_locked = 0;
        $num_of_related = 0;
        $aryData = array('ok' => true);


        if ($val !== '') {
            $val = ($val) ? 1 : 0;
        }

        //check if is related
        if(!is_array($cid)) {
            $cid = array($cid);
        }
        $num_of_id = count($cid);
        foreach($cid as $key=>$id){
            $data = $this->model->get($id);
            $val_reverse = 1 - intval($data->$field);
            if ($data) {
                $record = object_to_array($data);
                $is_related = $this->check_is_related($record);
                $canWriteRecord = $this->do_write_record($id);
                if(!$canWriteRecord){
                    $num_of_locked++;
                }
                if($is_related && !$val_reverse){
                    $num_of_related++;
                }
                if((!$is_related || $is_related && $val_reverse ) && $canWriteRecord ) {
                    $num_of_success++;
                }else{
                    unset($cid[$key]);
                }
            }
        }
//        debug($num_of_success."/".$num_of_id, false);
        if ($num_of_success) {//update

            $ok = $this->model->dataSwitch($field, $cid, $val);

            if ($ok) {
                if($num_of_success < $num_of_id){
                    $numaff_rows='';
                    if ($num_of_success > 1) {
                        $numaff_rows = __('records');
                    }else $numaff_rows .= __('record');
                    if($num_of_locked && $num_of_related){
                        $aryData ['bulk_update_msg'] = __("MSG_BULK_UPDATE_RELATED_LOCKED", $num_of_success, $num_of_id, $numaff_rows,$num_of_related, $num_of_locked);
                    }elseif($num_of_related){
                        $aryData ['bulk_update_msg'] = __("MSG_BULK_UPDATE_RELATED", $num_of_success, $num_of_id, $numaff_rows);
                    }elseif($num_of_locked){
                        $aryData ['bulk_update_msg'] = __("MSG_BULK_UPDATE_LOCKED", $num_of_success, $num_of_id, $numaff_rows);
                    }

                }else{

                    $aryData ['smessage'] = __("MSG_UPDATE_SUCCESSFUL");
                }
            } else {
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("ERR_CANNOT_UPDATE");
            }
        } else {
            if($num_of_locked && $num_of_related){
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("ERR_BULK_UPDATE_RELATED_LOCKED",$num_of_related, $num_of_locked);
            }elseif($num_of_related){
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("LBL_IS_RELATED");
            }elseif($num_of_locked){
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("LBL_ALREADY_READ");
            }
        }

        if ($return) {
            return $aryData;
        } else {
            echo json_encode($aryData);
        }
    }


    /**
     * Delete a record
     * @param int $id
     */
    public function delete($cid = '', $return = false)
    {
        $data = null;
        $aryData = array('ok' => true);

        if ($cid && !is_array($cid)) $cid = array($cid);
        $is_related=false;
        $num_of_success=0;
        $num_of_locked = 0;
        $num_of_related = 0;
        $num_of_id=count($cid);
        foreach ($cid as $key=>$id) {
            $data = $this->model->get($id);
//            $logData = array('data_before' => json_encode($data));
//            $logData['task'] = 'delete';
//            $this->model->addLog($logData);
            if ($data) {
                $record = object_to_array($data);
                //check if is related
                $is_related = $this->check_is_related($record );
                $canWriteRecord = $this->do_write_record($id);
                if(!$canWriteRecord){
                    $num_of_locked++;
                }
                if($is_related){
                    $num_of_related++;
                }
                if(!$is_related && $canWriteRecord) {
                    $num_of_success++;
                }else{
                    unset($cid[$key]);
                }
            }
        }

        if ($num_of_success) {
            $ok = $this->model->delete($cid);

            if ($ok) {
                if($num_of_success < $num_of_id){
                    $numaff_rows='';
                    if ($num_of_success > 1) {
                        $numaff_rows = __('records');
                    }else $numaff_rows .= __('record');
                    if($num_of_locked && $num_of_related){
                        $aryData ['bulk_delete_msg'] = __("MSG_BULK_DELETE_RELATED_LOCKED", $num_of_success, $num_of_id, $numaff_rows,$num_of_related, $num_of_locked);
                    }elseif($num_of_related){
                        $aryData ['bulk_delete_msg'] = __("MSG_BULK_DELETE_RELATED", $num_of_success, $num_of_id, $numaff_rows);
                    }elseif($num_of_locked){
                        $aryData ['bulk_delete_msg'] = __("MSG_BULK_DELETE_LOCKED", $num_of_success, $num_of_id, $numaff_rows);
                    }
                }else{

                    $aryData ['smessage'] = __("MSG_DELETE_SUCCESS");
                }
            } else {
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("ERR_CANNOT_DELETE");
            }


        } else {
            if($num_of_locked && $num_of_related){
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("ERR_BULK_DELETE_RELATED_LOCKED",$num_of_related, $num_of_locked);
            }elseif($num_of_related){
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("LBL_IS_RELATED");
            }elseif($num_of_locked){
                $aryData ['ok'] = false;
                $aryData ['serror'] = __("LBL_ALREADY_READ");
            }
        }

        if ($return) {
            return $aryData;
        } else {
            echo json_encode($aryData);
        }
    }

    function save($return = false)
    {
        $aryData = array('ok' => true);
        $ok = $this->model->save($this->postData);

        if ($ok) {
            $aryData ['smessage'] = __("MSG_SAVE_DATA_SUCCESSFUL");
        } else {
            $aryData ['ok'] = false;
            $aryData ['serror'] = __("ERR_CANNOT_SAVE");
        }

        if ($return) {
            return $ok;
        } else {
            echo json_encode($aryData);
        }
    }


    /**
     * Doing form with Task for Toolbar button
     * @param string $task task name
     * @param int $id id of row
     * @param string $field field of table (switch)
     */
    public function saveAll($task = '', $id = '', $field = '', $json_output = TRUE)
    {
        if ($this->model) {

            //init task
            if (!$task) $task = $this->input->post('task');
            $task = strtolower($task);

            //init CID array
            if ($id) {
                $cid[] = $id;
            } else {
                $cid = $this->postData['cid'];
            }

            $aryData = array();

            //do task
            $numaff_rows = '';

            switch ($task) {

                case 'save':
                    $ok = $this->save(true);
                    if ($ok) {
                        $aryData ['smessage'] = __("MSG_UPDATE_SUCCESSFUL");
                        $aryData ['urlLoadList'] = site_url($this->module . '/' . $this->controller . '/getList');
                    } else {
                        $aryData ['serror'] = __("ERR_CANNOT_SAVE");
                    }
                    break;
                case 'add':
                    $ok = $this->save(true);
                    if ($ok) {
                        $aryData ['smessage'] = __("MSG_ADD_SUCCESS");
                        $aryData ['urlLoadList'] = site_url($this->module . '/' . $this->controller . '/getList');
                    } else {
                        $aryData ['serror'] = __("ERR_CANNOT_SAVE");
                    }
                    break;
                case 'delete':
                    $result = $this->delete($cid, true);
                    $ok = $result['ok'];

                    if ($ok) {
//                        $aryData ['smessage'] = __("MSG_DELETE_SUCCESS");
                        $aryData ['smessage'] = ($result['bulk_delete_msg']) ? $result['bulk_delete_msg']:__("MSG_DELETE_SUCCESS");
                        $aryData ['urlLoadList'] = site_url($this->module . '/' . $this->controller . '/getList');
                    } else {

                        $aryData ['serror'] = ($result['serror'])?$result['serror']:( __("ERR_CANNOT_SAVE"));
                    }

                    break;
                case 'publish':

                    $ok = $this->dataSwitch($cid, 'status', 1, true);

                    $numaff = $this->model->db->affected_rows();
                    if ($numaff > 1) $numaff_rows = __('rows');
                    else $numaff_rows .= __('row');

                    if ($ok) {
                        $aryData ['smessage'] = __("MSG_UPDATE_SUCCESSFUL");
                    } else {
                        $aryData ['serror'] = __("ERR_CANNOT_SAVE");
                    }

                    break;
                case 'unpublish':
                    $ok = $this->dataSwitch($cid, 'status', 0, true);

                    $numaff = $this->model->db->affected_rows();
                    if ($numaff > 1) $numaff_rows = __('records');
                    else $numaff_rows .= __('row');

                    if ($ok['ok']) {
                        $aryData ['smessage'] = ($ok['bulk_update_msg'])?$ok['bulk_update_msg']:__("MSG_UPDATE_SUCCESSFUL");
                    } else {
                        $aryData ['serror'] = $ok['serror'];
                    }
                    $ok=$ok['ok'];
                    break;
                case 'switch':
                    $ok = $this->model->dataSwitch($field, $cid);

                    if ($ok) {
                        $aryData ['smessage'] = __("MSG_UPDATE_SUCCESSFUL");
                    } else {
                        $aryData ['serror'] = __("ERR_CANNOT_SAVE");
                    }
                    break;
                default:
                    $params = func_get_args();
                    $ok = $this->_callbacks(array("do_" . $task), $params);
                    if ($ok) {
                        $aryData ['smessage'] = __("MSG_UPDATE_SUCCESSFUL");
                    } else {
                        $aryData ['serror'] = __("ERR_CANNOT_SAVE");
                    }
                    break;
            }

            $aryData ['ok'] = $ok;

            //retrun a JSON
            if ($json_output)
                echo json_encode($aryData);
            else
                return $aryData;
        }
    }


    /**
     * show translation form
     * @param int $articleId
     * @param string $lang
     */

    protected function translate($articleId, $lang, $editor = false)
    {

        if ($editor) $this->loadJs('editor/scripts/innovaeditor.js');

        $article = $this->model->get($articleId);

        $article = langObject($article, $lang);
        $this->template->set('article', $article);
        $this->template->set('fillData', $article);
        $this->template->set('lang', $lang);

        $this->view(strtolower($this->controller) . 's/translate');
    }

    /**
     * Update translation
     * @param string $table
     * @param string $key table primary key
     * @param string $back_url
     * @param string $return
     */
    protected function updateTranslate($table, $key, $back_url = '', $return = false)
    {
        $aryData = array('ok' => false);
        if (!$key) {
            $aryData['serror'] = __('ERR_NO_KEY_FOUND');
            return $aryData;
        }

        //debug($this->postData);

        $articleId = $this->postData[$key];
        $lang = $this->postData['lang'];

        $article = $this->model->get($articleId);

        if (!$article->translation) {
            $article->translation = '{}';
        }
        $aryTranslation = json_decode($article->translation);


        $aryTranslation->{$lang} = $this->postData;


        $ok = $this->model->update($table, array('translation' => json_encode($aryTranslation)), array($key => $articleId));
        //debug($this->db->last_query());
        if ($return) {
            $aryData['ok'] = $ok;
            if (!$ok) $aryData['serror'] = __("ERR_TRANSLATE_FAILURE");
            else $aryData['smessage'] = __("MSG_TRANSLATE_SUCCESSFUL");

            return $aryData;
        } else {

            if (!$ok) {
                $this->session->set_flashdata('error', __("ERR_TRANSLATE_FAILURE"));
            } else {
                $this->session->set_flashdata('message', __("MSG_TRANSLATE_SUCCESSFUL"));
            }
            redirect($back_url);
        }
    }

    public function removeTranslate($id, $lang)
    {
        $aryData = array('ok' => false, 'serror' => __("ERR_CANNOT_REMOVE_TRANSLATE"));
        $data = $this->model->get($id);
        if ($data->translation) {
            $trans = json_decode($data->translation);
            if ($lang && isset($trans->{$lang})) {
                unset($trans->{$lang});
                $ok = $this->db->update($this->model->get_table(), array('translation' => json_encode($trans)), array($this->model->get_primary_key() => $id));
                if ($ok) {
                    $aryData['ok'] = $ok;
                    $aryData['smessage'] = __("MSG_REMOVE_SUCCESS");
                }
            }
        }
        echo json_encode($aryData);
    }

    protected function check_invalid_data($input_data)
    {
        return preg_match(REGEX_INVALID_CHARACTER, $input_data);
    }




    protected function do_read_record($recordId)
    {
        //clear old locked
        $last_check_time = date("Y-m-d H:i:s", strtotime("-".LOCKED_EDIT));
        $this->model->deleteWhere_primary(array('createdTime <='=>$last_check_time),array('from'=>'sys_global_checkin'));

        //other people
        $isExisted = $this->model->find_where('',
            array('module'=>$this->module,
            'controller'=>$this->controller,
                'recordId'=>$recordId,
                'createdId <>'=>intval($this->LoginData->memberId)),
            array('from'=>'sys_global_checkin'));

        if (!empty($isExisted)) {
            return false;
        }

        //it's me :)
        $isExisted = $this->model->find_where('',
            array('module'=>$this->module,
                'controller'=>$this->controller,
                'recordId'=>$recordId,
                'createdId ='=>intval($this->LoginData->memberId)),
            array('from'=>'sys_global_checkin'));

        if (empty($isExisted)) {
            $this->model->add('sys_global_checkin',
                array('module' => $this->module,
                    'controller' => $this->controller,
                    'recordId' => $recordId));
        }else{
            $this->model->update('sys_global_checkin',
                array('createdTime' =>date("Y-m-d H:i:s")),
                array('checkId'=>$isExisted->checkId)
                );
        }

        return true;
    }

    protected function do_write_record($recordId)
    {

        //clear old locked
        $last_check_time = date("Y-m-d H:i:s", strtotime("-".LOCKED_EDIT));
        $this->model->deleteWhere_primary(array('createdTime <='=>$last_check_time),array('from'=>'sys_global_checkin'));

        $condition = array('module'=>$this->module,
            'controller'=>$this->controller,
            'recordId'=>$recordId,
            'createdId <>'=>intval($this->LoginData->memberId));

        //other people
        $isExisted = $this->model->find_where('',
            $condition,
            array('from'=>'sys_global_checkin'));

        if (!empty($isExisted)) {
            return false;
        }

        $condition['createdId'] = intval($this->LoginData->memberId);
        $this->model->deleteWhere_primary($condition,array('from'=>'sys_global_checkin'));

        return true;

    }



    protected function getCheckin($actions = array(), $createdId = null)
    {
        $aryData = array('record' => array(), 'own' => false);


        $query = $this->db->get_where('sys_global_checkin',
            array('module'=>$actions['module'],
                'controller'=>$actions['controller'],
                'recordId'=>$actions['recordId']));
        $record = $query->row();
        if ($createdId) {
            $aryData['own'] = ($record->createdId == $createdId);
        }
        $aryData['record'] = $record;
        return $aryData;
    }


    protected function getAction($recordId)
    {
        $actions['module'] = strtolower($this->router->fetch_module());
        $actions['controller'] = strtolower($this->router->fetch_class());
        $actions['recordId'] = $recordId;
        return $actions;
    }

    protected function mergeGetList($getList,$primary_key='')
    {
        if(!$primary_key) $primary_key = $this->model->get_primary_key();

        $aryItemId = array();
        foreach($getList as $item){
            $aryItemId[] = $item->{$primary_key};
        }

        //clear old locked
        $last_check_time = date("Y-m-d H:i:s", strtotime("-".LOCKED_EDIT));
        $this->model->deleteWhere_primary(array('createdTime <='=>$last_check_time),array('from'=>'sys_global_checkin'));

        $aryCondition = array('createdId <>'=>$this->LoginData->memberId,
                        'module'=>$this->module,
                        'controller'=> $this->controller,
                        'IN'=>array('recordId'=>$aryItemId),
                        'createdTime >'=>$last_check_time);
        $aryLocked =$this->model->find_where('list',$aryCondition,array('from'=>'sys_global_checkin'));
//        debug($this->db->last_query());
        $aryLockedId = array();
        foreach($aryLocked as $l){
            $aryLockedId[] = $l->recordId;
        }

        foreach($getList as $k=>$item){

            if(in_array($item->{$primary_key},$aryLockedId)){
                 $getList[$k]->locked = true;
            }
        }

        return $getList;
    }

    protected function check_is_related($data)
    {
        $isInUsing = $this->model->check_is_related($data);
        return $isInUsing;
    }

}

?>
