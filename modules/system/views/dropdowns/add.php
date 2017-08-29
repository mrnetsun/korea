<?php 
	$formBase = new FormBase();
	echo $formBase->create('system/dropdown/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
	?>
    <div class="screenView">
        
		<div class="section span7">
           
        <div class="control-group">
            <label class="control-label">
                <?php echo __("Module");?>  
            </label>
            <div class="controls">
                <?php echo $formBase->dropdown('moduleId',array('options'=>getModuleArray('--Choose One--'),'rules'=>'required','class'=>"span4"))?>
            </div>
		</div> 
		<div class="control-group">
            <label class="control-label">
                <?php echo __("Name");?>  
            </label>
            <div class="controls">
                <?php echo $formBase->input('dropdownName',array('rules'=>"required",'class'=>"span4"))?>
            </div>
		</div> 
		<div class="control-group">
            <label class="control-label">
                <?php echo __("Code");?>  
            </label>
            <div class="controls">
                <?php echo $formBase->input('dropdownCode',array('rules'=>"required|callback_check_code",'class'=>"span4"))?>
            </div>
		</div> 
		<div class="control-group">
            <label class="control-label">
                <?php echo __("Options");?>  
            </label>
            <div id="valueWrapAdd" class="controls">
            	<div class="valueItem">            	
                <?php echo $formBase->input('value[]',array('rules'=>"required",'class'=>"span2",'placeholder'=> __("Value"),'msg'=>''))?>
               
                <?php echo $formBase->input('text[]',array('rules'=>"required",'class'=>"span2",'placeholder'=>__("Text")))?>
                
                </div>
                <div class="valueItem">            	
                <?php echo $formBase->input('value[]',array('rules'=>"required",'class'=>"span2",'placeholder'=> __("Value"),'msg'=>''))?>
               
                <?php echo $formBase->input('text[]',array('rules'=>"required",'class'=>"span2",'placeholder'=>__("Text")))?>
                
                </div>
            </div>
            <div class="clear"></div>
            <div class="controls"><a class='pointer' onclick="systemController.addDropdownItem('valueWrapAdd');"><?php echo __("Add more");?></a></div>
		</div> 
       <div class="form-actions ">
			
			<?php 
				echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'));
			?>
			<?php 
				echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'));
			?>
				   
			
		</div> 
        
        </div>    
    
	</div>
	<div class="clear"></div>

<?php echo $formBase->end();?>

<script>
	var check_code = false;
	FormValidateCallBack['check_code'] = function(field,val){
		if(!check_code){			
			check_code = true;
			$.ajax({
				type:"POST",
				url:"<?php echo site_url("system/dropdown/checkDuplicate");?>",
				data:"code="+val+'&dropdownId='+$('#dropdownId').val(),
				success : function(data){
					data = $.parseJSON(data);
					if(!data.ok){
						FormValidate._error(field,data.serror);
						field.addClass('callback_error');						
					}else{
						field.removeClass('callback_error');
					}
					check_code = false;
				}
				});	
		}
	}

</script>