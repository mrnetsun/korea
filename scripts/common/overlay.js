/*
 @Auth: Lucdt Overlay Libray
 @Date: 2013-05-30
 */
var OverlayStack = [];

$(document).keydown(function(e) {
    // ESCAPE key pressed
    if (e.keyCode == 27) {
        var closer = OverlayStack.pop();
		
		if(OverlayStack.length == 0){
            $('body').removeClass('bodyFix');
            $('.overlayWrapFixed').removeClass('overlayWrapFixed');
        }
		
		if(closer){
			$closer = $('#'+closer);
			$closer.find('.overlay').hide();
			$closer.find('.modal').hide();
		}
		e.preventDefault();
    }
});

var Overlay = function () {};
 Overlay.prototype = {
	 
	overlayCount : 0,
	instantDiv:'',
				 
	modal:function(config){
				this.overlayCount ++;	
				var 
				method = {},
				$overlay,
				$modal,
				$content,
				$close;
				
				if(!arguments[0]) config = {};
				
				var instantDiv = '';
				
				if(config.id){
					instantDiv = config.id; 	
				}
				
				method.config = config;
				method.overlayCount = this.overlayCount;
				
				// Center the modal in the viewport
				method.center = function () {
					var top, left;

					if(this.config && this.config.center){
						top = Math.max($(window).height() - $modal.outerHeight(), 0) / 2;
					}else top = 20;
					
					left = Math.max($(window).width() - $modal.outerWidth(), 0) / 2;

					$modal.css({
						top:top + $(window).scrollTop(), 
						left:left + $(window).scrollLeft(),
						position:'fixed'
					});
				};

				// Open the modal
				method.open = function (settings) {
					//add To manager
					var tempDivId = '';					
					if(this.config.id){
						tempDivId = this.config.id;
					}else{						
						tempDivId = 'overlayWrap_'+this.overlayCount;	
					}
					
					//$content.empty().append(settings.content);
					var w_title='',w_w='',w_h='',w_url='',w_data='',w_content='';
				
					if(settings){
						w_title = settings.title;
						w_w = settings.width;
						w_h = settings.height;
						w_url = settings.url;
						w_data = settings.data;
						w_content = settings.content;
					}
					
					if(w_content){ 
							//instant content
							$content.append(w_content);
						}else{
							if(w_url){
								//get content ajax
								$('#'+tempDivId).hide();	
								$.ajax({
									   type: "POST",
									   url: w_url,
									   data: w_data+'&ajax=1',
									   success: function(data){
										   $('#'+tempDivId).fadeIn(500);
										   try{		  
												var data = $.parseJSON(data);
												$("#overlay_"+this.overlayCount).html(data.html);
												method.center();
										   }catch(e){
											   //alert(e.toString());
												Common.jsonError(e);   
										   }										   
																					
									   }
									});	 
								
							}
						}
						if(w_title){
							$title.html(w_title);
						}
						
						if(w_w){
							$content.width(w_w-40);	
						}
						
						if(w_h){
							$content.height(w_h);	
						}
					
					$modal.css({
						width: w_w || 'auto', 
						height: w_h || 'auto'
					});
					
					
					//if(isError) return false;

					method.center();
					$(window).bind('resize.modal', method.center);
					$modal.show();
					$overlay.show();
				};

				// Close the modal
				method.close = function () {
					$modal.hide();
					$overlay.hide();
					$content.empty();
					$(window).unbind('resize.modal');
				};

				// Generate the HTML and add it to the document
				$title = $('<div class="overlayTitle"></div>');
				$overlay = $('<div class="overlay"></div>');
				$modal = $('<div class="modal"></div>');
				$content = $('<div id="overlay_'+this.overlayCount+'"  class="content"></div>');
				$close = $('<a class="close" href="#">close</a>');
				
				$modal.hide();
				$overlay.hide();
				$modal.append($title,$content, $close);

				if(instantDiv){					
					if(document.getElementById(instantDiv)){
						$('#'+instantDiv).html('');
						$('#'+instantDiv).append($overlay, $modal);
					}else{
						$wrap = $('<div id="'+instantDiv+'"></div>');					
						$wrap.append($overlay, $modal);
						$('body').append($wrap);						
					}
				}else{
					overlayCount = this.overlayCount;					
					$(document).ready(function(){
						$wrap = $('<div id="overlayWrap_'+overlayCount+'"></div>');					
						$wrap.append($overlay, $modal);
						$('body').append($wrap);						
					});				
				}

				$close.click(function(e){
					OverlayStack.pop();
					e.preventDefault();
					method.close();
				});
				
				return method;
			  },
			  
	panel:function(config){
		
				
				var 
				method = {},
				$overlay,
				$modal,
				$header,
				$content,
				$close;
				this.overlayCount ++;
				
				if(!arguments[0]) config = {}
				
				var instantDiv = '';
				var isTitle = (config.title==false)?0:1; //set title status
				
				if(config.id){
					instantDiv = config.id; 	
				}
				method.config = config;
				
				method.overlayCount = this.overlayCount;
				
				// Center the modal in the viewport
				method.center = function () {
					var top, left;
					if(this.config && this.config.center){						
						top = Math.max($(window).height() - $modal.outerHeight(), 0) / 2;
					}else top = 20;
					left = Math.max($(window).width() - $modal.outerWidth(), 0) / 2;
					
					if(this.config) $fixed = (this.config.fixed)?'fixed':'absolute';
					
					$modal.css({
						top:top + $(window).scrollTop(), 
						left:left + $(window).scrollLeft(),
						position: $fixed
					});
				};

				// Open the modal
				method.open = function (settings) {
					if(!$('body').hasClass("bodyFix")){
                        $('body').addClass('bodyFix');
                        $('.overlayWrap').addClass('overlayWrapFixed');
                    }
					//add To manager
					var tempDivId = '';					
					if(this.config.id){
						tempDivId = this.config.id;
					}else{						
						tempDivId = 'overlayWrap_'+this.overlayCount;	
					}
					
					OverlayStack.push(tempDivId);
					 
					var w_title='',w_w='',w_h='',w_url='',w_data='',w_content='';
				
					if(settings){
						w_title = settings.title;
						w_w = settings.width;
						w_h = settings.height;
						w_url = settings.url;
						w_data = settings.data;
						w_content = settings.content;
						w_iframe = settings.iframe;
					}
					
					if(w_content){ 
						//intant content
						$content.html(w_content);
					}else{
						if(w_url){
							//get content ajax
							//get content ajax
							if(w_iframe){
								n_w = w_w -20;
								n_h = w_h -50;
								$iframe = $('<iframe width="'+n_w+'" scrolling="auto" height="'+n_h+'" align="middle" style="background:#fff;margin:0;padding:0;border:none !important;">Loading..</iframe>');
								$iframe.attr('src',w_url);
								$content.html($iframe);
							}else{
								$('#'+tempDivId).hide();
								$.ajax({
										   type: "POST",
										   url: w_url,
										   data: w_data+'&ajax=1',
										   success: function(data){
											   	   $('#'+tempDivId).fadeIn(500);
												   try{
													  
														var data = $.parseJSON(data);
														$content.html(data.html);	
														method.center();
												   }catch(e){
														//alert(e.toString());
													   Common.jsonError(e);   
												   }										  
																						
										   }
										});	 
									
								}
							}
					}
					
					if(w_title){
						$header.find('H3').html(w_title);	
					}
					
					if(w_w){
						$box.width(w_w);	
					}
					
					if(w_h){
						$box.height(w_h);	
					}
					//$content.empty().append(settings.content);

					$modal.css({
						width: settings.width || 'auto', 
						height: settings.height || 'auto'
					});

					method.center();
					$(window).bind('resize.modal', method.center);
					$modal.show();
					$overlay.show();
				};

				// Close the modal
				method.close = function () {
					
					$modal.hide();
					$overlay.hide();
					$content.empty();
					$(window).unbind('resize.modal');
				};

				// Generate the HTML and add it to the document
				$overlay = $('<div class="overlay"></div>');
				$modal = $('<div class="modal"></div>');
				if(instantDiv){
					$box = $('<div id="overlay_'+instantDiv+'" class="box boxOverlay"></div>');
						 
				}else{
					$box = $('<div id="overlay_'+this.overlayCount+'" class="box boxOverlay"></div>');
				}
				
				if(isTitle){
					$header = $('<div class="header"><div class="icon"></div><h3></h3></div>');
					
					//dragdrop setting
					$header.mousedown(function() {
						$(this).parent().parent().draggable({ disabled: false });
					});					
					$header.mouseout(function() {
						$(this).parent().parent().draggable({ disabled: true });
					});
					//end
					
				}else{
					$header = $('');
				}
				$content = $('<div class="content boxContent">Loading...</div>');
				$close = $('<a class="closeWindow" href="#">close</a>');
				
				
				
				
				$box.append($header, $content);
				
				$modal.hide();
				$overlay.hide();
				$modal.append($box, $close);

				if(instantDiv){
								
					if(document.getElementById(instantDiv)){
						$('#'+instantDiv).html('');
						$('#'+instantDiv).append($overlay,$modal);
					}else{
						$wrap = $('<div class="overlayWrap" id="'+instantDiv+'"></div>');
						$wrap.append($overlay,$modal);
						$('body').append($wrap);						
					}
				}else{				
					overlayCount = this.overlayCount;				
					$(document).ready(function(){
						$wrap = $('<div class="overlayWrap" id="overlayWrap_'+overlayCount+'"></div>');
						$wrap.append($overlay,$modal);
						$('body').append($wrap);						
					});				
				}
				
				

				$close.click(function(e){
					OverlayStack.pop();
					if(OverlayStack.length == 0){
                        $('body').removeClass('bodyFix');

                    }
                    $('.overlayWrapFixed').removeClass('overlayWrapFixed');

					e.preventDefault();
					method.close();
				});
				
				return method;
			  }
              
			}
var Overlay = new Overlay();