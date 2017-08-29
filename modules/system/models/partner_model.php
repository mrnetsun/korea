<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Partner_Model extends MY_Model{
	
	/**
	 *@var array config
	 * table : table of object for Add,Edit,Delete,Update
	 * view: create view of List Screen
	 * view: create view of View Screen
	 */
	protected  $main = array(
			'table'=>'partner',
			'list'=>'',
			'view'=>''		
			);
	
	/**	 
	 * The primary key name, by default set to 'id'
	 *  @var string
	*/
	protected $primary_key = 'partnerId';
	
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
	
}