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
$config['home_viewdefs'] = array(

    //action index
    'index'=>array(
        'title'=>'Dashboard', //screen title
        'noModuleTitle'=>0,
        'noToolbar'=>0,
        'form'=>'', //id of form action

    ));

// List view config
$config['cronlog_viewdefs'] = array(
	
		//action index			
		'index'=>array(
				'title'=>'Cron Log', //screen title
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
							'action'=>'cronlog/restartsolr',
								'class'=>'toolbar_icon-32-client',
							'label'=>'LBL_RUN_RESTART_SOLR'
						),
						array(
							'action'=>'cronlog/dailyupdate',
								'class'=>'toolbar_icon-32-dailyupdate',
							'label'=>'LBL_RUN_DAILY_UPDATE'
						),
//						array(
//								'action'=>'cronlog/command',
//								'class'=>'toolbar_icon-32-command',
//								'label'=>'LBL_RUN_COMMAND'
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
				'order_by' => array('updatedTime'=>'DESC')
		)	
);