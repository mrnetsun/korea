<?php
$aryOption = array("0"=>__("No"),"1"=>__("Yes"));
foreach($tableField as $row){
	$obj = json_decode($row);
	echo "<ul><li class=''><a class='pointer' onclick='systemController.removeElement(this)'><span class='toolbar_icon-16 toolbar_icon-16-delete'></span></a></li>
		<li class='w140'><input type='hidden' name='listSearchRow[field][]' value='".$obj->name."'/>".$obj->name."</li>
		<li class='w140'>".form_input('listSearchRow[label][]')."</li>
		<li class='w140'>".form_dropdown('listSearchRow[search][]',$aryOption)."</li>
		<li class='w140'>".form_dropdown('listSearchRow[sort][]',$aryOption)."</li></ul>";
}
?>