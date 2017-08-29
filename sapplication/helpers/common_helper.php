<?php
if(!defined('BASEPATH')) {exit('No direct script access allowed');}

/**
 * return Encrypted password with SALT
 * @param $password
 */
function password($password){
	$embasePassword = $password.SALT;
	return  md5($embasePassword);
}

/**
 * Return Array content for database
 * @param mix $aryCondition = array('table'=>,'key'=>,'val'=>,'where','empty'=>'--label empty--'
 */
function getDBDropdown($aryCondition,$params = array()){
	$aryData = array();

	if($aryCondition['empty']){
		$aryData[''] = $aryCondition['empty'];
	}

	$ci = &get_instance();


	if($aryCondition['select']){
		$ci->db->select($aryCondition['select'], FALSE);
	}


	if($params['order_by']){
		$ci->db->order_by($params['order_by']);
	}

	if(!empty($aryCondition['where'])) {$ci->db->where($aryCondition['where']);}

	$where = array('del_flag'=>NOT_DELETED);
	//debug($aryCondition,false);
	if($aryCondition['status']){$where['status'] = ACTIVE;}

	$ci->db->where($where);

	$rows = $ci->db->get($aryCondition['table'])->result();
	if(!empty($rows)) {foreach($rows as $row){
		$aryData[$row->{$aryCondition['key']}] = $row->{$aryCondition['val']};
	}}
	return $aryData;
}

function getDBConfig($code,$json = false){
	$ci = &get_instance();
	$ci->db->where(array('configCode'=>$code,'del_flag'=>NOT_DELETED));
	$row = $ci->db->get('sys_config')->row();
	if($json){
		return json_decode($row->configValue);
	}else{
		return $row->configValue;
	}

}

function getDBConfigObject($code){
	$ci = &get_instance();
	$ci->db->where(array('configCode'=>$code,'del_flag'=>NOT_DELETED));
	$row = $ci->db->get('sys_config')->row();
	return $row;
}


function getPermissionDeploy(){
	$ci = &get_instance();
	return $ci->session->userdata('DEPLOY_DATA_PERMISSION');
}


function setDBConfig($code,$value,$date = FALSE){
	$ci = &get_instance();
	$ci->db->where(array('configCode'=>$code,'del_flag'=>NOT_DELETED));
	$row = $ci->db->get('sys_config')->row();
	 if(!empty($row)){
	    $ci->db->update('sys_config',array('configValue'=>$value),array('configCode'=>$code,'del_flag'=>NOT_DELETED));
	 }else{
	    $ci->db->insert('sys_config',array('configValue'=>$value,'configCode'=>$code,'del_flag'=>NOT_DELETED));
	 }
}



/**
 * Return module array
 * @param bool $empty
 * @return multitype:NULL Ambigous <unknown, string>
 */
function getModuleArray($label=''){
	return getDBDropdown(array('table'=>'sys_module','key'=>'moduleId','val'=>'moduleName','empty'=>$label));
}
/**
 *
 * @param string $code
 * @param boolean $empty
 * @return mixed
 */
function sysDropdown($code,$empty=FALSE){
	$aryData = array();

	if($empty){
		$aryData[''] = __($empty);
	}

	$ci = &get_instance();

	$ci->db->where(array('dropdownCode'=>$code));
	$row = $ci->db->get('sys_dropdown')->row();

	$rows = json_decode($row->value);

	if(!empty($rows)){foreach($rows as $item){
		$aryData[$item->value] = $item->text;
	}}
	return $aryData;
}

/**
 * get System Dropdown by Code
 * @param unknown_type $code
 * @param unknown_type $empty
 * @return Ambigous <mixed, multitype:NULL Ambigous <unknown, string> >
 */
function getSystemDropdownByCode($code,$empty=''){
	return sysDropdown($code,$empty);
}

//return array status
function getDropdownStatus($empty = FALSE){
	$aryData = array();

	if($empty){
		$aryData[''] = __($empty);
	}

	$aryData[ACTIVE] = __('Active');
	$aryData[DEACTIVE] = __('Deactive');

	return $aryData;
}

/**
 * return valid module Name
 * @param string $moduleName
 * @return boolean
 */
function checkValidName($moduleName){

	$keywords = array('__halt_compiler', 'abstract', 'and', 'array', 'as', 'break', 'callable', 'case', 'catch', 'class', 'clone', 'const', 'continue', 'declare', 'default', 'die', 'do', 'echo', 'else', 'elseif', 'empty', 'enddeclare', 'endfor', 'endforeach', 'endif', 'endswitch', 'endwhile', 'eval', 'exit', 'extends', 'final', 'for', 'foreach', 'function', 'global', 'goto', 'if', 'implements', 'include', 'include_once', 'instanceof', 'insteadof', 'interface', 'isset', 'list', 'namespace', 'new', 'or', 'print', 'private', 'protected', 'public', 'require', 'require_once', 'return', 'static', 'switch', 'throw', 'trait', 'try', 'unset', 'use', 'var', 'while', 'xor');
	if(in_array(strtolower(trim($moduleName)),$keywords))
		{return FALSE;}
	else
		{return TRUE;}
}
/**
 *
 * @param string $name
 * @param string $strJson
 * @param string $key
 * @param string $text
 */
function makeDropdowJson($name,$strJson,$key='value',$text='text'){
	$aryJson = json_decode($strJson);
	$options = array();
	foreach($aryJson as $item){
		$options[$item->{$key}] = $item->{$text};
	}
	return form_dropdown($name,$options);
}

function fillDBArray(&$aryData,$params){
	$ci = &get_instance();
	$result = $ci->db->get_where($params['table'],$params['where'])->result();
	foreach ($result as $row){
		$aryData[] = $row->roleId;
	}
}

function formatDate($date){
	if($date){return date("d M Y h:i A",strtotime($date));}
}

function multiWord($word){
	$words =preg_split('/[,]+/',trim($word), -1 , PREG_SPLIT_NO_EMPTY );
	$str='';
	foreach ($words as $w){
		$str.='<span class="label">'.htmlspecialchars($w).'</span> ';
	}

	return $str;
}
function multiWordWrap($word, $comma=FALSE){
    $comma=($comma)?',':'';
	$words =preg_split('/[,]+/',trim($word), -1 , PREG_SPLIT_NO_EMPTY );
	$str='';
	$words_size=count($words);
	$count_word=0;
	if($words_size)
	{foreach ($words as $w){
        $count_word++;
		$str.='<span class="word-wrap">'.htmlspecialchars($w).(($count_word<$words_size)?$comma:"").'</span>';

	}}

	return $str;
}

/**
 * create module basic
 * @param mixed $params
 */
function createModule($params){

	$ci = &get_instance();

	$folder = $params['modulePath'];

	$folder = strtolower($folder);
	$module = $folder;
	$controller = $folder;
	$controllerU = ucfirst($controller);

	//int folder tree struct
	mkdir(MODULEPATH.$folder);
	mkdir(MODULEPATH.$folder.'/asset');
	mkdir(MODULEPATH.$folder.'/asset/css');
	mkdir(MODULEPATH.$folder.'/asset/image');
	mkdir(MODULEPATH.$folder.'/asset/js');

	mkdir(MODULEPATH.$folder.'/config');

	mkdir(MODULEPATH.$folder.'/language');
	mkdir(MODULEPATH.$folder.'/language/english');

	mkdir(MODULEPATH.$folder.'/controllers');
	mkdir(MODULEPATH.$folder.'/models');

	mkdir(MODULEPATH.$folder.'/views');

	//create default file

	$aryFind = array('{module}','{controller}','{controllerU}','{tableName}','{primaryKey}');
	$aryReplace = array($module,$controller,$controllerU,$params['tableName'],$params['primaryKey']);

	$aryFiles = array(
			//asset init
			array(
					'folder'=>'asset/css',
					'file_name'=>'style.css',
					'template'=>'css.txt'
				),
			array(
					'folder'=>'asset/js',
					'file_name'=>$module.'.js',
					'template'=>'js.txt'
			),
			//config
			array(
					'folder'=>'config',
					'file_name'=>'config.php',
					'template'=>'config.php.txt'
			),

			);

	foreach($aryFiles as $item){
		//die(MODULEPATH.'system/templates/'.$item['template']);
		$content = file_get_contents(MODULEPATH.'system/templates/'.$item['template']);

		$content = str_replace($aryFind,$aryReplace,$content);

		//write content
		$filename = MODULEPATH.$module.'/'.$item['folder'].'/'.$item['file_name'];
		file_put_contents($filename,$content);
	}

	//create default Controller
	createController($params);
}

/**
 * create Controller basic
 * @param mixed $params
 */
function createController($params){


	$ci = &get_instance();

	$module = strtolower($params['modulePath']);

	$controller = strtolower($params['controller']);
	$controllerU = ucfirst($controller);

	//maked folder View
	@mkdir(MODULEPATH.$module.'/views/'.$controller.'s');

	//create default file

	$aryFind = array('{module}','{controller}','{controllerU}','{tableName}','{primaryKey}');
	$aryReplace = array($module,$controller,$controllerU,$params['tableName'],$params['primaryKey']);

	$aryFiles = array(
			//lang
			array(
					'folder'=>'language/english',
					'file_name'=>$controller.'_lang.php',
					'template'=>'lang.php.txt'
			),
			//controller
			array(
					'folder'=>'controllers',
					'file_name'=>$controller.'.php',
					'template'=>'controller.php.txt'
			),
			//model
			array(
					'folder'=>'models',
					'file_name'=>$controller.'_model.php',
					'template'=>'model.php.txt'
			),
			//view
			array(
					'folder'=>'views/'.$controller.'s',
					'file_name'=>'add.php',
					'template'=>'add.php.txt'
			),
			array(
					'folder'=>'views/'.$controller.'s',
					'file_name'=>'edit.php',
					'template'=>'edit.php.txt'
			),
			array(
					'folder'=>'views/'.$controller.'s',
					'file_name'=>'index.php',
					'template'=>'index.php.txt'
			),
			array(
					'folder'=>'views/'.$controller.'s',
					'file_name'=>'getList.php',
					'template'=>'getList.php.txt'
			),
			array(
					'folder'=>'views/'.$controller.'s',
					'file_name'=>'view.php',
					'template'=>'view.php.txt'
			)

	);

	//update config file
	$new_config = file_get_contents(MODULEPATH.'system/templates/config_controller.php.txt');
	$new_config = str_replace($aryFind,$aryReplace,$new_config);

	//write config file
	$filename = MODULEPATH.$module.'/config/config.php';
	if (is_writable($filename)) {

		//opening $filename in append mode.
		if (!$handle = fopen($filename, 'a')) {
			echo "Cannot open file ($filename)";
		}

		// Write config.
		if (fwrite($handle, $new_config) === FALSE) {
			echo "Cannot write to file ($filename)";
		}

		fclose($handle);

	} else {
		echo "The file $filename is not writable";
	}


	foreach($aryFiles as $item){
		//die(MODULEPATH.'system/templates/'.$item['template']);
		$content = file_get_contents(MODULEPATH.'system/templates/'.$item['template']);

		$content = str_replace($aryFind,$aryReplace,$content);

		//get fields
		if($params['tableName']){
			$aryDataFields =$ci->db->field_data($params['tableName']);
		}else{
			$aryDataFields = '';
		}
		switch ($item['file_name']){
			case "$controller.php":
				$aryElements = array();
				foreach ($params['listSearchRow']['field'] as $key=>$field){
					$element = file_get_contents(MODULEPATH.'system/templates/search_item.txt');
					$element = str_replace(array('{fieldName}'),array($field),$element);
					$aryElements[] = $element;
				}
				$content = str_replace('{searchConditon}', implode("", $aryElements), $content);
				break;
			case 'view.php':
				$aryElements = array();

				if(!empty($params['addEditRow'])){
					$i = 0;
					foreach ($params['addEditRow']['field'] as $key=>$field){
						$i++; $even = ($i % 2)?'even':'';

						$label = $params['addEditRow']['label'][$key];
						//text-password-textarea-datetime-daterange-date-select-radio-checkbox-import-latlong-captcha-upload
						$type = $params['addEditRow']['type'][$key];
						$validate = $params['addEditRow']['validate'][$key];

						switch($field){
							case 'status':
								$element = file_get_contents(MODULEPATH.'system/templates/view_item_status.txt');
								$element = str_replace(array('{fieldName}','{fieldLabel}','{even}'),array($field,$label,$even),$element);

								break;
							default:
								$element = file_get_contents(MODULEPATH.'system/templates/view_item.txt');
								$element = str_replace(array('{fieldName}','{fieldLabel}','{even}'),array($field,$label,$even),$element);

						}

						$aryElements[] = $element;
					}
				}elseif(!empty($aryDataFields)){
					$i = 0;
					foreach ($aryDataFields as $field)
					{
						$i++; $even = ($i % 2)?'even':'';
						switch($field){
							case 'status':
								$element = file_get_contents(MODULEPATH.'system/templates/view_item_status.txt');
								$element = str_replace(array('{fieldName}','{fieldLabel}','{even}'),array($field,$label,$even),$element);

								break;
							default:
								$element = file_get_contents(MODULEPATH.'system/templates/view_item.txt');
								$element = str_replace(array('{fieldName}','{fieldLabel}','{even}'),array($field,$label,$even),$element);

						}
					}


				}

				$content = str_replace('{fieldViewItem}', implode("", $aryElements), $content);

				break;
			case 'add.php':
			case 'edit.php':
				$aryElements = array();
				if(!empty($params['addEditRow'])){
					$i = 0;
					foreach ($params['addEditRow']['field'] as $key=>$field){
						$i++; $even = ($i % 2)?'even':'';

						$label = $params['addEditRow']['label'][$key];
						//text-password-textarea-datetime-daterange-date-select-radio-checkbox-import-latlong-captcha-upload
						$type = $params['addEditRow']['type'][$key];
						$validate = $params['addEditRow']['validate'][$key];

						$element = file_get_contents(MODULEPATH.'system/templates/form_item_'.$type.'.txt');
						$element = str_replace(array('{fieldName}','{fieldLabel}','{fieldRules}','{even}'),array($field,$label,$validate,$even),$element);
						$aryElements[] = $element;
					}
				}elseif(!empty($aryDataFields)){
					$i = 0;
					foreach ($aryDataFields as $field)
					{
						$i++;
						$even = ($i % 2)?'even':'';
						$element = file_get_contents(MODULEPATH.'system/templates/form_item.txt');
						$element = str_replace(array('{fieldName}','{fieldLable}','{even}'),array($field->name,$field->name,$even),$element);
						$aryElements[] = $element;
					}


				}

				$content = str_replace('{fieldFormItem}', implode("", $aryElements), $content);

				break;
			case 'index.php':
					$aryElements = array();
					if(!empty($params['listSearchRow'])){
						$i = 0;
						foreach ($params['listSearchRow']['field'] as $key=>$field){
							$i++; $even = ($i % 2)?'even':'';

							$label = $params['listSearchRow']['label'][$key];

							$search = $params['listSearchRow']['search'][$key];

							if($search){
								switch($field){
									case 'status':
										$element = file_get_contents(MODULEPATH.'system/templates/form_search_item_status.txt');
										$element = str_replace(array('{fieldName}','{fieldLabel}','{fieldRules}','{even}'),array($field,$label,'',$even),$element);
										$aryElements[] = $element;
										break;
									case 'createdTime':
									case 'updatedTime':
										$element = file_get_contents(MODULEPATH.'system/templates/form_search_item_date.txt');
										$element = str_replace(array('{fieldName}','{fieldLabel}','{fieldRules}','{even}'),array($field,$label,'',$even),$element);
										$aryElements[] = $element;
										break;
									default:
										$element = file_get_contents(MODULEPATH.'system/templates/form_search_item.txt');
										$element = str_replace(array('{fieldName}','{fieldLabel}','{fieldRules}','{even}'),array($field,$label,'',$even),$element);
										$aryElements[] = $element;
								}

							}
						}
					}

					$content = str_replace('{fieldSearchItem}', implode("", $aryElements), $content);

					break;
			case 'getList.php':
				$aryElements = array();
				$aryContents = array();
				if(!empty($params['listSearchRow'])){
					$i = 0;
					foreach ($params['listSearchRow']['field'] as $key=>$field){
						$i++; $even = ($i % 2)?'even':'';

						$label = $params['listSearchRow']['label'][$key];

						$sort = $params['listSearchRow']['sort'][$key];

						$element = file_get_contents(MODULEPATH.'system/templates/list_head_'.$sort.'.txt');
						$element = str_replace(array('{fieldName}','{fieldLabel}'),array($field,$label),$element);
						$aryElements[] = $element;

						switch($field){
							case 'createdTime':
							case 'updatedTime':
							$element = file_get_contents(MODULEPATH.'system/templates/list_content_time.txt');
							$element = str_replace(array('{fieldName}','{fieldLabel}'),array($field,$label),$element);
								break;
							case 'status':
								$element = file_get_contents(MODULEPATH.'system/templates/list_content_status.txt');
								$element = str_replace(
									array('{fieldName}',
										'{fieldLabel}',
										'{module}',
										'{controller}',
										'{primaryKey}'),
									array($field,
										$label,
										$module,
										$controller,
										$params['primaryKey']
										),$element);
								break;
							default:
								$element = file_get_contents(MODULEPATH.'system/templates/list_content.txt');
								$element = str_replace(array('{fieldName}','{fieldLabel}'),array($field,$label),$element);
						}

						$aryContents[] = $element;
					}
				}

				$content = str_replace(array('{ListHeadItem}','{ListRowItem}'), array(implode("", $aryElements),implode("", $aryContents)), $content);

				break;
		}

		//write content
		$filename = MODULEPATH.$module.'/'.$item['folder'].'/'.$item['file_name'];
		file_put_contents($filename,$content);
	}
}

/**
 * return formated table *
 * @param mixed $aryHead
 * @param mixed $aryData
 */
function buildHTMLTable($aryHead,$aryData){
	$CI = &get_instance();
	$CI->load->library('table');

	$tmpl = array ( 'table_open'  => '<div class="hasTable"><table border="1" cellpadding="2" cellspacing="1" class="tableList">', 'table_close' => '</table></div>');

	$CI->table->set_template($tmpl);

	$CI->table->set_heading($aryHead);
	return $CI->table->generate($aryData);
}

/**
 * return All Controller file of Module
 * @param string $folder
 * @return mixed
 */
function getControllerFiles($directory, $recursive=FALSE) {
	$directory = MODULEPATH.$directory.'/controllers';
    $array_items = array();
    if ($handle = opendir($directory)) {
        while (FALSE !== ($file = readdir($handle))) {
            if ($file != "." && $file != "..") {
                if (is_dir($directory. "/" . $file)) {
                    if($recursive) {
                        $array_items = array_merge($array_items, getControllerFiles($directory. "/" . $file, $recursive));
                    }
                    //$file = $directory . "/" . $file;
                    $array_items[] = preg_replace("/\/\//si", "/", $file);
                } else {
                    //$file = $directory . "/" . $file;
                	$info = pathinfo($directory . "/" . $file);
                    $array_items[] = array($info['filename'],filesize($directory . "/" . $file),date ("Y-m-d H:i:s.", filemtime($directory . "/" . $file)));
                }
            }
        }
        closedir($handle);
    }

    return $array_items;
}


/**
 * display variable and exit
 * @param object $var
 * @param bool $flag
 */
function debug($var,$flag = TRUE){
	echo "<pre>"; print_r($var); echo "</pre>";
	if($flag) {die("End Debug");}
}

/**
 * Retrun Highlight text
 * @param string $text
 * @param array $words
 * @return string
 */
function highlightWords($text, array $words){
  $words = array_map(preg_quote, $words);
  return preg_replace('/(' . implode('|', $words). ')/is', '<span class="higlight">$1</span>', $text);
}

/**
 * return Money Format
 * @param number $number
 * */
function moneyformat($number){
	if($number){
		return number_format($number,0, ',', '.')." $";
	}else{
		return "0 $";
	}
}

/**
 * convert second to word
 * @param int $seconds
 */
function secondsToWords($seconds,$type=0)
{
    /*** return value ***/
    $ret = "";

    /*** get the hours ***/
    $hours = intval(intval($seconds) / 3600);
    if($hours != 0)
    {
        $ret .= str_pad($hours,2,"0",STR_PAD_LEFT);
		if($type==1)
			{$ret .=":";}
		else {$ret .=" Giây ";}
    }else{
		if($type==1)
			{$ret .="00:";}
	}
    /*** get the minutes ***/
    $minutes = bcmod((intval($seconds) / 60),60);
    if($hours != 0 || $minutes != 0)
    {
        $ret .= str_pad($minutes,2,"0",STR_PAD_LEFT);
		if($type==1) {$ret .=":";}
		else {$ret .=" PhÃºt ";}
    }else{
		if($type==1)
			{$ret .="00:";}
	}

    /*** get the seconds ***/
    $seconds = bcmod(intval($seconds),60);
	if( $seconds !=0){
    	$ret .= str_pad($seconds,2,"0",STR_PAD_LEFT);
		if($type==1)
			{$ret .="";}
		else
			{$ret .= " GiÃ¢y";}
	}else{
		if($type==1)
			{$ret .="00";}
	}
    return $ret;
}

//do encrypt data
function sys_encrypt($text)
    {
        $str = trim(base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, SALT, $text, MCRYPT_MODE_ECB, mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND))));
        return strtr($str, '+/=', '-_,');
    }

//do decrypt data
function sys_decrypt($text)
    {
        $text = base64_decode(strtr($text, '-_,', '+/='));
    	return trim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, SALT, $text, MCRYPT_MODE_ECB, mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB), MCRYPT_RAND)));
    }

/**
 * Return the timestamp of the first day (Monday) of a given week in a given year
 *
 * @param integer week number
 * @param integer Year
 */
function first_day_of_week($week_number, $year) {
	$offset = date('w', mktime(0, 0, 0, 1, 1, $year));

	$offset = ($offset < 5) ? (1 - $offset) : (8 - $offset);
	$monday = mktime(0, 0, 0, 1, 1 + $offset, $year);
	$date = strtotime('+' . ($week_number - 1) . ' weeks', $monday);

	return $date;
}

/**
 * Return the timestamp of the last day (Sunday) of a given week in a given year
 *
 * @param integer week number
 * @param integer Year
 */
function last_day_of_week($week_number, $year) {
	$first_day = first_day_of_week($week_number, $year);

	return strtotime('+6 days', $first_day);
}

/**
 * Return the number of weeks in a given year
 *
 * @param integer Year
 */
function num_of_weeks($year) {
	return max(date('W', mktime(0, 0, 0, 12, 25, $year)), date('W', mktime(0, 0, 0, 12, 31, $year)));
}

/**
 * Generate random float number
 */
function frand($min, $max) {
	$range = $max - $min;
	return $min + $range * mt_rand(0, 32767)/32767;
}


/**
 * Truncate a string to a certain length if necessary,
 * optionally splitting in the middle of a word, and
 * appending the $etc string or inserting $etc into the middle.
 * @param string
 * @param integer
 * @param string
 * @param boolean
 * @param boolean
 * @return string
 */
function truncate($string, $length = 80, $etc = '...', $break_words = FALSE, $middle = FALSE){
    if ($length == 0)
        {return '';}

    if (strlen($string) > $length) {
        $length -= min($length, strlen($etc));
        if (!$break_words && !$middle) {
            $string = preg_replace('/\s+?(\S+)?$/', '', substr($string, 0, $length+1));
        }
        if(!$middle) {
            return substr($string, 0, $length) . $etc;
        } else {
            return substr($string, 0, $length/2) . $etc . substr($string, -$length/2);
        }
    } else {
        return $string;
    }
}
/**
 *
 * @param string $jsdate
 */
function js2PhpTime($jsdate){
  if(preg_match('@(\d+)/(\d+)/(\d+)\s+(\d+):(\d+)@', $jsdate, $matches)==1){
    $ret = mktime($matches[4], $matches[5], 0, $matches[1], $matches[2], $matches[3]);
    //echo $matches[4] ."-". $matches[5] ."-". 0  ."-". $matches[1] ."-". $matches[2] ."-". $matches[3];
  }else {if(preg_match('@(\d+)/(\d+)/(\d+)@', $jsdate, $matches)==1){
    $ret = mktime(0, 0, 0, $matches[1], $matches[2], $matches[3]);
    //echo 0 ."-". 0 ."-". 0 ."-". $matches[1] ."-". $matches[2] ."-". $matches[3];
  }}
  return $ret;
}
/**
 *
 * @param string $phpDate
 */
function php2JsTime($phpDate){
    //echo $phpDate;
    //return "/Date(" . $phpDate*1000 . ")/";
    return date("m/d/Y H:i", $phpDate);
}
/**
 *
 * @param string $phpDate
 * @return string
 */
function php2MySqlTime($phpDate){
    return date("Y-m-d H:i:s", $phpDate);
}
/**
 *
 * @param unknown_type $sqlDate
 */
function mySql2PhpTime($sqlDate){
    $arr = date_parse($sqlDate);
    return mktime($arr["hour"],$arr["minute"],$arr["second"],$arr["month"],$arr["day"],$arr["year"]);

}

function strtosqltime($strDate){
	return date("Y-m-d H:i:s",strtotime($strDate));
}

function strsqltotime($strDate,$format=''){
	$format = ($format)?$format:"m/d/Y H:i:s";
	return date($format,strtotime($strDate));
}

function task_date($strDate,$format='m/d/Y'){
    return '<span class="time">'.strsqltotime($strDate,$format).'</span>';
}

/**
 * return fullname Module_Controller_Action_$name
 * @param string $name
 */
 function _getName($name=''){
 	$CI =& get_instance();

	$m = ucwords(strtolower($CI->router->fetch_module()));
	$c = ucwords(strtolower($CI->router->fetch_class()));
	$a = ucwords(strtolower($CI->router->fetch_method()));
	if($m==$c) {$c ='';}
	$str = $m;
	if($c) {$str.= '_'.$c;}
	if($a) {$str.= '_'.$a;}
	if($name) {$str.= '_'.$name;}
	return $str;
}
/**
 * return fullname module/controller/action
 * @param string $name
 */
function _getAction($name=''){
	$CI =& get_instance();

	$m = strtolower($CI->router->fetch_module());
	$c = strtolower($CI->router->fetch_class());
	$a = strtolower($CI->router->fetch_method());
	if($m==$c) {$c ='';}
	$str = $m;
	if($c) {$str.= '/'.$c;}
	if($name){
		$str.= '/'.strtolower($name);
	}else{
		$str.= '/'.$a;
	}

	return $str;
}

/**
 * return base name Module_Controller_$name
 * @param unknown_type $name
 */
 function _getBaseName($name=''){
 	$CI =& get_instance();

	$m = ucwords(strtolower($CI->router->fetch_module()));
	$c = ucwords(strtolower($CI->router->fetch_class()));
	$a = ucwords(strtolower($CI->router->fetch_method()));
	if($m==$c) {$c ='';}
	$str = $m;
	if($c) {$str.= '_'.$c;}
	//if($a) $str.= '_'.$a;
	if($name) {$str.= '_'.ucwords(strtolower($name));}

	return $str;
}
/**
 * return Lat,Long from address
 * @param string $ip_addr
 * @return multitype:string |multitype:unknown mixed
 */
function IP2Geo($ip_addr=''){
	if(!$ip_addr) {$ip_addr = getIP();}

	//localhost return HANOI(21.033333,105.850000) , HCM(10.823099,106.629664)
	if($ip_addr =='127.0.0.1') {return array('lat'=>'21.033333','long'=>'105.850000');}

	$geoplugin = unserialize( file_get_contents('http://www.geoplugin.net/php.gp?ip='.$ip_addr) );

	if ( is_numeric($geoplugin['geoplugin_latitude']) && is_numeric($geoplugin['geoplugin_longitude']) ) {

		$lat = $geoplugin['geoplugin_latitude'];
		$long = $geoplugin['geoplugin_longitude'];
	}

	if(!$lat) {$lat = 21.033333;}
	if(!$long) {$long = 105.850000;}

	return array('lat'=>$lat,'long'=>$long);
}

function getAddressFromGEO($lat,$long){
	$geoplugin = json_decode( file_get_contents('http://maps.googleapis.com/maps/api/geocode/json?latlng='.$lat.','.$long.'&sensor=true_or_false') );
	debug($geoplugin);
}
/**
 * get Module Menu
 * @param unknown_type $modulePath
 * @param unknown_type $level
 */
function getModuleMenu($modulePath,$level = 0,$aryWhere = array()){
	$CI = get_instance();
	$moduleMenu = array();
	if($modulePath) {$aryWhere['moduleId'] = $modulePath;}
	if($aryWhere) {$CI->db->where($aryWhere);}
	$CI->db->order_by('position');
	$rows = $CI->db->get_where('sys_menu',array('parentId'=>$level,'status'=>ACTIVE,'del_flag'=>NOT_DELETED))->result();

	foreach ($rows as $row){
		$row->children = getModuleMenu($modulePath,$row->menuId,$aryWhere);
		$moduleMenu[] = $row;
	}

	return $moduleMenu;
}

function isUserViewMenu($menu,$permission){
    $menuLink =  explode('/',$menu->menuLink);
    $controller = $menuLink[0];
    $action = $menuLink[1];
    $parentId = intval( $menu->parentId );
	//debug($parentId,false);
	if( empty( $parentId ) ){
		foreach ( $menu->children as $v ) {
			$menuLink =  explode('/',$v->menuLink);
			$controller = $menuLink[0];
			$action = $menuLink[1];
			$role = $permission[$controller.'/'.$action];
			if($role){
				if($role->full || $role->edit ||  $role->add || $role->delete || $role->listView) {
					return TRUE;
				}
			}else{
				return false;
			}
		}
	}

    if($controller == 'home' ||!$menu->menuLink ||!$menu->menuLink=='#') {
            if((!$menu->menuLink ||!$menu->menuLink=='#') && $menu->children){
                   foreach ( $menu->children as $v ) {
                        return isUserViewMenu($v,$permission);
                   }
            }else{
                return TRUE;
            }


    }
    else{
        $role = $permission[$controller.'/'.$action];
        if($role){
            if($role->full || $role->edit ||  $role->add || $role->delete || $role->listView) {return TRUE;}
        }
    }
     return FALSE;
}

function isUserViewButton($button,$permission){
    return TRUE;
    $CI = get_instance();
    $currentModule = $CI->router->fetch_module();
    if($currentModule == 'home') {return TRUE;}
    switch($button['task']){

    }
    $menuLink =  explode('/',$button['action']);
    $controller = $menuLink[0];
    $action = $menuLink[1];

    $currentAction = $CI->router->fetch_method();

    if($controller == 'home') {return TRUE;}
    else{

        print_r($button);$role = $permission[$currentModule.'/'.$controller];
        echo $currentModule.'/'.$controller;debug($role,FALSE);
        if($role){
            if($role->full) {return TRUE;}
        }
    }
     return FALSE;
}

function checkPermissionUser($menu, $permissions) {
	$task = $menu['task'];
	$action = $menu['action'];
	if($action) {
		$menuLink =  explode('/',$action);
		$controller = $menuLink[0];
		$task = $menuLink[1];
	}
	$CI = get_instance();
	$module = $CI->router->fetch_module();
	$controller = $CI->router->fetch_class();
	$method = $CI->router->fetch_method();
	$member_controller = new Member_Controller;
	$actions_list = $member_controller->action_listview;//action_list;
	$actions_add = $member_controller->action_add;
	$actions_edit = $member_controller->action_edit;
	$actions_delete = $member_controller->action_delete;

	$permission = $permissions[$module.'/'.$controller];
	if($permission->full) {return TRUE;}
	$roles = array();
	foreach($actions_list as $action):
		$roles[$action] = $permission->listView;
	endforeach;
	foreach($actions_add as $action):
		$roles[$action] = $permission->add;
	endforeach;
	foreach($actions_edit as $action):
		$roles[$action] = $permission->edit;
	endforeach;
	foreach($actions_delete as $action):
		$roles[$action] = $permission->delete;
	endforeach;

	return $roles[$task];
}

function is_menu_active($menu){
$CI = get_instance();
$class= $CI->router->fetch_class();
$linkArray  = explode('/',$menu->menuLink);
	//echo current_url();
	//debug(site_url($menu->menuLink),false);
// || strtolower($class) == strtolower($linkArray[1])
  $ok = ((current_url()==site_url($menu->menuLink)));

  if(!$ok && !empty($menu->children)){
		foreach ( $menu->children as $v ) {
				$linkArray  = explode('/',$v->menuLink);
			   if((current_url()==site_url($v->menuLink))){
					$ok = TRUE;
					return $ok;
			   }
			}
  }
  return $ok;
}

/**
 * Display Menu
 * @param unknown_type $moduleMenu
 * @param unknown_type $level
 */
function displayMenu($moduleMenu,$level=0){
	if($level == 0){
		$html = '<ul class="nav">' . PHP_EOL;
	}else{
		$html = '<ul class="dropdown-menu">' . PHP_EOL;
	}
	foreach ( $moduleMenu as $v ) {
		$link = ($v->menuLink)?site_url($v->menuLink):'#';
		$active = (current_url() == site_url($v->menuLink))? 'class="active"':'';
		if(!$v->children){
			$html.= '<li '.$active.'><a href="'.$link.'">' . $v->menuName . '</a></li>';
		}else{
			$html.= '<li class="dropdown"> <a data-toggle="dropdown" class="dropdown-toggle" href="'.$link.'">' . $v->menuName . '<b class="caret"></b></a>';
			$html.= displayMenu($v->children,1);
			$html.= '</li>' . PHP_EOL;
		}


	}
	$html.= '</ul>' . PHP_EOL;
	return $html;
}

function frontMenu(){
	$CI = &get_instance();
	$CI->db->order_by('position','ASC');
	$CI->db->where(array('parentId'=>0,'menuType'=>'customer'));
	$rows = $CI->db->get('sys_menu')->result();

	$html = '<ul class="slimmenu" id="slimmenu">';
	foreach($rows as $item){
		$active_class = is_menu_active($item)?'active':'';
		$html.='<li class="'.$active_class.'">';
		$html.= anchor($item->menuLink,$item->menuName);
		$html.= frontMenuItem($item->menuId);
		$html.='</li>';
	}

	$html.='</ul>';

	return $html;
}

function frontMenuItem($parent_id=0){

	$CI = &get_instance();
	$CI->db->order_by('position','ASC');
	$CI->db->where(array('parentId'=>$parent_id,'menuType'=>'customer'));
	$rows = $CI->db->get('sys_menu')->result();
	$html = '';

	if(!empty($rows)) {
		$html .= '<ul>';
		foreach ($rows as $item) {
			$active_class = is_menu_active($item) ? 'active' : '';
			$html .= '<li class="' . $active_class . '">';
			$html .= anchor($item->menuLink, $item->menuName);
			$html .= frontMenuItem($item->menuId);
			$html .='</li>';

		}
		$html .= '</ul>';
	}

	return $html;
}

/**
 * get Tree Array from Database
 * @param int $parentId
 * @param int $level
 * @param mixed $params (table,key,name)
 */
function getTree($parentId,$level = 0,$params=array()){
	if(!$params['parent']) {$params['parent'] = 'parentId';}
	$level++;
	//debug($params);
	//echo $params['key'];
	$CI = get_instance();
	$tree = array();
	if($params['where']) {
		$where = $params['where'] ;
	}else{
		$where = array();
	}
	$where[$params['parent']] = $parentId;
	$where['del_flag'] = NOT_DELETED;

	if($params['active']) {$where['status'] = ACTIVE;}

	if($params['type']) $where['type'] = $params['type'];
	if($params['key_type']) $where[$params['key_type']] = $params['key_val'];

	$rows = $CI->db->get_where($params['table'],$where)->result();

    if($parentId) {$parent = $CI->db->get_where($params['table'],array($CI->db->primary($params['table'])=>$parentId))->row();}

	foreach ($rows as $row){
		$row->level = $level;
        $row->parentName = $parent->cateName;
		$row->children = getTree($row->{$params['key']},$level,$params);
		$tree[] = $row;
	}
	$level--;
	return $tree;
}

/**
 * return Option array from Database
 * @param string $parentId
 * @param int $level
 * @param mixed $params (table,key,name)
 */
function getTreeOption($parentId,$level = 0,$params=array()){
	$aryData = getTree($parentId,$level,$params);
	$aryOption = array();
	$aryOption = buildOptionTree($aryData,$aryOption,$params);
	return $aryOption;
}
/**
 * Build Tree Option from Array
 * @param string $aryData
 * @param string $aryOption
 * @param string $params
 */
function buildOptionTree($aryData,&$aryOption,$params = array()){
	//debug($aryData);
	$char = ($params['char'])?$params['char']:'&nbsp;&nbsp;&nbsp;';
	foreach ($aryData as $item){
		$blank = ''; for($i=1;$i<$item->level;$i++) {$blank .= $char;}

		if(!$params['lang']){
			$aryOption[$item->{$params['key']}] = $blank.$item->{$params['name']};
		}else{
			$lang = $params['lang'];
			$trans = json_decode($item->translation);
			//debug($trans->vn,false);
			if($trans->{$lang}){
				$aryOption[$item->{$params['key']}] = $blank.$trans->{$lang}->{$params['name']};
			}else{
				if($trans->en){
					$aryOption[$item->{$params['key']}] = $blank.$trans->en->{$params['name']};
				}else{
					$aryOption[$item->{$params['key']}] = $blank.$item->{$params['name']};
				}
			}
		}
		if(!empty($item->children)) {buildOptionTree($item->children,$aryOption,$params);}
	}
	return $aryOption;
}

function spaceTree($level){
	$str = '';
	if($level>1) {$str.= "|";}
	for($j=1;$j<$level;$j++) {$str.= '-----+';}

	return "<span class='spaceTree'>".$str."</span>";
}

function buidCategoryList($url,$formBase,$aryData,$level=0,$fastlane=1){
    $i =0;
	foreach ($aryData as $item){
		$i++;
		//$first = ($i==1)?'first':'';
		$even = ($level==0)?'even first':'';
		?>
	            		<tr class="<?php echo $even;?>">
	                    <td class="tc first">
	                    	<?php echo $formBase->checkbox('cid[]',array('value'=>$item->categoryId,'onclick'=>"Common.isCheckAll(this)"));?>
	                    </td>


						<td class="tl">

	                    	<div>
	                    	<?php
	                    		echo spaceTree($item->level);
	                    	?>
	                    	<a title='<?php echo __('View');?>' onclick="return Common.linkSetup(this,{ajax:true,overlay:true,title:'<?php echo __('View')?>'})" data-url="<?php echo site_url($url.'/edit/'.$item->categoryId)?>">
	                    	<?php echo $item->cateName; builLangList($url,$item,'categoryId',array('overlay'=>TRUE))?>
	                    	</a></div>
	                    </td>
	                    <td class="tl">
	                    	<div><?php echo ($item->parentName)?$item->parentName:__("Root")?></div>
	                    </td>
                            <?php if($fastlane){?>
                            <td class="tc">
                                <div><?php echo img_status($item->is_fastlane,site_url($url.'/dataSwitch/'.$item->categoryId.'/is_fastlane'));?></div>
                            </td>
                            <?php }?>
                            <td class="tc">
	                    	<div><?php echo img_status($item->status,site_url($url.'/dataSwitch/'.$item->categoryId.'/status'));?></div>
	                    </td>
						<td class="tc">
	                    	<div><?php echo localDate($item->createdTime)?></div>
	                    </td>


	                    <td class="tc last ">

	                    	<div class="settings-button">
	                    		<span class='action-setting'></span>
	                    		<div class="toolbar-icons" style="display: none;">
								<a title='<?php echo __('View');?>' onclick="return Common.linkSetup(this,{ajax:true,overlay:true,title:'<?php echo __('View')?>'})" data-url="<?php echo site_url($url.'/detail/'.$item->categoryId)?>"><i class="action-icon-eye-open"></i></a>
								<a title='<?php echo __('Edit');?>' onclick="return Common.linkSetup(this,{ajax:true,overlay:true,title:'<?php echo __('Edit')?>'})" data-url="<?php echo site_url($url.'/edit/'.$item->categoryId)?>"><i class="action-icon-edit"></i></a>
								<a title='<?php echo __('Delete');?>' onclick="return Common.linkSetup(this,{ajax:true,callBack:'reload'})" data-url="<?php echo site_url($url.'/delete/'.$item->categoryId)?>"><i class="action-icon-trash"></i></a>
							</div>
	                    	</div>


	                    </td>
	                	</tr>
	            		<?php
	            		if($item->children){
	            			$level ++;
	            			buidCategoryList($url,$formBase,$item->children,$level,$fastlane);
	            			$level --;
	            		}
	            	}
	}

/**
 * @param $url
 * @param $formBase
 * @param $aryData
 * @param int $level
 */
function buidCategoryListFontend($url,$formBase,$aryData,$registered,$level=0){
    $i =0;

    foreach ($aryData as $item){
        $i++;
        //$first = ($i==1)?'first':'';
        $even = ($level==0)?'even first':'';
        ?>
        <tr class="<?php echo $even;?>">
            <td class="tc first">
                <?php
                //debug($registered,false); debug($item->categoryId);
                if(@in_array($item->categoryId,$registered)){
                    echo $formBase->checkbox('cid[]',array('value'=>$item->categoryId,'onclick'=>"dealerController.checkService(this)","checked"=>array($item->categoryId)));
                }else{
                    echo $formBase->checkbox('cid[]',array('value'=>$item->categoryId,'onclick'=>"dealerController.checkService(this)"));
                }
                ?>
            </td>


            <td class="tl">

                <div>
                    <?php
                    echo spaceTree($item->level);
                    ?>
                    <?php echo $item->cateName;?></div>
            </td>
            <td class="tl">
                <div><?php echo ($item->parentName)?$item->parentName:__("Root")?></div>
            </td>

            <td class="tc">
                <div><?php echo localDate($item->createdTime)?></div>
            </td>

        </tr>
        <?php
        if($item->children){
            $level ++;
            buidCategoryListFontend($url,$formBase,$item->children,$registered,$level);
            $level --;
        }
    }
}
function builLangList($url,$item,$id,$params = array()){
	$overlay = ($params['overlay'])?'onclick="return Common.linkSetup(this,{ajax:true,overlay:true,title:\''.__('Update').'\'})"':'';
	if(!$params['nolink']){
	?>
	<a <?php echo $overlay; ?> <?php echo ($params['overlay'])?'data-url':'href'?>="<?php echo site_url($url.'/edit/'.$item->{$id}.'/'.$params['url'])?>"><div class="flag flag-<?php echo $item->lang;?>"></div></a>
	<?php }else{
		echo '<div class="flag flag-'.$item->lang.'"></div>';
		}
		?>
              <?php if($item->translation){
                    		$aryLang = json_decode($item->translation);
                    		foreach($aryLang as $lang){
                 	if(!$params['nolink']){
                   ?>
                  <a <?php echo $overlay; ?> <?php echo ($params['overlay'])?'data-url':'href'?>="<?php echo site_url($url.'/translate/'.$item->{$id}.'/'.$lang->lang.'/'.$params['url'])?>"><div class="flag flag-<?php echo $lang->lang;?>"></div></a>
                  <?php
                 	}else{
                 		echo '<div class="flag flag-'.$lang->lang.'"></div>';
                 	}
                    }
                  }?>
	<?php
}

function buildTranslate($url,$fillData,$id,$title,$params = array()){
	$formBase = new FormBase();
	$overlay = ($params['overlay'])?'onclick="return Common.linkSetup(this,{ajax:true,overlay:true,title:\''.__('Update').'\'})"':'';
	?>
	<div class="translationWrap section<?php echo $params['class']?>">
		<h2><?php echo __("Translation"); ?> </h2>
		<div class="toolbar h30">
		<div class="left">
		<?php

			//$type = explode('/', $url);
			//debug($url,false);
			switch (strtolower($url)){
				default:
					$code = '';
			}
			?>

		</div>

		<div class="right"><?php echo $formBase->language('translate_to');?>
		<a class="btn" onclick="return Common.makeTranslation(this,<?php echo $overlay?1:0?>)" href="<?php echo site_url($url."/translate/".$fillData->{$id});?>"><?php echo __("Translate");?></a>
		</div></div>

		<div class="translationContent clear">
			<table class='tableList' width="100%"><tr>
			<th class="w30"><?php echo __("Language")?></th>
			<th class="tl"><?php echo __("Title")?></th>
			<th class="w50"><?php echo __("Action")?></th>
			</tr>
			<?php
				$aryTranslation = json_decode($fillData->translation);
				if(!empty($aryTranslation) && $fillData->translation !='{}'){
					foreach ($aryTranslation as $key => $tran){
						//debug($trans);
					?>
					<tr><td  class="tc"><div class="flag flag-<?php echo $tran->lang?>"></div></td>
					<td><?php echo anchor($url.'/translate/'.$fillData->{$id}.'/'.$tran->lang.'/'.$params['url'],$tran->{$title},$overlay)?></td>
					<td class="tc">
					<?php echo anchor($url.'/translate/'.$fillData->{$id}.'/'.$tran->lang.'/'.$params['url'],'<i class="action-icon-edit"></i>',$overlay)?>
					<?php echo anchor($url.'/removeTranslate/'.$fillData->{$id}.'/'.$tran->lang,'<i class="action-icon-trash"></i>',' onclick="return Common.removeTranslate(this)"')?>
					</td></tr>
					<?php
					}
				}else{
					echo "<tr><td colspan='10'><div class='error'>".__("No translation found.").'</div></td></tr>';
				}
			?>
			</table>
		</div>
	</div>
	<?php
}

function buildMmyTranslationList($code,$url){

	$formBase = new FormBase();
	$trans = getMyTranslation($code);
	$inviteStatus = getSystemDropdownByCode('INVITE_STATUS');
	//debug($inviteStatus);
	?>
	<div class="toolbar h30">
	<div class="right translate mg5"><?php echo $formBase->language('translate_to');?>
			<a class="btn" onclick="return Common.makeTranslation(this,1)" href="<?php echo $url;?>"><?php echo __("Make a Translation");?></a>
	</div></div>
	<div class="clear h10"></div>
	<div class="header clear h30">
		<div class="span0 w30"><?php echo __("No.");?></div>
		<div class="span3 w350"><?php echo __("Title");?></div>
		<div class="span2 tc"><?php echo __("Approve");?></div>
		<div class="span1 tc"><?php echo __("Actions");?></div>
	</div>
	<?php

	if(!empty($trans)){
		$i = 0;
		foreach ($trans as $key=>$item){
		?>
		<div class="rowItem clear">
		<div class="span0 w30"><?php echo ++$i;?></div>
		<div class="span3 w350">

		<span class="mg5 flag flag-<?php echo $item->lang;?>"></span>
		<?php
			if(!$item->status){
		?>
		<span class="note"><?php echo $item->title?></span>

			- <span class="text_error"><i><?php echo __('Draft');?></i></span>
		<?php }else{
			echo $item->title;
		}?>
		</div>
		<div class="span2 tc invite_<?php echo $item->approve?>">
		<?php echo __($inviteStatus[$item->approve]);?>
		</div>
		<div class="span1 tc">
		<?php echo anchor($url.'/'.$item->lang,'<i class="action-icon-edit"></i>','onclick="return Common.linkSetup(this,{ajax:true,overlay:true,title:\''.__("Edit").'\'})"');?>
			<?php echo anchor('#','<i class="action-icon-trash"></i>','onclick="Common.removeMyTranslation(this,'.intval($item->translation_id).');"');?>
		</div>
		</div>
		<?php
		}
	}else{
		echo "<div class='clear span0 error'>".__("No translation found.")."</div>";
	}
	?>
	<div class="clear"></div>
	<?php
}

function builTranLangList($code,$url){
	$trans = getMyTranslation($code);

	if(!empty($trans)){
		$i = 0;
		foreach ($trans as $key=>$item){
			echo anchor($url.'/'.$item->lang,'<span class="flag flag-'.$item->lang.'"><span>','onclick="return Common.linkSetup(this,{ajax:true,overlay:true,title:\''.__("Edit").'\'})"');
		}
	}
}

function googlePreview($id,$latlong,$width=480,$height=320,$class='',$zoom=13){
	$str = '';

	$display = ($latlong)?'':'none';

	$str .= '<div class="googleMapPreview" class="'.$class.'" style="display:'.$display.'">';

	$str.= '<img id="'.$id.'" src="http://maps.googleapis.com/maps/api/staticmap?size='.$width.'x'.$height.'&maptype=roadmap&markers=color:red|label:C|'.str_replace(LATLONG_SPLIT,',', $latlong).'&sensor=false&zoom='.$zoom.'"/>';

	$str.='</div>';
	return $str;
}

function getLatLongByAddress($address){

	$address = urlencode($address.',Việt Nam');//urlencode($address.',Viet Nam');

	$json = curl_get_content("http://maps.google.com/maps/api/geocode/json?libraries=places&address=$address&sensor=false&region=Vietnam");

	$json = json_decode($json);

	$lat = $json->{'results'}[0]->{'geometry'}->{'location'}->{'lat'};
	$long = $json->{'results'}[0]->{'geometry'}->{'location'}->{'lng'};
	return array($lat,$long);
}

function img_array($aryImage){
		$str='';
	 	if(!is_array($aryImage)) {$aryImage = json_decode($aryImage);}
	 	$str.='<div class="clear"><div class="galleryInputUpload">';
	 	foreach($aryImage as $image){
	 		$str.='<div class="photoItem">';
	 		$str.=base_img($image);
	 		$str.='</div>';
	 	}
	 	$str.='</div></div>';
	echo $str;
}


function _langObject($aryData,$lang=''){
	$data = $aryData;
	if(!$lang){
		$CI = &get_instance();
		$lang = $CI->lang->lang();
	}

	if($lang == $data->lang) {return $data;}

	if($data->translation){
		$aryTranslation = json_decode($data->translation);

		if($aryTranslation->{$lang}){
			$aryTranslation->{$data->lang} = $data;
			$data->translation = json_encode($aryTranslation);
			foreach (get_object_vars($aryTranslation->{$lang}) as $var => $val) {
				$data->{$var} = $val;
			}
		}
		else{
			if($aryTranslation->en){
				foreach (get_object_vars($aryTranslation->en) as $var => $val) {
					$data->{$var} = $val;
				}
			}

		}
	}
	return $data;
}

function langObject($aryData,$lang=''){

	if(is_array($aryData)){
		for($i=0;$i<count($aryData);$i++){
			$aryData[$i] = _langObject($aryData[$i],$lang);
		}
		return $aryData;
	}else{
        //debug($aryData);
		return _langObject($aryData,$lang);
	}
}

function mergeTranslate($object,$tran){
	$object->lang = $tran->lang;
	$aryTranslation = json_decode($tran->data);
	foreach (get_object_vars($aryTranslation) as $var => $val) {
		$object->{$var} = $val;
	}
	return $object;
}

function createStaticMap($latlong,$trail,$locations,$zoom='',$width='',$height=''){
	$width = ($width)?$width:500;
	$height = ($height)?$height:500;
	$zoom = ($zoom)?$zoom-1:14;
	$lat = $latlong['lat'];
	$lng = $latlong['lng'];

	$aryData = array();
	//full map
	$aryData['fullmap'] = TRAIL_UPLOAD.'maps/fullmap_'.$trail->trail_id.'.png';
	$url = "http://maps.googleapis.com/maps/api/staticmap?size=".$width."x".$height."&maptype=roadmap&center=$lat,$lng&sensor=false&zoom=".$zoom;
	$content = file_get_contents($url);
	file_put_contents($aryData['fullmap'], $content);

	//location map
	for($i=1;$i<count($locations);$i++){
		$mapname= TRAIL_UPLOAD.'maps/submap_'.$trail->trail_id.'_'.$locations[$i-1]->location_id.'_'.$locations[$i]->location_id.'.png';
		$latlong1 = str_replace(LATLONG_SPLIT, ',', $locations[$i-1]->gps);
		$latlong2 = str_replace(LATLONG_SPLIT, ',', $locations[$i]->gps);
		$url = "http://maps.googleapis.com/maps/api/staticmap?size=".$width."x".$height."&maptype=roadmap&markers=$latlong1&markers=$latlong2&sensor=false&zoom=".$zoom;
		$content = file_get_contents($url);
		file_put_contents($mapname, $content);
		$aryData['submap'][] = $mapname;
	}

	return $aryData;
}

function lonToX($lon) {
	return round(OFFSET + RADIUS * $lon * pi() / 180);
}

function latToY($lat) {
	return round(OFFSET - RADIUS *
			log((1 + sin($lat * pi() / 180)) /
					(1 - sin($lat * pi() / 180))) / 2);
}

function pixelDistance($lat1, $lon1, $lat2, $lon2, $zoom) {
	$x1 = lonToX($lon1);
	$y1 = latToY($lat1);

	$x2 = lonToX($lon2);
	$y2 = latToY($lat2);

	return sqrt(pow(($x1-$x2),2) + pow(($y1-$y2),2)) >> (21 - $zoom);
}

function getMapZoom($locations,$_width,$_height){
	$count = count($locations);

	$max = 0; $aryLatLong = array();
	for($i=0;$i<$count-1;$i++){
		for($j= $i+1; $j< $count;$j++){
			list($lat1,$long1) = explode(LATLONG_SPLIT, $locations[$i]->gps);
			list($lat2,$long2) = explode(LATLONG_SPLIT, $locations[$j]->gps);

			$distance = getDistance($lat1, $long1, $lat2, $long2);
			if($distance>$max){
				$aryLatLong['lat1'] = $lat1;
				$aryLatLong['long1'] = $long1;
				$aryLatLong['lat2'] = $lat2;
				$aryLatLong['long2'] = $long2;
				$max = $distance;
			}
		}
	}
	$_zoom = 13;
	//tim zoom phu hop

	for($i=1;$i<=22;$i++){
		$delta = pixelDistance($aryLatLong['lat1'],$aryLatLong['long1'],$aryLatLong['lat2'],$aryLatLong['long2'], $i);
		if($delta<$_width && $delta < $_height) {$_zoom = $i;}
		else {break;}
	}
	return $_zoom;
}


function loadCss($css){
	return file_get_contents($css);
}

function urlsafe($text)
{
	//url_title($str);
	// Swap out Non "Letters" with a -
	$text = preg_replace('/[^\\pL\d]+/u', '-', $text);

	// Trim out extra -'s
	$text = trim($text, '-');

	// Convert letters that we have left to the closest ASCII representation
	$text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

	// Make text lowercase
	$text = strtolower($text);

	// Strip out anything we haven't been able to convert
	$text = preg_replace('/[^-\w]+/', '', $text);

	return $text;
}

function getCurrentUser(){
	$CI = &get_instance();
	$LoginData = $CI->session->userdata('LoginData');
	return $LoginData;
}

function getMyMessage(){
	$CI = &get_instance();
	/*$aryMessage = $this->model->find_where('list',
			array('recieptId'=>$this->LoginData->memberId),
			array('from'=>'message','offset'=>0,'limit'=>10));*/
	$LoginData = $CI->session->userdata('LoginData');
	$CI->db->order_by('createdTime','DESC');
	$aryMessage = $CI->db->get_where('message',array('recieptId'=>$LoginData->memberId,'del_flag'=>NOT_DELETED),10,0)->result();
	//debug($CI->db->last_query());
	//debug($aryMessage);
	$html = $CI->load->view('myMessage',array('aryMessage'=>$aryMessage),TRUE);
	return $html;
}

function addMessage($to,$title,$message){
	$CI = &get_instance();
	$LoginData = $CI->session->userdata('LoginData');

	$toObject = $CI->db->get_where('sys_member',array('memberId'=>$to))->row();
	$data = array(
			'title'=>$title,
			'content'=>$message,
			'createdName'=>$LoginData->firstName.' '.$LoginData->lastName,
			'createdId'=>$LoginData->memberId,
			'createdTime'=>date('Y-m-d H:i:s'),
			'recieptId'=>$to,
			'recieptName'=>$toObject->firstName.' '.$toObject->lastName
			);
	//debug($data);
	$ok = $CI->db->insert('message',$data);
	return $ok;
}

function getMyTranslation($code){
	$CI = &get_instance();
	//echo $code;
	$LoginData = $CI->session->userdata('LoginData');

	$aryData =$CI->db->get_where('translation_data',array('createdId'=>$LoginData->memberId,'code'=>$code))->result();
	return $aryData;
}

function buildInputTooltip($str){
    return '<a class="input_tooltip icon-question-sign" rel="tooltip" title="'.$str.'"></a>';
}




function commentWrap($task,$item,$LoginData,$i,$doingControl='doingController'){
    $html ='';
    $html.= '<div class="row_task_'.$i.' commentItem"><table width="100%">
                                                                <tr><td class="comment_item_avatar" valign="top">
                                                                <div class="smallAvatar40">
                                                                '.base_img($item->avatar,array('width'=>40, 'height'=>40)).'
                                                                </div>
                                                                </td>
                                                                <td class="comment_item_content"  valign="top">
                                                                <div class="info">
                                                                <div class="left">'.display_member($item->userid,$item->name).' '.display_time_ago($item->time).'</div>';
    if($item->userid == $LoginData->memberId){
        $html.='<div class="delete">
                                                                <a class=\'action pointer action-icon-edit\' rel="tooltip" onclick=\''.$doingControl.'.editComment(this,"'.md5(json_encode($item)).'",'.$task->id.');\' title=\''.__("Edit").'\'></a>
                                                                <a class=\'action pointer action-icon-trash\' rel="tooltip" onclick=\''.$doingControl.'.removeComment(this,"'.md5(json_encode($item)).'",'.$task->id.');\' title=\''.__("Remove").'\'></a></div>
                                                                </div>';
    }
    $html.='<div class="clear">'.nl2br($item->comment).'</div>';
    $html.='<div class="clear"></div>';
    if($item->files){
        $pre = uniqid();
        foreach($item->files as $f){
            $f = json_decode($f);

            $html.='<div class="mg5 comment_file"><a href="'.ROOT_URL.$f->real_name.'" class="file_attach_icon comment_'.$pre.'">
                                                                        '.$f->client_name.'
                                                                        </a></div>';
            $html.='<script>$(document).ready(function(){$(".comment_'.$pre.'").colorbox({rel:".comment_'.$pre.'"});});</script>';
        }

    }

    $html.='<div class="clear"></div>
                                                                </td></tr>
                                                                </table></div>';
    return $html;
}

function attachWrap($task,$item,$LoginData,$i,$doingControl='doingController'){
    $html = '';
    $html.= '<div class=\'documentItem row_task_'.$i.'\'>
                                                                <table width="100%" class=\'commentItem\'>
                                                                <tr><td class="comment_item_avatar" valign="top">
                                                                <div class="smallAvatar40">
                                                                '.base_img($item->avatar,array('width'=>40, 'height'=>40)).'
                                                                </div>
                                                                </td>
                                                                <td valign="top">
                                                                <a class="file_icon task_group_'.$task->id.'" href="'.ROOT_URL.'/'.$item->real_name.'">'.$item->client_name.'</a>';
    if($item->userid == $LoginData->memberId){
        $html.='<div class=\'tc\'><a class=\'action pointer action-icon-trash\' rel="tooltip"  onclick=\''.$doingControl.'.removeAttach(this,"'.md5($item->real_name).'",'.$task->id.');\' title=\''.__("Remove").'\'></a></div>';
    }
    $html.='<div class="clear info">'.display_member($item->userid,$item->name).''.display_time_ago($item->time).'</div>';
    $html.='<div class="clear"></div></div>
                                                                </td></tr></table>
                                                                </div>';
    return $html;
}

function taskWrap($task,$memberList,$LoginData,$htmlColor){
 ?>
    <li class="taskItemWrap taskItemWrapBox readyTask_<?php echo $task->status?> priority_<?php echo $task->color;?>">

        <input type="hidden" name="task_ID" id="task_ID" value="<?php echo $task->id?>"/>
        <div class="titleItem" id="titleItem<?php echo $task->id?>">
            <ul class="leftItem">
                <li><div class="settings-button">
                        <a class="action-setting dropdown-toggle" data-toggle="dropdown"></a>
                        <ul class="dropdown-menu">
                            <li>
                                <?php echo anchor('doing/task/detail/'.$task->id,'<i class="action-icon-eye-open"></i>'); ?>
                            </li>
                            <li>
                                <?php echo ajax_link('doing/task/edit/'.$task->id.'/board','<i class="action-icon-edit"></i>',array('overlay'=>'Edit'));?>
                            </li>
                            <li>
                                <?php echo ajax_link('doing/task/delete/'.$task->id,'<i class="action-icon-trash"></i>',array('Callback'=>'doingController.loadProjectBoard'));?>
                            </li>
                        </ul>
                    </div></li>
                <li><span class="taskID"><?php echo $task->id;?></span></li>
                <?php if($task->deadline && $task->deadline!='0000-00-00 00:00:00'){?>
                <li><div class="box1 boxdate <?php if(!$task->finish_time && $task->deadline <= date("Y-m-d H:i")){ echo "boxdate_deadline";}?>">
                        <p><?php echo display_remain_time($task->deadline,'m/d/Y')?></p></div></li>
                <?php }?>
            </ul>
            <ul class="userItem">
                <li><div class="task_user dropdown dropdownRight">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <?php echo ($task->assigned)?display_member($task->userid,$task->assigned):__('Unsigned');?>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <?php if($memberList) {foreach($memberList as $key=>$val){?>
                                <li onclick="doingController.updateTaskAssign(this,<?php echo $task->id;?>,<?php echo $key?>)">
                                    <a><?php echo $val?></a></li>
                            <?php }}?>
                        </ul>
                    </div></li>

            </ul>
        </div>
        <div class="content">
            <ul class="main_content" id="main_content_task_<?php echo $task->id;?>">
                <li class="taskDescription">
                    <div class="titleTask">
                        <div style="padding: 5px;">
                        <a >
                            <i class="icon-info-sign"></i>
                        </a>
                        <?php echo $task->task_name?>
                        </div>
                    </div>
                    <div class="taskDescriptionContent row_task_1" style="display:none;">
                        <table width="100%">
                            <tr>
                                <td valign="top" class="taskAvatar">
                                    <?php echo base_img($task->avatar,array('width'=>40, 'height'=>40)); ?>
                                </td>
                                <td>
                                    <div class="info">
                                        <div class="name"><?php echo display_member($task->createdId,$task->createdName); ?></div>
                                        <div class="time"><?php echo display_time_ago($task->createdTime); ?></div>
                                    </div>
                                    <div>
                                        <?php echo $task->detail ?>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                </li>
                <li class="comments_List" id="taskComment_<?php echo $task->id;?>" >
                    <div class="pointer mg5" onclick="doingController.showComment(this)">
                        <i class="icon-comment"></i>
                        <?php
                        $comments = json_decode($task->comments);
                        echo intval(count($comments)); ?>
                        <?php echo __("comment");?></div>
                    <div class="comment_list_content" style="display:none ;">
                        <div class="comment_add">
                            <a class="add_comment" rel="tooltip" title="<?php echo __("Add Comment");?>" onclick="doingController.addComment(<?php echo $task->id;?>)">
                                <i class="icon-plus-sign"></i>
                            </a>
                        </div>
                        <div class="commentContentWrap">
                            <?php
                            $html = '';
                            if($task->comments){
                                $comments = json_decode($task->comments);
                                $i = 0;
                                foreach($comments as $k=>$item){
                                    $i = 1-$i;
                                    $html.= commentWrap($task,$item,$LoginData,$i);
                                }
                                $html .= '<div class="clear"></div>';

                            }else{
                                $html.= '<div class="note mg5">'.__("No comment here").'</div>';
                            }
                            echo $html;
                            ?>
                        </div>
                    </div>
                </li>
                <li class="attachment_List" >
                    <div id="taskAttachment_<?php echo $task->id;?>">
                        <div class="pointer mg5" onclick="doingController.showAttachment(this)">
                            <i class="icon-folder-open"></i>
                            <?php
                            $attachments = json_decode($task->document);
                            $number = count($attachments);
                            echo " $number ";
                            ?>
                            <?php echo __("files")?>
                        </div>
                        <div class="attachment_files_content" style="display:none ;">
                            <div class="documentInputUpload">
                                <?php
                                $html = '';
                                if($task->document){
                                    $attachments = json_decode($task->document);
                                     $i =0;
                                    foreach($attachments as $k=>$item){
                                        $i = 1-$i;
                                        $html .= attachWrap($task,$item,$LoginData,$i);
                                    }
                                    $html .= '<div class="clear"></div>
                                    <script>$(document).ready(function(){
                                        $(".task_group_'.$task->id.'").colorbox({rel:"task_group_'.$task->id.'"});});
                                    </script>';

                                }else{
                                    $html.= '<div class="note mg5">'.__("No files here").'</div>';
                                }
                                echo $html;
                                ?>
                            </div>
                        </div>
                    </div>
                    <div class="attachment_upload" style="display: none;">
                        <?php echo upload_task_document('task_'.$task->id,
                            array('class'=>'button_upload_task','task_id'=>$task->id,'url'=>'task/uploadAttachment','data'=>array('task_id'=>$task->id),'preview'=>'taskAttachment_'.$task->id));?>

                    </div>

                </li>

                <div class="taskController">
                    <div class="colorBlock" style="display:none ;">
                        <?php
                        echo $htmlColor;
                        ?>
                    </div>
                    <div class="control" id="control<?php echo $task->id?>">
                        <ul id="controlHide" class="controlHide">
                            <li class="btnComment"></li>
                            <li class="btnColor"></li>
                            <li class="btnAttachment"></li>
                        </ul>
                    </div>
                </div>
        </div>
    </li>
<?php
}

function display_member($id,$name){
    $CI = &get_instance();
    $LoginData = $CI->session->userdata('LoginData');

    $html ='<span class="name">';
    if($LoginData->memberId == $id){
        $html.= __("Me");
    }else{
        $html.= $name;
    }
    $html.='</span> ';
    return $html;
}

function display_time_ago($time,$format = 'm/d/Y'){
    if(!$time || $time =='0000-00-00 00:00:00') {return '';}
    //type cast, current time, difference in timestamps
    $timestamp = strtotime($time);
    $timestamp      = (int) $timestamp;
    $current_time   = time();
    $diff           = $current_time - $timestamp;

    //intervals in seconds
    $intervals      = array (
        'year' => 31556926, 'month' => 2629744, 'week' => 604800, 'day' => 86400, 'hour' => 3600, 'minute'=> 60
    );

    //now we just find the difference
    if ($diff == 0)
    {
        return '<span class="time">'.__("just now").'</span>';
    }

    if ($diff < 60)
    {
        return $diff == 1 ? '<span class="time">'.$diff . ' '.__('second ago').'</span>' : '<span class="time">'.$diff . ' '.__('seconds ago').'</span>';
    }

    if ($diff >= 60 && $diff < $intervals['hour'])
    {
        $diff = floor($diff/$intervals['minute']);
        return $diff == 1 ? '<span class="time">'.$diff . ' '.__('minute ago').'<span>' : '<span class="time">'.$diff . ' '.__('minutes ago').'</span>';
    }

    if ($diff >= $intervals['hour'] && $diff < $intervals['day'])
    {
        $diff = floor($diff/$intervals['hour']);
        return $diff == 1 ? '<span class="time">'.$diff . ' '.__('hour ago').'</span>' : '<span class="time">'.$diff . ' '.__('hours ago').'</span>';
    }

    if ($diff >= $intervals['day'] && $diff < $intervals['week'])
    {
        $diff = floor($diff/$intervals['day']);
        return $diff == 1 ? '<span class="time">'.$diff . ' '.__('day ago').'</span>' : '<span class="time">'.$diff . ' '.__('days ago').'</span>';
    }

    if ($diff >= $intervals['week'])
    {
        return task_date($time,$format);
    }
//
//    if ($diff >= $intervals['month'] && $diff < $intervals['year'])
//    {
//        $diff = floor($diff/$intervals['month']);
//        return $diff == 1 ? $diff . ' month ago' : $diff . ' months ago';
//    }
//
//    if ($diff >= $intervals['year'])
//    {
//        $diff = floor($diff/$intervals['year']);
//        return $diff == 1 ? $diff . ' year ago' : $diff . ' years ago';
//    }
}

function get_time_remaining($timeLeft=0, $endTime=NULL) {

    /*check if 'endTime' parameter exists so we can calculate timeLeft
    else timeLeft will be '0' and function will return (0,0,0,0)*/
    $endTime = strtotime($endTime);
    if($endTime != NULL)
        {$timeLeft = $endTime - time();}

    /*if timeLeft value is bigger than 0 we have number
    that we can work with, else we return (0,0,0,0) */
    if($timeLeft > 0) {

        /*divide timeLeft value with number of seconds for 1 day:  1*24*60*60,
        remove calculated seconds from main timeLeft value*/
        $days = floor($timeLeft / 86400);
        $timeLeft = $timeLeft - $days * 86400;

        /*divide timeLeft value with number of seconds for 1 hr:  1*60*60,
        remove calculated seconds from main timeLeft value*/
        $hrs = floor($timeLeft / 3600);
        $timeLeft = $timeLeft - $hrs * 3600;

        /*divide timeLeft value with number of seconds for 1 min:  1*60,
        remove calculated seconds from main timeLeft value */
        $mins = floor($timeLeft / 60);

        //what is left is seconds value
        $secs = $timeLeft - $mins * 60;

        $return = array($days, $hrs, $mins, $secs);
    }
    else
    {
        //return array with 0 values when there is not defined endTime
        $return = '';
    }

    //return array with calculated values
    return $return;
}

function display_remain_time($endtime,$format=''){
    $remain = get_time_remaining(0,$endtime);
    $left = ' '.__("left");
    if($remain[0]>0){
        if($remain[0]<10){
            return $remain[0].' '.__("days").$left;
        }else{
            return task_date($endtime);
        }
    }
    if($remain[1]>0){
        return $remain[1].' '.__("hours").$left;
    }
    if($remain[2]>0){
        return $remain[2].' '.__("minutes").$left;
    }
    if($remain[3]>0){
        return $remain[3].' '.__("seconds").$left;
    }

    return display_time_ago($endtime,$format);
}

function display_expired($endtime,$format=''){
    $time = strtotime($endtime);

    if($time > time()){
        return display_remain_time($endtime,$format);
    }else{
        return '<span class="expired">'.__('Expired').'</span>';
    }
}

function localDate($date,$format="d/m/Y H:i"){
    if($date && $date !='0000-00-00 00:00:00'){
        return date($format,strtotime($date));
    }else{
        return '-';
    }

}

function mongoDate($date,$format="d/m/Y H:i A"){
	if($date){
		return date($format,$date->sec);
	}else{
		return '-';
	}
}

/**
 * Get image info from string json
 */
function explodeImage($strJson,$name){
    $objStr = json_decode($strJson);

    if($name =='real_name'){
        return $objStr->real_name;
    }elseif($name =='client_name'){
        return $objStr->client_name;
    }else{
        $aryImg = array();
        $aryImg['link'] = $objStr->real_name;
        $aryImg['name'] = $objStr->client_name;
        return $aryImg;
    }

}

//clear default field
function clearResult(&$obj){
    unset($obj->del_flag);
    unset($obj->createdId);
    unset($obj->createdTime);
    unset($obj->updatedId);
    unset($obj->updatedTime);
    return $obj;
}

function getAllChildCategory($id,$param,&$cateId){
	if(!$param['id']) $param['id'] = 'id';
	$CI = &get_instance();
	$rows =$CI->db->get_where($param['table'],array($param['parent']=>$id,'status'=>ACTIVE))->result();
	foreach($rows as $row){
		$cateId[] = $row->{$param['id']};
		getAllChildCategory($row->{$param['id']},$param,$cateId);

	}
}

function clearResultArray(&$objs){
    foreach($objs as $k=>$obj){
        $objs[$k] = clearResult($obj);
    }
    return $objs;
}

function jsonToString($json){
	return implode(", ", json_decode($json));
}
function getTypeSynonym($type_code){
    return ($type_code)?"Similarly":"One way";
}
function displaySynonym($fromWord, $toWord, $type){
    $html="";
    if($type){
        $html= $toWord;
    }else{
        $html.="".($fromWord).' <strong class="arr_right">&rArr;</strong>  '.($toWord);
    }
    return $html;
}

 function displayParam($indexId,$key,$param,$type='index', $rules="", $onchange=TRUE){
     $rules=(empty($rules)?"max_length[256]":"max_length[256]|".$rules);
     $formBase = new FormBase(array('module'=>'solr','controller'=>'fieldtype'));
     $html = '<div class="control-group">';

        $html.= $formBase->hidden('data['.$type.']['.$indexId.'][params]['.$key.'][label]',array('value'=>$param['label']));
        $html.= $formBase->hidden('data['.$type.']['.$indexId.'][params]['.$key.'][type]',array('value'=>$param['type']));
        if($param['type'] == 'radio' ){
            $html.= $formBase->yesno('data['.$type.']['.$indexId.'][params]['.$key.'][value]',array('label'=>__( $param['label'] ),'checked'=>$param['value'],'data-name'=> $param['label'] , 'rules'=>"",'onchange'=>(($onchange)?'solrController.updateFilter(this)':"")));


        }else {if( $param['type'] == 'text' ){
           $html.= $formBase->input('data['.$type.']['.$indexId.'][params]['.$key.'][value]',array('label'=>__( $param['label'] ), 'value'=>$param['value'],'rules'=>$rules,'class'=>"span3 validate", 'id'=>$param['label']."_".$indexId, 'onchange'=>(($onchange)?'solrController.updateFilter(this)':"")));

        }}
    $html.="</div>";
     return $html;
 }

function displayFilterParam($indexId,$key,$param,$type='index', $rules="", $onchange=TRUE){
     $rules=(empty($rules)?"max_length[256]":"max_length[256]|".$rules);
     $formBase = new FormBase(array('module'=>'solr','controller'=>'fieldtype'));
     $html = '<div class="control-group">';

        $html.= $formBase->hidden('data['.$type.']['.$indexId.'][params]['.$key.'][label]',array('value'=>$param['label']));
        $html.= $formBase->hidden('data['.$type.']['.$indexId.'][params]['.$key.'][type]',array('value'=>$param['type']));
        if($param['type'] == 'radio' ){
            $html.= $formBase->yesno('data['.$type.']['.$indexId.'][params]['.$key.'][value]',array('label'=>__( $param['label'] ),'checked'=>$param['value'],'data-name'=> $param['label'] , 'rules'=>"",'onchange'=>(($onchange)?'solrController.updateFilter(this)':"")));


        }else {if( $param['type'] == 'text' ){
           $html.= $formBase->input('data['.$type.']['.$indexId.'][params]['.$key.'][value]',array('label'=>__( $param['label'] ), 'value'=>$param['value'],'rules'=>$rules,'class'=>"span3 validate", 'id'=>$param['label']."_".$indexId, 'onkeyup'=>(($onchange)?'solrController.updateFilter(this)':"")));

        }}
    $html.="</div>";
     return $html;
 }

function object_to_array($data)
{
    if (is_array($data) || is_object($data))
    {
        $result = array();
        foreach ($data as $key => $value)
        {
            $result[$key] = object_to_array($value);
        }
        return $result;
    }
    return $data;
}

function limit_character($str, $limit=20){
    if(strlen($str)>$limit){
        return substr($str, 0, $limit)."...";
    }
    return $str;
}


function json_view($data){
    $aryData = array();
    $jsObject = json_decode($data);
    if(!empty($jsObject)){foreach($jsObject as $k=>$v){
     $aryData[] = $k.":".$v;
    }}

    return implode(', ',$aryData);
}

function shell_backup_sql($DB = NULL){
	//perform get data such as backup database
	$aryData = array( 'ok'=>TRUE,'result'=>'','smessage'=>'','serror'=>'' );
		if ( empty( $DB ) )
		{
			$aryData['ok'] = FALSE;
			$aryData['serror'] = __('Error condition deploy!');
			return $aryData;
		}
		// Extract the prefs for simplicity
		// Build the output
		$output = '';
		$ignore = array();
		$add_drop = TRUE;
		$add_insert = TRUE;

		$resultsListTable = $DB->list_tables();
		foreach ($resultsListTable as $table)
		{
			$tables[] = $table;
		}
//		foreach( $results2->result() as $key=>$value ) {
//			$tables[] = $value->Tables_in_ypsolr2;
//		}
		$newline ="\n";
		foreach ((array)$tables as $table)
		{
			// Is the table in the "ignore" list?
			// Build the insert string
			$val_str = '';
			if (in_array($table, (array)$ignore, TRUE))
			{
				continue;
			}
			// Get the table schema
			$query = $DB->query("SHOW CREATE TABLE `".$DB->database.'`.`'.$table.'`');
			// No result means the table name was invalid
			if ($query === FALSE)
			{
				continue;
			}
			// Write out the table schema
			if ($add_drop == TRUE)
			{
				$output .= 'DROP TABLE IF EXISTS '.$table.';'.$newline.$newline;
			}
			$i = 0;
			$result = $query->result_array();
			foreach ($result[0] as $val)
			{
				if ($i++ % 2)
				{
					$output .= $val.';'.$newline.$newline;
				}
			}
			//$output = str_replace( "'" , '"' , $output );
			// If inserts are not needed we're done...
			if ($add_insert == FALSE)
			{
				continue;
			}
			// Grab all the data from the current table
			$query = $DB->query("SELECT * FROM $table");
			if ($query->num_rows() == 0)
			{
				continue;
			}
			// Fetch the field names.
			// We are going to surround all values with single quotes
			// and hope that mysql would be able to make type conversion...
			$field_str = '';
			foreach ($query->row() as $field_name => $field_value) {$field_str .= '`'.$field_name.'`, ';}
			// Trim off the end comma
			$field_str = preg_replace( "/, $/" , "" , $field_str);
			foreach ($query->result_array() as $row)
			{
				$n = count( $row );
				$val_str.='(';
				$i = 0;
				foreach ($row as $v)
				{
					// Is the value NULL?
					if ($v === NULL)
					{
						$val_str .= 'NULL';
					}
					else
					{
						$val_str .= $DB->escape($v);
					}
					// Append a comma
					$i++;
					if(  $i < $n )
						{$val_str .= ', ';}
					else
						{$val_str .= '';}
				}
				$val_str.='),'.$newline;
			}
			// Remove the comma at the end of the string
			$val_str = trim( $val_str );
			$val_str = substr($val_str,0,-2);
			$val_str = preg_replace( "/, $/" , "" , $val_str);
			$val_str = str_replace( "\'" , "" , $val_str);
			//$val_str = str_replace( "\"" , '"' , $val_str);
			// Build the INSERT string
			$output .= 'INSERT INTO '.$table.' ('.$field_str.') VALUES '.$val_str.');'.$newline;
		}
		$aryData['result'] = $output.$newline.$newline;
		//debug( $output );
		return $aryData;
}
function shell_import_sql($DB=NULL,$path_file=NULL){
	$aryData = array('ok' => TRUE,'smessage'=>'','serror'=>'');
	try{
		if (file_exists($path_file)) {
			$DB->query("SET FOREIGN_KEY_CHECKS = 0");
			$templine = '';
			$dataImport = file($path_file);
			foreach ($dataImport as $line)
			{
			// Skip it if it's a comment
				if (substr($line, 0, 2) == '--' || $line == '')
					{continue;}
				$templine .= $line;
				if (substr(trim($line), -1, 1) == ';')
				{
					$DB->query( $templine );
					$templine = '';
				}
			}
			$DB->query("SET FOREIGN_KEY_CHECKS = 1");
		} else {
			$aryData['ok'] = FALSE;
			$aryData['serror'] = __("File backup isn't exits!");
		}
	}catch (Exception $ex){
		$aryData['ok'] = false;
		$aryData['serror'] = __("Error exception import: ".$ex->getMessage() );
	}

	return $aryData;
}



function array_unshift_assoc($arr, $key, $val)
{
    if(!is_array($arr)) {$arr = array();}
    $arr=array($key=>$val) + $arr;
    return $arr;
}

function get_config_field($field_id){
    $CI = &get_instance();
    $field = $CI->db2->get_where('field_config',array('field_id'=>$field_id,'status'=>ACTIVE))->row();
//    debug($field);
    return $field;
}

function get_group_field($field_id=null){
    $CI = &get_instance();
    $field = $CI->db2->get_where('field_group',array('search_group_id'=>$field_id,'status'=>ACTIVE))->row();
//    debug($field);
    return $field;
}

function get_member_role($role_id=null){
	if( empty($role_id) )
		return '';
	$CI = &get_instance();
	$query = $CI->db->get_where('sys_role',array('roleId'=>$role_id,'status'=>ACTIVE,'del_flag'=>NOT_DELETED))->row();
	if( !empty( $query ) ){
		return $query->roleName;
	}else{
		return '';
	}
}

function config_get_field_type( $type_id = null ){
	$CI = &get_instance();
	$query = $CI->db2->select('type_name')->get_where('field_type',array('field_type_id'=>$type_id,'status'=>ACTIVE,'del_flag'=>NOT_DELETED))->row();
	if( !empty($query) ){
		return $query->type_name;
	}else{
		return '';
	}
}
function get_name_class( $classId = null ){
	$CI = &get_instance();
	$query = $CI->db2->select('classId,className')->get_where('class',array('classId'=>$classId,'status'=>ACTIVE,'del_flag'=>NOT_DELETED))->row();
	if( !empty($query) ){
		return $query->className;
	}else{
		return '';
	}
}

function get_class_copyfield( $field_id = null ){
	if( !is_array( $field_id ) )
		return '';
	$CI = &get_instance();
	$arr = array();
	$query = $CI->db2->select('field_id,fieldName')->where_in('field_id',$field_id)->get_where('field_config',array('status'=>ACTIVE,'del_flag'=>NOT_DELETED));
	$rows = $query->result();
	if( !empty( $rows ) ){
		foreach( $rows as $value ){
			$arr[$value->field_id] = $value->fieldName;
		}
		return $arr;
	}else{
		return '';
	}
}




function json_obj_to_string($json_id, $mode=NULL){
	$arr_id_field=array();
	if($json_id){
		$field_list=json_decode($json_id);
		if($field_list)
			{foreach($field_list as $field){
				$arr_id_field[]=$field;
			}}

		if($mode=='array'){
			return $arr_id_field;
		}else
			{return implode(",",$arr_id_field);}
	}
	return 0;
  }

function escape_query($str){
    return str_replace('"','',$str);
}