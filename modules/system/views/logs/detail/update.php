<?php
/**
 * Created by PhpStorm.
 * User: OSD
 * Date: 11/11/2015
 * Time: 11:25 AM
 */
$data_before = json_decode($fillData->data_before);
$data_after = json_decode($fillData->data_after);
//debug($data_after,false);
//debug($data_before,false);
$strHtml = '';
$strHtmlSame = '';
$flagObjectDeffirent = true;// $data_before same $data_after
?>
<table class="tableList">
    <tr>
        <th class="span2 tl"><?php echo __("LBL_FIELD")?></th>
        <th class="span2 tl"><?php echo __("LBL_BEFORE")?></th>
        <th class="span2 tl"><?php echo __("LBL_AFTER")?></th>
    </tr>

<?php
foreach($data_after as $k=>$v){
    if(($v != $data_before->{$k}) ) {
        $flagObjectDeffirent = false;
        $strHtml .="<tr>";
        $strHtml .="<td><span>".__(strtoupper('LBL_'.$fillData->controller.'_'.$k))."</span></td>";

        $strHtml .="<td>";
        if($k == 'status'){
            $lv = ( $data_before->{$k} )?'ACTIVE':'DEACTIVE';
            $strHtml.= __('LBL_'.$lv);
        }else{
            $strHtml.= $data_before->{$k};
        }
        $strHtml.="</td>";
        $strHtml.="<td>";
        if($k == 'status'){
            $lv = ($v)?'ACTIVE':'DEACTIVE';
            $strHtml.= __('LBL_'.$lv);
        }else{
            $strHtml.= $v;
        }
        $strHtml.= "</td>";
        $strHtml.= "</tr>";
    }
}

if( $flagObjectDeffirent ){
    $strHtmlSame .="<tr><td colspan='3'>".__("Haven't changed data")."</td></tr>";
    echo $strHtmlSame;
}else{
    echo $strHtml;
}
    ?>
</table>
