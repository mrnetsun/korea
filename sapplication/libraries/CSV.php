<?php

require_once 'convertUTF8.php';

/**
* This class provides functionality and data handling for reading
* and writing CSV formatted files with all their variants.
*
* @access public
* @author Ringo Grosser <ringo@edustrial.de>
* @package void
* @version 2009-04-29
* 
* Revision 1 - 2010-03-16
* by mario wellner <mario.wellner@spectos.com>
* 
* check, if the file to read is utf8, if not than first convert before reading
* check, if a written file is iso, if not than convert to utf8
* 
*/
class CSV {

	/**
	* name of csvfile
	*
	* @var string $csvfile name of csvfile
	* @access private
	*/
	var $csvfile = false;

	/**
	* access mode of file
	* valid values are "r" read or "w" write
	*
	* @var string $mode access mode of file
	* @access public
	*/
	var $mode = false;

	/**
	* delimiting character that separates fields in a line
	* default value ";"
	*
	* @var string $delimiter delimiting character that separates fields in a line
	* @access public
	*/
	var $delimiter = false;

	/**
	* enclosing character for enclosing fields containing special chars
	*
	* @var string $enclosure enclosing character
	* @access public
	*/
	var $enclosure = false;

	/**
	* file uses first line as headers
	*
	* @var bool $useHeaders file uses first line as headers
	* @access public
	*/
	var $useHeaders = false;

	/**
	* headers to associate fields
	*
	* @var array $headers headers to associate fields
	* @access public
	*/
	var $headers = false;

	/**
	* filepointer
	*
	* @var pointer $_fp filepointer
	* @access private
	*/
	var $_fp = false;

	/**
	* actual line of file
	*
	* @var array $_line actual line of file
	* @access private
	*/
	var $_line = false;

	/**
	* number of lines in file
	* will be available after parsing the entire file
	*
	* @var integer $numLines number if lines in file
	* @access public
	*/
	var $numLines = 0;

	/**
	* number of columns (fields)
	*
	* @var int $numCols number of columns
	* @access public
	*/
	var $numCols = 0;

	/**
	* flag for headers are already written to output file or not
	*
	* @var bool $_headersWritten
	* @access private
	*/
	var $_headersWritten = 0;




	/**
	* the constructor
	*
	* @access public
	* @param $file
	* @param $mode
	* @param $useHeaders
	* @param $delimiter
	* @param $enclosure
	* @return void
	*/
	function CSV($csvfile=false, $mode=false, $useHeaders=false, $delimiter=';', $enclosure=false) {
		if ( $csvfile AND !$mode ) {
			$this->_halt('wrong parameter count in constructor. please specify at least the filename and the access mode.');
		}
		elseif ( $csvfile AND $mode ) {
			$this->setFile($csvfile, $mode, $useHeaders, $delimiter, $enclosure);
		}
		else {
			// we will wait for separate call of method setFile
		}
	}




	/**
	* set csv file to work with
	* either existing file to read
	* or new file to write
	*
	* @access public
	* @param
	* @return
	*/// set input file to read
	function setFile($csvfile, $mode, $useHeaders=false, $delimiter=';', $enclosure=false) {
		if ( $csvfile{strlen($csvfile)-1}=='/' ) $this->_halt('your file "'.$csvfile.'" seems to miss the filename.');
		if ( !$this->_validMode($mode) ) $this->_halt('invalid mode selection "'.$mode.'" in function setFile. valid modes are "r" (read) or "w" (write).');
		$this->csvfile = $csvfile;
		$this->mode = $mode;
		if ( $useHeaders ) $this->useHeaders = true;
		$this->delimiter = $delimiter;
		$this->enclosure = $enclosure;


		// in read mode check for existance of file
		if ( 'r' == $this->mode ) {
			// check for existing file only if the file is not an URL stream
			if ( !strstr($this->csvfile, 'http://') ) {
				if ( !file_exists($this->csvfile) ) $this->_halt('the specified file "'.$this->csvfile.'" does not exist');
			}
		}
		// in write mode check for chmod settings
		// folder must be writable
		elseif ( 'w' == $this->mode ) {
			if ( !$this->_isWritable($this->csvfile) ) $this->_halt('the specified file "'.$this->csvfile.'" is not writable. please check permission of folder.');
		}
		
		
		
		//if 'r' == mode then we need utf8
		
		if('r' == $this->mode){
			$conversion = new convertUTF8($this->csvfile);
			
			if(!$conversion->is_utf8()){
				$conversion->convertFile(true);
			}
		}
			

		$this->_fp = fopen($this->csvfile, $this->mode);



		// in read mode automatically read or make headers
		// if user has not set specific headers
		if ( 'r' == $this->mode ) {
			if ( $this->useHeaders AND !$this->headers ) $this->_readHeaders();
			elseif ( $this->useHeaders AND $this->headers ) $this->_skipHeaders();
			#elseif ( !$this->headers ) $this->_makeHeaders(); // we will not build global headers for all the file but deliver each line as it is (possibly different field count per line)
			else {} // we already got headers
		}

		$this->numLines = 0;
		$this->numCols = 0;
	}




	/**
	* close the file handle to avoid permission errors
	* when trying to unlink the file after parsing it
	*
	* @access public
	* @param void
	* @return void
	*/
	function close() {
		if ( !$this->_fp ) $this->_halt('no open file to close');
		else fclose($this->_fp);
		unset($this->headers);
		$this->_gotHeaders = false;
	}




	/**
	* if file has headers read them from first line of input file
	* or return user-specified headers
	*
	* @access private
	* @param void
	* @return array
	*/
	function _readHeaders() {
		$this->headers = array();
		$line = $this->_readNextLine();
		if ( $line ) {
			foreach ( $line as $k => $v ) {
				$this->headers[$k] = $v;
			}
		}
	}




	/**
	* make headers for file without headers
	*
	* @access private
	* @param void
	* @return void
	*/
	function _makeHeaders() {
		$this->headers = array();
		$line = $this->_readNextLine();
		if ( $line ) {
			foreach ( $line as $k => $v ) {
				$this->headers[$k] = $k;
			}
		}
		// rewind file because first line contains a record
		#rewind($this->_fp); // rewind() is not supported for http:// streams
		$this->_fp = fopen($this->csvfile, $this->mode);
	}




	/**
	* make headers for file from first line to be written
	*
	* @access private
	* @param array $line the line to be written
	* @return void
	*/
	function _makeHeadersFromLine($line) {
		$this->headers = array();
		foreach ( $line as $k => $v ) {
			$this->headers[$k] = $k;
		}
	}




	/**
	* skip the first line of file (headers)
	*
	* @access private
	* @param void
	* @return void
	*/
	function _skipHeaders() {
		$this->_readNextLine();
	}





	// headers are already specified
	function getHeaders() {
		return $this->headers;
	}





	/**
	* set headers for file
	* in read mode or write mode these headers will be used for
	* associative keys in line array
	* additionally in write mode these headers can be used as first line in file
	*
	* @access public
	* @param array $headers the headers
	* @return void
	*/
	// set headers
	function setHeaders($headers) {
		$this->headers = $headers;
	}



	/**
	* read the next line from file
	*
	* @access private
	* @param void
	* @return array
	*/
	function _readNextLine() {
		if ( $this->enclosure ) {
			$line = fgetcsv($this->_fp, 4096, $this->delimiter, $this->enclosure);
		}
		else {
			$line = fgetcsv($this->_fp, 4096, $this->delimiter);
		}
		return $line;
	}




	/**
	* check if there is a next line in file
	*
	* @access public
	* @param void
	* @return bool
	*/
	function nextLine() {
		$next = false;
		if ( ($line = $this->_readNextLine()) !== FALSE ) {
			$next = true;
			$this->_line = $line;
			$this->numLines++;
		}
		return $next;
	}




	/**
	* parse the next line
	*
	* @access public
	* @param void
	* @return array
	*/
	function getLine() {
		#if ( !$this->headers ) $this->_halt('getLine called without set headers');
		// to support files without headers and individual field count per line
		// we will delivery the line as it is
		$line = array();
		if ( !$this->headers )
		{
			$line = $this->_line;
		}
		else
		{
			foreach ( $this->headers as $k => $v ) {
				$line[$v] = stripslashes($this->_line[$k]);
			}
		}
		return $line;
	}




	/**
	* return number of lines
	* total number will only be available after end of file
	*
	* @access public
	* @param void
	* @return integer
	*/
	function numLines() {
		return $this->numLines;
	}




	/**
	* return number of columns
	*
	* @access public
	* @param void
	* @return integer
	*/
	function numCols() {
		return count($this->headers);
	}




	/**
	* write headers to first line of output file
	*
	* @access private
	* @param void
	* @return void
	*/
	// write headers to an output file
	function _writeHeaders() {

		$line = array();
		foreach ( $this->headers as $k => $v ) {
			$line[$v] = $v;
		}
		$this->_headersWritten = true;
		$this->writeLine($line);

	}




	/**
	* write a line to output file
	*
	* @access public
	* @param array $line the line to be written
	* @param string $replace replacement for linebreaks "\r\n"
	* @return void
	*/
	function writeLine($line, $replace=false) {

		// if file should get headers
		// and headers are not already written to the first line of file
		if ( $this->useHeaders AND !$this->_headersWritten ) {
			// if headers are not set by user then use associative keys from first line array
			if ( !$this->headers ) {
				$this->_makeHeadersFromLine($line);
			}
			$this->_writeHeaders();
		}


		$wline = '';

		// user headers order of columns if headers are set
		if ( $this->headers ) {
			$numCols = $this->numCols();
			$i = 0;
			foreach ( $this->headers as $k => $v ) {
				$i++;
				$value = $line[$v];

				$hasLinebreak = $this->_hasLinebreak($value);
				if ( $hasLinebreak AND $replace ) {
					// remove linebreaks from values
					$value = str_replace("\r", $replace, $value);
					$value = str_replace("\n", $replace, $value);
					$value = str_replace($replace.$replace, $replace, $value);
				}

				// enclose values with " (standard enclosure)
				// if value contains delimiter character and enclosure was not defined
				if ( (strstr($value, $this->delimiter) OR $hasLinebreak )
					AND !$this->enclosure )
				{
					$enclosure = '"';
				}
				else {
					$enclosure = $this->enclosure;
				}

				// build the line
				$wline .= $enclosure . addslashes($value) . $enclosure;
				if ( $i < $numCols ) $wline .= $this->delimiter;
			}
			$wline .= "\r\n";
		}

		// without headers simply use the order of values in line
		else {
			$numCols = count($line);
			$i = 0;
			foreach ( $line as $k => $v ) {
				$i++;
				$value = $line[$k];

				$hasLinebreak = $this->_hasLinebreak($value);
				if ( $hasLinebreak AND $replace ) {
					// remove linebreaks from values
					$value = str_replace("\r", $replace, $value);
					$value = str_replace("\n", $replace, $value);
					$value = str_replace($replace.$replace, $replace, $value);
				}

				// enclose values with " (standard enclosure)
				// if value contains delimiter character and enclosure was not defined
				if ( (strstr($value, $this->delimiter) OR $hasLinebreak )
					AND !$this->enclosure )
				{
					$enclosure = '"';
				}
				else {
					$enclosure = $this->enclosure;
				}

				// build the line
				$wline .= $enclosure . addslashes($value) . $enclosure;
				if ( $i < $numCols ) $wline .= $this->delimiter;
			}
			$wline .= "\r\n";
		}

		$this->numLines++;
		
		//convert into iso, if neccessary
		$conversion = new convertUTF8($wline);
			
			if($conversion->is_utf8()){	
				$wline = $conversion->convertString(false, true);
			}
		
		fwrite($this->_fp, $wline);

	}




	/**
	* check for valid mode
	* valid modes are "r" (read)
	* or "w" (write)
	*
	* @access private
	* @param string $mode access mode
	* @return bool
	*/
	function _validMode($mode) {
		if ( 'r' == $mode
			OR 'w' == $mode )
		{
			return true;
		}
		else {
			return false;
		}
	}




	/**
	* check if file or folder is writable
	*
	* @access private
	* @param string $file folder and filename
	* @return bool
	*/
	function _isWritable($file) {
		// in case of user has specified only a folder path
		if ( $file{strlen($file)-1}=='/' ) {
			// recall function again with tmp file
        	$file = $file.uniqid(mt_rand()).'.tmp';
        	return $this->_isWritable($file);
		}
	 	else {
	 		// check file for read/write capabilities
	 		if ( !($fp = @fopen($file, 'w+')) ) {
	 		   return false;
	 		}
	 		fclose($fp);
	 		unlink($file);
	 		return true;
		}
	}




	/**
	* check a string for containing linebreaks "\r" or "\n"
	*
	* @access private
	* @param string $string
	* @return bool
	*/
	function _hasLinebreak($string) {
		if ( strstr($string, "\r")
			OR strstr($string, "\n") )
		{
			return true;
		}
		else {
			return false;
		}
	}




	/**
	 * service method for printing error message and halting
	 *
	 * @param string $msg the error message
	 * @return void
	 * @access private
	 */
	function _halt($msg) {
		die('CSV Class Error: '.$msg);
	}

}

?>
