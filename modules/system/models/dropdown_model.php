<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Dropdown_Model extends MY_Model{
	
	/**
	 *@var array config
	 * table : table of object for Add,Edit,Delete,Update
	 * view: create view of List Screen
	 * view: create view of View Screen
	 */
	protected  $main = array(
			'table'=>'sys_dropdown',
			'list'=>'',
			'view'=>''		
			);
	
	/**	 
	 * The primary key name, by default set to 'id'
	 *  @var string
	*/
	protected $primary_key = 'dropdownId';
	
	/**
	 * @var array
	 * The database table fields, used for filtering data arrays before inserting and updating
	* If not set, an additional query will be made to fetch these fields
	*/
	protected $fields = array();
	
	/**
	 * @var array
	 * The field may be switch 0 or 1 value
	 * If not set, an additional query will be made to fetch these fields
	 */
	protected $switchfields = array('status');
	
    function __construct(){
        parent::__construct();
       
    }
    
	//customer function go here
	
    public function _getDropdownList($aryCondition=array(),$limit='',$start='',$sort = array()){ 

    
    	
    	$rows =  $this->find_where('list',$aryCondition,
    			array(  'select'=>"mt.*,m.moduleName",
    					'limit'=>$limit,
    					'offset'=>$start,
    					'join'=>array(
    							array('sys_module as m','mt.moduleId = m.moduleId','left')
    					),
    					'created'=>true,
    					'updated'=>true,
    					'order_by'=>$sort
    			)
    	);
    	//debug($this->db->last_query());	
    	return $rows;
    }
    
}