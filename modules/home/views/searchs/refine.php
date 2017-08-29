<?php
if(!$refine) $refine = array();
echo '<ul class="list-unstyled refineGroup moreRefineGroup">';
foreach ($facetsCollection as $k => $v) {
    $checked = (in_array($k,$refine))?'checked="checked"':'';
    $i++;
    echo '<li class="tdRow">';
    echo '<label><div class="tdCell"><input type="checkbox" '.$checked.' name="refine['.$key.'][]" value="' . $k . '">&nbsp;</div><div class="tdCell"> ' . $k . '(' . $v . ')</div></label>';
    echo '</li>';

}
echo '</ul>';
?>
<div class="clear"></div>
