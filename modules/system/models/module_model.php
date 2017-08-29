<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Module_Model extends MY_Model{
    
   protected $main = array('table'=>'sys_module');
   protected $primary_key = 'moduleId';
	
    function __construct(){
        parent::__construct();
       
    }
	
    
    function _getModuleList($aryCondition=array(),$limit='',$start='',$sort = array()){
    	
    	$rows =  $this->find_where('list',$aryCondition,
	    			array(  'select'=>"mt.*",
	    					'limit'=>$limit,
	    					'offset'=>$start,
	    					'created'=>true,
	    					'updated'=>true,
	    					'order_by'=>$sort
	    				)
	    			
    			);
    	    
    	return $rows;
    }
    
    function getTableField($tableName){
    	$fields =  $this->db->field_data($tableName);
    	
    	$aryResult = array();
    	foreach($fields as $field){
    		if($field->primary_key){
    			$aryResult['primary'] = $field->name;
    		}
    		
    		$aryResult['fields'][] = array('text'=>$field->name."(".$field->type.")",'val'=>json_encode($field));
    	}
    	return $aryResult;
    }
    
    function checkTable($tableName){
    	$row = $this->db->table_exists($tableName); 
    	return ($row) ? true : false;   
    }
    
}