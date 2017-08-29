<?php
/**
 * File: language_helper.php
 * Created on: Aug 10, 2010
 * Author: Dat Nguyen
 * 
 */

/**
 * The translate model supports parameters in two form:
 *  1. %key
 *  2. %{key}
 * 
 * Passed $params is an array formated as: array('key' => 'value')
 */
if ( !function_exists('lang') )
{
	function lang__($text, $params = array())
	{
		$msg = T_gettext($text);
		if (isset($params) && count($params) && $msg)
		{
			$t_params = array();
			foreach ($params as $key => $value)
			{
				$t_params['%{' . $key . '}'] = $t_params['%' . $key] = $value;
			}
			unset($params);
			$msg = strtr($msg, $t_params);
		}
		return $msg;
	}
}

 function __($line, $params = '')
 {
  $CI =& get_instance();
  
  if(!$CI->lang->line($line)) return $line;
  
  $line = $CI->lang->line($line);
  
  $args = func_get_args();
  
  if(is_array($args)) array_shift($args);
  
  if(is_array($args) && count($args))
  {
      foreach($args as $arg)
      {
          $line = str_replace_first('%s', $arg, $line);
      }
  }

  /*if ($id != '')
  {
   $line = '<label for="'.$id.'">'.$line."</label>";
  }*/
  
  return $line;
 }

 function str_replace_first($search_for, $replace_with, $in)
 {
     $pos = strpos($in, $search_for);
     if($pos === false)
     {
         return $in;
     }
     else
     {
         return substr($in, 0, $pos) . $replace_with . substr($in, $pos + strlen($search_for), strlen($in));
     }
 }

/* End of file MY_language_helper.php */
/* Location: ./application/helpers/MY_language_helper */
