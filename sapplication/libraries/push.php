<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
class Push{
	
	//Android config
	protected $android_url = 'https://android.googleapis.com/gcm/send';
	protected $android_key = 'AIzaSyDmUVR52fpnrjVqm0WJ51SlbUjpT-gPOJ0';
	
	//IOS config
	protected $ios_url = 'ssl://gateway.sandbox.push.apple.com:2195';
	protected $ios_keyfile = '/uploads/push/tf.pem';
	protected $ios_passphrase = '1234';
	
	public function adroid($members = array(), $message = NULL, $data = NULL, $pushtype = NULL){
		$ok = true;
		// Set POST variables
        $url = $this->android_url;
        $registatoin_ids = array();
        foreach ($members as $put){
        	if($put->machineCode){
        		$registatoin_ids[] = $put->machineCode;
        	}
        }
        if(!empty($registatoin_ids)){
        	$fields = array(
        			'registration_ids' => $registatoin_ids,
        			'data' => array('price'=>$message),
        	);

        	$headers = array(
        			'Authorization: key=' . $this->android_key,
        			'Content-Type: application/json'
        	);
        	// Open connection
        	$ch = curl_init();

        	// Set the url, number of POST vars, POST data
        	curl_setopt($ch, CURLOPT_URL, $url);

        	curl_setopt($ch, CURLOPT_POST, true);
        	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        	// Disabling SSL Certificate support temporarly
        	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));

        	// Execute post
        	$result = curl_exec($ch);
        	if ($result === FALSE) {
        			
        		$ok = false;
        	}

        	// Close connection
        	curl_close($ch);
        }else{
        	$ok = false;
        }
        return $ok;
	}
	
	public function ios($registatoin_ids = array(), $message = NULL, $data = NULL, $pushtype = NULL){
		
		$return = array();
		// Put your device token here (without spaces):
		//$deviceToken = $userid;
		//$deviceToken = $this->getTokenPush($userid);
		// Put your private key's passphrase here:
		
		// Put your alert message here:
		//$message = $this->getMessagePush($pushtype);
		$ctx = stream_context_create();
		stream_context_set_option($ctx, 'ssl', 'local_cert', FCPATH.$this->ios_keyfile);
		stream_context_set_option($ctx, 'ssl', 'passphrase', $this->ios_passphrase);
		// Open a connection to the APNS server
		$fp = @stream_socket_client(
				$this->ios_url, $err,
				$errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);
		// Check connect to APNS server
		if (!$fp){
			$return['ok'] = false;			
			$return['serror'] = __("Failed to connect");
		}
		// Create the payload body
		$body['aps'] = array('alert' => $message,'sound' => 'default','badge' => '1','pushtype' => $pushtype,'data'=>$data);
		// Encode the payload as JSON
		$payload = json_encode($body);
		// Build the binary notification
		
		foreach($registatoin_ids as $put){
			if($put->machineCode){
				$msg = chr(0) . pack('n', 32) . pack('H*', $put->machineCode) . pack('n', strlen($payload)) . $payload;
				// Send it to the server
				$result = fwrite($fp, $msg, strlen($msg));
			}
		}
		
		if($result){
			// Close the connection to the server
			fclose($fp);
			return true;			
			
		}else{
			return false;
		}
				
	}
}