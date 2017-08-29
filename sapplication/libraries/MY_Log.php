<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
 * Created on Oct 13, 2010
 *
 * Author: Dat Nguyen
 * Filename: MY_Log.php
 */

class MY_Log extends CI_Log {

	public function MY_Log()
	{
		parent::__construct();
		$config =& get_config();

		$this->_levels = array('TRACE' => '1', 'SQL' => '2', 'ERROR' => '3', 'DEBUG' => '4',  'INFO' => '5', 'ALL' => '6');

		if (isset ($config['show_in_log']))
        {
            $show_in_log = $config['show_in_log'];
        }
        else
        {
            $show_in_log = "";
        }
        $this->log_path = ($config['log_path'] != '') ? $config['log_path'] : realpath(APPPATH.'logs/');

//        die($this->log_path);

        if ( ! is_dir($this->log_path) OR ! is_really_writable($this->log_path) )
        {
            $this->_enabled = FALSE;
        }

        if (is_array($show_in_log))
        {
            $this->_logging_array = $show_in_log;
        }

        if (is_numeric($config['log_threshold']))
        {
            $this->_threshold = $config['log_threshold'];
        }

        if ($config['log_date_format'] != '')
        {
            $this->_date_fmt = $config['log_date_format'];
        }


	}

	// --------------------------------------------------------------------
    /**
     * Write Trace File
     *
     * Generally this function will be called using the global log_message() function
     *
     * @access    public
     * @param    string    the error level
     * @param    string    the error message
     * @param    bool    whether the error is a native PHP error
     * @return    bool
     */
    function write_trace($session_id, $level = 'trace', $msg, $php_error = FALSE)
    {

        if ($this->_enabled === FALSE)
        {
            return FALSE;
        }
        $level = strtoupper($level);

        if (isset($this->_logging_array))
        {
            if ((! in_array($level, $this->_logging_array)) && (! empty($this->_logging_array)))
            {
                return FALSE;
            }
        }

        $filepath = $this->log_path.'app-'.date('Y-m-d').'.log';

        $message  = '';

        if ( ! $fp = @fopen($filepath, FOPEN_WRITE_CREATE))
        {
            return FALSE;
        }

        $message .= $level . ' - ['.date($this->_date_fmt). ']['.$session_id.'] --> '.$msg."\n";

        flock($fp, LOCK_EX);
        fwrite($fp, $message);
        flock($fp, LOCK_UN);
        fclose($fp);

        @chmod($filepath, FILE_WRITE_MODE);
        return TRUE;
    }

    function write_xml($session_id, $msg, $type = 'request')
    {
        if ($this->_enabled === FALSE)
        {
            return FALSE;
        }

        $filepath = $this->log_path.'webservice-'.date('Y-m-d').'.log';
        $message  = '';

        if ( ! $fp = @fopen($filepath, FOPEN_WRITE_CREATE))
        {
            return FALSE;
        }

        $message .= 'TRACE' . ' - ['.date($this->_date_fmt). ']['.$session_id.'] '.strtoupper($type) . "\n";
        $message .= $msg . "\n";

        flock($fp, LOCK_EX);
        fwrite($fp, $message);
        flock($fp, LOCK_UN);
        fclose($fp);

        @chmod($filepath, FILE_WRITE_MODE);
        return TRUE;
    }
}
?>
