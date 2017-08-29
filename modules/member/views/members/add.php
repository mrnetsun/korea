<div class="memberProfile span8">
<?php 
	$formBase = new FormBase();
	echo $formBase->create('member/insert',array('ajax'=>_getBaseName('List'),'class'=>'form-horizontal'));
?>
<div class="left span2">
	<div class="avartar " id='memberAvatarPreview'>
		
	</div>
	<div>
     <?php 
     echo $formBase->upload_image('avatar',
     		array('url'=>site_url("member/avartaUpload"),
     				'preview'=>'memberAvatarPreview',
     				'class'=>'btn btn-mini mg5 mgl20',
				'rules'=>'valid_image'
     		));
     ?>
		</div>
</div>
<div class="right span6">
			<?php echo $formBase->dropdown('clientId',
				array('label'=>'LBL_PARTNER','options'=>getDBDropdown(array('table'=>'client',
					'key'=>'id',
					'val'=>'name'
				))
				,'empty'=>'LBL_NON_CLIENT'));?>
          	<?php echo $formBase->input('firstName',array('label'=>'LBL_FIRST_NAME','rules'=>'required|max_length[50]|isnull_or_white_space|alpha_space','class'=>'span3'));?>
           <?php echo $formBase->input('lastName',array('label'=>'LBL_LAST_NAME','rules'=>'required|max_length[50]|isnull_or_white_space|alpha_space','class'=>'span3'));?>
            <?php echo $formBase->input('username',array('label'=>'LBL_USERNAME','rules'=>'required|no_space|max_length[50]','class'=>'span3'));?><!--callback_check_username-->
            <?php echo $formBase->password('password',array('label'=>'LBL_PASSWORD','rules'=>'required|min_length[6]|max_length[50]|password_special','class'=>'span3'));?>
            <?php echo $formBase->input('email',array('label'=>'LBL_EMAIL','rules'=>'required|valid_email|max_length[50]','class'=>'span3'));?><!--callback_check_email-->
            <?php /* echo $formBase->dropdown('departmentId',
               								array('label'=>'Department',
               										'options'=>getDBDropdown(array('table'=>'sys_department',
               																'key'=>'departmentId',
               																'val'=>'departmentName',
               																'empty'=>'--Choose One--')),
               								'rules'=>'required','class'=>'span3')); */?>
    <?php echo $formBase->dropdown('roleId',array('label'=>'LBL_ROLES',
        'options'=>$data['list_role'],
        'rules'=>'required',
        'class'=>'span3',
        'onchange'=>'memberController.updateRole(this)'
    ));?>


               
            
           <?php echo $formBase->status('status',array('label'=>'LBL_STATUS',
               								'rules'=>'required')               							
               						);?>
 <div class="form-actions ">

	 <?php echo $formBase->submit('BTN_SUBMIT',array('label'=>'BTN_SUBMIT'))?>
	 <?php echo $formBase->close('BTN_CLOSE',array('label'=>'BTN_CLOSE'))?>
    
</div> 
    
	
</div>


<?php echo $formBase->end();?>
</div>
<div class="clear"></div>

<script>
	var checkuser = false;
	var checkemail = false;
	FormValidateCallBack['check_username'] = function(field,val){
		if(!checkuser){			
			checkuser = true;
			$.ajax({
				type:"POST",
				url:"<?php echo site_url("member/checkDuplicate");?>",
				data:"username="+val,
				success : function(data){
					data = $.parseJSON(data);
					if(!data.ok){
						FormValidate._error(field,data.serror);
						field.addClass('callback_error');						
					}else{
						field.removeClass('callback_error');
					}
					checkuser = false;
				}
				});	
		}
	}

	FormValidateCallBack['check_email'] = function(field,val){
		if(!checkemail){			
			checkemail = true;
			$.ajax({
			type:"POST",
			url:"<?php echo site_url("member/checkDuplicate");?>",
			data:"email="+val,
			success : function(data){
				data = $.parseJSON(data);
				if(!data.ok){
					FormValidate._error(field,data.serror);
					field.addClass('callback_error');				
				}else{
					field.removeClass('callback_error');
				}
				checkemail = false;
			}
			});
		}
	}
	$(document).ready(function(){
		$('input[type=file]').attr('accept','image/jpg,image/jpeg,image/gif,image/png');
	});

</script>
