<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/region/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           		<?php echo $formBase->dropdown('country_code',array('label'=>"Country",'class'=>'span3','options'=> getDBDropdown(array('table'=>'country','status'=>true,'key'=>'iso','val'=>'nicename')),
								'empty'=>'--Select Country--','rules'=>"required"))?>
        		<?php echo $formBase->input('region_code',array('label'=>"Region/States Code",'class'=>'span3','rules'=>"required"))?>
				<?php echo $formBase->input('region_name',array('label'=>"Region/States name",'class'=>'span3','rules'=>"required"))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required"))?>
        <div class="form-actions ">			
			<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'));?>
			<?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
