<?php
/**
 * class.minify.php
 * This class minify a js/css file:
 *   	- Read a file and saves the minify version to a given target
 *		- Default target is souce.min.ext
 * 		- Works only with JS and CSS files
 *
 * @author		Rodolfo Berríos <http://rodolfoberrios.com/>
 * @url			<http://chevereto.com>
 * @package		Chevereto
 * @version		1.0
 *
 * @copyright	Rodolfo Berrios <inbox@rodolfoberrios.com>
 *
 */

/*
	//Example ussage:

	require_once('class.minify.php');
	$minify = new Minify();
	try {
		$minify->addSource("script.js");
		$minify->exec();
	} catch (MinifyException $e) {
		//print_r($e->getMessage());
	}
*/

/* P.S: use ->setTarget("target") to set the destination file. By default if will be source.min.js */

class Minify {

    function __construct($source='') {
        if($source!=='') {
            $this->addSource($source);
        }
    }

    /**
     * addSource
     * Adds the filepath to be minified
     *
     * @param	string
     */
    public function addSource($source) {
        $this->source = $source;
        if(!$this->can_read_source()) {
            throw new MinifyException('Source file "'.$source.'" can\'t be loaded. Make sure that the file exists on the given path.');
        }
        if(!$this->is_valid_source()) {
            throw new MinifyException('Invalid type. This only works with JS and CSS files.');
        }
        $this->type = preg_replace('/^.*\.(css|js)$/i', '$1', $source);
        $this->data = $this->get_source_data();
    }

    /**
     * setTarget
     * Sets where you want to save the minified file
     *
     * @param	string
     */
    public function setTarget($target='') {
        $this->target = ($target == '' ? preg_replace('/(.+)\.(js|css)$/i', '$1.min.$2', $this->source) : $target);
    }

    /**
     * exec
     * Does the minification process
     */
    public function exec() {
        if(!isset($this->source)) {
            throw new MinifyException('There is no source defined. Use the class constructor or ->addSource(\'/source-dir/source.file\') to add a source to be minified.');
        }
        switch($this->type) {
            case 'css':
                $this->minifyCSS();
                break;
            case 'js':
                $this->minifyJS();
                break;
        }
        $this->save_to_file();
    }

    /**
     * get_source_data
     * Grabs the file data using file_get_contents
     *
     * @return: string
     */
    private function get_source_data() {
        $data = @file_get_contents($this->source);
        if($data === false) {
            throw new MinifyException('Can\'t read the contents of the source file.');
        } else {
            return $data;
        }
    }

    /**
     * can_read_source
     * Tells if the source file can be readed or not
     *
     * @return: bool
     */
    private function can_read_source() {
        return (@file_exists($this->source) && is_file($this->source) ? true : false);
    }

    /**
     * is_valid_source
     * Tells if the source is valid by its extension
     *
     * @return: bool
     */
    private function is_valid_source() {
        return preg_match('/^.*\.(css|js)$/i', $this->source);
    }

    /**
     * minifyCSS
     * Sets the minified data for CSS
     */
    private function minifyCSS() {
        $this->set_minified_data($this->get_minified_data());
    }

    /**
     * minifyJS
     * Sets the minified data for JavaScript
     */
    private function minifyJS() {
        $this->set_minified_data($this->superfixmyjs($this->get_minified_data($this->data)));
    }

    /**
     * get_default_target
     * Set the default file.min.ext from $this->source
     *
     * @return: string
     */
    private function get_default_target() {
        return preg_replace('/(.*)\.([a-z]{2,3})$/i', '$1.min.$2', $this->source);
    }

    /**
     * get_minified_data
     * Returns the minified $this->data
     *
     * @return: string
     */
    private function get_minified_data() {
        return $this->strip_whitespaces($this->strip_linebreaks($this->strip_comments($this->data)));
    }

    /**
     * set_minified_data
     * Sets $this->minified_data and unset the $this->data
     */
    private function set_minified_data($string) {
        $this->minified_data = $string;
        unset($this->data);
    }

    /**
     * save_to_file
     * Saves the minified data to the target file
     */
    private function save_to_file()
    {
        $this->target = (!isset($this->target) ? $this->get_default_target() : $this->target);
        if(!isset($this->minified_data)) {
            throw new MinifyException('There is no data to write to "'.$this->target.'"');
        }
        if(($handler = @fopen($this->target, 'w')) === false) {
            throw new MinifyException('Can\'t open "' . $this->target . '" for writing.');
        }
        if(@fwrite($handler, $this->minified_data) === false) {
            throw new MinifyException('The file "' . $path . '" could not be written to. Check if PHP has enough permissions.');
        }
        @fclose($handler);
    }

    /**
     * strip_whitespaces
     * Removes any whitespace inside/betwen ;:{}[] chars. It also safely removes the extra space inside () parentheses
     *
     * @param: string
     */
    private function strip_whitespaces($string) {
        switch($this->type) {
            case 'css':
                $pattern = ';|:|,|\{|\}';
                break;
            case 'js':
                $pattern = ';|:|,|\{|\}|\[|\]';
                break;
        }
        return preg_replace('/\s*('.$pattern.')\s*/', '$1', preg_replace('/\(\s*(.*)\s*\)/', '($1)', $string));
    }

    /**
     * strip_linebreaks
     * Removes any line break in the form of newline, carriage return, tab and extra spaces
     *
     * @param: string
     */
    private function strip_linebreaks($string) {
        return preg_replace('/(\\\?[\n\r\t]+|\s{2,})/', '', $string);
    }

    /**
     * strip_comments
     * Removes all the known comment types from the source
     *
     * @param: string
     */
    private function strip_comments($string) {
        // Don't touch anything inside a quote or regex
        $protected = '(?<![\\\/\'":])';
        // Comment types
        $multiline = '\/\*[^*]*\*+([^\/][^\*]*\*+)*\/'; // /* comment */
        $html = '<!--([\w\s]*?)-->'; // <!-- comment -->
        $ctype = '\/\/.*'; // //comment (Yo Dawg)!
        // The pattern
        $pattern = $protected;
        switch($this->type) {
            case 'css':
                $pattern .= $multiline;
                break;
            case 'js':
                $pattern .= '('.$multiline.'|'.$html.'|'.$ctype.')';
                break;
        }
        return preg_replace('#'.$pattern.'#', '', $string);
    }

    /**
     * superfixmyjs
     * Attemps to fix the missing syntax for JavaScript
     * Note: It doesn't fix stupidity.
     *
     * @param: string
     */
    private function superfixmyjs($string) {
        // mmkay fix the misisng ; in javascript objects
        $pattern = '#[=|:][\[\{].*?(?=[\}\]][^,\}\]])[\}|\]](.{1})#';
        preg_match_all($pattern, $string, $matches);

        foreach($matches[1] as $key => $value) {
            if($value !== ";") {
                $source[] = $matches[0][$key];
                $replace[] = substr($matches[0][$key], 0, -1).';'.$value;
            }
        }

        return isset($replace) ? str_replace($source, $replace, $string) : $string;

    }

}

class MinifyException extends Exception {}
