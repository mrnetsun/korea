<div class="webtoolbar services">
	<div class="shell">
		<div id="nav-toolbar">
			<div class="toolbar_header"><h3>
					<span class="sub"><?php echo __('LBL_RUN_DAILY_UPDATE') ?></span>
				</h3></div>
			<div class="clr"></div>
		</div>
		<div class="clr"></div>
	</div>
</div>
<?php
$formBase = new FormBase();
$formBase->fillData($arySearch);
$server = json_decode(getDBConfig('SOLR_SSH_SERVER'));
$command = getDBConfig('SOLR_DAILY_UPDATE');
?>
<div class="main">
	<div class="shell system_alert" style="padding: 0px 0px;display: block;">
		<div class="main form-horizontal">
			<?php $formBase = new FormBase();
			$formBase->fillData($member);
			echo $formBase->create('home/cronlog/command/daily',array('ajax'=>array('Callback'=>'ajaxCallback'),'class'=>'form-horizontal','id'=>'form-cronlog' ));
			?>
			<div class="screenView formView">
				<div class="control-group">
					<label class="control-label"><?php echo __("LBL_SERVER")?></label>
					<div class="controls">
						<?php echo $server[0][0]?>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"><?php echo __("LBL_COMMAND")?></label>
					<div class="controls">
						<?php echo $command?>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"><?php echo __("LBL_PASSWORD")?></label>
					<div class="controls">
						<?php echo $formBase->password('password',array('rules'=>'required','class'=>'span3'));?>
						<?php echo $formBase->submit('BTN_SUBMIT',array('label'=>__('LBL_RUN'),'id'=>'btnCommand' ) ); ?>
						<?php echo $formBase->back('BTN_BACK',site_url('home/cronlog'),array('label'=>__('BTN_BACK')) ); ?>
					</div>
				</div>
				<?php echo $formBase->end();?>

				<div class="clear"></div>
			</div>

			<span style="font-size: 14px;font-weight: bold;padding: 0 0 5px 0;display: block"><?php echo __("LBL_RESULTS");?></span>
			<div class="boxin2">
				<div class="boxin-content"><!-- content box 1 for tab switching -->
					<div id="add"></div>
				</div>
			</div><!-- .content#box-1-holder -->
		</div>
		<div class="clear"></div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('#form-cronlog').submit(function(){
			$('#btnCommand').prop('disabled', true);
		});
	});
	function ajaxCallback(data){
		$('#btnCommand').prop('disabled', false);
		try{
			var data = $.parseJSON(data);
			Common.closeOverlay();
			if(data.ok){
				var temp = '<div class="new-line-log smessage_success">'+data.smessage+'</div>';
				//Common.alert(data.smessage);
				$(temp).insertAfter('#add').show("blind", {
					direction: "up"
				}, 1000);

				//$('.boxin-content').append(data.smessage).slideDown("fast");
				//Common.load('<?php echo site_url('home/cronlog/fullupdate'); ?>')
			}
			else{
				//Common.error(data.serror);
				var temp = '<div class="new-line-log smessage_error">'+data.serror+'</div>';
				//Common.alert(data.smessage);
				$(temp).insertAfter('#add').show("blind", {
					direction: "up"
				}, 1000);
			}

			//window.location.href = '<?php echo site_url('home/cronlog/fullupdate'); ?>';
		}catch(e){
			Common.jsonError(e);
		}
	}
</script>
