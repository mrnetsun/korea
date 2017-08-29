<?php
/**
 * File: email.php
 * Created on: 2013/06/23
 * Author: Lucdt
 * 
 */
 
$config['system_email'] = 'cmcsofttest@gmail.com';

$config['gmail'] = Array(
		'protocol' => 'smtp',
		'smtp_host' => 'ssl://smtp.googlemail.com',
		'smtp_port' => 465,
		'smtp_user' => 'cmcsofttest@gmail.com',
		'smtp_pass' => 'cmcsofttest@01',
		'smtp_timeout' => 5,
		'wordwrap' => TRUE,
		'wrapchars' => 76,
		'mailtype' => 'html',
		'charset' => 'utf-8',
		'validate' => FALSE,
		'priority' => 3,
		'crlf' => "\r\n",
		'newline' => "\r\n",
		);
?>
