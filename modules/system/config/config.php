<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

//paging config
$config ['pagingConfig'] = array(
			'base_url'=> '', // url callback
			'per_page'=> 10, // number record per page
			'cur_page'=> 0, // the current page
			'start'=> 0, // start record
			'total_rows'=>0, // total record
			'num_links'=> 10, // number of link
			'first_link'=> __('LBL_FIRST'), //label
			'last_link'=> __('LBL_LAST'), //label
			'display_from' => __('LBL_DISPLAY_FROM'),
			'display_to' => __('LBL_DISPLAY_TO'),
			'display_of' => __('LBL_OF')
			);

// List view config
$config['module_viewdefs'] = array(	
		//action index			
		'index'=>array(
				'title'=>'Module Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'module/add',
							//'task'=>'',
							'label'=>'LBL_ADD_NEW',
							'class'=>'toolbar_icon-32-add'
						),
						array(
							'action'=>'module/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)			
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(''=>'--Choose One--',
						"LBL_DELETE"=>"LBL_DELETE",
						"LBL_ACTIVE"=>"LBL_ACTIVE",
						"LBL_DEACTIVE"=>'Unpublic'
				),
					
				'order_by' => array('moduleName'=>'asc')
		),
		
		//action add
		'add'=>array(
			'title'=>'Add Module'		
		)		

);

// List view config
$config['dropdown_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Dropdown Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'dropdown/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'dropdown/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						)
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(''=>'--Choose One--',
						"LBL_DELETE"=>"LBL_DELETE",
						"LBL_ACTIVE"=>"LBL_ACTIVE",
						"LBL_DEACTIVE"=>'Unpublic'
				),
				
				'order_by' => array('dropdownName'=>'asc')
				
		)	
);

// List view config
$config['menu_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Menu Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'menu/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'menu/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(
				),
				'order_by' => array()
		)	
);

// List view config
$config['roles_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Roles Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'roles/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'roles/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(
				),
				'order_by' => array()
		)	
);

// List view config
$config['country_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Country Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'country/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'country/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(
				),
				'order_by' => array()
		)	
);
// List view config
$config['region_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Region Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'region/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'region/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(
				),
				'order_by' => array()
		)	
);
// List view config
$config['city_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'City Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'city/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'city/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(
				),
				'order_by' => array()
		)	
);
// List view config
$config['partner_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Partner Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'partner/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'partner/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(
				),
				'order_by' => array()
		)	
);
// List view config
$config['badge_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Badge Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'badge/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'badge/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(
				),
				'order_by' => array()
		)	
);
// List view config
$config['department_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Department Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'department/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'department/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(
				),
				'order_by' => array()
		)	
);
// List view config
$config['slider_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Slider Management', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'slider/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'slider/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(),
				'order_by' => array()
		)	
);
// List view config
$config['config_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Config', //screen title
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'config/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'config/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						)

						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(),
				'order_by' => array()
		)	
);
// List view config
$config['resource_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Resource Management', //screen title
				'noModuleTile'=>0,
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'resource/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'resource/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(/*''=>'--Choose One--',
						"LBL_DELETE"=>"LBL_DELETE",
						"LBL_ACTIVE"=>"LBL_ACTIVE",
						'move'=>'Move',
						'approve'=>'Approve',
						'reject'=>'Reject'*/
				),
				'order_by' => array('createdTime'=>'DESC')
		)	
);

// List view config
$config['backup_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Backup Management', //screen title
				'noModuleTitle'=>0,
				'noToolbar'=>0,
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>site_url('system/backup/add'),
							'class'=>'toolbar_icon-32-export',
							'label'=>'LBL_CREATE_BACKUP',
							'onclick'=>'systemController.linkSetup(this,{ajax:true,overlay:true,title:\'Create backup\'})',
							'ajax'=>true,
						),
//						array(
//							'action'=>'backup/edit',
//							'task'=>'edit',
//							'label'=>'LBL_EDIT'
//						),
//						array(
//								'task'=>"delete",
//								'label'=>"LBL_DELETE"
//						),
//						array(
//							'task'=>"publish",
//							'label'=>"LBL_ACTIVE"
//						),
//						array(
//							'task'=>"unpublish",
//							'label'=>"LBL_DEACTIVE"
//						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(/*''=>'--Choose One--',
						"LBL_DELETE"=>"LBL_DELETE",
						"LBL_ACTIVE"=>"LBL_ACTIVE",
						'move'=>'Move',
						'approve'=>'Approve',
						'reject'=>'Reject'*/
				),
				'order_by' => array('createdTime'=>'DESC')
		)	
);
// List view config
$config['router_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Router Management', //screen title
				'noModuleTitle'=>0,
				'noToolbar'=>0,
				'form'=>'', //id of form action
				
				/*
				 * Detail of item config
				 * if task enable => onclick is disabled
				 * array('action'=>'url', //url action
							'task'=>'the task',	//add,edit,delete,move,import,export,publish,unpublish or null					
							'onclick'=>'the_function', // javascript function
							'label'=>'The label', //lable for display
							'class'=>'class name' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'router/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'router/edit',
							'task'=>'edit',
							'label'=>'LBL_EDIT'
						),
						array(
								'task'=>"delete",
								'label'=>"LBL_DELETE"
						),
						array(
							'task'=>"publish",
							'label'=>"LBL_ACTIVE"
						),
						array(
							'task'=>"unpublish",
							'label'=>"LBL_DEACTIVE"
						),
						
				)
				
		),
		//action getList
		'getList'=>array(
				// dropdown action on the footer of list
				'dropdownTask'=>array(/*''=>'--Choose One--',
						"LBL_DELETE"=>"LBL_DELETE",
						"LBL_ACTIVE"=>"LBL_ACTIVE",
						'move'=>'Move',
						'approve'=>'Approve',
						'reject'=>'Reject'*/
				),
				'order_by' => array('position'=>'ASC')
		)	
);