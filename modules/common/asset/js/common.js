// JavaScript Document
/**
 * A Common object with commonly functiuon
 * @author Lucdt@ideavietnam.com
 */
var reload = 'reload';
$(function(){
	$(document).on('click','.body-field input[type=radio]',function(){
		var nameRadio = $(this).attr('name');
		$(this).parents('.inputGroup').find('input[type=radio]').attr('checked', false );
		$(this).attr('checked', true);
	});

	//$('.dropdown').mouseleave(function(){
	//	$('.dropdown-menu').stop('400').slideUp('400');
	//});
    //
    //$(document).on('mouseover','li.active',function(){
		//$(this).find('.dropdown-menu').stop('400').slideDown('400');
    //});
});
var Common = {
	/**
	 * Back to home page if JSON parse error
	 */
	numberTr:1,
	jsonError: function(e){
		//LBL_DISPLAY_TO('System Error!');
		alert(e.toString());
		//document.location =  ROOT_URL;	
	},
    deleteComment:function(id)
    {


        $('#delete'+id).click(function(){
            $.ajax(
                {
                    url:"<?php echo site_url('doing/comment/delete/');?>"+id,
                    type:"post",
                    success:function(data){
                        var data = $.parseJSON(data);
                        if (data.ok)
                        {
                            Common.fadeOut('#deleteComment'+id);
                        }
                        else
                        {
							alert(data.serror);
                        }
                    }
                }

            )

        })

    },
	removeParent: function(obj){		
		$(obj).parent().remove();
	},
	
	removeFormItem:function(obj){
	    var wrap = $(obj).closest('.multipleWrap');
		$(obj).closest('.control-group').remove();
		i = 1;
		wrap.find('.number').each(function(){			 
			$(this).html(i);i++;
		});
	},

	updateFilterList:function (element,selector,wrap){
		if(!selector) return;
		var value = $(element).val();
		$(selector).each(function() {
			if ($(this).text().search(new RegExp(value, "i")) > -1) {
				if(wrap){
					$(this).closest(wrap).show();
				}else{
					$(this).show();
				}
			} else {
				if(wrap){
					$(this).closest(wrap).hide();
				}else{
					$(this).hide();
				}
			}
		});
	},

	addFormItem:function(obj){
		var wrap = $(obj).closest('.multipleWrap');

		var current = $(obj).closest('.control-group');
		var prev = current.prev().clone();
		prev.insertBefore(current);
		prev.find('input').val('');
		i = 1;
		wrap.find('.number').each(function(){
			$(this).html(i);i++;
		});
	},
	/**
	 * Remove a element
	 */
	remove: function(obj){
		$(obj).fadeOut(1000,function(){
			$(this).remove();
		});	
	},
	
	/**
	 * Do Fade in a object
	 */
	fadeIn: function(obj){
		$(obj).fadeIn(1000);
	},
	
	/**
	 * Do Fade out a Object
	 */
	fadeOut: function(obj){
		$(obj).fadeOut(1000);
	},

	slug: function(str) {
		str = str.replace(/^\s+|\s+$/g, ''); // trim
		str = str.toLowerCase();



		// remove accents, swap ñ for n, etc
		var from = "àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ·/_,:;";
		var to   = "aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd------";
		for (var i=0, l=from.length ; i<l ; i++) {
			str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
		}

		str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
			.replace(/\s+/g, '-') // collapse whitespace and replace by -
			.replace(/-+/g, '-'); // collapse dashes

		return str;
	},
	
	/**
	 * Display alert overlay box
	 */
	alert:function(msg){
		try{
			alertMe = Overlay.panel({title:true,center:true});
			alertMe.open({title:"<?php echo __('LBL_ALERT');?> ",width:300,content:'<div class="message"><div><h3 class="floatleft"><span class="toolbar_icon-16 toolbar_icon-16-info"></span></h3><p class="p-alert" style="padding-top:3px;">'+msg+'</p></div><br><div class="clear tc"><a class="btn" onclick="Common.closeOverlay()"><?php echo __("LBL_OK")?></a></div></div>'});
			
		}catch(e){
			alert(e.toString());
		}
	},
	/**
	 * Display error overlay box
	 */	
	error: function(msg){
		try{
			alertMe = Overlay.panel({title:true,center:true});
			alertMe.open({title:"<?php echo __('LBL_ERROR');?> ",width:300,content:'<div class="message"><p  class="p-alert">'+msg+'</p></div><div class="clear tc"><a class="btn" onclick="Common.closeOverlay()"><?php echo __("LBL_OK")?></a></div></div>'});
			
		}catch(e){
			alert(e.toString());
		}
	},
	/**
	 * Display Message on the top page
	 */
	showMessage:function(msg){
		$('#alertwrap').show();
		$('#sys_error').fadeOut();
		$('#sys_message .message_content').html(msg);
		$('#sys_message').slideDown();
		
		$("html, body").animate({ scrollTop: 0 }, 300);
	},
	/**
	 * Display Message on the top page
	 */
	showWarn:function(msg){
		$('#alertwrap').show();
		$('#sys_warn').fadeOut();
		$('#sys_warn .message_content').html(msg);
		$('#sys_warn').slideDown();

		$("html, body").animate({ scrollTop: 0 }, 300);
	},
	
	/**
	 * Display error on the top page
	 */
	showError:function(msg){
		$('#alertwrap').show();
		$('#sys_message').fadeOut();
		$('#sys_warn').fadeOut();
		$('#sys_error .error_content').html(msg);
		$('#sys_error').slideDown();
		$("html, body").animate({ scrollTop: 0 }, 300);
	},

	
	/**
	 * Close Current Overlay
	 */
	closeOverlay:function(){
		//get overlay from Global Stack
		var closer = OverlayStack.pop();
		
		if(OverlayStack.length == 0) $('body').removeClass('bodyFix');
		
		if(closer){
			$closer = $('#'+closer);
			$closer.find('.overlay').hide();
//			$closer.find('.modal').hide();
            $closer.find('.modal').remove();
		}

		try {
			BootstrapDialog.closeAll();
		}
		catch (err) {}

	},
	
	/**
	 * Close All Overlay
	 */
	 closeAllOverlay: function(){
		//get overlay from Global Stack
		while(closer = OverlayStack.pop()){
			$closer = $('#'+closer);
			$closer.find('.overlay').hide();
			$closer.find('.modal').hide();
		}
	 },
	 
	/**
	 * Do check All checkbox inner form
	 */
	checkAll:function (obj){
		$checked = $(obj).attr('checked');
		
		$parent = $(obj).closest('form');
		
		if($checked){
			$parent.find('input[type=checkbox]').attr('checked',true);
		}else{
			$parent.find('input[type=checkbox]').attr('checked',false);	
		}
	},
	/**
	 * set CheckAll status
	 */
	isCheckAll: function(obj){
		$checked = $(obj).attr('checked');		
		$parent = $(obj).closest('form');
		
		var checked = $parent.find('input:checked').length;
		var total = $parent.find('input[type=checkbox]').length;
		
		if(!$checked){
			$parent.find('.checkAll').attr('checked',false);
		}else{
			if(checked+1>=total) $parent.find('.checkAll').attr('checked',true);
		}
	},
	/**
	 * Do Checked All check box by the forObj
	 */
	checkAllFor:function (obj,forObj){
		$checked = $(obj).attr('checked');

		$parent = $('#'+forObj);
		if($checked){
			$parent.find('input[type=checkbox]').attr('checked',true);
		}else{
			$parent.find('input[type=checkbox]').attr('checked',false);	
		}
	},
	/**
	 * Return number of checkbox is checked
	 */
	countChecked: function(obj){
		var count = $('#'+obj).find('input:checked').length;
		if($('#'+obj).find('.checkAll').attr('checked')) count --;
		return count;
	},
	/**
	 * Go to the top web page
	 */
	goTop: function (){
		$('html, body').animate({scrollTop:200}, 'slow');	
	},
	/**
	 * Go to the url
	 */
	goUrl: function (url){
		document.location = url;
	},
	/**
	 * fill Object by Load ajax
	 */
	load : function(obj,url){
		$('#'+obj).html('<img src="'+STYLES_PATH+'images/load.gif" align="middle"/>'+' <?php echo __("Loading");?>...');
		$('#'+obj).load(url);
	},
	/**
	 * Change status link ajax
	 */
	changStatus: function(obj){
		w_url = $(obj).attr('href');
		$.ajax({
			   type: "POST",
			   url: w_url,					   
			   success: function(data){
				   try{ 
					   var data = $.parseJSON(data);
					   
						if(data.ok){
							if( data.flagDeploy ){
								Common.showHeadTooltip(true);
							}
							//switch images
							var src = $(obj).find('img').attr('src');
							if(src.indexOf('icon_1')!=-1){
								$(obj).find('img').attr('src',src.replace('icon_1','icon_0'))
							}else{
								$(obj).find('img').attr('src',src.replace('icon_0','icon_1'))
							}

							//show message
							if(data.smessage){
								Common.showMessage(data.smessage);	
							}
						}else{
							//show error
							if(data.serror){
								Common.showError(data.serror);	
							}
						}
				   }catch(e){					   
					   Common.error('JSON Error.')
				}
			   }
			   });
		return false;
	},

	updateCKEditor:function(){
		for ( instance in CKEDITOR.instances ) {
			CKEDITOR.instances[instance].updateElement();
		}
	},
	/**
	 * Convert link function
	 */
	linkSetup:function(obj,setting){

		try{
			w_url = $(obj).attr('data-url');

			if(w_url.indexOf("delete")!=-1){
                $('.dialog-message').empty();
                if( setting.messageConfirm == '' || typeof setting.messageConfirm =='undefined')
                    setting.messageConfirm = '<?php echo __("LBL_CONFIRM_DELETE")?>';
                $('.dialog-message').append( setting.messageConfirm );
				$('.dialog-wrapper').css({'display':'block'});

				$( ".btn-confirm-yes" ).off().bind("click", function() {
					Common.deleteAjax(obj,setting);
				});
				return false;
				//if(!confirm('<?php echo __("LBL_CONFIRM_DELETE")?>')) return false;
			}

			if(setting.overlay){
				var addOverlay = Overlay.panel({id:'id_overlay_link'});
				addOverlay.open({title:setting.title,url:w_url});
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

    linkSetup2:function(obj,setting){

        try{
            w_url = $(obj).attr('data-url');

            if(w_url.indexOf("delete")!=-1){
                $('.dialog-message').empty();
                if( setting.messageConfirm == '' )
                    setting.messageConfirm = '<?php echo __("LBL_CONFIRM_DELETE")?>';
                $('.dialog-message').append( setting.messageConfirm );
                $('.dialog-wrapper').css({'display':'block'});

                $( ".btn-confirm-yes" ).off().bind("click", function() {
                    Common.deleteAjax(obj,setting);
                });
                return false;
                //if(!confirm('<?php echo __("LBL_CONFIRM_DELETE")?>')) return false;
            }

            if(setting.overlay){
                var addOverlay = Overlay.panel({id:'id_overlay_link'});
                addOverlay.open({title:setting.title,url:w_url});
            }else{
                if(setting.ajax){

                    $.ajax({
                        type: "POST",
                        url: w_url,
                        success: function(data){

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
	/**
	 * do Submit form by the Task for List Controll
	 */
	formSubmit:function(obj,form,task,wtitle,messageConfirm){

		if(!document.getElementById(form)){
			this.alert('[' + form + '] <?php echo __("ERR_ITEM_DOES_NOT_EXISTED");?>');
			return false;	
		}

		//bind task
		$('#'+form+' input[name=task]').val(task);
		switch(task){
				case 'add':
					w_url = $(obj).attr('data-url');
                    if(!w_url) w_url = $(obj).attr('href');
					var addOverlay = Overlay.panel({'id':form + '_overlay_add'});
					addOverlay.open({title:'<?php echo __("LBL_ADD_NEW")?>',url:w_url,data: $('#'+form).serialize()});

					break;
				case 'edit':
					var checked = Common.countChecked(form);
					if(!checked){
						Common.alert('<?php echo __("LBL_PLEASE_SELECT_ITEM")?>');
						return false;
					}
					w_url = $(obj).attr('data-url');
                    if(!w_url) w_url = $(obj).attr('href');
					var addOverlay = Overlay.panel({'id':form + '_overlay_add'});
					addOverlay.open({title:'<?php echo __("LBL_EDIT")?>',url:w_url,data: $('#'+form).serialize()});
					break;
				case 'overlay':
					
					var checked = Common.countChecked(form);
					if(!checked){
						Common.alert('<?php echo __("LBL_PLEASE_SELECT_ITEM")?>');
						return false;
					}
					w_url = $(obj).attr('data-url');
                    if(!w_url) w_url = $(obj).attr('href');
					var addOverlay = Overlay.panel({'id':form + '_overlay_add'});
					addOverlay.open({title:wtitle,url:w_url,data: $('#'+form).serialize()});
					
					break;
				case 'back':

					w_url = $(obj).attr('data-url');
                    if(!w_url) w_url = $(obj).attr('href');
					if(w_url) Common.goUrl(w_url);
					else History.go(-1);
					break;
				default:
					var checked = Common.countChecked(form);
					if(!checked){
						Common.alert('<?php echo __("LBL_PLEASE_SELECT_ITEM")?>');
						return false;
					}
					
					if(task == "delete"){
                        $('.dialog-message').empty();
                        $('.dialog-message').append(messageConfirm);
                        $('.dialog-wrapper').css({'display':'block'});

                        $( ".btn-confirm-yes" ).off().bind("click", function() {
                            w_url = $('#'+form).attr('data-url');
                            if(!w_url) w_url = $('#'+form).attr('action');
                            //doing save content ajax
                            $.ajax({
                                type: "POST",
                                url: w_url,
                                data: $('#'+form).serialize(),
                                success: function(data){
                                    Common.closeDialog();
									var result = $.parseJSON(data);
									if( result.flagDeploy ){
										Common.showHeadTooltip(true);
									}
                                    try{
                                        var data = $.parseJSON(data);

                                        if(data.ok){
                                            if(data.smessage){
                                                Common.showMessage(data.smessage);
                                            }
                                            if(data.urlloadList){
                                                urlLoadList = data.urlloadList
                                            }else{
                                                urlLoadList = $('#'+form).find('input[name=loadListUrl]').val();
                                            }
                                            //LBL_DISPLAY_TO(urlLoadList);

                                            if(urlLoadList){
                                                $('#'+form).parent().load(urlLoadList);
                                            }


                                        }else{
                                            if(data.serror){
                                                Common.showError(data.serror);
                                            }
                                        }
                                    }catch(e){
                                        //LBL_DISPLAY_TO(e.toString());
                                        Common.jsonError(e);
                                    }

                                }
                            });
                        });
                        return false;
						//if(!confirm('<?php echo __("LBL_CONFIRM_DELETE")?>')) return false;
					}

                    w_url = $('#'+form).attr('data-url');
                    if(!w_url) w_url = $('#'+form).attr('action');
					//doing save content ajax	
					$.ajax({
						   type: "POST",
						   url: w_url,
						   data: $('#'+form).serialize(),
						   success: function(data){							   
							   try{
								   result = $.parseJSON(data);
								   if( result.flagDeploy ){
									   Common.showHeadTooltip(true);
								   }
									var data = $.parseJSON(data);
									
									if(data.ok){
										if(data.smessage){
											Common.showMessage(data.smessage);	
										}
										if(data.urlloadList){
											urlLoadList = data.urlloadList
										}else{
											urlLoadList = $('#'+form).find('input[name=loadListUrl]').val();
										}
										//LBL_DISPLAY_TO(urlLoadList);
										
										if(urlLoadList){
											$('#'+form).parent().load(urlLoadList);
										}
										
										
									}else{
										if(data.serror){
											Common.showError(data.serror);	
										}
									}									
							   }catch(e){
									//LBL_DISPLAY_TO(e.toString());
								   Common.jsonError(e);   
							   }										   
																		
						   }
						});
					break;	
		}
		
		return false;
	},
	
	submitSelect: function (obj){
		$task = $(obj).val();
		if($task){
			$formId = $(obj).parents('form:first').attr('id');

			if($formId){
				var checked = Common.countChecked($formId);
				if(!checked) $(obj).val('');

				Common.formSubmit(obj, $formId, $task);
			}
		}
	},
	
	formAjax:function(obj,result){
		var w_url = $(obj).attr('data-url');
		var closeOverlay = $(obj).attr('data-not-close-overlay');

		//check valid date
		if(!FormValidate.validator($(obj).attr("id"))) return false;

		if($(obj).attr("ckeditor")){

			Common.updateCKEditor();
		}

		if($('#'+$(obj).attr('id')+'_img')){
			$('#'+$(obj).attr('id')+'_img').show();
		}

		//doing ajax
		$.ajax({
			   type: "POST",
			   url: w_url,
			   data: $(obj).serialize(),
			   success: function(data){
				   //$('.message_content').parent().css({'display':'none'});
				   if (typeof(result.Callback) === 'function') {

					   result.Callback(data);
				   }else{
					   try{
							var data = $.parseJSON(data);
							if(!closeOverlay){
								Common.closeOverlay();
							}

							if(data.ok){

								if(data.smessage){
									Common.showMessage(data.smessage);
								}
								if( data.swarn ){
									Common.showWarn(data.swarn);
								}
								if(data.urlLoadList){
									urlLoadList = data.urlLoadList;
									$('#'+result.id).load(urlLoadList);
								}
								if( data.url_reload ){
									document.location = data.url_reload;
								}


                                if(result.Callback == 'reload'){
                                    urlCallback = $('input[name=loadListUrl]').val();

                                    var divcallBack = $('input[name=loadListUrl]').closest('form').parent().attr('id');

                                    //load content
                                    Common.load(divcallBack,urlCallback);
                                }else{
                                    eval(result.callBack);
                                }
							}else{
								if(data.serror){
									Common.showError(data.serror);

								}
								if( data.swarn ){
									Common.showError(data.swarn);
								}

								if( !data.serror && !data.swarn ){
									var addOverlay = Overlay.panel({id:'id_overlay_link'});
									addOverlay.open( {title:'Update', url: w_url } );
								}
							}
					   }catch(e){
						   $('#'+result.id).html(data);
						   //alert(e.toString());
					   }
				   }
			   }
			});

		return false;
		
	},

	stripTag:function (html)
	{
		var tmp = document.createElement("DIV");
		tmp.innerHTML = html;
		return tmp.textContent || tmp.innerText || "";
	},

	callBackForm:function(data){
		var data = $.parseJSON(data);
		if(data.ok){
			Common.alert(data.smessage);
		}else{
			Common.error(data.serror);
		}
	},
    formAjax2:function(obj,result){

        w_url = $(obj).attr('ajaxEvent');
        //check valid date
        if(!FormValidate.validator($(obj).attr("id"))) return false;

        //doing ajax
        $.ajax({
            type: "POST",
            url: w_url,
            data: $(obj).serialize(),
            success: function(data){

                if (typeof(result.Callback) === 'function') {
                    result.Callback(data);
                }else{
                    try{
                        var data = $.parseJSON(data);
                        Common.closeOverlay();
                        if(data.ok){
                            //LBL_DISPLAY_TO(data.urlLoadList);
                            if(data.smessage){
                                Common.showMessage(data.smessage);
                            }
                            if(data.urlLoadList){
                                urlLoadList = data.urlLoadList
                                $('#'+result.id).load(urlLoadList);
                            }

                        }else{
                            if(data.serror){
                                Common.showError(data.serror);
                            }
                        }
                    }catch(e){
                        $('#'+result.id).html(data);
                    }
                }
            }
        });

        return false;

    },
	sort:function(obj,field){
		//clear sort		
		obj = $(obj);
		
		if(obj.hasClass('asc')){
			dir = 'desc';
			obj.removeClass('asc');			
		}else{
			dir = 'asc';
			obj.removeClass('desc');
		}
		
		obj.closest('tr').find('.asc').removeClass('asc');
		obj.closest('tr').find('.desc').removeClass('desc');
		
		obj.addClass(dir);
		
		url = obj.closest('form').find('input[name=loadListUrl]').val();
		
		$.ajax({
			url:url,
			type:"POST",
			data:"sort="+field+"&dir="+dir,
			success:function(data){
				//try{
				//var data = $.parseJSON(data);
				obj.closest('form').parent().html(data);
				//}catch(e){
				//	Common.jsonError(e);
				//}
			}
			
		});
		
	},
	
	openGoogleMap:function(input,latlong,address,preview){
		
		try{
			
			var googleOverlay = Overlay.panel();

			googleOverlay.open({title:"<?php echo __('LBL_GOOGLE_MAP');?>",width:750,height:530,iframe:true,url:"<?php echo site_url('common/googlemap');?>"+"/"+input+'/'+latlong+'/'+address+'/'+preview});


		}catch(e){
			Common.error(e.toString());
		}
		
	},

	frontGoogleMap:function(input,latlong,address,preview){



			var url = "<?php echo ROOT_URL;?>"+"common/googlemap/"+input+'/'+latlong+'/'+address+'/'+preview;
			BootstrapDialog.show({
				size: BootstrapDialog.SIZE_LARGE,
				title:'<?php echo __("TITLE_GOOGLE_MAP")?>',
				message: $('<iframe width="100%" height="450"  frameborder="0" src="'+url+'"></iframe>')
			});


	},
	
	openGoogleMap2:function(input,latlong){
		
		try{
			
			var googleOverlay = Overlay.panel({id:'id_overlay_link'});
			googleOverlay.open({title:"<?php echo __('LBL_GOOGLE_MAP');?>",width:750,height:530,iframe:true,url:"<?php echo site_url('common/googlemap2');?>"+"/"+input+'/'+latlong});
			
		}catch(e){
			Common.error(e.toString());
		}
		
	},
	
	selectGEO : function(obj,value,preview){
		$('#'+obj).val(value);
		if(preview){
			var src = $('#'+preview).attr('src');
			if(src){
			var src_new = src.replace(/label:C\|(.)*\&sensor/g, 'label:C|'+value.replace('-',',')+'&sensor');			
			$('#'+preview).attr('src',src_new);
			$('#'+preview).parent().show();
			}
		}
		Common.closeOverlay();
	},
	
	getElementVal:function(obj){
		return $('#'+obj).val();
	},
		
	clearForm : function(obj){


		var form = $(obj).closest('form');
		form.find('input[type=text]').val('');
		form.find('textarea').val('');
		form.find('select').val('');
		form.find('input[type=checkbox]').attr('checked', false);		
	},
	
	makeTranslation : function (obj,overlay){
		var lang = $('#translate_to_hidden').val();
		if(!lang){
			Common.alert("<?php echo __('ERR_SELECT_LANGUAGE')?>");
			return false;
		}
		url = $(obj).attr('href')+'/'+ lang;
		//LBL_DISPLAY_TO(url);
		if(overlay){
			var addOverlay = Overlay.panel({'id':'translate_overlay'});
			addOverlay.open({title:'<?php echo __("Translation")?>',url:url});
		}else{
			Common.goUrl(url);
		}
		
		return false;
	},
	
	removeTranslate: function (obj){
		if(confirm('<?php echo __("LBL_CONFIRM_REMOVE")?>')){
			url = $(obj).attr('href');			
			$(obj).closest('tr').remove();
			$.ajax({url:url,success:function(data){
				try{
					var data = $.parseJSON(data);
					
					if(data.ok) Common.showMessage(data.smessage);
					else Common.showError(data.serror);					
					
					
					var obj = $('input[name="loadListUrl"]');			
					$(obj).closest('form').parent().load(obj.val());
				}catch(e){
					Common.jsonError(e);
				}
				
				Common.closeOverlay();
			}});
			
		}
		return false;
	},
	
	imageBox:function(obj,large){
		var url = $(obj).attr("src");
		if(large==1){
			url = url.replace('thumbs/','');
		}
		var img = $('<img/>');
		img.attr('src',url);
		var addOverlay = Overlay.panel({'id':'img_overlay'});
		addOverlay.open({title:"<?php echo __('LBL_VIEW');?>",content: img});
	},
	
	ajaxCallback : function (data){
		try{
			var data = $.parseJSON(data);
			Common.closeOverlay();
			if(data.ok){
				Common.alert(data.smessage);
			}
			else
				Common.alert(data.serror);

			
		}catch(e){
			Common.jsonError(e);
		}
	},

	ajaxCallbackFront : function (data){
		try{
			var data = $.parseJSON(data);
			Common.closeOverlay();
			if(data.ok){
				Common.dialogAlert(data.smessage);
			}
			else
				Common.dialogAlert(data.serror);


		}catch(e){
			Common.jsonError(e);
		}
	},
	
	getRegion: function(objCountry,region,city,empty){
		var country = $(objCountry).val();
		var region = $('#'+region);
		var city = $('#'+city);
		if(country){		
			$.ajax({
				url: "<?php echo site_url('common/getStates');?>",
				type: "POST",
				data:"&country=" + country,
				success:function(data){
					try{
						var data = $.parseJSON(data);
						if(data.ok){
							var i = 0;
							if(region){
								region.empty();
								if(empty) region.append('<option value=""><?php echo __("LBL_SELECT_ONE");?></option>');
								for(i=0;i< data.region.length;i++){
									region.append('<option value="'+data.region[i].region_code+'">'+data.region[i].region_name+'</option>');
								}
							}
							
							if(city){
								city.empty();
								if(empty) city.append('<option value=""><?php echo __("LBL_SELECT_ONE");?></option>');
								for(i=0;i< data.city.length;i++){
									city.append('<option value="'+data.city[i].city_id+'">'+data.city[i].city_name+'</option>');
								}
							}
						}						
					}catch(e){
						Common.jsonError(e);
					}
				}
			});
		}
	},
	
	getCity: function(objRegion,objCountry,city,empty){
		var country = $('#'+objCountry).val();
		var region = $(objRegion).val();
		var city = $('#'+city);
		$.ajax({
			url: "<?php echo site_url('common/getCity');?>",
			type: "POST",
			data:"&country=" + country+'&region='+region,
			success:function(data){
				try{
					var data = $.parseJSON(data);
					if(data.ok){
						var i = 0;						
						if(city){
							city.empty();
							if(empty) city.append('<option value=""><?php echo __("LBL_SELECT_ONE");?></option>');
							for(i=0;i< data.city.length;i++){
								city.append('<option value="'+data.city[i].city_id+'">'+data.city[i].city_name+'</option>');
							}
						}
					}	
				}catch(e){
					Common.jsonError(e);
				}
			}
		});
		
	},	
	doImport:function (obj,input_name){
		
		var strInput = new Array();
		
		$(obj).parent().find('input:checked').each(function(){
			if($(this).val()!='true'){
				var val = $(this).val();
				var input = $($('#'+input_name+'_hidden').val());
					input.val(val);
				var titleName = $($('#'+input_name+'_hiddenTitle').val());
					titleName.val($('#name_'+val).val());
				var name = $('<span>'+$('#name_'+val).val()+'</span> <a class="pointer" onclick="Common.removeMember(this)"><i class="icon-remove"></i></a>');
				var item = $('<span class="items items_'+val+'"></span>');
				item.append(input);item.append(titleName);item.append(name);
				$('#'+input_name+'_require').val('1');
				FormValidate._validateField($('#'+input_name+'_require'));
				var count = 0;
				$('#'+input_name+'_wrap').find('.items_'+val).each(function(){count++});
                //LBL_DISPLAY_TO(item);
				if(!count){
					if($('#memberChoseType').val()=='checkbox'){
						$('#'+input_name+'_wrap').append(item);

					}else{
						$('#'+input_name+'_wrap').html(item);
					}
				}
				
			}			
		});		
		
		Common.closeOverlay();
	},
	importMemberRadio:function(obj)
    {
        $(obj).parent().find('input:checked').each(function(){
            if($(this).val()!='true'){
                var memberID = $(this).val();
                var rolesProject =$('#rolesProjects').val();
                var formData = {memberID:memberID,rolesProject:rolesProject};
                $.ajax({
                    url: "<?php echo site_url('projects/insertMember');?>",
                    type:"post",
                    data:formData,
                    success:function(data){
                        try{
                            var data = $.parseJSON(data);
                            if(data.ok){

                                var urlLoad ="<?php echo site_url('projects/loadMemberList');?>";
                                $('#memberList').load(urlLoad);
                            }
                            else
                            {
                                Common.showError(data.serror);
                            }
                        }catch(e){
                            Common.jsonError(e);
                        }
                    }

                })




            }
        });

        Common.closeOverlay();
    },
	removeMember : function(obj){
		var wrap = $(obj).closest('.controls');
		var require = wrap.find('.inputRule');
		Common.removeParent(obj);
		var item = wrap.find('.items');
		FormValidate._validateField(require);
		if(item.length<=0){
			require.val('');
		}
		
		
		
	},
	
	approve: function(url,post){
		$.ajax({
			url: url,
			type: "POST",
			data:"&cid=" +post,
			success:function(data){
				Common.ajaxCallback(data);
			}
		});
	},
	
	unapprove: function(url,post){
		if(!confirm('<?php echo __("LBL_CONFIRM_REJECT");?>')) return;
		$.ajax({
			url: url,
			type: "POST",
			data:"&cid=" +post,
			success:function(data){
				Common.ajaxCallback(data);
			}
		});
	},
	
	replyMessage:function(id){
		Common.closeOverlay();
		w_url = '<?php echo site_url("message/reply") ?>'+'/'+id;
		var addOverlay = Overlay.panel({'id':'reply_overlay_add'});
		addOverlay.open({title:'<?php echo __("Reply")?>',url:w_url,data:''});
	},
	
	buttonClick:function(obj){
		var form = $(obj).closest('form');
		
		var task = form.find("input[name='task']");
		
		task.val($(obj).attr('name'));
	},
	
	removeMyTranslation:function(obj,id){
		if(!confirm('<?php echo __("LBL_CONFIRM_DELETE");?>')) return;
		$(obj).parent().parent().remove();
		var url ='<?php echo site_url("common/removeTrans/");?>/'+id;
		$.ajax({
			url: url,
			type: "POST",			
			success:function(data){
				Common.ajaxCallback(data);
			}
		});
	},

    loadShoutComment: function(data){
        try{
            var data = $.parseJSON(data);
            $('#'+data.code+'_shoutbox').load('<?php echo site_url("system/shoutbox/load/")?>/'+data.code);
        }catch (e){
            Common.jsonError(e);
        }
    },
    changeNumberListShowing : function(obj){
        var form = $(obj).closest('FORM');
        var loadListUrl = form.find('input[name=loadListUrl]').val();
        form.find('input[name=task]').val('changeShowingNumber');
        $.ajax({
            url: loadListUrl,
            type: "POST",
            data:form.serialize(),
            success:function(data){
                $(form).parent().html(data);
            }
        });

    },
	closeDialog:function(){
		$('.dialog-wrapper').css({'display':'none'});
		$('.dialog-wrapper-deploy').css({'display':'none'});
		$('.dialog-backup').css({'display':'none'});
		$('.bar').css({'width':''});
		$('#btn_backup_retry').hide();
	},
	closeDialogView:function(){
		$('.dialog-wrapper-view').css({'display':'none'});
	},
	deleteAjax:function(obj,setting){

		if(setting.overlay){
			var addOverlay = Overlay.panel({id:'id_overlay_link'});
			addOverlay.open({title:setting.title,url:w_url});
		}else{
			if(setting.ajax){

				$.ajax({
					type: "POST",
					url: w_url,
					success: function(data){
						var result = $.parseJSON(data);
						if( result.flagDeploy ){
							Common.showHeadTooltip(true);
						}
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
	},
	sysncMenu:function(element,option){
		nameClass = $(element).attr("menuClass");
		$('li').each(function(index, element) {
			var isDisabled = $(element).attr('menuClass');
			if (isDisabled) {
				$(element).removeClass('active');
			} else {
				// Handle input is not disabled
			}
		});
		//$('li').removeClass('active');
		//$('.shell ul>li>a.dropdown-toggle').parent('li').removeClass('active');
		$('li').find('ul').css({'display':'none'});
		$(nameClass).addClass('active');
		$("#cssmenu>ul>li").find('a').find('b').remove();
		$("#cssmenu>ul>li").find('a').parent(nameClass).find('a').first('a').append('<b class="caret"></b>');
		if( option )
			$(nameClass).find('ul').slideDown("slow");
		//alert('11111');
	},
	showHeadTooltip:function(value){
		if( value ){
			$('#tooltip-head-deploy').css({'display':'block'});
		}
	},

	updateProgress:function(percent,title,error,status){
		$('.progress').addClass('progress-striped').addClass('active');
		$('.progress .bar').removeClass().addClass('bar')
			.addClass((percent < 40) ? 'bar-danger' : ( (percent < 80) ? 'bar-warning' : 'bar-success' ));


		if(error){
			$('#deploy_user_message_status').removeClass('text_message');
			$('#deploy_user_message_status').addClass('text_error');
		}else{
			if(percent != -1){
				$('.progress .bar').width(percent + '%');
				$('.progress .bar').text(percent + '%');
			}


			$('#deploy_user_message_status').removeClass('text_error');
			$('#deploy_user_message_status').addClass('text_message');
		}
		if(title){
			$('#deploy_user_message_status').html(title);
		}

	},

	dialogAlert:function(content){

		BootstrapDialog.show({
			title: '<?php echo __("ALERT_TITLE")?>',
			message: content,
			buttons: [
				{
					label: '<?php echo __("BTN_CLOSE")?>',
					action: function(dialogItself){
						dialogItself.close();
					}
				}]
		});
	},

	dialogError:function(content){

		BootstrapDialog.show({
			title: '<?php echo __("ALERT_ERROR_TITLE")?>',
			type: BootstrapDialog.TYPE_DANGER,
			message: content,
			buttons: [
				{
					label: '<?php echo __("BTN_CLOSE")?>',
					action: function(dialogItself){
						dialogItself.close();
					}
				}]
		});
	},

	sendMail:function(obj){
		var company_id = $(obj).attr('data-company');

		BootstrapDialog.show({
			title:$(obj).attr('data-title'),
			message: $('<div class="popupEmailEnquery"><img style="width: 20px; height: 20px;" src="'+ROOT_URL+'styles/images/loading.gif"/>Đang tải...</div>').load('<?php echo site_url("home/company/sendMailForm");?>/?company_id='+company_id),

		});
	}
}