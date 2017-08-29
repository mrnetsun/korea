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
$config['banner_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Banner Management', //screen title
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
							'action'=>'banner/add',
							'class'=>'toolbar_icon toolbar_icon-32-add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'banner/edit',
							'class'=>'toolbar_icon toolbar_icon-32-edit',
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
		),

		'add'=>array(
			'title'=>'Thêm banner quảng cáo', //screen title
			'noModuleTitle'=>0,
			'noToolbar'=>0,
			'form'=>'', //id of form action

			'items'=>array(
				array(
					'link'=>'banner/banner',
					'class'=>'toolbar_icon toolbar_icon-32-back',
					'label'=>'LBL_BACK'
				)

			)

		),

	'edit'=>array(
		'title'=>'Sửa banner quảng cáo', //screen title
		'noModuleTitle'=>0,
		'noToolbar'=>0,
		'form'=>'', //id of form action

		'items'=>array(
			array(
				'link'=>'banner/banner',
				'class'=>'toolbar_icon toolbar_icon-32-back',
				'label'=>'LBL_BACK'
			)

		)

	),



);
// List view config
$config['campaign_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Campaign Management', //screen title
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
							'action'=>'campaign/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'campaign/edit',
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
$config['position_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Position Management', //screen title
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
							'class'=>'toolbar_icon toolbar_icon-32-add' //more css, customize icon
							
						),
				 * */
				'items'=>array(
						array(
							'action'=>'position/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'position/edit',
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