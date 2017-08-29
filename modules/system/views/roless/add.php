<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/roles/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));?>
    <div class="screenView span7">
        <div style="height:15px;"><h3></h3></div>
		<div class="section ">
           
        		<?php echo $formBase->input('roleName',array('label'=>"Role name",'rules'=>"required"))?>
        		<?php echo $formBase->dropdown('moduleId',array('label'=>"Module",
        							'options'=>getDBDropdown(array('table'=>'sys_module','key'=>'modulePath','val'=>'moduleName','empty'=>'--Select Module--'))))?>
				<?php echo $formBase->status('status',array('label'=>'Status','checked'=>ACTIVE))?>        							
		       
        <div class="form-actions ">			
			<?php 
				echo $formBase->submit('BTN_SUBMIT');
			?>
			<?php 
				echo $formBase->close('BTN_CLOSE');
			?>
		</div>
        </div>   
    
	</div>
	<div class="clear"></div>
<?php echo $formBase->end();?>
