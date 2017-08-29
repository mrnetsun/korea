systemController = {
	backup_step:0,
	restore_step:0,
	linkSetup:function(obj,setting){

		try{
			w_url = $(obj).attr('data-url');
			if(setting.overlay){
				var addOverlay = Overlay.panel({id:'id_overlay_link'});
				addOverlay.open({title:setting.title,url:w_url});
				return false;
				if( setting.confirm ){
					//$('.dialog-wrapper .dialog-title').empty();
					//$('.dialog-wrapper .dialog-title').append('<?php echo __("LBL_CONFIRM-BACKUP")?>');
					//$('.backup_message_status').empty();
                    //
					//setting.messageConfirm = '<?php echo __("LBL_CONFIRM_BACKUP&RESTORE"); ?>';
					//$('.dialog-wrapper .dialog-message').html( setting.messageConfirm );
					//$('.dialog-wrapper').css({'display':'block'});
                    //
					//$( ".btn-confirm-yes" ).off().bind("click", function() {
					//	Common.closeDialog();
					//	$('.dialog-backup').css({'display':'block'});
					//	systemController.updateBackupProgress(2,'<?php echo __("LBL_BACKUP_DATABASE")?>');
					//	systemController.doBackup();
					//});

				}else{
					addOverlay.open({title:setting.title,url:w_url});
				}
			}else{
				if(setting.ajax){

					$.ajax({
						type: "POST",
						url: w_url,
						success: function(data){
							Common.closeDialog();
							if (typeof(setting.callBack) === 'function') {
								setting.callBack(data);
							}else{
								try{
									var data = $.parseJSON(data);
									if(data.ok){

										if(data.smessage){
											Common.showMessage(data.smessage);
										}
										if (setting.hide!=null)
										{
											$(setting.hide).hide();
										}

										if(setting.callBack!=''){

											var form = $(obj).closest('form');
											if(setting.callBack == 'reload'){
												var urlCallback = setting.url;
												if(!urlCallback) urlCallback = $(form).find('input[name=loadListUrl]').val();

												setting.callBack = form.parent().attr('id');
												//load content
												Common.load(setting.callBack,urlCallback);
											}else{
												eval(setting.callBack);
											}

										}

									}else{
										if(data.serror){
											Common.showError(data.serror);
										}
									}
								}catch(e){Common.error('JSON Error.')}
							}

						}
					});

				}else{
					Common.goUrl(w_url);
				}
			}
		}catch(e){
			Common.error(e.toString());
		}
		return false;
	},
	performBackup:function(){
		var formDeploy = $('#frmSolrRestore');
		Common.closeDialog();
		$('.dialog-backup').css({'display':'block'});

		$.ajax({
			url: formDeploy.attr('action'),
			type: 'POST',
			data:formDeploy.serialize(),
			dataType: 'json',
			success: function(data) {
				if(data.ok){
					systemController.updateBackupProgress(2,'<?php echo __("LBL_BACKUP_DATABASE")?>');
					systemController.doBackup();
				}else{
					$('#warning_restore_close_browser').html(data.serror).show();
				}
			}
		});
	},
	verifyRestore:function(){
		var formDeploy = $('#frmSolrRestore');
		$('#statusRestoreMessage').hide();
		$.ajax({
			url: formDeploy.attr('action'),
			type: 'POST',
			data:formDeploy.serialize(),
			dataType: 'json',
			success: function(data) {
				if(data.ok){
					systemController.doRestore();
				}else{
					$('#statusRestoreMessage').html(data.serror).show();
				}
			}
		});
	},

	doRestore:function(){
		//initial
		Common.closeAllOverlay();

		$('#btn_backup_restore_retry').hide();
		$('#btn_backup_restore_ok').hide();
		$('.dialog-backup-restore').css({'display':'block'});

		$.ajax({
			url: '<?php echo site_url("system/backup/doRestore")?>'+'/'+systemController.restore_step,
			type: 'POST',
			dataType: 'json',
			beforeSend:function(){
				$('#backup_restore_message_status').empty();
			},
			success: function(data) {
				try{
					if(data.ok){
						systemController.restore_step++;
						if( systemController.restore_step <= 5 ){
							systemController.doRestore();
							systemController.updateRestoreProgress(data.percent,data.smessage);
						}
						if(data.percent === 100 ){
							systemController.restore_step = 0;
							systemController.updateRestoreProgress(data.percent,data.smessage);
							$('#btn_backup_restore_ok').addClass('btn-success').show();
							$('.dialog-backup-restore .dialog-title').html('<?php echo __("LBL_COMPLETED")?>');
							$('#tooltip-head-deploy').show();
							$('#btn_backup_restore_retry').hide();
						}
					}else{
						$('#btn_backup_restore_retry').show();
						systemController.restore_step = 0;
						$('#btn_backup_restore_ok').removeClass('btn-success').show();
						$('.progress .bar').removeClass().addClass('bar').addClass('bar-danger');
						systemController.updateRestoreProgress(data.percent,data.serror,1);
					}
				}catch (e){
					systemController.restore_step = 0;
					$('#btn_backup_restore_retry').show();
					$('#btn_backup_restore_ok').removeClass('btn-success').show();
					$('.progress .bar').removeClass().addClass('bar').addClass('bar-danger');
					$('#backup_restore_message_status').removeClass('text_message');
					$('#backup_restore_message_status').addClass('text_error');
					$('#backup_restore_message_status').html('<?php echo __("ERR_CANNOT_CONNECT")?>');
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown)
			{
				systemController.restore_step = 0;
				$('#btn_backup_restore_retry').show();
				$('#btn_backup_restore_ok').removeClass('btn-success').show();
				$('.progress .bar').removeClass().addClass('bar').addClass('bar-danger');
				$('#backup_restore_message_status').removeClass('text_message');
				$('#backup_restore_message_status').addClass('text_error');
				$('#backup_restore_message_status').html('<?php echo __("ERR_CANNOT_CONNECT")?>');
			}
		});
	},

	doBackup:function(){
		//initial
		Common.closeAllOverlay();
		$('#btn_deploy_retry').hide();
		$('#btn_deploy_ok').hide();
		//$('.dialog-deploy').css({'display':'block'});

		$.ajax({
			url: '<?php echo site_url("system/backup/doBackup")?>/'+systemController.backup_step,
			type: 'POST',
			dataType: 'json',
			success: function(data) {
			try {
				if(data.ok){
					if(systemController.backup_step < 5){
						systemController.backup_step++;
						systemController.updateBackupProgress(data.percent,data.smessage);
						systemController.doBackup();
					}else {
						systemController.backup_step = 0;
						systemController.updateBackupProgress(data.percent,data.smessage);
						if( data.urlLoadList && ( parseInt(data.percent) === 100 ) ){
							urlLoadList = data.urlLoadList;
							$('#System_Backup_List').load(urlLoadList);
						}
					}
					$('#btn_backup_retry').hide();
				}else{
					systemController.backup_step = 0;
					$('#btn_backup_retry').show();
					$('#btn_backup_ok').removeClass('btn-success').show();
					$('.progress .bar').removeClass().addClass('bar').addClass('bar-danger');
					$('.progress .bar').removeClass('bar-success').addClass('bar-danger');
					systemController.updateBackupProgress(data.percent,data.serror,1);
				}
			}catch (e){
				systemController.backup_step = 0;
				$('#btn_backup_retry').show();
				$('#btn_backup_ok').removeClass('btn-success').hide();
				$('.progress .bar').removeClass().addClass('bar').addClass('bar-danger');
				$('#backup_message_status').removeClass('text_message');
				$('#backup_message_status').addClass('text_error');
				$('#backup_message_status').html('<?php echo __("ERR_CANNOT_CONNECT")?>');
			}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown)
			{
				systemController.backup_step = 0;
				$('#btn_backup_retry').show();
				$('#btn_backup_ok').removeClass('btn-success').hide();
				$('.progress .bar').removeClass().addClass('bar').addClass('bar-danger');
				$('#backup_message_status').removeClass('text_message');
				$('#backup_message_status').addClass('text_error');
				$('#backup_message_status').html('<?php echo __("ERR_CANNOT_CONNECT")?>');
			}
		});
	},

	updateRestoreProgress:function(percent,title,error){
		$('.progress').addClass('progress-striped').addClass('active');
		$('.progress .bar').removeClass().addClass('bar')
			.addClass((percent < 40) ? 'bar-danger' : ( (percent < 80) ? 'bar-warning' : 'bar-success' ));

		if(error){
			$('#backup_restore_message_status').removeClass('text_message');
			$('#backup_restore_message_status').addClass('text_error');
		}else{
			if(percent != -1){
				$('.progress .bar').width(percent + '%');
				$('.progress .bar').text(percent + '%');
			}


			$('#backup_restore_message_status').removeClass('text_error');
			$('#backup_restore_message_status').addClass('text_message');
		}
		if(title){
			$('#backup_restore_message_status').html(title);
		}

	},


	updateBackupProgress:function(percent,title,error){
		$('.progress').addClass('progress-striped').addClass('active');
		$('.progress .bar').removeClass().addClass('bar')
			.addClass((percent < 40) ? 'bar-danger' : ( (percent < 80) ? 'bar-warning' : 'bar-success' ));

		if(error){
			$('#backup_message_status').removeClass('text_message');
			$('#backup_message_status').addClass('text_error');
			$('.progress .bar').removeClass('btn-success');
			$('.progress .bar').addClass('bar-danger');
		}else{
			if(percent != -1){
				$('.progress .bar').width(percent + '%');
				$('.progress .bar').text(percent + '%');
			}
			if( percent == 100 ){
				$('.dialog-backup .dialog-title').html( '<?php echo __("LBL_TITLE_BACKUP_COMPLETED") ?>' );
				$('#btn_backup_ok').addClass('btn-success').show();

			}

			$('#backup_message_status').removeClass('text_error');
			$('#backup_message_status').addClass('text_message');
		}
		if(title){
			$('#backup_message_status').html(title);
		}

	},
	getTableField:function(obj){		
		val = $(obj).val();		
		if(!val) return;
		$.ajax({
			   type: "POST",
			   url: "<?php echo site_url('system/module/getTableField/')?>",
			   data: 'tableName=' +  val,
			   success: function(data){							   
				   try{		  
						var data = $.parseJSON(data);
						if(data.ok){
							$('#tableNameError').html('');
							$('.primaryKey').val(data.data.primary);
							
							$.each(data.data.fields, function (i, item) {
								
								$('.tableField').append($('<option>', { 
									value: item.val,
									text : item.text
								}));
							});
						}else{
							$('#tableNameError').html(data.serror);	
						}							
				   }catch(e){
					   Common.error('JSON Error.')	   
				   }										   
															
			   }
		});
			
	},
	
	
	checkControllerName : function(obj,mod){
		val = $(obj).val();		
		
		$.ajax({
			   type: "POST",
			   url: "<?php echo site_url('system/module/checkControllerName/')?>",
			   data: 'controllerName=' +  val +'&modulePath='+mod,
			   success: function(data){							   
				   try{		  
						var data = $.parseJSON(data);
						if(data.ok){
							$('#controllerNameError').html('');							
						}else{
							$('#controllerNameError').html(data.serror);	
						}							
				   }catch(e){
					   Common.error('JSON Error.')	   
				   }										   
															
			   }
		});
	},
	moveRightAddEdit : function (obj){
		parent = $(obj).closest('fieldset');
		$.ajax({
			   type: "POST",
			   url: "<?php echo site_url('system/module/getConfigAddEdit/')?>",
			   data: parent.serialize(),
			   success: function(data){							   
				   $('#tableField1Wrap').html(data);									   
															
			   }
		});
	},
	
	moveLeftAddEdit : function (obj){
		
	},
	
	moveRightSearch : function (obj){
		parent = $(obj).closest('fieldset');
		$.ajax({
			   type: "POST",
			   url: "<?php echo site_url('system/module/getConfigListSearch/')?>",
			   data: parent.serialize(),
			   success: function(data){							   
				   $('#tableField2Wrap').html(data);									   
															
			   }
		});
	},
	
	moveLeftSearch : function (obj){
		
	},
	
	removeElement: function(obj){
		if(confirm('<?php echo __("Do you want to delete this?");?>'))
		$(obj).closest("ul").remove();	
	},
	
	addDropdownItem: function(obj){
		var html = '<div class="valueItem">';		
		html +='<input name="data[dropdown][value][]" value="" placeholder="<?php echo ("Value")?>" rules="required" class="span2" msg="" id="System_Dropdown_Insert_Form_4" type="text">';		
		html +=' <input name="data[dropdown][text][]" value="" placeholder="<?php echo __("Text"); ?>" rules="required" class="span2" type="text">';
		html +=' <span class="pointer action-icon-trash" onclick = "systemController.removeOption(this)"></span></div>';
		$('#'+obj).append(html);
	},
	
	removeOption: function(obj){
		$(obj).parent().remove();
	},
	downloadFile: function (obj) {
		var w_url = $(obj).attr('href');
		$.ajax({
			url: w_url,
			type: 'POST',
			dataType: 'html',
			success: function(data) {
				data = $.parseJSON(data);
				if( data.ok ){
					document.location = data.file;
				}
				else{
					if( data.serror ){
						Common.showError( data.serror )
					}else{
						var addOverlay = Overlay.panel({id:'id_overlay_link'});
						addOverlay.open( {title:'Download', url: w_url } );
					}
				}
			}
		});
	},
}