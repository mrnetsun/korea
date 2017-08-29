<?php

/** 
 * A simple exception supported SSH2 
 * class for PHP
 * 
 * @author sixeightzero 
 * @license http://opensource.org/licenses/gpl-license.php GNU General Public Licence 
 * @copyright (c) 2011 - Mike Mackintosh 
 * @version 1.0.1 
 * @package SSH2
 */
class SSH2{

  private static $connection;
  private $error;

  var $port = 22;

  const PASS = 'password';
  const PUBKEY = 'publickey';

  /**
   * Construct, takes Array
   */
  public function __construct(Array $options = array()){

    if($options){
      foreach($options as $opt => $value){
        $this->$opt = $value;
      }
    }
    return $this;
  }

  /**
   * Disconnect Callback
   */
  final function xdisconnect($reason, $message, $language) {
    printf("Server disconnected with reason code [%d] and message: %sn", $reason, $message);
  }

  /** 
   * Disconnect
   */
  public function disconnect(){
    @ssh2_exec(self::$connection, 'exit');
  }

  /**
   * Connect Function
   */
  final function connect(){
    $callbacks = array('disconnect' => 'xdisconnect');
    if (!function_exists("ssh2_connect")) return false;

    self::$connection = ssh2_connect($this->host, $this->port, NULL, $callbacks);
    if(self::$connection === FALSE){
      throw new SSH2FailedToConnectException($this->host, $this->port);
      return false;
    }

    $this->fingerprint = @ssh2_fingerprint(self::$connection);
    return true;
  }

  // sm business 
  final function authenticate(){
    $method = "ssh2_auth_{$this->auth['type']}";
    
    if(@$method(self::$connection, $this->auth['username'], $this->auth['password']) === FALSE){
      throw new SSH2FailedToAuthenticate($this->host, $this->auth['username'], $this->auth['type']);
      return false;
    }
    else{
      return true;
    }
  }

  /**
   * Run a command
   */
  public function exec($cmd){
    $response = '';
    if(is_array($cmd)){
      foreach($cmd as $command){
        /* Send the command */
        $stream = @ssh2_exec(self::$connection, $command);
        $errorStream = @ssh2_fetch_stream($stream, SSH2_STREAM_STDERR);
        
        /* Enable Blocking */ 
        @stream_set_blocking($errorStream, true);
        @stream_set_blocking($stream, true);
        
        /* Grab Response */ 
        $response = stream_get_contents($stream);
        $this->error .= stream_get_contents($errorStream);
      }
    }
    else{
      $stream = @ssh2_exec(self::$connection, $cmd);
      $errorStream = @ssh2_fetch_stream($stream, SSH2_STREAM_STDERR);
      
      /* Enable Blocking */ 
      @stream_set_blocking($errorStream, true);
      @stream_set_blocking($stream, true);

      /* Grab Response */ 
      $response .= stream_get_contents($stream);
      $this->error .= stream_get_contents($errorStream);
    }
    
    if(is_null($response)){
      return false;
    }

    return $response;

  }

  final function shell($cmd){
    $stream = ssh2_shell (self::$connection, 'vt102', null, 80, 40, SSH2_TERM_UNIT_CHARS);
    $output = NULL;

    if(is_array($cmd)){
      foreach($cmd as $command){
        fwrite($stream, $command.PHP_EOL);
        sleep(2);
        
        while(( $res = stream_get_contents($stream, -1)) !== false){
          $output .= $res;
          if($res == ''){
            break;
          }
        }
      }
    }
    else{
      fwrite($stream, $cmd.PHP_EOL);
      sleep(2);
      while(( $res = stream_get_contents($stream, -1)) !== false){
        $output .= $res;
        if($res == ''){
          break;
        }
      }
    }
    
    fwrite($stream, 'exit'.PHP_EOL);
    return $output;
  }

  public function getLastError(){
    return $this->error;
  }
}

/** 
 * Thrown if a class tries to access the XML parser's functionality 
 * 
 * @author sixeightzero 
 * @license http://opensource.org/licenses/gpl-license.php GNU General Public Licence 
 * @copyright (c) 2011 - Mike Mackintosh 
 * @version 0.1 
 * @package Zepnik Framework 
 */ 
 final class SSH2FailedToConnectException extends Exception {
    /** 
    * Sets the error message 
    * 
    * @todo Add logger output 
    */ 
    public function __construct($host, $port) {
      $message = "Failed to connect to host '{$host}' on port {$port}\n";

      // Call the parent constructor 
      parent::__construct($message);
    }
}

final class SSH2FailedToAuthenticate extends Exception {
    /** 
     * Sets the error message 
     * 
     * @todo Add logger output 
     */ 
    public function __construct($host, $username, $type) {
      $message = "Failed to authenticate '{$username}' by '{$type}' on host '{$host}'\n";
    
      // Call the parent constructor 
      parent::__construct($message);
    }
}
?>