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
$config['exam_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Exam Management', //screen title
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
							'action'=>'exam/add',
							'class'=>'toolbar_icon toolbar_icon-32-add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'exam/edit',
							'class'=>'toolbar_icon toolbar_icon-32-add',
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
		'title'=>'title_add_exam', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/exam'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
	'edit'=>array(
		'title'=>'title_edit_exam', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/exam'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
	'detail'=>array(
		'title'=>'title_detail_exam', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/exam'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
);
// List view config
$config['examcategory_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Examcategory Management', //screen title
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
							'action'=>'examcategory/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'examcategory/edit',
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
$config['question_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Question Management', //screen title
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
							'action'=>'question/add',
							'class'=>'toolbar_icon toolbar_icon-32-add',
							'label'=>'LBL_ADD_NEW'
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
		'title'=>'title_add_question', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/question'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
	'edit'=>array(
		'title'=>'title_edit_question', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/question'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
	'detail'=>array(
		'title'=>'title_detail_question', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/question'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
);
// List view config
$config['questioncategory_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Questioncategory Management', //screen title
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
							'action'=>'questioncategory/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'questioncategory/edit',
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
$config['test_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Test Management', //screen title
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
							'action'=>'test/add',
							'class'=>'toolbar_icon toolbar_icon-32-add',
							'label'=>'LBL_ADD_NEW'
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
		'title'=>'title_add_test', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/test'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
	'edit'=>array(
		'title'=>'title_edit_test', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/test'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
	'detail'=>array(
		'title'=>'title_detail_test', //screen title
		'items'=>array(
			array(
				'link'=>site_url('exam/test'),
				'task'=>'back',
				'label'=>'LBL_BACK'
			),
		)
	),
);
// List view config
$config['testcategory_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Testcategory Management', //screen title
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
							'action'=>'testcategory/add',
							'task'=>'add',
							'label'=>'LBL_ADD_NEW'
						),
						array(
							'action'=>'testcategory/edit',
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