<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 *
 * @author Lucdt@ideavietnam.com 2012/05/10
 *
 */
class MY_Model extends CI_Model
{
    protected $related_table = array(
        'field_config' => array(
            'field_copy' => array(
                'field_id' => 'field_source_id',
                'field_id' => 'field_destination_id',
                '_json_store' => FALSE
            ),
            'facet' => array(
                'field_id' => 'field_list',
                '_json_store' => TRUE
            ),
            'field_group' => array(
                'field_id' => 'field_list',
                '_json_store' => TRUE
            ),
            'search_query' => array(
                'field_id' => 'field_list',
                '_json_store' => TRUE
            )
        ),
        'field_type' => array(
            'field_config' => array(
                'field_type_id' => 'field_type_id',
                '_json_store' => FALSE)),
        'sys_role' => array(
            'sys_member' => array(
                'roleId' => 'roleId',
                '_json_store' => FALSE)),
        'class' => array(
            'field_type' => array(
                'classId' => 'field_class',
                '_json_store' => FALSE)),
        'field_group' => array(
            'search_query' => array(
                'search_group_id' => 'group_field_list',
                '_json_store' => TRUE
            )),
        'facet' => array(
            'search_query' => array(
                'facet_id' => 'facet', '_json_store' => FALSE,
            )
        )
    );
    /**
     * @var array config
     * table : table of object for Add,Edit,Delete,Update
     * view: create view of List Screen
     * view: create view of View Screen
     */
    protected $main = array(
        'table' => '',
        'list' => '',
        'view' => ''
    );

    /**
     * The primary key name, by default set to 'id'
     * @var string
     */
    protected $primary_key = 'id';

    /**
     * @var array
     * The database table fields, used for filtering data arrays before inserting and updating
     * If not set, an additional query will be made to fetch these fields
     */
    protected $fields = array();

    /**
     * @var array
     * The database table fields, used for filtering data arrays before inserting and updating
     * If not set, an additional query will be made to fetch these fields
     */
    protected $switchfields = array('status');

    /**
     * key value of object
     * @var int
     */
    public $id;
    /**
     * object value data
     * @var Object
     */
    public $data;

    /*
     * Callbacks, should contain an array of methods
    */
    protected $before_create = array();
    protected $after_create = array();
    protected $before_update = array();
    protected $after_update = array();
    protected $before_get = array();
    protected $after_get = array();
    protected $before_delete = array();
    protected $after_delete = array();

    /*
     * Validation, should contain validation arrays like the form validation
    */
    protected $validate = array();

    /*
     * Skip the validation
    */
    protected $skip_validation = FALSE;

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
     * @var CI_Language
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
     * @var Template
     */
    var $template;

    /**
     * Constructor init object
     */
    function __construct()
    {
        parent::__construct();
        $CI =& get_instance();
        $this->db = $CI->db;

        //get current Login
        $this->LoginData = $CI->session->userdata('LoginData');

        //get All fields
        $this->_fields();

    }

    public function set($main, $primary_key)
    {
        $this->main['table'] = $main;
        $this->primary_key = $primary_key;
    }

    public function set_id($id)
    {
        $this->id = $id;
    }


    /**
     * Magic function that passes unrecognized method calls to the database class for chaining
     *
     * @param string $method
     * @param array $params
     * @return void
     */
    public function __call($method, $params)
    {
        if (method_exists($this->db, $method)) {
            call_user_func_array(array($this->db, $method), $params);
            return $this;
        }
    }

    /**
     * get a record
     * @author lucdt
     * @param int id
     * @see MX_Model::get()
     */

    function get($id = '', $params = array())
    {
        if (!$id) $id = $this->id;

        $table = ($params['from']) ? $params['from'] : $this->main['table'];
        $key = $this->getKey($table);

        $result = $this->find_where('first', array($key => $id), $params);
        //debug($this->db->last_query());
        $this->data = $result;
        return $result;
    }

    /**
     * Insert Data to table
     * @param string $table
     * @param mixed $data
     */
    function add($table, $data)
    {

        if(!$data['createdId'])$data['createdId'] = $this->LoginData->memberId;
        if(!$data['createdTime'])$data['createdTime'] = date("Y-m-d H:i:s");

        $tableFields = $this->db->list_fields($table);
        foreach ($data as $key => $val) {
            if (!in_array($key, $tableFields)) {
                unset($data[$key]);
            }
        }
        $this->db->insert($table, $data);
        return $this->insert_id();
    }

    /**
     * update $table set value $data with $where
     * @param string $table
     * @param mixed $data
     * @param mixed $where
     */
    function update($table, $data, $where, $flag = true)
    {

        if(!$data['updatedId'])$data['updatedId'] = $this->LoginData->memberId;
        if(!$data['updatedTime'])$data['updatedTime'] = date("Y-m-d H:i:s");

        $tableFields = $this->db->list_fields($table);
        foreach ($data as $key => $val) {
            if (!in_array($key, $tableFields)) {
                unset($data[$key]);
            }
        }

        if ($flag) {
            return $this->db->update($table, $data, $where);
        } else {

            foreach ($data as $key => $val) {
                $this->db->set($key, $val, FALSE);
            }

            $this->db->where($where);
            return $this->db->update($table);

        }

    }

    /**
     * Insert a new record, or update existing
     * @param mixed $data
     * @param boolean $owner_feed True : insert Cretead,updated ; False : other
     * @param boolean $skip_validation not check validate
     * @return boolean
     */
    function save($data, $owner_feed = TRUE, $skip_validation = FALSE)
    {
        //clear field not in database

        foreach ($data as $key => $val) {
            if (!in_array($key, $this->fields)) {
                unset($data[$key]);
            }
        }

        if ($skip_validation === FALSE) {
            $valid = $this->_run_validation($data);
        }


        //doing update
        if (!empty($data)) {
            if ($data[$this->primary_key]) {
                //update
                if ($owner_feed === TRUE) {
                    $data['updatedId'] = $this->LoginData->memberId;
                    $data['updatedTime'] = date("Y-m-d H:i:s");
                }
                return $this->db->update($this->main['table'], $data, array($this->primary_key => $data[$this->primary_key]));
            } else {
                //insert
                if ($owner_feed === TRUE) {
                    $data['createdId'] = $this->LoginData->memberId;
                    $data['createdTime'] = date("Y-m-d H:i:s");
                    $data['updatedTime'] = date("Y-m-d H:i:s");
                }

                $this->db->insert($this->main['table'], $data);
                return $this->insert_id();
            }
        }


        return false;
    }

    /**
     * find All data from Table
     * @author lucdt
     * @param none
     */
    function find_all($params = array())
    {
        return $this->find('all', $params);
    }

    /**
     * return $type of $where
     * @param string $type
     * @param mixed $where
     * @param mixed $params
     * @return mixed
     */
    function find_where($type = '', $where = array(), $params = array())
    {
        $params['where'] = $where;
        return $this->find($type, $params);
    }

    /**
     * return total of $where
     * @param mixed $where
     * @param mixed $params
     */
    function count_where($where, $params = array(), $list = '')
    {
        if (!$params['select']) {
            $params['select'] = 'COUNT(*) as total';
        }
        $params['where'] = $where;
        $row = $this->find($list, $params);
        if ($list) {
            return $row;
        } else {
            return $row->total;
        }
    }

    /**
     * Return a Object by $select an $where
     * @param string $select
     * @param mixed $where
     * @param mixed $params
     */
    function select($select, $where = array(), $params = array())
    {
        $params['select'] = $select;
        $params['where'] = $where;
        $row = $this->find('', $params);
        return $row->total;
    }

    /**
     * Select single row
     *
     * @author lucd
     * @param   string $type [first,one,all,list]
     * @param   array $parames [select,where,order_by,limit,offset,group_by]
     */
    function find($type = '', $parames = '')
    {
        //debug($parames);
        try {

            $results = false;
            //set select
            if ($parames['select'])
                $this->db->select($parames['select'], false);
            //set where
            if ($parames['where'])
                $this->_buildWhere($parames['where']);

            if ($parames['fixed_sort']) {
                $this->db->order_by($parames['fixed_sort']);
            }

            //set order
            if ($parames['order_by']) {
                //list($key,$dir) = each($parames['order_by']);
//    			if($key && in_array($key,$this->_fields())){
                //$this->db->order_by($key,$dir);
//    			}
                if (!empty($parames['order_by']) && is_array($parames['order_by'])) {
                    foreach ($parames['order_by'] as $key => $value) {
                        $this->db->order_by($key, $value);
                    }
                }
            }
            //set group by
            if ($parames['group_by'])
                $this->db->group_by($parames['group_by']);

            //set limit
            if ($parames['limit']) {
                if ($parames['offset']) {
                    $this->db->limit($parames['limit'], $parames['offset']);
                } else {
                    $this->db->limit($parames['limit']);
                }
            }
            //get Created and Updated infomation
            if (!$parames['join']) $parames['join'] = array();

            if ($parames['created']) {
                $this->db->select("CONCAT(u_c.firstName,' ',u_c.lastName) as createdName", false);
                array_push($parames['join'], array('sys_member as u_c', 'mt.createdId = u_c.memberId', 'left'));
            }

            if ($parames['updated']) {
                $this->db->select("CONCAT(u_u.firstName,' ',u_u.lastName) as updatedName", false);
                array_push($parames['join'], array('sys_member as u_u', 'mt.createdId = u_u.memberId', 'left'));
            }

            //join table
            if (!empty($parames['join'])) {
                foreach ($parames['join'] as $join) {
                    list($jtable, $onCondtion, $direct) = $join;
                    $this->db->join($jtable, $onCondtion, $direct);
                }
            }

            //allway not display deleted row
            if (!$parames['deleted']) {
                $this->db->where('mt.del_flag', NOT_DELETED);
            }

            //get one by Id
            if (!$type && empty($parames)) {
                $this->db->where($this->primary_key, $this->id);
            }
            //from table
            $table = $parames['from'];

            switch (strtolower($type)) {
                case 'all':
                case 'list':
                    if (!$table)
                        $table = ($this->main['list']) ? $this->main['list'] : $this->_table();
                    $results = $this->db->get($table . ' as mt')->result();
                    break;
                case 'first':
                case 'one':
                default :
                    if (!$table)
                        $table = ($this->main['view']) ? $this->main['view'] : $this->_table();
                    $results = $this->db->get($table . ' as mt')->row();
            }

            //debug($this->db->last_query());
        } catch (Exception $e) {
            //$this->session->sess_destroy();
        }
        return $results;

    }

    function approve($table, $id, $val, $params = array())
    {
        if (!is_array($id)) $id = array($id);
        $key = $this->getKey($table);

        $field = ($params['field']) ? $params['field'] : 'approve';
        $data = array($field => $val);
        if ($params['member']) {
            $data['approveId'] = $this->LoginData->memberId;
            $data['approveTime'] = date("Y-m-d H:i:s");
        }
        $this->db->where_in($key, $id);
        $ok = $this->db->update($table, $data);
        return $ok;
    }

    /**
     * Delete logic row or rows
     * @param int $id delete by id
     * @param   mixed $where Where clause
     */
    function delete($id = '', $where = '', $params = array())
    {
        //delete by id
        if (!$id && $this->id) $id = $this->id;
        if ($id && !is_array($id)) $id = array($id);

        if (empty($id)) return false;

        // delete by where
        if (!empty($where)) {
            $this->db->where($where);
        }


        $table = ($params['from']) ? $params['from'] : $this->main['table'];
        $key = $this->getKey($table);

        //delete by array Id
        if (is_array($id)) {
            $this->db->where_in($key, $id);
        }

        $this->db->update($table, array('del_flag' => DELETED));

        $this->db->where_in($this->primary_key, $id);
        $dataBefore = $this->db->get($this->main['table'] . ' as mt');
        $dataBefore = $dataBefore->result();
        if (!empty($dataBefore)) {
            foreach ($dataBefore as $key => $value) {
                $logData = array('data_before' => json_encode($value));
                $logData['task'] = 'delete';
                $this->addLog($logData);
            }
        }

        return $this->db->affected_rows();

    }


    /**
     * Delete logic row or rows
     * @param int $id delete by id
     * @param   mixed $where Where clause
     */
    function deleteWhere($where = '', $params = array())
    {
        // delete by where
        if (!empty($where)) {
            $this->db->where($where);
        }


        $table = ($params['from']) ? $params['from'] : $this->main['table'];
        $key = $this->getKey($table);

        $this->db->update($table, array('del_flag' => DELETED));

        return $this->db->affected_rows();

    }

    /**
     * Delete logic row or rows
     * @param int $id delete by id
     * @param   mixed $where Where clause
     */
    function deleteWhere_primary($where = '', $params = array())
    {
        // delete by where
        if (!empty($where)) {
            $this->db->where($where);
        }

        $table = ($params['from']) ? $params['from'] : $this->main['table'];

        $this->db->delete($table);

        return $this->db->affected_rows();

    }

    /**
     * Delete physical row or rows
     *
     * @param   array   Where clause
     */
    function delete_primary($id = '', $where = '', $params = array())
    {

        //delete by id
        if (!$id && $this->id) $id = $this->id;
        if ($id && !is_array($id)) $id = array($id);

        if (empty($id)) return false;

        // delete by where

        if (!empty($where))
            $this->db->where($where);


        $table = ($params['from']) ? $params['from'] : $this->main['table'];

        $key = $this->getKey($table);

        if (is_array($id)) {
            $this->db->where_in($key, $id);
        }

        return $this->db->delete($table);

    }

    /**
     * Switch data field value
     * @param string $field database field
     * @param mixed $cid array of Id
     * @param string $val (data 0|1)
     * @return boolean
     */
    function dataSwitch($field, $cid, $val = '')
    {

        if (!is_array($cid)) $cid = array($cid);
        //check security

        if (!in_array($field, $this->switchfields)) return false;

        $ok = true;

        //log
        $this->db->where_in($this->primary_key, $cid);
        $dataBefore = $this->db->get($this->main['table'] . ' as mt');
        $dataBefore = $dataBefore->result();


        $this->db->where_in($this->primary_key, $cid);

        if ($val !== '') {
            $ok = $this->db->update($this->main['table'], array($field => $val, 'updatedTime' => date('Y-m-d H:i:s'), 'updatedId' => $this->LoginData->memberId));
        } else {

            $row = $this->db->get_where($this->main['table'], array($this->primary_key => $cid[0]))->row();

            $val = 1 - intval($row->$field);
            $ok = $this->db->update($this->main['table'], array($field => $val, 'updatedTime' => date('Y-m-d H:i:s'), 'updatedId' => $this->LoginData->memberId), array($this->primary_key => $cid[0]));

        }

        if (!empty($dataBefore)) {
            foreach ($dataBefore as $value) {
                $dataLog = array(
                    'task' => 'switch',
                    'data_before' => json_encode($value),
                    'data_after' => json_encode(array($field => $val))
                );
                $this->addLog($dataLog);
            }
        }

        //die($this->db->last_query());

        return $ok;
    }

    /**
     * Count the number of rows based on a WHERE parameters
     *
     * @param string $key
     * @param string $val
     * @return integer
     */
    public function count_all_results()
    {
        $where = &func_get_args();
        $this->_set_where($where);

        return $this->db->count_all_results($this->_table());
    }

    /**
     * Return a count of every row in the table
     *
     * @return integer
     */
    public function count_all()
    {
        return $this->db->count_all($this->_table());
    }

    /**
     * An easier limit function
     *
     * @param integer $limit
     * @param integer $offset
     */
    public function limit($limit = NULL, $offset = NULL)
    {
        if (is_numeric($limit) && is_numeric($offset)) {
            $this->db->limit($limit, $offset);
        } elseif (is_numeric($limit)) {
            $this->db->limit($limit);
        }
        return $this;
    }

    /**
     * List all table fields
     *
     * @return array $fields
     */
    public function list_fields()
    {
        return $this->db->list_fields($this->_table());
    }

    /**
     * Retrieve and generate a dropdown-friendly array of the data
     * in the table based on a key and a value.
     *
     * @param string $key
     * @param string $value
     * @return array $options
     */
    public function dropdown()
    {
        $args = &func_get_args();

        if (count($args) >= 2) {
            list($key, $value) = $args;
        } else {
            $key = $this->primary_key;
            $value = $args[0];
        }

        $options = array();
        if ($args[2]) {
            $options[] = __('--Choose One--');
        }

        if ($this->result_mode == 'object') {
            $result = $this->db->select(array($key, $value))->get($this->_table())->result();

            foreach ($result as $row) {
                $row = $this->_callbacks('after_get', array($row));
                $options[$row->{$key}] = $row->{$value};
            }
        } else {
            $result = $this->db->select(array($key, $value))->get($this->_table())->result_array();

            foreach ($result as $row) {
                $options[$row[$key]] = $row[$value];
            }
        }

        return $options;
    }


    /**
     * Skip the insert validation for future calls
     */
    public function skip_validation($bool = TRUE)
    {
        $this->skip_validation = $bool;
        return $this;
    }

    /**
     * call {storedprocedure function name}
     * @param string $proc_name
     * @param array $params
     */
    public function call_proc($proc_name, $params = array())
    {

        $aryBin = array();
        $aryPush = array();

        foreach ($params as $key => $value) {

            $aryBin[] = $value;
            $aryPush[] = '?';
        }

        $query = " CALL " . $proc_name . "(" . implode(',', $aryPush) . ") ";

        $result = $this->db->query($query, $this->safe_escape($aryBin))->result();

        return $result;

    }


    /**
     * Run the specific callbacks, each callback taking a $data
     * variable and returning it
     */
    private function _callbacks($name, $params = array())
    {
        $data = (isset($params[0])) ? $params[0] : FALSE;

        if (!empty($this->$name)) {
            foreach ($this->$name as $method) {
                $data = call_user_func_array(array($this, $method), $params);
            }
        }

        return $data;
    }

    /**
     * Runs validation on the passed data.
     *
     * @return bool
     */
    private function _run_validation($data)
    {
        if ($this->skip_validation) {
            return TRUE;
        }

        if (!empty($this->validate)) {
            foreach ($data as $key => $val) {
                $_POST[$key] = $val;
            }

            $this->load->library('form_validation');

            if (is_array($this->validate)) {
                $this->form_validation->set_rules($this->validate);

                return $this->form_validation->run();
            } else {
                return $this->form_validation->run($this->validate);
            }
        } else {
            return TRUE;
        }
    }

    /**
     * Return or fetch the database fields
     */
    private function _fields()
    {
        if ($this->_table() && empty($this->fields)) {
            $this->fields = $this->db->list_fields($this->_table());
        }
        return $this->fields;
    }


    /**
     * Return or guess the database table
     */
    private function _table()
    {

        return $this->main['table'];
    }

    /**
     * Return where
     * @param unknown_type $where
     */
    protected function _buildWhere($where = '', $operator = '')
    {
        //debug($where,false);
        if (is_array($where)) {
            foreach ($where as $key => $item) {
                $keySQL = strtoupper($key);

                if ($this->_is_sql_key($this->_clearn_space($keySQL))) {

                    //list($field,$value) = each($item);

                    switch ($keySQL) {
                        case '>':
                        case '>=':
                        case '<':
                        case '<=':
                        case '<>':
                            list($field, $value) = each($item);
                            $this->db->where($field . $keySQL, $value);
                            break;
                        case 'LIKE':

                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->like($k, $v);
                                    } else {
                                        $this->db->like($v);
                                    }

                                }
                            } else {

                                $this->db->like($field, $value);
                            }
                            break;
                        case 'NOT LIKE':
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->not_like($k, $v);
                                    } else {
                                        $this->db->not_like($v);
                                    }

                                }
                            } else {

                                $this->db->not_like($field, $value);
                            }

                            break;
                        case 'OR LIKE':
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->or_like($k, $v);
                                    } else {
                                        $this->db->or_like($v);
                                    }

                                }
                            } else {

                                $this->db->or_like($field, $value);
                            }

                            break;
                        case 'OR NOT LIKE':
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->or_not_like($k, $v);
                                    } else {
                                        $this->db->or_not_like($v);
                                    }

                                }
                            } else {

                                $this->db->or_not_like($field, $value);
                            }

                            break;
                        case 'IN':

                            if (is_array($item)) {

                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->where_in($k, $v);
                                    } else {
                                        $this->db->where_in($v);
                                    }

                                }
                            } else {

                                $this->db->where_in($field, $value);
                            }

                            break;
                        case 'NOT IN':
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->where_not_in($k, $v);
                                    } else {
                                        $this->db->where_not_in($v);
                                    }

                                }
                            } else {

                                $this->db->where_not_in($field, $value);
                            }


                            break;
                        case 'OR IN':
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->or_where_in($k, $v);
                                    } else {
                                        $this->db->or_where_in($v);
                                    }

                                }
                            } else {

                                $this->db->or_where_in($field, $value);
                            }

                            break;
                        case 'OR NOT IN':
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->or_where_not_in($k, $v);
                                    } else {
                                        $this->db->or_where_not_in($v);
                                    }

                                }
                            } else {

                                $this->db->or_where_not_in($field, $value);
                            }

                            break;
                        case 'HAVING':
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->having($k, $v);
                                    } else {
                                        $this->db->having($v);
                                    }

                                }
                            } else {

                                $this->db->having($field, $value);
                            }


                            break;
                        case 'OR HAVING':
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {

                                    if (!is_numeric($k)) {
                                        $this->db->or_having($k, $v);
                                    } else {
                                        $this->db->or_having($v);
                                    }

                                }
                            } else {

                                $this->db->or_having($field, $value);
                            }

                            break;
                        case 'AND':
                            //debug($item);
                            if (is_array($item)) {
                                foreach ($item as $k => $v) {
                                    if (!is_numeric($k)) {
                                        $this->db->where($k, $v);
                                    } else {
                                        $this->db->where($v);
                                    }

                                }
                            } else {
                                //debug($item);
                                $this->db->where($item);
                            }
                            break;
                        case 'OR':
                            if (!is_array($item))
                                $this->db->where($item, false);
                            else {
                                foreach ($item as $k => $v) {
                                    if (!is_numeric($k)) {
                                        $this->db2->or_where($k, $v);
                                    } else {
                                        $this->db2->or_where($v);
                                    }
                                }
                            }
                            break;
                    }
                } else {
                    if (!is_array($item))
                        $this->db->where($key, $item);
                }
            }
        } else {
            $this->db->where($where, false);
        }
    }

    private function _is_sql_key($key)
    {
        $haystack = array('>', '>=', '<', '<=', '=', '<>',
            'AND', 'OR', 'LIKE', 'IN', 'HAVING',
            'NOT LIKE', 'NOT IN',
            'OR LIKE', 'OR IN', 'OR HAVING',
            'OR NOT LIKE', 'OR NOT IN'
        );
        return in_array(strtoupper($key), $haystack);
    }

    /**
     * remove character quoc or space
     * @param string $PassedStr
     */
    private function _clearn_space($key)
    {

        $PassedStr = preg_replace('/[\'"]/', '', $key);
        return $PassedStr;
    }

    /**
     * escapes and adds single quotes to each value of an array
     */
    public function safe_escape(&$data)
    {
        if (count($data) <= 0) {
            return $data;
        }

        foreach ($data as $node) {
            if (is_array($node)) {
                $this->safe_escape($node);
            } else {
                $node = $this->db->escape($node);
            }
        }

        return $data;
    }

    /**
     * Return primary key
     * @return string
     */
    public function get_primary_key()
    {
        return $this->primary_key;
    }

    public function get_table()
    {
        return $this->_table();
    }

    /**
     * Retrun last insert ID
     */
    public function insert_id()
    {

        return $this->db->insert_id();
    }

    public function updateLevel($cateId)
    {
        $cate = $this->get($cateId);
        $parent = $this->get($cate->parentId);
        $cate->level = $parent->level + 1;
        $this->db->update($this->main['table'], $cate, array($this->primary_key => $cate->{$this->primary_key}));
    }

    public function getKey($table)
    {
        return $this->db->primary($table);
    }

    public function addLog($data, $action = 'log')
    {

        $CI = get_instance();
        $data['module'] = strtolower($CI->router->fetch_module());
        $data['controller'] = strtolower($CI->router->fetch_class());
        $data['method'] = strtolower($CI->router->fetch_method());

        $data['updatedTime'] = date("Y-m-d H:i:s");

        $data['actor'] = $this->LoginData->firstName . ' ' . $this->LoginData->lastName;

        $this->db->insert('sys_data_log', $data);


    }


    public function insert_checkin_id()
    {
        return $this->db->insert_id();
    }

    function check_is_related($data)
    {
        $related_table = $this->related_table;

        if (count($related_table)) {
            foreach ($related_table as $key => $table) {
                if ($key == $this->main['table']) {
                    foreach ($table as $t_name => $t_col) {
                        $match_mode = ($t_col['_json_store']) ? "LIKE" : "AND";
                        unset($t_col['_json_store']);
                        foreach ($t_col as $ref_col => $col) {
                            $related_record = $this->find_where("list",
                                array($match_mode => array($col => $data[$ref_col])), array(
                                    'select' => $col,
                                    'from' => $t_name
                                )
                            );
                            if (count($related_record)) {
                                return TRUE;
                            }
                        }
                    }
                }
            }
        }
        return FALSE;
    }

}