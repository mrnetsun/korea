<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Common extends Front_Controller {

	public $model_name = 'common_model';
	
	/**
	 *
	 * @var Home_Model
	 */
	public $model;
	
	 public function __construct(){
	   parent::__construct();
       
	}
	 
	public function index(){	   
        
        //debug($this->LoginData);

	 	$this->view('commons/dashboard');

	}

	public function loadjs($module='',$file='',$action=''){		

		if($file){
			$module = ($module)?$module:$this->module;
//			 debug($module);
			$lang = $this->lang->get_lang_name($this->lang->lang());
			$lang_path = MODULEPATH.$module.'/language/'.$lang.'/';

			if($module)$this->lang->getModuleLang($module,$lang_path);
			$file_js = MODULEPATH.$module.'/asset/js/'.$file;
            $cache_path = FCPATH.SCRIPTS.'cache/'.$module.'/'.$this->lang->lang().'/';

            if(!file_exists($cache_path.$file)){
                mkdir( $cache_path, 0777, true );
                file_put_contents($cache_path.$file,$this->load->file($file_js,true));
            }

		}
        return BASE_URL.SCRIPTS.'cache/'.$module.'/'.$this->lang->lang().'/'.$file;
	}
	public function loadcss($module='',$file=''){
		header("Content-type: text/css", true);
		if($file){
			
			$module = ($module)?$module:$this->router->fetch_module();
			$file = MODULEPATH.$module.'/asset/css/'.$file;
			$this->output->cache(60);
			$this->load->file($file);
		}	
	}
	
	public function googlemap($input = '',$latlong='',$address='',$preview=''){
		
		$this->baseView('commons/googlemapv3',array('input'=>$input,'latlong'=>$latlong,'address'=>$address,'preview'=>$preview));
		
	}
	
	public function googlemap2($input = '',$latlong=''){
	
		$this->baseView('commons/googlemap2',array('input'=>$input,'latlong'=>$latlong));
	
	}
	
	
	
	public function loadimg($module='',$file=''){
	   
		if($file){
			$module = ($module)?$module:$this->router->fetch_module();
			$file = MODULEPATH.$module.'/asset/image/'.$file;
			$size = @getimagesize($file);
			$mime = $size['mime'];
			$bin = @file_get_contents($file);
			echo '<img src="data:'.$mime.';base64,'.base64_encode($bin).'"> ';
		}	
	}
    
    function image(){
        $this->load->helper('MY_helper');
        echo loadImage('member','1.png');
    }
    
    
    public function upload(){
    	
    	$dir = ($this->input->post('dir'))? $this->input->post('dir') : UPLOAD_DIR;
    	$thumb = intval($this->input->post('thumb'));
    	$resize = intval($this->input->post('resize'));
    	$crop = intval($this->input->post('crop'));
    	$preName = $this->input->post('pre_name');
    	$type = $this->input->post('file_type');
    	$max_size = ($this->input->post('max_size'))?$this->input->post('max_size'):MAX_UPLOAD_SIZE;
    	
    	$width = ($this->input->post('width'))?$this->input->post('width'):MAX_IMAGE_WIDTH;
    	$height = ($this->input->post('height'))?$this->input->post('height'):MAX_IMAGE_HEIGHT;
    	
    	$thumb_width = ($this->input->post('thumb_width'))?$this->input->post('thumb_width'):THUMB_WIDTH;
    	$thumb_height = ($this->input->post('thumb_height'))?$this->input->post('thumb_height'):THUMB_HEIGHT;
    	
    	
    	switch($type){
    		case 'video':
    			$uploadType = VIDEO_UPLOAD_TYPE;
    			break;
    		case 'audio':
    			$uploadType = AUDIO_UPLOAD_TYPE;
    			break;
    		case 'document':
    			$uploadType = DOCUMENT_UPLOAD_TYPE;
    			break;
    		default:
    			$uploadType = IMAGE_UPLOAD_TYPE;
    			break;
    	}
    	
    	
    	
    	$upload_dir = FCPATH.$dir; // Relative to the root
    	 
    	$new_file_name = uniqid($preName);
    	 
    	$aryData['ok'] = true;
    	 
    	$config = array();
    	$config['upload_path'] = $upload_dir;
    	$config['allowed_types'] = $uploadType;
    	$config['max_size'] = $max_size;
    	 
    	$config['file_name'] = $new_file_name;
    	$config['overwrite'] = true;
    	 
    	$this->load->library('upload');
    	$this->upload = new CI_Upload($config);
    	 
    	// Output json as response

    	if ( ! $this->upload->do_upload('uploadfile'))
    	{
    		$aryData['ok'] = false;
    		$aryData['serror'] =  $this->upload->display_errors('','')."(".$uploadType.").";
    	}
    	else
    	{
    		$aryData['preview'] = ROOT_URL.$dir.$this->upload->file_name;
    		$aryData['value'] = json_encode(
                array('real_name'=>$dir.$this->upload->file_name,
                'client_name'=>$this->upload->client_name));
    		//check resize
    		if($resize){
	    		$this->load->library('image_lib');
	    		$this->image_lib = new CI_Image_lib();
	    		$size = $this->image_lib->getImagesize($this->upload->upload_path.$this->upload->file_name);
	    
	    		if($size['width']>$width || $size['height']>$height){
	    			$config['image_library'] = 'gd2';
	    			$config['source_image'] = $this->upload->upload_path.$this->upload->file_name;
	    			$config['new_image'] = $this->upload->upload_path;
	    			$config['maintain_ratio'] = TRUE;
	    			$config['create_thumb'] = TRUE;
	    			$config['thumb_marker'] = '';
	    			$config['width'] = $width;
	    			$config['height'] = $height;
	    
	    			$this->image_lib->initialize($config);
	    			$this->image_lib->resize();
	    		}    		
    		}
    		
    		if($crop){
    			$this->load->library('image_cropper');
    			$this->image_cropper->load($this->upload->upload_path.$this->upload->file_name)
    			->crop(array($width,$height))
    			->set_marker(false)
    			->save($dir);    			
    		}
    		
    		
    		
    		if($thumb){
	    		$this->load->library('image_cropper');
	    		$this->image_cropper->load($this->upload->upload_path.$this->upload->file_name)
	    		->crop(array($thumb_width,$thumb_height))
	    		->set_marker(false)
	    		->save($dir.'thumbs/');
	    		$aryData['preview'] = ROOT_URL.$dir.'thumbs/'.$this->upload->file_name;
	    		//$aryData['value'] = $dir.'thumbs/'.$this->upload->file_name;
    		}
    		 
    		$aryData['fileName'] = $this->upload->client_name;
    	}
    	 
    	echo json_encode($aryData);
    }
    
    public function getStates(){
    	$country = $this->input->post('country');
    	$aryRegion = $this->model->find_where('list',array('country_code'=>$country,'status'=>ACTIVE),array('from'=>'country_region'));
    	$aryCity = $this->model->find_where('list',array('country_code'=>$country,'status'=>ACTIVE),array('from'=>'city'));
    	
    	echo json_encode(array('ok'=> true,'region'=>$aryRegion,'city'=>$aryCity));
    }
    
    public function getCity(){
    	$country = $this->input->post('country');
    	$region = $this->input->post('region');
    	
    	$aryCity = $this->model->find_where('list',array('country_code'=>$country,'country_region'=>$region,'status'=>ACTIVE),array('from'=>'city'));
    	 
    	echo json_encode(array('ok'=> true,'city'=>$aryCity));
    }

	public function locations(){

		$city = $this->model->find_where('list',array('status'=>ACTIVE),array('from'=>'city'));
		$aryData = array();
		foreach($city as $c){
			$aryData[] = array('name'=>$c->location);
		}
		echo json_encode($aryData);
	}
    
    public function destroy(){
    	$this->session->sess_destroy();
    }
    
   	public function accessdenied(){
   		$this->view('commons/accessdenied','','','auth');
   	}


	public function checkDeployStatus(){
		$aryData = array('ok'=>true,'smessage'=>'','serror'=>'','result'=>0);

		$status = getDBConfig('DEPLOY_STATUS');

		if( !empty( $status ) ){

			if($status != -1){
				$aryData['status'] = $status;
				$aryData['percent'] = (20 + intval(($status/15)*80));
				switch(intval($status)){

					case 1:
						$aryData['smessage'] = __("MSG_JAVA_AGENT_RUNNING");
						break;

					case 2:
						$aryData['smessage'] = __("MSG_JAVA_AGENT_COPY_XML");
						break;

					case 3:
						$aryData['smessage'] = __("MSG_JAVA_AGENT_RESTART_SOLR");
						break;

					case 4:
						$aryData['smessage'] = __("MSG_JAVA_AGENT_BACKUP_DATA");
						break;

					case 5:
						$aryData['smessage'] = __("MSG_JAVA_AGENT_CONVERT");
						break;
					case 6:
						$aryData['smessage'] = __("Scanning full-update folder...");
						break;

					case 7:
						$aryData['smessage'] = __("Converting data...");
						break;

					case 8:
						$aryData['smessage'] = __("Uploading  full-update EIW data to Solr...");
						break;

					case 9:
						$aryData['smessage'] = __("Scanning daily update folder....");
						break;

					case 10:
						$aryData['smessage'] = __("Converting data....");
						break;

					case 11:
						$aryData['smessage'] = __("Uploading daily update data to Solr for EIY...");
						break;

					case 12:
						$aryData['smessage'] = __("Uploading daily update data to Solr for EIY...");
						break;

					case 13:
						$aryData['smessage'] = __("Uploading daily update data to Solr for EIY...");
						break;

					case 14:
						$aryData['smessage'] = __("Uploading daily update data to Solr for EIY...");
						break;

					case 15:
						//finish
						$aryData['smessage'] = __("MSG_DEPLOY_SUCCESSFUL");
						$this->session->unset_userdata('DEPLOY_DATA_PERMISSION');

				}
			}else{
				$aryData['ok'] = false;
				$aryData['percent'] = -1;
				$aryData['serror'] = __("MSG_JAVA_AGENT_FAILURE");
			}


		}
		echo json_encode($aryData);

	}

}

