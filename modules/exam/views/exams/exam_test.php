<?php
if($test)foreach($test as $k=>$t){
    $index = $k % 2;
    echo '<div class="testItem row_'.$index.'"><input type="hidden" name="data[exam][test_id][]" value="'.$t->test_id.'">'.anchor('exam/test/detail/'.$t->test_id,$t->test_id.'. ',array('target'=>'_blank')).$t->test_name.'<a onclick="examController.removeTest(this);"  class="pointer right"><i class="icon icon-trash"></i></a></div>';
}else{
    echo '<div class="testItem row_0">'.__("LBL_DATA_NOT_SET").'</div>';
}