<div style="height:50px;" class="clear"></div>
<div id="footer">
		<div class="shell">
			<nav class="footer-nav">
				<?php							
					$type = 'main';
					$aryMenu = getModuleMenu('',0,array('menuType'=>$type));
					foreach($aryMenu as $menu){						
						$class= (current_url()==site_url($menu->menuLink))?'class="active"':'';
						if(($menu->menuLink !='auth' && $menu->menuLink!='auth/signup')){
							echo '<a '.$class.' href="'.site_url($menu->menuLink).'"><span class="bottom-arr"></span>'.__($menu->menuName).'</a>';
						}else{
							if(!$LoginData){
								echo '<a '.$class.' href="'.site_url($menu->menuLink).'"><span class="bottom-arr"></span>'.__($menu->menuName).'</a>';
							}
						}
						
					}
					?>	
				
			</nav>
			<p class="copy">Copyright &copy; <?php echo date("Y")?> Handytrail.com  Designed by <a href="http://cmcsoft.com/index.php?lang=en" target="_blank">CMC Software.</a></p>
			<div class="cl">&nbsp;</div>
		</div>
	</div>
    <div id="AppLoadding">
    <div id="AppLoaddingContent">
        <img src="<?php  echo THEME_PATH.$userCurrentTheme; ?>images/loadding.gif" align="middle" style=" vertical-align:middle"  />
        {t}Loading...{/t}</div>
	</div>
	<script src="<?php  echo ROOT_URL; ?>styles/bootstrap/js/bootstrap.js"></script> 
	<?php echo $template['footer_load'];?>	
</body>
</html>

<script type="text/javascript">
$(document).ready(function() {
	$('#AppLoadding').ajaxStart(function () {		
            $(this).show();           
        });
	
	$('#AppLoadding').ajaxComplete(function (e, xhr, settings) {
		
	});
	
	$('#AppLoadding').ajaxError(function(e, jqXHR, settings, exception){
		var msg = '';
		if (jqXHR.status === 0) {
			msg = 'Not connected. Please verify network is connected.'
		} else if (jqXHR.status == 404) {
			msg = 'Requested page not found.'
		} else if (jqXHR.status == 500) {
			msg = 'Internal Server Error.'
		} else if (exception === 'parsererror') {
			msg = 'Requested JSON parse failed.'
		} else if (exception === 'timeout') {
			msg = 'Time out error.'
		} else if (exception === 'abort') {
			msg = 'Ajax request aborted.'
		} else {
		  	msg = "Unknwon error"; 
		}
		
		if(msg){
			//open error => Close overlay.																				
			var closer = OverlayStack.pop();
			if(closer){
				$closer = $('#'+closer);
				$closer.find('.overlay').hide();
				$closer.find('.modal').hide();
			}
										
			Common.error(msg)};
		
	});

	$('#AppLoadding').ajaxStop(function () {
		$('.Form').each(function(){
			FormValidate.bindEventRules($(this).attr("id"));
		});
		$(this).hide();
	});

	$('#AppLoadding').ajaxSuccess(function (e, xhr, settings) {
		try {			
		} catch (e) { }
	});

	//setup toolbar fix;
	function showDiv() {
		
	if ($(window).scrollTop() > 150 && $('#nav-toolbar').data('positioned') == 'false') {
	$("#nav-toolbar").addClass("nav-toolbar-fix").data('positioned', 'true');
	 
	} else if ($(window).scrollTop() <= 150 && $('#nav-toolbar').data('positioned') == 'true') {
	$("#nav-toolbar").removeClass("nav-toolbar-fix").data('positioned', 'false');
	}
	}
	$(window).scroll(showDiv);
	$('#nav-toolbar').data('positioned', 'false');
	
	//setup form validate
	FormValidate = new FormValidate();
	$('.Form').each(function(){
			FormValidate.bindEventRules($(this).attr("id"));
			$(this).submit(function(){
				return 	FormValidate.validator($(this).attr("id"));
			});
	});
	
});
</script>