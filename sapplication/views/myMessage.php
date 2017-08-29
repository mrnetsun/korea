<div class="listWrap">
<div class="header clear h30">
	<div class="span0 w30 mg5"></div>
	<div class="span3 w470" style="margin-left:5px;"><?php echo __("Message");?>
	<div class="mg5 right"><?php echo anchor('message',__('All message'))?></div>
	</div>
</div>
<?php

if(!empty($aryMessage)){
	$i=0;
	
	foreach ($aryMessage as $key=>$item){
	?>
	<div class="rowItem clear">
	<div class="span0 w30 mg5 tc">
	<?php 
						if($item->createdId == $LoginData->memberId){
							echo img('msg-fwd.gif');
						}else{
							if($item->read_flag){
								echo img('msg-rd.gif');
							}else{
								echo img('email.gif');
							}
						}
					?>
	</div>
	<div class="span3 w470 mg5">
		<div><?php  echo anchor('message/detail/'.$item->message_id,$item->title,array('onclick'=>"return Common.linkSetup(this,{ajax:true,overlay:true,title:'View'})"));?></div>
		<div class="note"><?php echo $item->createdName;?> - <?php echo $item->createdTime;?></div>
	</div>	
	
	</div>
	
	<?php 
	}
}else{
	echo "<div class='clear span0 error'>".__("No message found.")."</div>";
}
?>

<div class="clear"></div>
</div>