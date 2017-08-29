<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Common_Model extends MY_Model{
	
	const TABLE_MODULE='sys_module';
	const TABLE_MENU='sys_menu';
	
	protected $main = array('table'=>'sys_member');
	protected $primary_key = "memberId";
    protected $fields = array();	
							
	public $before_create = array('func_before_insert');

    function func_before_insert($data) {
		$data['createdId'] =  $this->LoginData->memberId;
        $data['createdTime'] = date('Y-m-d H:i:s');
        return $data;
    }
	
	public $before_update = array('func_before_update');

    function func_before_update($data) {
		$data['updatedId'] = $this->LoginData->memberId;
        $data['updatedTime'] = date('Y-m-d H:i:s');
        return $data;
    }
	
	function getMemberModules(){
		$aryModule = array();
		$this->db->order_by('position');
		$rows = $this->db->get_where(self::TABLE_MODULE,array('del_flag'=>NOT_DELETED,'status'=>ACTIVE))->result();
		foreach($rows as $row){
			//check view
			$aryModule[] = $row;
		}	
		
		return $aryModule;
	}


	/**
	 * @param $data Add system Log
	 */
	function addLog($data){
		$this->add('sys_data_log',$data);
	}
	
}