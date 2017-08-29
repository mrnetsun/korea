<?php
$aryOption = array(
			'textbox'=>'Text Box',
			'password'=>'Password',
			'textarea' => 'Text Area',			
			'select'=>'Select',
			'radio'=>'Radio',
			'status'=>'Status',
			'yesno'=>'Yes/No',
			'checkbox'=>'Check Box',		    
			'number'=>'Number',
			'date' => 'Date',
			'datetime' => 'Datetime',
			'daterange' => 'Date Range',
			'import' => 'Import',
			'latlong' => 'Latitude/Longitude',
			'slider' => 'Slider',
			'autocomplete' => 'Autocomplete',
			'upload' => 'Upload',
			'upload_image' => 'Upload Image',
			'upload_document' => 'Upload Document',
			
			'captcha' => 'Captcha'
		);

foreach($tableField as $row){
	$obj = json_decode($row);
	echo "<ul><li class=''><a class='pointer' onclick='systemController.removeElement(this)'><span class='toolbar_icon-16 toolbar_icon-16-delete'></span></a></li>
		<li class='w140'><input type='hidden' name='addEditRow[field][]' value='".$obj->name."'/>".$obj->name."</li>
		<li class='w140'>".form_input('addEditRow[label][]')."</li>
		<li class='w140'>".form_dropdown('addEditRow[type][]',$aryOption)."</li>
		<li class='w140'>".form_input('addEditRow[validate][]')."</li></ul>";
}
?>
