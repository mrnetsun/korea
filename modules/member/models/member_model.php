<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Member_Model extends MY_Model{
    
   protected $main = array('table'=>'sys_member');
   protected $primary_key = 'memberId';
	
    function __construct(){
        parent::__construct();
       
    }
    
    function _getDataMember($aryCondition=array(), $limit='', $start='', $sort=array()){  
    	//debug($aryCondition);
    	$rows =  $this->find_where('list',$aryCondition,
    			array(  'select'=>"mt.*,c.name as client_name",
                        'join'=>array(array('client as c','c.id = mt.clientId','left')),
    					'limit'=>$limit,
    					'offset'=>$start,
    					'order_by'=>$sort
    				)
    			
    		);
    	 
    	return $rows;
    }
    function _getAutoComplete($options = array())
    {
        $this->db->select('memberId,username');
        $this->db->like('username', $options['keyword'], 'after');
        $query = $this->db->get('sys_member');
        return $query->result();
    }
    
}