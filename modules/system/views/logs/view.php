<?php
	$formBase = new FormBase();
$aryLogType = array(0=>'info',1=>'warning',2=>'danger');

$arr_controller = array(
	'member',

	'role',
	'config'
)

?>
<div class="formView form-horizontal span8">
	<div class="section ">
            <div><h2> <?php echo __($fillData->header);?></h2></div>
            

		<?php echo $formBase->view("LBL_TYPE",'<span class="label label-'.$aryLogType[$fillData->type].'">'.__($aryLogType[$fillData->type]).'</span>');?>



		<?php if($fillData->comment) echo $formBase->view("LBL_COMMENT",$fillData->comment);?>
		
		<?php echo $formBase->view("LBL_ACTOR",$fillData->actor);?>
		<?php
		if($fillData->data_before){
			$data_before = json_decode($fillData->data_before);
			foreach($data_before as $k=>$v){
				echo $formBase->view(strtoupper('LBL_'.$fillData->controller.'_'.ucfirst($k)),$v);
				break;
			}
		}
		?>
		<?php if($fillData->task) echo $formBase->view("LBL_TASK",ucfirst($fillData->task));?>


		<?php //echo $formBase->view('Case',$case);?>
		
		<?php echo $formBase->view("LBL_UPDATED",formatDate($fillData->updatedTime));?>

		<?php
		$case = strtolower($fillData->method);
		$string = '';
		$controller = $fillData->controller;
		$method = $fillData->method;
		switch($case){
			case 'dataswitch':
			case 'update':
				if( $controller && in_array( $controller,$arr_controller ) ){
					$string = $this->load->view('logs/detail/'.$controller.'s/update', array('fillData' => $fillData), true);
				}else {
					$string = $this->load->view('logs/detail/update', array('fillData' => $fillData), true);
				}
				break;
			case 'insert':
			case 'delete':
				if( $controller && in_array( $controller,$arr_controller ) ){
					$string = $this->load->view('logs/detail/'.$controller.'s/delete', array('fillData' => $fillData), true);
				}else {
					$string = $this->load->view('logs/detail/delete',array('fillData'=>$fillData),true);
				}

				break;
			case 'saveall':

				if($fillData->task=='switch'){

					if( $controller && in_array( $controller,$arr_controller ) ) {
						$string = $this->load->view('logs/detail/'.$controller.'s/update',array('fillData'=>$fillData),true);
					}else{
						$string = $this->load->view('logs/detail/update',array('fillData'=>$fillData),true);
					}
				}else{
					if( $controller && in_array( $controller,$arr_controller ) ) {
						$string = $this->load->view('logs/detail/'.$controller.'s/delete',array('fillData'=>$fillData),true);
					}else{
						$string = $this->load->view('logs/detail/delete',array('fillData'=>$fillData),true);
					}

				}
				break;
			default:
				$string = "";

		}

		if( $controller && in_array( $controller,$arr_controller ) ){
				echo $string;
		}else{
			echo $formBase->view("LBL_DESCRIPTION",$string,'',array('class'=>'scrollWrap'));
		}

		?>
                    
	</div>
  
	<div class="actions">
		<?php 
			echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
		?>
	</div>

</div>
<div class="clear"></div>