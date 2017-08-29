<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| File and Directory Modes
|--------------------------------------------------------------------------
|
| These prefs are used when checking and setting modes when working
| with the file system.  The defaults are fine on servers with proper
| security, but you may wish (or even need) to change the values in
| certain environments (Apache running a separate process for each
| user, PHP under CGI with Apache suEXEC, etc.).  Octal values should
| always be used to set the mode correctly.
|
*/
define('FILE_READ_MODE', 0644);
define('FILE_WRITE_MODE', 0666);
define('DIR_READ_MODE', 0755);
define('DIR_WRITE_MODE', 0777);

/*
|--------------------------------------------------------------------------
| File Stream Modes
|--------------------------------------------------------------------------
|
| These modes are used when working with fopen()/popen()
|
*/

define('FOPEN_READ',							'rb');
define('FOPEN_READ_WRITE',						'r+b');
define('FOPEN_WRITE_CREATE_DESTRUCTIVE',		'wb'); // truncates existing file data, use with care
define('FOPEN_READ_WRITE_CREATE_DESTRUCTIVE',	'w+b'); // truncates existing file data, use with care
define('FOPEN_WRITE_CREATE',					'ab');
define('FOPEN_READ_WRITE_CREATE',				'a+b');
define('FOPEN_WRITE_CREATE_STRICT',				'xb');
define('FOPEN_READ_WRITE_CREATE_STRICT',		'x+b');

define('OFFSET', 268435456);
define('RADIUS', 85445659.4471); /* $offset / pi() */

define('_START_','_START_');
define('CHARFILTER',1);
define('UN_CHARFILTER',0);
define('ACTIVE', 1);
define('DEACTIVE', 0);
define('DELETED',-1);
define('NOT_DELETED',0);
define('LATLONG_SPLIT',':');
define('TIME_DELETE_BLOCKED_MEMBER',10);//time total is minute
define('MEMBER_NUMBER_LIMIT_LOGIN',6);//time total is minute
define('BENEFIT_RATE',10); // %

//time locked record when user edit
define('LOCKED_EDIT', '5 minutes');

//approve
define('APPROVE_WAITING','0');
define('APPROVED_OK','1');
define('APPROVE_REJECT','-1');
//0: Waiting; 1: Approved; -1: Reject

//definded roles
define('ROLE_ADMIN', 1);
define('ROLE_MEMBER', 3);

//Log Type
define('TYPE_LOG_INFOR', 0);
define('TYPE_LOG_WARNING', 1);
define('TYPE_LOG_ERROR', 2);

//upload
define('IMAGE_UPLOAD_TYPE','jpg|jpeg|gif|png');
define('DOCUMENT_UPLOAD_TYPE','doc|docx|xls|xlsx|zip|rar|ppt|txt|jpg|jpeg|gif|png|jar|pdf');
define('AUDIO_UPLOAD_TYPE','mp3');
define('VIDEO_UPLOAD_TYPE','mp4|mov');
define('MAX_UPLOAD_SIZE',20480); //~6M

define('UPLOAD_DIR','uploadlib/');
define('UPLOAD_LIB',UPLOAD_DIR.'library/');
define('ARTICLE_UPLOAD',UPLOAD_DIR.'article/');
define('MEMBER_AVATAR',UPLOAD_DIR.'member/avatar/');
define('DEPLOY_DIR',UPLOAD_DIR.'solrdir/');

define('DEFAULT_AVATAR',UPLOAD_DIR.'member/default.jpeg');

define('THUMB_WIDTH',148);
define('THUMB_HEIGHT',148);
define('MAX_IMAGE_WIDTH',640);
define('MAX_IMAGE_HEIGHT',640);

//push
define('PUSH_MESSAGE', 'PUSH_MESSAGE');
//REGEX
define('REGEX_INVALID_CHARACTER', "/\'|-|=|\+|\(|\)|\[|\]|\*|&|\^|\%|\\\$|#|@|!|~|`|\"|:|;|<|>|,|\.|\?|\/|\||\\\|\n|\s+/");
define('REGEX_INVALID_NUMBER', "/[0-9]+/");
//group field

define('BOOT_VALUE', 10);
define('ALLOWED_TAG','<p><a><b><i><span><div><br><h1><h2><h3><h4><h5><h6><img>');
//checkin

define('CHECKIN_TIMEOUT', '-5 minutes');

/* End of file constants.php */
/* Location: ./application/config/constants.php */