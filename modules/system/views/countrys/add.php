<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/country/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           
        		<?php echo $formBase->input('iso',array('label'=>"Code",'rules'=>"required"))?>
				<?php echo $formBase->input('nicename',array('label'=>"Country name",'rules'=>"required"))?>
				<?php echo $formBase->input('phonecode',array('label'=>"Phone code",'rules'=>"required"))?>
				<?php echo $formBase->status('status',array('label'=>"LBL_STATUS",'rules'=>"required"))?>
		       
        <div class="form-actions ">			
			<?php 
				echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'));
				echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
			?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
