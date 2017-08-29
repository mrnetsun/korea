<?php (defined('BASEPATH')) OR exit('No direct script access allowed');
/**
 * Create a Form
 * @author lucdt@ideavietnam.com
 * @date 2013-06-01
 */
class FormBase {
	/**
	 * Stor token form
	 * @var mixed
	 */
	public   $_arrayToken = array();
	/**
	 * Store data value
	 * @var string
	 */
	private $formData = '';
	
	/**
	 * Store id of form
	 * @var string
	 */
	private $formId = '';
	/**
	* Count number of element
	 */
	private $element = 0;
	
	/**
	 * Store module
	 * @var string
	 */
	private $module = '';
	
	/** 
	 * store controller
	 * @var string
	 */
	private $controller='';


    public $focus_first = true;
	
	/**
	 * Begin of Form
	 * @param string $action
	 * @param mixed $attributes
	 * @param mixed $hidden
	 * @return string
	 */

	public function __construct($config = array())
	{
		$this->module = $config['module'];
		$this->controller = $config['controller'];
	}

	private $config = array('start' => '<div class="control-group">',
        'end'=>'</div>',
        'input_start'=>'<div class="controls ">',
        'input_end'=>'</div>');
	
	public  function setup($aryConfig){
		foreach($aryConfig as $key => $val){
			$this->config[$key] = $val;
		}
	}
	
	public function create($action = '', $attributes = array(), $hidden = array()){
		
		$this->element = 0;
		$ci = & get_instance();

		//clear token
		$this->_arrayToken = array();
		
		if(!$action){
			$action = _getAction();
		}
		
		$aryAct = explode('/',$action);
			
		//check module included
		if($aryAct[0] != $ci->router->fetch_module()){			
			array_unshift($aryAct,$ci->router->fetch_module());
		}
		if(count($aryAct)>2){
			$this->module = $aryAct[0];
			$this->controller = strtolower($aryAct[1]);
		}else{
			$this->module = $aryAct[0];
			$this->controller = strtolower($aryAct[0]);
		}
		$form_action = $aryAct;
		
		//set Id
		if(!isset($attributes['id'])){			
			foreach($aryAct as $key => $val) $aryAct[$key] = ucfirst(strtolower($val));
			$aryAct[] = 'form';
			if($aryAct[0]==$aryAct[1]) unset($aryAct[0]);
			$attributes['id'] = implode('_',$aryAct);
		}
		
		if(isset($attributes['ajax'])){
			if(!is_array($attributes['ajax'])){
				$attributes['ajax'] = array('id'=>"'".$attributes['ajax']."'");
			}
			
			$strAjax = ""; $i=0;
			foreach($attributes['ajax'] as $key=>$val){
				
				if($i) $strAjax .= ',';
				$strAjax .= "$key:$val";
				$i++;
			}
			if( isset( $attributes['offset_module'] ) && $attributes['offset_module'] ==='solr' ){
				$attributes['onSubmit'] = 'return solrController.formAjaxDeploy(this,{' . $strAjax . '});';
			}else {
				$attributes['onSubmit'] = 'return Common.formAjax(this,{' . $strAjax . '});';
			}
            $action_url = '#';
            $attributes['data-url'] = site_url(implode('/',$form_action));
		}else{
            $action_url = site_url(implode('/',$form_action));
        }
		
		$this->formId = $attributes['id'];
		
		$attributes['class'] .= ' Form';
		
		if(!isset($hidden['task'])) $hidden['task'] = '';
		
		unset($attributes['ajax']);
        $return ='';
		$return .= form_open($action_url,$attributes,$hidden);

		return $return;
	}
	
	public function multipart($action = '', $attributes = array(), $hidden = array()){
		if (is_string($attributes))
		{
			$attributes .= ' enctype="multipart/form-data"';
		}
		else
		{
			$attributes['enctype'] = 'multipart/form-data';
		}
		$this->create($action,$attributes,$hidden);
	}
	/**
	 * Text Input Field
	 *
	 * @param	mixed
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function input($name = '', $params = array()){

//
		$label = $params['label'];
		$unit = ($params['unit'])?$params['unit']:'';
		$html = '';
		if(is_array($params['value'])){
			$preName = $this->_getName($name);
			$name = "data[".$this->controller.']'.$preName;
			$key =   str_replace(array('[',']'), '',$preName);
			$i = 0;
			$html = '<div class="multipleWrap">';



			$multiple = ($params['value'])?$params['value']:array();

			$extra = $this->_buildParam ($params);
			$id = $params['id'];

			$newrule = str_replace('required','',strtolower($params['rules']));

			$params['rules'] = $newrule;
			$tooltip = ($params['tooltip'])? buildInputTooltip($params['tooltip']):'';


			$add_more = '<div class="control-group"><div class="control-label"></div><div class="controls"><a onclick="Common.addFormItem(this)"><i class="icon-plus-sign"></i>'.__("LBL_ADD_MORE").'</a></div></div>';

			$remove = '<span class="control-remove" onclick="Common.removeFormItem(this)"><i class="icon-trash"></i></span>';

			foreach($multiple as $itval){
				$i++;
				$params['id'] = $id.'_'.$i;
				$extra2 = $this->_buildParam ($params);
				if($label){
					$html_s = $this->config['start'].$this->label($label.' <span class="number">'.$i.'</span>').$this->config['input_start'];
					$html_e = $this->config['input_end'];
					$field_e = $this->config['end'];
				}

				if($i==1){
					$input = form_input($name, $itval, $extra);
					$html.=  $html_s.$input.$unit.$html_e.$field_e;
				}else{
					$input = form_input($name, $itval, $extra2);
					$html.=  $html_s.$input.$unit.$remove.$html_e.$field_e;
				}


			}
			$html.=$add_more.'</div>';

		}else{
			$preName = $this->_getName($name);
			$name = "data[".$this->controller.']'.$preName;
			$key =   str_replace(array('[',']'), '',$preName);

			if($params['label']){
				$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
				$html_e = $this->config['input_end'];
				$field_e = $this->config['end'];
			}else{
				$html_s = '';
				$html_e = '';
				$field_e = '';
			}

			$unit = ($params['unit'])?$params['unit']:'';
			$tooltip = ($params['tooltip'])? buildInputTooltip($params['tooltip']):'';

			$value = (isset($params['value']))? $params['value'] : NULL;

			if($value === NULL){
				if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
			}



			$extra = $this->_buildParam ($params);
			$input = form_input($name, $value, $extra);
			$item  =  $html_s.$input.' '.$unit.$html_e.$field_e;

			$html = $item;
		}

		return $html;
	}
	/**
	 * Hidden Input Field
	 *
	 * Generates hidden fields. You can pass a simple key/value string or
	 * an associative array with multiple values.
	 *
	 * @param	string
	 * @param	string
	 * @param	bool
	 * @return	string
	 */
	public function hidden($name,$params=array(), $recursing = FALSE){
				
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		
		$key =   str_replace(array('[',']'), '',$preName);
				
		$value = $params['value'];
		
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		$extra = $this->_buildParam ($params);
		//debug($extra);
		$html = '<input type="hidden" '.$extra.' name="'.$name.'" value="'.$value.'"/>';
		return  $html;
		
		
	}
	
	/**
	 * Create hidden loadlist url
	 */
	public function loadListUrl($value=''){		
		$name='loadListUrl';
		if(!$value)	$value = site_url($this->module.'/'.$this->controller.'/getList'); 
		$html = '<input type="hidden" name="'.$name.'" value="'.$value.'"/>';
		return $html;		
	}
	
	/**
	 * Password Field
	 *
	 * Identical to the input function but adds the "password" type
	 *
	 * @param	string
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function password($name = '',  $params = array()){
		
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
			
		}else{
			$html_s = '';
			$html_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
						
		$extra = $this->_buildParam ($params);
				
		return $html_s.form_password($name, $value, $extra).$html_e.$field_e;
		
	}
	
	/**
	 * Upload Field
	 *
	 * Identical to the input function but adds the "file" type
	 *
	 * @param	string
	 * @param	mix
	 * @return	string
	 */
	public function upload($name = '', $params = array())
	{
		
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;

		if($params['name']) $name = $params['name'];
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
				
		$extra = $this->_buildParam ($params);
				
		return $html_s.form_upload($name, $value, $extra).$html_e.$field_e;
	}
	
	/**
	 * 
	 * @param string $name : the name of field value
	 * @param mixed $params = array(
	 * 	url: string the url target upload
	 *  data: mixed data send on submit
	 *  preview: string id of preview image after upload
	 *  class : css style class
	 * )
	 * @return string
	 */
	function upload_image($name,$params = array()){
		
		$preName = $this->_getName($name);
		$input_name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		
		$uploadfile = ($params['config'])?$params['config']:'uploadfile';
		$caption = $params['caption'];
		
		$url = ($params['url'])?$params['url']:site_url('common/upload');
		$preview = ($params['preview'])?$params['preview']:$name.'_Preview';
		
		$value = (isset($params['value']))? $params['value'] : NULL;
		
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		
		$html = '';
		$html.= '<input type="hidden" id="'.$name.'_hidden" name="'.$input_name.'" value=\''.$value.'\'/>';
		if($params['label']){
			$html.='<div class="control-group"><label class="control-label">'.__($params['label']).'</label><div class="controls ">';
		}
		$html.= '<a id="'.$name.'_upload" class="'.$params['class'].'">'.__("Browse").' '.img_ajax().'</span></a> <span class="note">'.$params['dimensions'].'</span>';

		if(!$params['preview']){
		
			$html.='<div class="clear"><div id="'.$name.'_Preview" class="galleryInputUpload">';

			if($this->formData->{$key}){
				if(!is_array($this->formData->{$key})) $this->formData->{$key} = json_decode($this->formData->{$key});
				$item  = $this->formData->{$key};
                $value = json_decode($value);
				$html.= '<div class=\'photoItem\'>				
				'.base_img($value->real_name,array('width'=>30,'height'=>30,'class'=>'w30 h30')).'
				<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();$("#'.$name.'_hidden").val("")\' title=\''.__("Remove").'\'></a></div>
				</div>';
				
			}
			
			$html.='</div></div>';
		}
		$html.= '<script type="text/javascript">
		        $(function(){
		           var btnUpload=$("#'.$name.'_upload");
		             new AjaxUpload(btnUpload, {
		                        action: "'.$url.'",
		                        name: "'.$uploadfile.'",
		                        onSubmit: function(file, ext){
		                        $("#'.$name.'_upload .ajaxImage").show();
		                        ';
		if($params['data']) $html.=' this.setData('.json_encode($params['data']).');';						                                 
		$html.= '                 },
		                       onComplete: function(file, response){
		                          //On completion clear the status
		                          //alert(response);
		                          $("#'.$name.'_upload .ajaxImage").hide();
		                          var data = $.parseJSON(response);
		                          if(data.ok){
		                                var div = $("<div class=\'photoItem\'></div>");
		                              	var img = $("<img/>");
		                              	var del = "<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();$(\\"#'.$name.'_hidden\\").val(\\"\\")\' title=\''.__("Remove").'\'><i class=\\"fa fa-trash-o\\"></i></a>";
		                              	img.attr("src",data.preview);
		                              	div.append(img);div.append(del);
										$("#'.$preview.'").html(div);
										$("#'.$name.'_hidden").val(data.value);
		                          }else{
										Common.error(data.serror);
		                          }
		                        }
		                   });
		                                
		                 });
		             </script>';
		if($params['label']){
			$html.='</div></div>';
		}
		return $html;
	}
	/**
	 *
	 * @param string $name : the name of field value
	 * @param mixed $params = array(
	 * 	url: string the url target upload
	 *  data: mixed data send on submit
	 *  preview: string id of preview image after upload
	 *  class : css style class
	 * )
	 * @return string
	 */
    function upload_photos($name,$params = array()){
        $html = '';
        //debug($params['data']);
        $preName = $this->_getName($name);
        $input_name = "data[".$this->controller.']'.$preName;

        $key =   str_replace(array('[',']'), '',$preName);

        $uploadfile = ($params['config'])?$params['config']:'uploadfile';

        $url = ($params['url'])?$params['url']:site_url('common/upload');

        if($params['label']){
            $html.='<div class="control-group"><label class="control-label">'.__($params['label']).'</label><div class="controls ">';
        }
        $html.= '<a id="'.$name.'_upload" class="'.$params['class'].'">'.__("Browse").' '.img_ajax().'</span></a>';

        $html.='<div class="clear"><div id="'.$name.'_galleryPreview" class="galleryInputUpload">';

        if($this->formData->{$key}){
            if(!is_array($this->formData->{$key})) $this->formData->{$key} = json_decode($this->formData->{$key});
            $data  = $this->formData->{$key};
            if($data)foreach($data as $item){

                $html.= '<div class=\'photoItem\'>
						<input name="'.$input_name.'[]" value=\''.$item.'\' type="hidden"/>
						'.json_img($item).'
						<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();\' title=\''.__("Remove").'\'><i class=\\"fa fa-trash-o\\"></i></a></div>
						</div>';
            }
        }

        $html.='</div></div>';

        $html.= '<script type="text/javascript">
		$(function(){
		
		var inputT = \'<input name="'.$input_name.'[]" type="hidden"/>\';
		
		var btnUpload=$("#'.$name.'_upload");
		new AjaxUpload(btnUpload, {
			action: "'.$url.'",
			name: "'.$uploadfile.'",
			onSubmit: function(file, ext){
			$("#'.$name.'_upload .ajaxImage").show();
			';
        if($params['data']) $html.=' this.setData('.json_encode($params['data']).');';
        $html.= '},
			onComplete: function(file, response){
				//On completion clear the status
				$("#'.$name.'_upload .ajaxImage").hide();
				var data = $.parseJSON(response);
				if(data.ok){
					
					var img = $("<img/>");
					var hidden = $(inputT);
					hidden.val(data.value);
					img.attr("src",data.preview);
					var div = $("<div class=\'photoItem\'>");
					var close = $("<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();\' title=\''.__("Remove").'\'><i class=\\"fa fa-trash-o\\"></i></a></div>")
					div.append(hidden);div.append(img);div.append(close);
					$("#'.$name.'_galleryPreview").append(div);
					
				}else{
					Common.error(data.serror);
				}
			}
		});
	
	});
	</script>';
        if($params['label']){
            $html.='</div></div>';
        }
        return $html;
    }

    /**
     *
     * @param string $name : the name of field value
     * @param mixed $params = array(
     * 	url: string the url target upload
     *  data: mixed data send on submit
     *  preview: document preview
     *  class : css style class
     * )
     * @return string
     */
    function upload_document($name,$params = array()){
        $html = '';
        //debug($params['data']);
        $preName = $this->_getName($name);
        $input_name = "data[".$this->controller.']'.$preName;

        $key =   str_replace(array('[',']'), '',$preName);

        if(!$params['data']['file_type']){
            $params['data']['file_type'] = 'document';
        }
        $uploadfile = ($params['config'])?$params['config']:'uploadfile';

        $url = ($params['url'])?$params['url']:site_url('common/upload');

        if($params['label']){
            $html.='<div class="control-group"><label class="control-label">'.__($params['label']).'</label><div class="controls ">';
        }
        $html.= '<a id="'.$name.'_upload" class="'.$params['class'].'">'.__("Browser").' '.img_ajax().'</span></a>';

        if(!$params['preview']){
            $html.='<div class="clear"><div id="'.$name.'_documentPreview" class="documentInputUpload">';

            if($this->formData->{$key}){

                if(!is_array($this->formData->{$key})) $this->formData->{$key} = json_decode($this->formData->{$key});
                $item  = $this->formData->{$key};
                    $item_value = $item;

                    $html.= '<div class=\'documentItem\'>
						<input name="'.$input_name.'" value=\''.json_encode($item_value).'\' type="hidden"/>
						'.json_document($item).'
						<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();\' title=\''.__("Remove").'\'><i class=\\"fa fa-trash-o\\"></i></a></div>
						</div>';

            }

            $html.='</div></div>';

        }

        $divPreview =($params['preview']) ? $params['preview'] : $name.'_documentPreview';

        $html.= '<script type="text/javascript">
		$(function(){

		var inputT = \'<input name="'.$input_name.'" type="hidden"/>\';

		var btnUpload=$("#'.$name.'_upload");
		new AjaxUpload(btnUpload, {
			action: "'.$url.'",
			name: "'.$uploadfile.'",
			onSubmit: function(file, ext){
			$("#'.$name.'_upload .ajaxImage").hide();
			';
        if($params['data']) $html.=' this.setData('.json_encode($params['data']).');';
        $html.= '},
			onComplete: function(file, response){
				//On completion clear the status
				$("#'.$name.'_upload .ajaxImage").hide();
				var data = $.parseJSON(response);
				if(data.ok){

					var a = $("<a class=\"file_icon\"/>");
					var hidden = $(inputT);
					hidden.val(data.value);
					a.attr("href",data.preview);
					a.html(data.fileName);
					var div = $("<div class=\'documentItem\'>");
					var close = $("<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();\' title=\''.__("Remove").'\'><i class=\\"fa fa-trash-o\\"></i></a></div>")
					div.append(hidden);div.append(a);div.append(close);
					$("#'.$divPreview.'").html(div);

				}else{
					Common.error(data.serror);
				}
			}
		});

	});
	</script>';
        if($params['label']){
            $html.='</div></div>';
        }
        return $html;
    }
	
	/**
	 *
	 * @param string $name : the name of field value
	 * @param mixed $params = array(
	 * 	url: string the url target upload
	 *  data: mixed data send on submit
	 *  preview: document preview
	 *  class : css style class
	 * )
	 * @return string
	 */
	function upload_documents($name,$params = array()){
        $html = '';
        //debug($params['data']);
        $preName = $this->_getName($name);
        $input_name = "data[".$this->controller.']'.$preName;

        $key =   str_replace(array('[',']'), '',$preName);

        if(!$params['data']['file_type']){
            $params['data']['file_type'] = 'document';
        }
        $uploadfile = ($params['config'])?$params['config']:'uploadfile';

        $url = ($params['url'])?$params['url']:site_url('common/upload');

        if($params['label']){
            $html.='<div class="control-group"><label class="control-label">'.__($params['label']).'</label><div class="controls ">';
        }
        $html.= '<a id="'.$name.'_upload" class="'.$params['class'].'">'.__("Browser").' '.img_ajax().'</span></a>';

        if(!$params['preview']){
        $html.='<div class="clear"><div id="'.$name.'_documentPreview" class="documentInputUpload">';

        if($this->formData->{$key}){

            if(!is_array($this->formData->{$key})) $this->formData->{$key} = json_decode($this->formData->{$key});
            $data  = $this->formData->{$key};

            if(is_array($data))foreach($data as $item){
                $item_value = $item;
                //debug($item,false);
                $item = json_decode($item);
                $html.= '<div class=\'documentItem\'>
						<input name="'.$input_name.'[]" value=\''.$item_value.'\' type="hidden"/>
						<a class="file_icon" href="'.$item->real_name.'">'.$item->client_name.'</a>
						<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();\' title=\''.__("Remove").'\'><i class=\\"fa fa-trash-o\\"></i></a></div>
						</div>';
            }
        }

        $html.='</div></div>';

        }

        $divPreview =($params['preview']) ? $params['preview'] : $name.'_documentPreview';

        $html.= '<script type="text/javascript">
		$(function(){

		var inputT = \'<input name="'.$input_name.'[]" type="hidden"/>\';

		var btnUpload=$("#'.$name.'_upload");
		new AjaxUpload(btnUpload, {
			action: "'.$url.'",
			name: "'.$uploadfile.'",
			onSubmit: function(file, ext){
			$("#'.$name.'_upload .ajaxImage").hide();
			';
        if($params['data']) $html.=' this.setData('.json_encode($params['data']).');';
        $html.= '},
			onComplete: function(file, response){
				//On completion clear the status
				$("#'.$name.'_upload .ajaxImage").hide();
				var data = $.parseJSON(response);
				if(data.ok){

					var a = $("<a class=\"file_icon\"/>");
					var hidden = $(inputT);
					hidden.val(data.value);
					a.attr("href",data.preview);
					a.html(data.fileName);
					var div = $("<div class=\'documentItem\'>");
					var close = $("<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();\' title=\''.__("Remove").'\'><i class=\\"fa fa-trash-o\\"></i></a></div>")
					div.append(hidden);div.append(a);div.append(close);
					$("#'.$divPreview.'").append(div);

				}else{
					Common.error(data.serror);
				}
			}
		});

	});
	</script>';
        if($params['label']){
            $html.='</div></div>';
        }
        return $html;
	}
	
	/**
	 *
	 * @param string $name : the name of field value
	 * @param mixed $params = array(
	 * 	url: string the url target upload
	 *  data: mixed data send on submit
	 *  preview: audio preview
	 *  class : css style class
	 * )
	 * @return string
	 */
	public function audio($name,$params = array()){
		$preName = $this->_getName($name);
		$input_name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		
		$uploadfile = ($params['config'])?$params['config']:'uploadfile';
		
		$url = ($params['url'])?$params['url']:site_url('common/upload');
		$preview = ($params['preview'])?$params['preview']:$name.'_Preview';
		
		$value = (isset($params['value']))? $params['value'] : NULL;
		
		$preview_url = ($params['data']['dir'])?$params['data']['dir']:UPLOAD_DIR;
		
		$params['data']['file_type']='audio';
		
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		
		$html = '';
		$html.= '<input type="hidden" id="'.$name.'_hidden" name="'.$input_name.'" value="'.$value.'"/>';
		if($params['label']){
			$html.='<div class="control-group"><label class="control-label">'.__($params['label']).'</label><div class="controls ">';
		}
		$html.= '<a id="'.$name.'_upload" class="'.$params['class'].'">'.__("Browser").' '.img_ajax().'</span></a>';
		
		if(!$params['preview']){
		
			$html.='<div class="clear"><div id="'.$name.'_Preview" class="galleryInputUpload">';
			
			if($this->formData->{$key}){
				
				$item  = $this->formData->{$key};
				
				$html.= '<object width="300" height="30" id="audioplayer_'.$name.'" data="'.ROOT_URL.'mediaplayer/audio.swf" style="outline: medium none; visibility: visible;" name="audioplayer_'.$name.'" type="application/x-shockwave-flash">
				<param name="wmode" value="transparent">
				<param name="menu" value="false">
				<param value="initialvolume=100&amp;titles=Audio&amp;animation=yes&amp;autostart=No &amp;soundFile='.ROOT_URL.$item.'&amp;playerID=audioplayer_'.$name.'" name="flashvars"></object>';
				
			}
			
			$html.='</div></div>';
		}
		$html.= '<script type="text/javascript">
		        $(function(){
		           var btnUpload=$("#'.$name.'_upload");

		           
		             new AjaxUpload(btnUpload, {
		                        action: "'.$url.'",
		                        name: "'.$uploadfile.'",
		                        onSubmit: function(file, ext){
		                        $("#'.$name.'_upload .ajaxImage").hide();
		                        ';
		if($params['data']) $html.=' this.setData('.json_encode($params['data']).');';						                                 
		$html.= '                 },
		                       onComplete: function(file, response){
		                          //On completion clear the status
		                          $("#'.$name.'_upload .ajaxImage").hide();
		                          var data = $.parseJSON(response);
		                          if(data.ok){
		                              	//alert(data.value);
		                          		var link = \'<object width="300" height="30" id="audioplayer_'.$name.'" data="'.ROOT_URL.'mediaplayer/audio.swf" style="outline: medium none; visibility: visible;" name="audioplayer_'.$name.'" type="application/x-shockwave-flash">\';'
										.'link += \'<param name="wmode" value="transparent">\';'
										.'link += \'<param name="menu" value="false">\';'
										.'link += \'<param value="initialvolume=100&amp;titles=Audio&amp;animation=yes&amp;autostart=No &amp;soundFile='.ROOT_URL.'\'+data.value+\'&amp;playerID=audioplayer_'.$name.'" name="flashvars"></object>\';    	
		                          
										$("#'.$preview.'").html(link);
										$("#'.$name.'_hidden").val(data.value);
		                          }else{
										Common.error(data.serror);
		                          }
		                        }
		                   });
		                                
		                 });
		             </script>';
		if($params['label']){
			$html.='</div></div>';
		}
		return $html;
	}
	
	
	/**
	 * 
	 * @param unknown_type $name
	 * @param unknown_type $params
	 */
	public function date($name = '', $params = array()){

    $preName = $this->_getName($name);
    $name = "data[".$this->controller.']'.$preName;
    $key =   str_replace(array('[',']'), '',$preName);

    if($params['label']){
        $html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
        $html_e = $this->config['input_end'];
        $field_e = $this->config['end'];
    }else{
        $html_s = '';
        $html_e = '';
        $field_e = '';
    }

    $value = (isset($params['value']))? $params['value'] : NULL;

    if($params['class'])
        $params['class'] .= ' inputDate';
    else
        $params['class'] = 'inputDate';

    if($value === NULL){
        if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
    }

    if(!$params['config']) $config = '{ dateFormat: "yy-mm-dd"}';
    else $config = $params['config'];

    $extra = $this->_buildParam ($params);

    $inputId = $params['id'];


    $html =  $html_s.form_input($name, $value, $extra).$html_e.$field_e;

    $html .= '<script  type="text/javascript"> $("#'.$inputId.'").datepicker('.$config.')</script>';

    return $html;
    }
    /**
     *
     * @param unknown_type $name
     * @param unknown_type $params
     */

	/**
	 * 
	 * @param unknown_type $name
	 * @param unknown_type $params
	 */
	public function datetime($name = '', $params = array()){
	
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);

		if(!$params['config']) $params['config'] = "mm/dd/yy";
	
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
			$field_e = '';
		}
	
		$value = (isset($params['value']))? $params['value'] : NULL;
	
		if($params['class'])
			$params['class'] .= ' inputDateTime';
		else
			$params['class'] = 'inputDateTime';
	
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}

		if($value) $value = date("m/d/Y H:i",strtotime($value));
		
		$config = $params['config'];

	
		$extra = $this->_buildParam ($params);
	
		$inputId = $params['id'];
	
		$html =  $html_s.form_input($name, $value, $extra).$html_e.$field_e;
	
		$html .= '<script  type="text/javascript">
					$(document).ready(function(){
				 	$("#'.$inputId.'").datetimepicker({ dateFormat: "'.$config.'"})
				});		
		</script>';
	
		return $html;
	}
	/**
	 * 
	 * @param unknown_type $name
	 * @param unknown_type $params
	 */
	public function daterange($name,$params){
		
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
			$field_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
		
		if($params['class'])
			$params['class'] .= ' inputDateTime';
		else
			$params['class'] = 'inputDate';
		
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		//debug($params['config']);
		if(!$params['config']) $config = '{ dateFormat: "yy-mm-dd"}';
		else $config = $params['config'];
		$extra = $this->_buildParam ($params);
		
		$inputId = $params['id'];
		
		$html =  $html_s.form_input($name, $value, $extra).$html_e.$field_e;
		
		$html .= '<script  type="text/javascript">
		$(document).ready(function(){
		$("#'.$inputId.'").daterangepicker('.$config.')
		});
		</script>';
		
		return $html;
	}
	
	/**
	 * return Autocomplete input
	 * @param string $name
	 * @param mixed $params['url'] url to get data
	 * @param mixed $params['data'] data = array('name'=>'val') to POST
	 * @param mixed $params['config'] = array('id'=>'key','name'=>'name') matching return
	 */
	public function autocomplete($name = '', $params = array()){
	
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
			$field_e = '';
		}
		$url = $params['url'];
		$data = $params['data'];
		$config = $params['config'];
		
		$respone_id = ($config['id'])?$config['id']:'id';
		$respone_name = ($config['name'])?$config['name']:'name';
		
		$strRule = ($params['rules']=='required')? 'autocomplete_required':'';
		
		$extra = $this->_buildParam ($params);		
		$inputId = $params['id'];
		
		$stringPostData = '';		
		if(is_array($data)){
			foreach($data as $key=>$val){
				$stringPostData.='&'.$key.'='.$val;
			}
		}
		
		
		$html = '';		
		$html.= $html_s.'<div id="'.$inputId.'_autocomplete" class="ui-helper-clearfix hasAutocomplete controls">
						<input class="inputAutoComplete" name="'.$inputId.'_autocomplete_q" type="text" rules="'.$strRule.'">
					</div>'.$html_e.$field_e;
		$html.= '<script type="text/javascript">
				$(function(){
				
				//attach autocomplete
				$("#'.$inputId.'_autocomplete .inputAutoComplete").autocomplete({					
					 source: function( request, response ) {
						$.ajax({
							url: "'.$url.'",
							type:"POST",
							dataType: "json",
							data: $("#'.$inputId.'_autocomplete").closest("form").serialize() + "&q="+request.term+"'.$stringPostData.'",
							success: function( data ) {
								if(data){
									response( $.map( data.suggest, function( item ) {								
										return {
												id: item.'.$respone_id.',
												value: item.'.$respone_name.'
												}
									}));
								}
							}
						});
						},
					
					select: function(e, ui) {
						
						var friend = ui.item.value;
							val = ui.item.id;							
							var inserted_flag = false;
							$("#'.$inputId.'_autocomplete input[type=hidden]").each(function(){							
													
								if($(this).val().toString() == val.toString()){inserted_flag = true;}
																
							});	
							if(!inserted_flag){	
								span = $("<span>").text(friend);
								hidden = $("<input/>",{type:"hidden",name:"'.$name.'[]",value:val});
								hidden.appendTo(span);
								var a = $("<a>").addClass("remove").attr({
									href: "javascript:",
									title: "'.__("Remove").' " + friend
								}).text("x").appendTo(span);
								
								span.insertBefore("#'.$inputId.'_autocomplete .inputAutoComplete");								
								
							}
					},
					change: function() {											
						$("#'.$inputId.'_autocomplete .inputAutoComplete").val("");
						count = $("#'.$inputId.'_autocomplete").find("input[type=hidden]").length;
						if(count>0) $("#'.$inputId.'_autocomplete").removeClass("input_error");
					}
				});				
				$("#'.$inputId.'_autocomplete").click(function(){					
					$("#'.$inputId.'_autocomplete .inputAutoComplete").focus();
				});				
				$(".remove", $("#'.$inputId.'_autocomplete")).live("click", function(){
									
					$(this).parent().remove();
				
					if($("#'.$inputId.'_autocomplete span").length === 0) {
						$("#'.$inputId.'_autocomplete .inputAutoComplete").css("top", 0);
					}
							
				});				
			});
		</script>';
		return $html;
	
	}
	/**
	 * Slider Bar
	 * @param string $name
	 * @param mixed $params['config'] = array('range'=>'true|min|max','value','values: [ 75, 300 ]','min','max','orientation'=>'vertical','step')
	 */
	public function slider($name,$params = array()){

		$preName = $this->_getName($name);
		$input_name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		
				
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
			$field_e = '';
		}
		$config = $params['config'];
		$strConfig = '';
		$range = ($config['range'])?$config['range']:'min';
		$min = ($config['min'])?$config['min']:0;
		$max = ($config['max'])?$config['max']:100;
		
		if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		
		if(!$value){
			$value = ($config['value'])?$config['value']:0;
		}
		
		$suffix = $config['suffix'];
		$prefix = $config['prefix'];
		
		
		
		$extra = $this->_buildParam ($params);
		$inputId = $params['id'];
		
		$strConfig.='range: "'.$range.'",';
		$strConfig.='min: '.$min.',';
		$strConfig.='max: '.$max.',';
		if($config['value']!='')$strConfig.='value: '.$value.',';
		if($config['step']!='')$strConfig.='step: '.$config['step'].',';
		if($config['values']!='')$strConfig.='values: '.$config['values'].',';
		
		$strConfig.='slide: function( event, ui ) {';
		if($config['range']==1){
			$strConfig.='$( "#'.$inputId.'_slider_value" ).text( "'.$prefix.'" + ui.values[0] + ""'.$suffix.'" - '.$prefix.'" + ui.values[1] +"'.$suffix.'");';
			$strConfig.='$( "#'.$inputId.'_slider_input" ).val(ui.values[0]+"-"+ui.values[1]);';
		}else{
			$strConfig.='$( "#'.$inputId.'_slider_value" ).text( "'.$prefix.'" + ui.value+"'.$suffix.'");';
			$strConfig.='$( "#'.$inputId.'_slider_input" ).val(ui.value);';
		}
		$strConfig.='}';
		
		$html = '';
		$html.= $html_s.'<div id="'.$inputId.'_slider" class="controls">
		Value: <span id="'.$inputId.'_slider_value"></span>
		'.'<input type="hidden" name="'.$input_name.'" id="'.$inputId.'_slider_input" value="'.$value.'"/>'.'
		<div id="'.$inputId.'_slider_range"></div>
		</div>'.$html_e.$field_e;
		$html.='<script>
	$(function() {
		$( "#'.$inputId.'_slider_range" ).slider({
			'.$strConfig.'
		});';
		if($config['range']==1){
			$html.='$( "#'.$inputId.'_slider_value" ).text( "'.$prefix.'" + $( "#'.$inputId.'_slider_range" ).slider( "values", 0 ) +
			"'.$suffix.' - '.$prefix.'" + $( "#'.$inputId.'_slider_range" ).slider( "values", 1 ) +"'.$suffix.'");';
			$strConfig.='$( "#'.$inputId.'_slider_input" ).val(ui.values[0]+"-"+ui.values[1]);';
		}else{
			$html.='$( "#'.$inputId.'_slider_value" ).text("'.$prefix.'"+$( "#'.$inputId.'_slider_range" ).slider( "value" )+"'.$suffix.'");';
			$strConfig.='$( "#'.$inputId.'_slider_input" ).val(ui.value);';
		}
		
	$html.='});
	</script>';
		return $html;
		
	}
	/**
	 * 
	 * @param string $name
	 * @param mixed $params
	 */
	public function number($name,$params= array()){
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
			$field_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
		
		$config = $params['config'];
				
		if($value === NULL){			
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		
		$params['class'].=' numberInput';
		if(strpos(strtolower($params['rules']),'numeric')===false) $params['rules'] .='|numeric';
		
		$extra = $this->_buildParam ($params);
		
		$inputId = $params['id'];
		
		$html = '';
		$html.= $html_s.'<div class="numberInput">'.form_input($name, $value, $extra).'
							<span id="'.$inputId.'_numberUp" class="numberUp"></span>
							<span  id="'.$inputId.'_numberDown"  class="numberDown"></span></div>'.$html_e.$field_e;
		$html.='<script>
					$(document).ready(function(){
						$("#'.$inputId.'_numberUp").click(function(){
							val  = parseInt($("#'.$inputId.'").val(),10)
							if(!val) val = 0;
							val = val + 1;
							';
		if(isset($config['max'])) $html.= ' if(val>'.$config['max'].') val = '.$config['max'].'; ';
		$html.='			$("#'.$inputId.'").val(val);
						});
						
						$("#'.$inputId.'_numberDown").click(function(){
							val  = parseInt($("#'.$inputId.'").val(),10) 
							if(!val) val = 0;
							val = val - 1;';
		if(isset($config['min'])) $html.= ' if(val<'.$config['min'].') val = '.$config['min'].'; ';
		$html.='			$("#'.$inputId.'").val(val);
						});
						
						$("#'.$inputId.'").keydown(function(event){
						// Allow: backspace, delete, tab, escape, and enter
						
							if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
									// Allow: Ctrl+A
									(event.keyCode == 65 && event.ctrlKey === true) ||
									// Allow: home, end, left, right
									(event.keyCode >= 35 && event.keyCode <= 39)) {
								
								return;
							}
								else {
								
									// Ensure that it is a number and stop the keypress
									if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || (event.keyCode > 105 && event.keyCode!=173) )) {
										
										event.preventDefault();
									}
										
								
									
							}
							
							$("#'.$inputId.'").keyup(function(event){
	
								';
		if(isset($config['max'])) $html.= ' if(parseInt($("#'.$inputId.'").val(),10)>'.$config['max'].'){
												$("#'.$inputId.'").val('.$config['max'].'); 
												event.preventDefault();
										}';
		if(isset($config['min'])) $html.= ' if(parseInt($("#'.$inputId.'").val(),10)<'.$config['min'].'){
											 $("#'.$inputId.'").val('.$config['min'].');
											event.preventDefault();
										}';
			
							$html.='
							});
		
						});
						
						w = ($("#'.$inputId.'").width()) +7;
						$("#'.$inputId.'_numberUp").show().css("left",w+"px");
						$("#'.$inputId.'_numberDown").show().css("left",w+"px");
					});
		
				</script>';
		return $html;
	}

    public  function color($name,$params = array()){
       // debug($params);
        $preName = $this->_getName($name);
        $input_name = "data[".$this->controller.']'.$preName;
        $name = "data[".$this->controller.']'.$preName;
        $key =   str_replace(array('[',']'), '',$preName);

        if($params['label']){
            $html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
            $html_e = $this->config['input_end'];
            $field_e = $this->config['end'];
        }else{
            $html_s = '';
            $html_e = '';
            $field_e = '';
        }
        $options = $params['options'];

        $tooltip = ($params['tooltip'])? buildInputTooltip($params['tooltip']):'';

        $value = (isset($params['value']))? $params['value'] : NULL;

        if($value === NULL){
            if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
        }

        $extra = $this->_buildParam ($params);
        $inputId = $params['id'];


        $input = '<input type="hidden" name="'.$input_name.'" id="'.$inputId.'_color_input" value="'.$value.'"/>';
        $input.='<ul class="form_clor_block" id="color_select_'.$inputId.'">';

        foreach($options as $k=>$c){
            $selected = ($k == $value)?"form_colors_selected":"";
            //echo $selected;
            $input.='<li><a class="form_colors '.$selected.'" rel="tooltip" data-toggle="tooltip" name="'.$k.'" title="'.$c.'" style=" background:#'.$k.'"></a></li>';
        }
        $input.='<li id="'.$inputId.'_color_label" class="form_colors_label"></li>';
        $input.="</ul>";

        $input.="<script>
               $(document).ready(function(){
                    $('#'+'color_select_".$inputId." .form_colors').click(function(){
                        $(this).closest('UL').find('.form_colors').removeClass('form_colors_selected');
                        $('#".$inputId."_color_label').html($(this).attr('title'));
                        $('#".$inputId."_color_input').val($(this).attr('name'));
                        $(this).addClass('form_colors_selected');
                    });
               });
        </script>";

        return $html_s.$input.$tooltip.$html_e.$field_e;
    }
	/**
	 * 
	 * @param unknown_type $name
	 * @param unknown_type $params
	 */
	public function latlong($name,$params=array()){
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		$params['label'] = 'Latitude/Longitude';
		$params['readonly'] = 'readonly';
		
		$address = $params['data'];
		$preview = $params['preview'];
		$func = ($params['function'])?$params['function']:'openGoogleMap';

		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
			$field_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
		
		$params['class'] .= ' latlongInput';
		
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		
		$extra = $this->_buildParam ($params);
		$inputId = $params['id'];
		
		$html =  $html_s.'<div class="googleMapInput">'.form_input($name, $value, $extra);
		
		$html.= '<span id="'.$inputId.'_pickup" class="googleMapButton"></span></div>';
		
		$html.= $html_e.$field_e;
		
		$html.='<script>
				$(document).ready(function(){
						w = ($("#'.$inputId.'").width())+20;
						$("#'.$inputId.'_pickup").show().css("left",w+"px").css("top","0px");
						$("#'.$inputId.'_pickup").click(function(){
							val = $("#'.$inputId.'").val();
							if(!val) val = 0;						
							Common.'.$func.'("'.$inputId.'",val,"'.$address.'","'.$preview.'");
						});
						
				});
		</script>';
		
		return $html;
	}
	/**
	 * Textarea field
	 *
	 * @param	string
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function textarea($name = '',  $params = array())
	{
		
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		
		$key =   str_replace(array('[',']'), '',$preName);
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
			
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		
		$extra = $this->_buildParam ($params);
		
		return $html_s.form_textarea($name, $value, $extra).$html_e.$field_e;
	}
	/**
	 * Textarea editor
	 *
	 * @param	string
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function texteditor($name = '',  $params = array()){
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		
		$key =   str_replace(array('[',']'), '',$preName);

		$config = $params['config'];
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
			
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		
		$extra = $this->_buildParam ($params);
		$inputId = $params['id'];
		
		$html = form_textarea($name, $value, $extra);
		if($config['type']=='innova'){
			$html.='<script>
		var oEdit'.$inputId.' = new InnovaEditor("oEdit'.$inputId.'");
		oEdit'.$inputId.'.toolbarMode = 0;
			oEdit'.$inputId.'.REPLACE("'.$inputId.'");
		  </script>';
		}else{
			$html.='
			<script>
				$(\'#'.$inputId.'\').wysiwyg();
			</script>';
		}
		
		return $html_s.$html.$html_e.$field_e;
	}

	/**
	 * Textarea editor
	 *
	 * @param	string
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function ckeditor($name = '',  $params = array()){
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;

		$key =   str_replace(array('[',']'), '',$preName);

		$config = $params['config'];

		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}

		$value = (isset($params['value']))? $params['value'] : NULL;

		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}

		$extra = $this->_buildParam ($params);
		$inputId = $params['id'];

		$html = form_textarea($name, $value, $extra);

		$editor_config = array();
		if($config['lang']) $editor_config[] = 'config.language = \''.$config['lang'].'\'';
		$base_uri = base_uri();
		if($config['uploadfile']) $editor_config[] = '
					filebrowserBrowseUrl : \''.$base_uri.'asset/ck/browse.php?opener=ckeditor&type=files \',
				    filebrowserImageBrowseUrl :  \''.$base_uri.'asset/ck/browse.php?opener=ckeditor&type=images \',
				    filebrowserFlashBrowseUrl :  \''.$base_uri.'asset/ck/browse.php?opener=ckeditor&type=flash \',
				    filebrowserUploadUrl :  \''.$base_uri.'asset/ck/upload.php?opener=ckeditor&type=files \',
				    filebrowserImageUploadUrl :  \''.$base_uri.'asset/ck/upload.php?opener=ckeditor&type=images \',
				    filebrowserFlashUploadUrl :  \''.$base_uri.'asset/ck/upload.php?opener=ckeditor&type=flash \'';


		$editor_config = '{'.implode(',',$editor_config).'}';

		$html.='<script>
    		CKEDITOR.replace("'.$inputId.'",'.$editor_config.');
  		</script>';

		return $html_s.$html.$html_e.$field_e;
	}
	
	/**
	 * Multi-select menu
	 *
	 * @param	string
	 * @param	array
	 * @param	mixed
	 * @param	string
	 * @return	string
	 */
	public  function multiselect($name = '', $params = array())
	{
				
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
				
		$options = $params['options'];
		$selected = $params['selected'];
		
		//localize
		foreach($options as $key=>$val)  $options[$key] = __($val);
		
		$extra = $this->_buildParam ($params);
		return $html_s.$this->dropdown($name, $options, $selected, $extra).$html_e.$field_e;
	}
	
	/**
	 * Drop-down Menu
	 *
	 * @param	string
	 * @param	array
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function dropdown($name = '', $params = array())
	{

		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		
		$key =   str_replace(array('[',']'), '',$preName);
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
						
		$options = $params['options'];
		$selected = $params['selected'];
		
		if(!$selected){
			if($this->formData) $selected = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		
		//localize
		$newOption = array();
		if($params['empty']) $newOption[''] = __($params['empty']);
		foreach ($options as $key=>$val) $newOption[$key] = __($val);
		
		$extra = $this->_buildParam ($params);
		
		return $html_s.form_dropdown($name, $newOption , $selected, $extra).$html_e.$field_e;
	}

	/**
	 * Drop-down Menu
	 *
	 * @param	string
	 * @param	array
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function select($name = '', $params = array())
	{
		//debug($params);
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
		$inline = '';
		if($params['inline']){
			$inline = 'inlineBlock';
			unset($params['inline']);
		}

		$params['class'] .=" buttonSelect";

		$key =   str_replace(array('[',']'), '',$preName);

		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}

		$config = array('enableCaseInsensitiveFiltering:true');
		if(!empty($params['config'])) foreach($params['config'] as $k=>$v){
			$config[]= $k.':'.$v;
		}

		$value = (isset($params['value']))? $params['value'] : NULL;

		$options = $params['options'];

		$selected = $params['selected'];

		if(!$selected){
			if($this->formData) $selected = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}

		//localize
		$newOption = array();
		if($params['empty']) $newOption[''] = __($params['empty']);
		foreach ($options as $key=>$val) $newOption[$key] = __($val);

		$extra = $this->_buildParam ($params);
		$inputId = $params['id'];

		$html = "<div class='$inputId $inline selectFormItem'>".$html_s.form_dropdown($name, $newOption , $selected, $extra).$html_e.$field_e."</div>";

		$html.='<script type="text/javascript">
            $(document).ready(function() {
            $("#'.$inputId.'").multiselect({'.implode(',',$config).'});
        });
        </script>';
		return $html;
	}
	
	
	/**
	 * Return Check radio button
	 * @param	string
	 * @param	string
	 * @param	bool
	 * @param	string
	 * @return	string
	 */
	public function radio($name = '', $params = array()){
		$gname = $name;
		$preName = $this->_getName($name);
		$name = "data[".$this->controller.']'.$preName;
	
		$key =   str_replace(array('[',']'), '',$preName);
	
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}
	
		$value = (isset($params['value']))? $params['value'] : NULL;
		if(isset($params['options'])) $value = $params['options'];
		
		$rules = (isset($params['value']))? $params['rules'] : NULL;
		$params['rules'] = NULL;
		$cval = $params['checked'];
	
		$str = '<div id="group_'.$gname.'" class="inputGroup '.$params['class'].'" rules="'.$rules.'">';
		$extra = $this->_buildParam ($params);
		$id = $params['id'];

		if(is_array($value)){
			$i = 0;
			unset($params['class']);
			foreach($value as $val=>$label){
				$str.="<label class='label-radio'>";
				if($this->formData && is_object($this->formData) && isset($this->formData->$key)){
					$cval = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;					
				}

				$i++;
				$params['id'] = $id."_$i";
				$extra = $this->_buildParam ($params);
				$checked = ($val==$cval);
				
				$str .= form_radio($name, $val, $checked, $extra);
				$str.="<span>".__($label)."</span>";
				$str.="</label>";
			}
		}else{
			$checked = ($value==$cval);
			$str.= form_radio($name, $value, $checked, $extra);
		}
		$str.= '</div>';
		return $html_s.$str.$html_e.$field_e;
	}
	
	
	/**
	 * Checkbox Field
	 *
	 * @param	string
	 * @param	string
	 * @param	bool
	 * @param	string
	 * @return	string
	 */
	public function checkbox($name = '',$params = array()){
		$gname = $name;
		$preName = $this->_getName($name,false);
		$name = "data[".$this->controller.']'.$preName;
		
		$key =   str_replace(array('[',']'), '',$preName);
		$params['class'] .= ' checkBox_Group';
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label'],array('tooltip'=>$params['tooltip'])).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}

		$extra_label = $params['extra_label'];
		unset($params['extra_label']);
		
		$value = (isset($params['value']))? $params['value'] : NULL;
		$checked = array();
		
		if(isset($params['options'])) $value = $params['options'];
		
		$rules = (isset($params['rules']))? $params['rules'] : NULL;
		$params['rules'] = NULL;
		$checked = (is_array($params['checked']))?$params['checked']:$params['checked'];
		
		
		$extra = $this->_buildParam ($params);
		
//		print_r($checked);
				
		$str = '<div id="group_'.$gname.'" class="inputGroup '.$params['class'].'" rules="'.$rules.'">';
		
		if(is_array($value)){

			if(!isset($params['checked']) && $this->formData){
				$db = is_array($this->formData)? $this->formData[$key]:$this->formData->{$key};
				if($db){
					$checked = is_array($db)?$db:json_decode($db);
				}else{
					$checked = array();
				}

				if(!is_array($checked)) $checked = json_decode($checked);
			}
			
			foreach($value as $val=>$label){
				$str.="<label class='label-radio'>";
				$isChecked = @in_array($val, $checked);
					
				$str .= form_checkbox($name.'[]', $val, $isChecked, '');

				$str.=" <span>$label</span>";

				$str.="</label>";
			}
			
		}else{

			if(!$checked){
				if($this->formData && is_object($this->formDat) && isset($this->formData->$key)){
					$cval = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
					$checked = ($value==$cval);
				}
			}
			
			$str.= '<label class="inlineBlock">'.form_checkbox($name, $value, $checked, $extra).' '.__($extra_label).'</label>';
		}
		
		$str.='</div>';
		
		return 	$html_s.$str.$html_e.$field_e;
	}
	
	/**
	 * True False
	 * @param string $name
	 * @param mixed $params
	 * @return string
	 */
	function yesno($name,$params= array()){
		$params['value'] = array(1=>__('LBL_YES'),0=>__('LBL_NO'));
		return $this->radio($name,$params);
	}
	
	/**
	 * Display status
	 * @param string $name
	 * @param mixed $params
	 */
	function status($name,$params = array()){
		$params['value'] = array(1=>__('Active'),0=>__('Deactive'));
		return $this->radio($name,$params);
	}
	
	/**
	 * Language Picker
	 * @param string $name
	 * @param mixed $params
	 * @return string
	 */
	function language($name,$params = array()){
		$preName = $this->_getName($name);
		$input_name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		
		$onClick = '';
		if($params['onclick']) $onClick = 'onclick="'.$params['onclick'].'"';
		
		$CI = &get_instance();
		$aryLang = $CI->config->item('lang_avail');
		
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
			
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
				                     
		$html = '';
		$params['id'] = $name.'_hidden';
		$html.= '<input type="hidden" name="'.$input_name.'" id="'.$name.'_hidden'.'" value="'.$value.'" />';
		$html.= '<div class="pickerWrap '.$params['class'].'" ><ul class="languageInput"><li id="langPicker_'.$name.'" class="dropdown">';
		
		$curentLang = @is_array($this->formData)?$this->formData[$name]:$this->formData->$name;
		
		if($params['value']) $curentLang = $params['value'];
		
		if(!$curentLang){$curentLang = 0; array_unshift($aryLang ,__("Select Language"));}
		
		//debug($aryLang,false);
		
		$html.= '<a  data-toggle="dropdown" class="dropdown-toggle" id="langPickerLabel_'.$name.'"><div class="flag flag-'.$curentLang.'"></div>'.__(ucwords($aryLang[$curentLang])).'<b class="caret"></b></a>';
		$html.='<ul class="dropdown-menu">';
		foreach($aryLang as $key=>$val){
		    $html.= '<li><a alt="'.$key.'" '.$onClick.' class="languageInputItem"><div class="flag flag-'.$key.'"></div>'.__(ucwords($val)).'</a></li>';                                	
		}
		$html.='</ul></ul></div>';
		$html.= '<script type="text/javascript">
		$(document).ready(function(){
			$("#langPicker_'.$name.' .languageInputItem").bind("click",function(){
					$("#langPickerLabel_'.$name.'").html($(this).html()+"<b class=\"caret\"></b>");		
					$("#'.$name.'_hidden").val($(this).attr("alt"));
					
			});
		});
		</script>';
		return $html_s.$html.$html_e.$field_e;
		
	}
	
	/**
	 * Language Picker
	 * @param string $name
	 * @param mixed $params
	 * @return string
	 */
	function languageView($name,$params = array()){
		$preName = $this->_getName($name);
		$input_name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
	
		$onClick = '';
		if($params['onclick']) $onClick = 'onclick="'.$params['onclick'].'"';
	
		$CI = &get_instance();
		$aryLangAvail = $CI->config->item('lang_avail');
		
		$aryLang = array($this->formData->lang =>$aryLangAvail[$this->formData->lang]);
		if($this->formData->translation){
			$translations = json_decode($this->formData->translation);
			foreach($translations as $item){
				$aryLang[$item->lang] = $aryLangAvail[$item->lang];
			}
		}
		//debug($this->formData);
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}
	
		$value = (isset($params['value']))? $params['value'] : NULL;
			
		if($value === NULL){
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
		}
		 
		$html = '';
		$params['id'] = $name.'_hidden';
		$html.= '<input type="hidden" name="'.$input_name.'" id="'.$name.'_hidden'.'" value="'.$value.'" />';
		$html.= '<div class="pickerWrap" ><ul class="languageInput"><li id="langPicker_'.$name.'" class="dropdown">';
	
		$curentLang = @is_array($this->formData)?$this->formData[$name]:$this->formData->$name;
	
		if($params['value']) $curentLang = $params['value'];
	
		if(!$curentLang){
			$curentLang = 0; array_unshift($aryLang ,__("Select Language"));
		}
	
		//debug($aryLang,false);
	
		$html.= '<a  data-toggle="dropdown" class="dropdown-toggle" id="langPickerLabel_'.$name.'"><div class="flag flag-'.$curentLang.'"></div>'.__(ucwords($aryLang[$curentLang])).'<b class="caret"></b></a>';
		$html.='<ul class="dropdown-menu">';
		foreach($aryLang as $key=>$val){
			$html.= '<li><a alt="'.$key.'" '.$onClick.' class="languageInputItem"><div class="flag flag-'.$key.'"></div>'.__(ucwords($val)).'</a></li>';
		}
		$html.='</ul></ul></div>';
		$html.= '<script type="text/javascript">
		$(document).ready(function(){
		$("#langPicker_'.$name.' .languageInputItem").bind("click",function(){
		$("#langPickerLabel_'.$name.'").html($(this).html()+"<b class=\"caret\"></b>");
		$("#'.$name.'_hidden").val($(this).attr("alt"));
			
	});
	});
	</script>';
		return $html_s.$html.$html_e.$field_e;
	
	}
	
	public function note($str,$param=array()){
		$extra = $this->_buildParam($param);
		$id = $param['id'];
		if($param['label']){
			return '<div id="'.$id.'" class="control-group" '.$extra.'><div class="note">'.__($str).'</div></div>';
		}else{
			return '<div id="'.$id.'" class="control-group '.$param['class'].'"><label class="control-label"></label><div class="controls"><div class="note">'.__($str).'</div></div></div>';
		}

	}
	
	public function agree($name,$url,$params = array(),$nolabel = false){
		$checkbox = $this->checkbox($name,$params);
		
		if($nolabel){
			return '<div class="control-group"><div>'.$checkbox." ".__("i agree with the")." ". anchor($url,"terms and conditions",array('class'=>'linkTerms','onclick' => "return Common.linkSetup(this,{ajax:true,overlay:true,title:'".__("Terms and conditions")."'})")).'</div></div>';
		}else
			return '<div class="control-group"><label class="control-label"></label><div class="controls"><div>'.$checkbox." ".__("i agree with the")." ". anchor($url,"terms and conditions",array('class'=>'linkTerms','onclick' => "return Common.linkSetup(this,{ajax:true,overlay:true,title:'".__("Terms and conditions")."'})")).'</div></div></div>';
	}
		
	/**
	 * Submit Button
	 *
	 * @param	string
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function submit($name = '',$params = array()){
						
		if(! $params['class']) $params['class'] = 'button button-green';
		
		if(! $params['label'])  $value = ucwords(strtolower($name));
		else $value = $params['label'];
		
		$extra = $this->_buildParam ($params);		
		
		return form_submit($name, __($value), $extra);
	}
	
	/**
	 * return Link submit form
	 * @param string $value
	 * @param string $extra
	 * @return string
	 */
	public function linkSubmit($value,$params = array()){
		
		$params['onclick'] = '$(\'#'.$this->formId.'\').submit(); return false;';
		
		$extra = $this->_buildParam ($params);
		
		return anchor('#',$value,$extra);
	}
	
	/**
	 * Reset Button
	 *
	 * @param	string
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function reset($name = '', $params = array()){
		
		if(! $params['class']) $params['class'] = 'button button-gray';
		
		if(! $params['label'])  $value = ucwords(strtolower($name));
		else $value = $params['label'];
		
		$extra = $this->_buildParam ($params);
		
		return form_reset($name , __($value) , $extra);
	}
	
	/**
	 * Clear Button
	 *
	 * @param	string
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function clear($name = '', $params = array()){
		
		if(! $params['class']) $params['class'] = 'button button-gray';
		
		if(! $params['label'])  $value = ucwords(strtolower($name));
		else $value = $params['label'];
		
		$params['onclick'] .= 'Common.clearForm(this)';
		
		$extra = $this->_buildParam ($params);
		
		return form_submit($name , __($value) , $extra);
	}
	
	/**
	 * Form button Close Overlay
	 * @param string $name
	 */
	public function close($name='', $params = array()){
		
		if(! $params['class']) $params['class'] = 'button button-gray';
		
		if(! $params['label'])  $value = ucwords(strtolower($name));
		else $value = $params['label'];
		
		$params['onclick'] = 'Common.closeOverlay()';
		
		$extra = $this->_buildParam ($params);
		
		return form_button($name , __($value) , $extra);
	}
	
	/**
	 * Form button Back to Url
	 * @param string $name
	 */
	public function back($name='',$url='',$params = array()){
		
		if(! $params['class']) $params['class'] = 'button button-gray';
		
		if(! $params['label'])  $value = ucwords(strtolower($name));
		else $value = $params['label'];
		
		$params['onclick'] = 'Common.goUrl(\''.$url.'\')';
		
		$extra = $this->_buildParam ($params);
				
		return form_button($name , __($value) , $extra);
	}
	
	
	/**
	 * Form Button
	 *
	 * @param	mixed
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public function button($name = '', $params = array()){
		if(! $params['class']) $params['class'] = 'button button-green';
		
		if(! $params['label'])  $value = ucwords(strtolower($name));
		else $value = $params['label'];
		if($params['url']){
			$params['onclick'] = 'Common.goUrl(\''.$params['url'].'\')';
		}
		$extra = $this->_buildParam ($params);
		
		return form_button($name, __($value), $extra);
	}
	
	/**
	 * Form Label Tag
	 *
	 * @param	string	The text to appear onscreen
	 * @param	string	The id the label applies to
	 * @param	string	Additional attributes
	 * @return	string
	 */
	public function label($label_text = '', $attributes = array()){

		$attributes['class'] = 'control-label';
		$tooltip='';
		$id = $attributes['id'];
		if($attributes['tooltip']){
			$tooltip = ' <i rel="tooltip" data-original-title="'.__($attributes['tooltip']).'" class="icon-question-sign iconhelp"></i>';
			$attributes['tooltip'] = '';
		}
		return form_label(__($label_text).$tooltip,$id,$attributes);

	}


	public function tag($name = '', $params = array()){
		$params['data-role'] = 'tagsinput';
		$params['class'] .= ' tagsInput';
		$html =  $this->input($name,$params);
		$html.="<script>
			$(document).ready(function(){
				$('.tagsInput').tagsinput({
					trimValue: true,
					itemText: function(item) {
						item = item.replace( /\s\s+/gmi, ' ' );
						return item;

					}
				});
			})

			</script>";
		return $html;
	}
	
	public function importMember($name,$params = array()){
		$preName = $this->_getName($name);
		$preNameTitle = $this->_getName($name.'_title');
		$name = "data[".$this->controller.']'.$preName;
		$name_title = "data[".$this->controller.']'.$preNameTitle;
		$key =   str_replace(array('[',']'), '',$preName);

		$data = $params['data'];
		$config = ($params['config']=='radio')?'radio':'checkbox';
		$title = $params['label'];
				
		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
			$field_e = '';
		}
		
		$value = (isset($params['value']))? $params['value'] : NULL;
		
				
		if($value === NULL){
			
			if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;
			
		}
		
		$extra = $this->_buildParam ($params);
		$inputId = $params['id'];
		
		$aryName = '';
		if($config=='checkbox') $aryName='[]';
		
		$html =  $html_s.'<div style="display:inline-block;">
				<input type="hidden" id="'.$inputId.'_hidden" value="'.htmlspecialchars('<input type="hidden" name="'.$name.$aryName.'"/>').'"/>
				<input type="hidden" id="'.$inputId.'_hiddenTitle" value="'.htmlspecialchars('<input type="hidden" name="'.$name_title.$aryName.'"/>').'"/>
				<div id="'.$inputId.'_wrap" class="inlineBlock">';
        if($value){

            $value = json_decode($value);
            if(!is_array($value)) $options[] = $value;
            else $options = $value;
            //$options = getDBDropdown(array('table'=>'sys_member','key'=>'memberId','val'=>'fullName','where'=>array('memberId'=>$value),'select'=>'CONCAT(firstName,\' \',lastName) as fullName'));
            foreach ($options as $val){
                $html.= '<span class="items items_'.$val->id.'">
                <input type="hidden" name="'.$name.$aryName.'" value="'.$val->id.'">
                <input type="hidden" name="'.$name_title.$aryName.'" value="'.$val->name.'">
                <span>'.$val->name.'</span> <a onclick="Common.removeMember(this)" class="pointer"><i class="icon-remove"></i></a></span>';
            }
		
        }
		
		$html.='</div>';
		
		$html.= '<span id="'.$inputId.'_select" class="btn">'.__("Select").'</span></div>
		<input style="width:0px;height:0px;overflow:hidden;border:0px!important;box-shadow:none;transition:none;" type="text" class="inputRule" name="'.$inputId.'_check" value="" id="'.$inputId.'_require" rules="'.$params['rules'].'"/>';
		
		$html.= $html_e.$field_e;
		
		$html.='<script>
		$(document).ready(function(){
		
		$("#'.$inputId.'_select").click(function(){
				var url = "'.site_url('common/importmember/index/'.$inputId.'/'.$config.'/'.$data).'"; 
				var addOverlay = Overlay.panel({\'id\':\'importmember_overlay\'});
				addOverlay.open({title:"'.__($title).'",url:url,data:"'.$data.'"});
		});
		
		});
		</script>';
		//debug($html);
		return $html;
	}



    public function importMember2($name,$params = array()){
        $preName = $this->_getName($name);
        $preNameTitle = $this->_getName($name.'_title');
        $name = "data[".$this->controller.']'.$preName;
        $name_title = "data[".$this->controller.']'.$preNameTitle;
        $key =   str_replace(array('[',']'), '',$preName);

        $data = $params['data'];
        $config = ($params['config']=='radio')?'radio':'checkbox';
        $title = $params['label'];

        if($params['label']){
            $html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
            $html_e = $this->config['input_end'];
            $field_e = $this->config['end'];
        }else{
            $html_s = '';
            $html_e = '';
            $field_e = '';
        }

        $value = (isset($params['value']))? $params['value'] : NULL;


        if($value === NULL){

            if($this->formData)$value = is_array($this->formData)?$this->formData[$key]:$this->formData->$key;

        }

        $extra = $this->_buildParam ($params);
        $inputId = $params['id'];

        $aryName = '';
        if($config=='checkbox') $aryName='[]';

        $html =  $html_s.'<div style="display:inline-block;">
				<input type="hidden" id="'.$inputId.'_hidden" value="'.htmlspecialchars('<input type="hidden" name="'.$name.$aryName.'"/>').'"/>
				<input type="hidden" id="'.$inputId.'_hiddenTitle" value="'.htmlspecialchars('<input type="hidden" name="'.$name_title.$aryName.'"/>').'"/>
				<div id="'.$inputId.'_wrap" class="inlineBlock">';



        $options = getDBDropdown(array('table'=>'sys_member','key'=>'memberId','val'=>'fullName','where'=>array('memberId'=>$value),'select'=>'*,CONCAT(firstName,\' \',lastName) as fullName'));
        foreach ($options as $key=>$val){
            $html.= '<span class="items items_'.$key.'">
			<input type="hidden" name="'.$name.$aryName.'" value="'.$key.'">
			<input type="hidden" name="'.$name_title.$aryName.'" value="'.$val.'">
			<span>'.$val.'</span> <a onclick="Common.removeMember(this)" class="pointer"><i class="icon-remove"></i></a></span>';
        }



        $html.='</div>';

        $html.= '<span id="'.$inputId.'_select" class="btn">'.__("Select").'</span></div>
		<input style="width:0px;height:0px;overflow:hidden;border:0px!important;box-shadow:none;transition:none;" type="text" class="inputRule" name="'.$inputId.'_check" value="" id="'.$inputId.'_require" rules="'.$params['rules'].'"/>';

        $html.= $html_e.$field_e;

        $html.='<script>
		$(document).ready(function(){

		$("#'.$inputId.'_select").click(function(){
				var url = "'.site_url('common/importmember/index/'.$inputId.'/'.$config.'/'.$data).'";
				var addOverlay = Overlay.panel({\'id\':\'importmember_overlay\'});
				addOverlay.open({title:"'.__($title).'",url:url,data:"'.$data.'"});
		});

		});
		</script>';
        //debug($html);
        return $html;
    }
	/**
	 * return name of object
	 * register name to token stack
	 * @param string $name
	 * @return string
	 */
	private function _getName($name,$isToken = true){
		
		$class = strtolower($this->controller);
		
		if(strpos($name,'[')){
			$pos = strpos($name,'[');
			$len = strlen($name);
			if($isToken) $this->_arrayToken[] = $class.'['.substr($name,0,$pos).']';
			return '['.substr($name,0,$pos).']'.substr($name,$pos,$len-$pos);
		}else{
			if(!$isToken)  $this->_arrayToken[] = $class.'['.$name.']';
			return '['.$name.']';
		}
	}
	
	/**
	 * added attribute ID for element form
	 * @param string $extra
	 */
	private function _getElemetId(){
		
		$this->element ++;
		return $this->formId.'_'.$this->element;
			
	}
	
	/**
	 * End of form
	 * @param string $extra
	 * @return string
	 */
	public function end($extra=''){
		$ci = &get_instance();
		$str = '';
		$token_data = password(implode(',',array_unique($this->_arrayToken)));
		$ci->session->set_userdata('formSession['.$this->formId.']',$token_data);
		$str.= $this->hidden('__token',array('value'=>$token_data));
		$str.= form_close($extra);
        if($this->focus_first){
            $str.= $this->firstFocus();
        }
		return $str;
	}


	public function setFirstFocus($status){
		$this->focus_first = $status;
	}

	/**
	 * Focus first element
	 * @param string $extra
	 * @return string
	 */
	public function firstFocus(){
        $str ="<script> $(document).ready(function(){
            $('#".$this->formId." :input:enabled:visible:first').focus();
        });</script>";
        return $str;
    }

    public function json($name,$params = array()){
        $preName = $this->_getName($name);
        $input_name = "data[".$this->controller.']'.$preName;
        $key =   str_replace(array('[',']'), '',$preName);

        if($params['label']){
            $html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
            $html_e = $this->config['input_end'];
            $field_e = $this->config['end'];
        }else{
            $html_s = '';
            $html_e = '';
        }

        if($params['config']) $params['config'] = json_decode($params['config']);
        $config = $params['config'];

		$default = ($params['default'])?intval($params['default']):1;
		$max_item = intval($params['max_item']);
        //debug($params['config']);
        $len = intval(count($params['config']));
                 $input = '';

        $extra = $this->_buildParam ($params);
        $inputId = $params['id'];
        $input .= '<div id="jsonWrap_'.$key.'">

        <div class="jsonContent">';
        $k = 0;
        if($this->formData->{$key} || $params['ignore_check_form']){
            //edit
			if($params['ignore_check_form']){
				$data  = json_decode($params['contains']);
			}else{
				if(!is_array($this->formData->{$key})) $this->formData->{$key} = json_decode($this->formData->{$key});
				$data  = $this->formData->{$key};
			}

            if($data)foreach($data as $k=>$item){
				$k ++;
                $input .= '<div class="jsonItem">';
                for($i=0;$i<$len;$i++){
                    $input .= '<input type="text" class="'.$params['class'].'" name="'.$input_name.'['.$k.']['.$i.']" value="'.$item.'" placeholder="'.__($config[$i]).'"/> ';
					if($k>0){
						$input .='<a class="btn-remove" onclick="Common.removeParent(this);"><i class="action-icon-trash fa fa-trash-o"></i></a>';
					}
                }


                $input .='</div>';
            }
        }else{
            //insert
			for($j=0;$j< $default;$j++){
				$k ++;
				$input .= '<div class="jsonItem">';

				for($i=0;$i<$len;$i++){
					$input .= '<input type="text" class="'.$params['class'].'" name="'.$input_name.'['.$k.']['.$i.']" value="" placeholder="'.__($config[$i]).'"/> ';
				}

				if($j>0){
					$input .='<a class="btn-remove" onclick="Common.removeParent(this);"><i class="action-icon-trash fa fa-trash-o"></i></a>';
				}

				$input .='</div>';
			}
        }
        $input .='</div>';

        $input .= '<div class="add-more" ><a class="addMore"><i class="icon-plus fa fa-plus"></i>'.__("Add more").'</a></div>

        <div class="clear"></div>
        </div>
        ';

        $input.='<script>
            var k_'.$key.' = '.$k.';
            $(\'#jsonWrap_'.$key.' .addMore\').click(function(){
                var input_'.$key.' = \'<div class="jsonItem">\';';
                for($i=0;$i<$len;$i++){
                    $input .= '  input_'.$key.' +=\'<input type="text" class="'.$params['class'].'" name="'.$input_name.'[\'+k_'.$key.'+\']['.$i.']" value="" placeholder="'.__($config[$i]).'"/> \';';

                }
                $input .= 'input_'.$key.' +=\'<a class="btn-remove" onclick="Common.removeParent(this);$(\\\'#jsonWrap_'.$key.' .addMore\\\').show();k_'.$key.'--;"><i class="action-icon-trash fa fa-trash-o"></i></a></div> \';';


				//$input .='alert(input_'.$key.')';
				$input .= '  $(\'#jsonWrap_'.$key.' .jsonContent\').append(input_'.$key.');
                 k_'.$key.'++;
                ';
				if($max_item){
					$input .=' if(k_'.$key.' >='.$max_item.'){ $("#jsonWrap_'.$key.' .addMore").hide();return false;}';
				}

         $input .='});
        </script>';

        $html =  $html_s;
        $html .= $input;
        $html.= $html_e;

//        $html.= $html_e.$field_e;
       // die($html);
        return $html;
    }


	public function json2($name,$params = array()){
		$preName = $this->_getName($name);
		$input_name = "data[".$this->controller.']'.$preName;
		$key =   str_replace(array('[',']'), '',$preName);
		$class= $params['class'];
		$rules = $params['rules'];
		$default = ($params['default'])?intval($params['default']):1;

		if($params['label']){
			$html_s = $this->config['start'].$this->label($params['label']).$this->config['input_start'];
			$html_e = $this->config['input_end'];
			$field_e = $this->config['end'];
		}else{
			$html_s = '';
			$html_e = '';
		}

		if($params['config']) $params['config'] = json_decode($params['config']);
		$config = $params['config'];
		//debug($params['config']);
		$len = intval(count($params['config']));
		$input = '';

		$extra = $this->_buildParam ($params);
		$inputId = $params['id'];
		$input .= '<div id="jsonWrap_'.$key.'">

        <div class="jsonContent">';
		$k = 0;
		if($this->formData->{$key}){
			//edit
			if(!is_array($this->formData->{$key})) $this->formData->{$key} = json_decode($this->formData->{$key});
			$data  = object_to_array($this->formData->{$key});

			if($data)foreach($data as $k=>$item){
//				debug($item);
				$input .= '<div class="jsonItem">';
				$j=0;
				foreach($item as $i=>$v){
					$input.= $this->input($name.'['.$k.']['.$j.']',array('label'=>$config[$j],'value'=>$v,'placeholder'=>$config[$j],'rules'=>$rules,'class'=>$class));
					$j++;
				}
//
				$input .='</div>';
			}
		}else{
			//insert
			for($j=0;$j<$default;$j++) {
				$input .= '<div class="jsonItem">';

				for ($i = 0; $i < $len; $i++) {
					$input .= $this->input($name.'[' . $k . '][' . $i . ']', array('label' => $config[$i], 'value' => "", 'placeholder' => $config[$i], 'rules' => $rules, 'class' => $class));
				}

				$input .= '</div>';
			}

		}
		$input .='</div>';

		$input .= '
        </div>
        <div class="clear"></div>
        </div>
        ';
		$k ++;


		$html =  $html_s;
		$html .= $input;
		$html.= $html_e;
//        $html.= $html_e.$field_e;
		// die($html);
		return $html;
	}

	/**
	 * Form Prep
	 *
	 * Formats text so that it can be safely placed in a form field in the event it has HTML tags.
	 *
	 * @param	string
	 * @param	string
	 * @return	string
	 */
	public  function fillData($fillData){
		$this->formData = $fillData;
	}
	/**
	 * Show div clear
	 */
	public  function divClear(){
		return "<div class='clear'></div>";
	}
	/**
	 * View Item
	 * @param string $label
	 * @param string $value
	 * @param string $type : text, image, gallery, audio
	 */
	public  function view($label,$value,$type='text',$config=array()){
        $html = '';
		if($value){

			switch(strtolower($type)){
				case 'lang':
					$CI = &get_instance();
					$aryLang = $CI->config->item('lang_avail');
					$value = '<span class="flag flag-'.$value.'"></span>'.__(ucwords($aryLang[$value]));
					break;
				case 'status':
					$html = img_status($value);
					$value = $html;
					break;
				case 'image':
					$width = ($config['width'])?$config['width']:100;
					$height =($config['height'])?$config['height']:100;

					$value = json_img($value,array('width'=>$width,'height'=>$height,'class'=>'pointer','onclick'=>"Common.imageBox(this,1)"));

					break;
				case 'gallery':
                    $width = ($config['width'])?$config['width']:100;
                    $height =($config['height'])?$config['height']:100;

                    $html = '<div class="galleryInputUpload">';
					$aryImage = json_decode($value);
					if(is_array($aryImage)) foreach($aryImage as $img){
						$html .= base_img($img,array('width'=>$width,'height'=>$height,'class'=>'pointer photoItem','onclick'=>"Common.imageBox(this,1)"));
					}
					$html.='</div>';
					$value = $html;
					break;
				case 'audio':

					$html.= '<object width="300" height="30"  data="'.ROOT_URL.'mediaplayer/audio.swf" style="outline: medium none; visibility: visible;"   type="application/x-shockwave-flash">
					<param name="wmode" value="transparent">
					<param name="menu" value="false">
					<param value="initialvolume=100&amp;titles=Audio&amp;animation=yes&amp;autostart=No &amp;soundFile='.ROOT_URL.$value.'&amp;playerID=audioplayer" name="flashvars"></object>';

					$value = $html;
					break;
				case 'json' :
					$html="";
					$items=json_decode($value, true);
					foreach($items as $key=>$val){
						$html.='<span class="label label-default lbl_toword">'.$val.'</span>';
					}
					$value=$html;
					break;

				case 'jsonarray' :
					$html="";
					$aryObject=json_decode($value, true);

					$labelArray = array('default','success','warning','important','info','inverse');

					foreach($aryObject as $items) {
						$html .= '<div>';
						$i = 0;
						foreach ($items as $key => $val) {
							$i++;
							$label_color = $labelArray[$i%6];
							$html .= '<span class="label label-'.$label_color.' lbl_toword">' . $val . '</span>';
						}
						$array_filter = array_filter($items);
						if(empty( $array_filter ) ){
							$html.='--';
						}
						$html .= '</div>';
					}
					$value=$html;
					break;
				case 'multiword':
					$value = multiWord($value);
					break;
				case 'multiword_wrap':
					$value = multiWordWrap($value, $config['comma']);
					break;
				case 'list_field':
						$html='<ul class="connected list no2" id="list_view">';
						if ($value){
							foreach ($value as $key => $val) {
								$html.= '<li class="word-wrap">' . $val->fieldName . '</li>';
							}
						}else{
							$html.= '<span>' . __('LBL_NO_RECORD') . '</spa>';
						}
						$html.='</ul>';
						$value=$html;
					break;
				case 'field_list_boot':
						$html='<ul class="connected list no2" id="list_view">';
						if ($value){
							foreach ($value as $key => $val) {
								$html.= '<li><span class="word-wrap fieldName">' . $val->fieldName . '</span><span class="lbl-boot-val">'.__("LBL_BOOTS_VALUE").': </span><strong>' . $val->boot_value . '</strong></li>';
							}
						}else{
							$html.= '<span>' . __('LBL_NO_RECORD') . '</spa>';
						}
						$html.='</ul>';
						$value=$html;
					break;
				case "list_param":
						$html="<ul class='list_param'>";
						if($value){
							$arr_list=json_decode($value);
//							debug($arr_list);
							if($arr_list)
							foreach($arr_list as $val){
								$html.='<li><span class="label_param">'.trim($val[0]).'</span> : <span class="param_val">'.$val[1].'</span></li>';
							}
						}
					$html.='</ul>';
					$value=$html;
					break;
				case "tokenizer":
					$html="<ul class='list_param'>";
					if($value){
						$arr_list=json_decode($value);
						if($arr_list)
							foreach($arr_list as $val){
								$html.='<li><span class="label_param">'.trim($val->label).'</span> : <span class="param_val">'.$val->value.'</span></li>';
							}
					}
					$value=$html;
					break;
				default:
					$value = ($value!='')?__($value):'--';
					break;
			}
		}else{
			$value = ($value===0)?0:'--';
		}

		$id = ($config['id'])?'id="'.$config['id'].'"':'';
		$html = '<div class="control-group">
            <label class="control-label">
                '.__($label).'  
            </label>
               <div class="controls '.$config['class'].'"><span '.$id.'>'.$value.'</span></div>
            </div>';
		return $html;
	}
	
	public function viewItem($name,$params= array(),$type=''){
		$value = ($params['value'])?$params['value']:$this->formData->{$name};
		return $this->view($params['label'],$value,$type,$params['config']);
	}
	
	public  function fieldset($label,$class='',$extra=''){
		return '<fieldset class="'.$class.'" '.$extra.'>
		<legend>'.__($label).'</legend>';
	}
	
	public  function fieldset_end(){
		return '</fieldset>';
	}
	
	/**
	 * 
	 * @param unknown_type $params
	 * @return void|string
	 */
	private  function _buildParam(&$params){
		if(!is_array($params)) return;
		
		unset($params['value']);
		unset($params['empty']);
		unset($params['label']);
		unset($params['options']);
		unset($params['checked']);
		unset($params['config']);
		unset($params['url']);
		unset($params['data']);
		unset($params['preview']);
        unset($params['note']);
        unset($params['unit']);
//		unset($params['multiple']);
		
		$params['placeholder'] = __($params['placeholder']);
		
		$return = "";
		
		if(!$params['id']) $params['id'] = $this->_getElemetId();
		
		if($params['rules']){
			$params['rules'] = str_replace(' ','',strtolower($params['rules']));
		}
		
		foreach($params as $key=>$val){
			$return.=" $key=\"$val\" ";
		}
		
		return $return;
	}


	/**
	 *
	 * @param string $name : the name of field value
	 * @param mixed $params = array(
	 * 	url: string the url target upload
	 *  data: mixed data send on submit
	 *  preview: document preview
	 *  class : css style class
	 * )
	 * @return string
	 */
	function upload_library($name,$params = array()){
		$html = '';
		//debug($params['data']);
		$preName = $this->_getName($name);
		$input_name = "data[".$this->controller.']'.$preName;

		$key =   str_replace(array('[',']'), '',$preName);

		if(!$params['data']['file_type']){
			$params['data']['file_type'] = 'document';
		}
		$uploadfile = ($params['config'])?$params['config']:'uploadfile';

		$url = ($params['url'])?$params['url']:site_url('common/upload');

		if($params['label']){
			$html.='<div class="control-group"><label class="control-label">'.__($params['label']).'</label><div class="controls ">';
		}
		$html.= '<a id="'.$name.'_upload" class="'.$params['class'].'">'.__("Browser").' '.img_ajax().'</span></a>';

		if(!$params['preview']){
			$html.='<div class="clear"><div id="'.$name.'_documentPreview" class="documentInputUpload">';

			if($this->formData->{$key}){

				if(!is_array($this->formData->{$key})) $this->formData->{$key} = json_decode($this->formData->{$key});
				$item  = $this->formData->{$key};
				$item_value = $item;

				$html.= '<div class=\'documentItem\'>
						<input name="'.$input_name.'" value=\''.json_encode($item_value).'\' type="hidden"/>
						'.json_document($item).'
						<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();\' title=\''.__("Remove").'\'></a></div>
						</div>';

			}

			$html.='</div></div>';

		}

		$divPreview =($params['preview']) ? $params['preview'] : $name.'_documentPreview';

		$html.= '<script type="text/javascript">
		$(function(){

		var inputT = \'<input name="'.$input_name.'" type="hidden"/>\';

		var btnUpload=$("#'.$name.'_upload");
		new AjaxUpload(btnUpload, {
			action: "'.$url.'",
			name: "'.$uploadfile.'",
			onSubmit: function(file, ext){
			$("#'.$name.'_upload .ajaxImage").hide();
			';
		if($params['data']) $html.=' this.setData('.json_encode($params['data']).');';
		$html.= '},
			onComplete: function(file, response){
				//On completion clear the status
				$("#'.$name.'_upload .ajaxImage").hide();
				var data = $.parseJSON(response);
				if(data.ok){

					var a = $("<a class=\"file_icon\"/>");
					var hidden = $(inputT);
					hidden.val(data.value);
					a.attr("href",data.preview);
					a.html(data.fileName);
					var div = $("<div class=\'documentItem\'>");
					var close = $("<div class=\'tc\'><a class=\'action pointer action-icon-trash\' onclick=\'$(this).parent().parent().remove();\' title=\''.__("Remove").'\'></a></div>")
					div.append(hidden);div.append(a);div.append(close);
					$("#'.$divPreview.'").html(div);
					$("#libRegex").val(data.fileName);
					var libName=$("#libName").val();
					$("#libDir").val($("#libDir").val()+libName.toLowerCase());
				}else{
					Common.error(data.serror);
				}
			}
		});

	});
	</script>';
		if($params['label']){
			$html.='</div></div>';
		}
		return $html;
	}
}


class form extends FormBase {
	
}