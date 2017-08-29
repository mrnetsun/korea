<?php
$formBase = new FormBase();
$data_before = json_decode($fillData->data_before);
$data_after = json_decode( $fillData->data_after );
?>
<div class="section ">
	<?php
	if( $data_after->classifications )
		echo $formBase->view(__('LBL_CATEGORY'), $data_after->classifications );
	if(  $data_after->classifications !== $data_before->classifications  ){
		echo $formBase->view('',$data_before->classifications,'',array('class'=>'line-through-old'));
	}
	?>
</div>
<div class="clear"></div>