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
$config['cronjob_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Cronjob Management', //screen title
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
							'action'=>'cronjob/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'cronjob/edit',
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
$config['weather_viewdefs'] = array(

	//action index
	'index'=>array(
		'title'=>'Weather', //screen title
		'noModuleTitle'=>0,
		'noToolbar'=>0,
		'form'=>'', //id of form action

		'items'=>array(
			array(
				'link'=>'cronjob',
				'task'=>'back',
				'label'=>'LBL_BACK'
			)

		)

	)
);

// List view config
$config['trangvang_viewdefs'] = array(

	//action index
	'index'=>array(
		'title'=>'Trangvang', //screen title
		'noModuleTitle'=>0,
		'noToolbar'=>0,
		'form'=>'', //id of form action

		'items'=>array(
			array(
				'link'=>'cronjob',
				'class'=>'toolbar_icon toolbar_icon-32-back',
				'label'=>'LBL_BACK'
			)

		)

	)
);

// List view config
$config['vneconomy_viewdefs'] = array(

	//action index
	'index'=>array(
		'title'=>'Thu thập tin tức', //screen title
		'noModuleTitle'=>0,
		'noToolbar'=>0,
		'form'=>'', //id of form action

		'items'=>array(
			array(
				'link'=>'cronjob/news',
				'class'=>'toolbar_icon toolbar_icon-32-back',
				'label'=>'LBL_BACK'
			)

		)

	)
);
// List view config
$config['news_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'News Management', //screen title
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
							'action'=>'news/getAll',
							'class'=>'toolbar_icon toolbar_icon-32-default',
							'label'=>'LBL_GET_ALL'
						),
						array(
							'action'=>'news/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'news/edit',
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
		),
	//action index
	'getAll'=>array(
		'title'=>'Thu thập tin tức', //screen title
		'noModuleTitle'=>0,
		'noToolbar'=>0,
		'form'=>'', //id of form action

		'items'=>array(
			array(
				'link'=>'cronjob/news',
				'class'=>'toolbar_icon toolbar_icon-32-back',
				'label'=>'LBL_BACK'
			)

		)

	)
);

// List view config
$config['solr_viewdefs'] = array(

	//action index
	'index'=>array(
		'title'=>'Solr Index', //screen title
		'noModuleTitle'=>0,
		'noToolbar'=>0,
		'form'=>'', //id of form action

		'items'=>array(
			array(
				'link'=>'cronjob/news',
				'class'=>'toolbar_icon toolbar_icon-32-back',
				'label'=>'LBL_BACK'
			)

		)

	)
);