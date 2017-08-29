<?php
	$formBase = new FormBase();
	$formBase->fillData($fillData);
?>
<div class="formView form-horizontal span8">
	<div class="section ">            
				<?php 
					$options = getDBDropdown(array('table'=>'country','status'=>true,'key'=>'iso','val'=>'nicename'));
					echo $formBase->view("Country",$options[$fillData->country_code])?>
        		<?php echo $formBase->viewItem('region_code',array('label'=>"Region/States Code",'class'=>'span3','rules'=>"required"))?>
				<?php echo $formBase->viewItem('region_name',array('label'=>"Region/States name",'class'=>'span3','rules'=>"required"))?>
				  
		<div class="form-actions ">			
				<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE',array('label'=>'BTN_CLOSE')))?>
		</div>
		
        </div>

</div>
<div class="clear"></div>