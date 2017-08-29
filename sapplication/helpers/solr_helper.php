<?php
if(!defined('BASEPATH')) {exit('No direct script access allowed');}
/**
 * Created by PhpStorm.
 * User: Lucdt
 * Date: 1/7/2016
 * Time: 4:27 PM
 */

function yp_display_selected_field($json,$array = false){
    $data =  json_decode($json);
    if(!is_array($data)) return;

    $return = array();
    $CI = &get_instance();
    $CI->db2->where_in('field_id',$data);
    $fields = $CI->db2->get_where('field_config',array('status'=>ACTIVE))->result();
    foreach($fields as $f){
        $return[] = $f->fieldName;
    }
    if($array){
        return $return;
    }else{
        return implode(', ',$return);
    }

}

function yp_display_sort_field($json,$array = false){
    $data =  json_decode($json);
    $return = array();
    foreach($data as $item){
        if($item->field_id !='score'){
            $field = get_config_field($item->field_id);
            $return[] = $field->fieldName .' '.$item->dir;
        }else{
            $return[] = $item->field_id .' '.$item->dir;
        }
    }

    if($array){
        return $return;
    }else{
        return implode(', ',$return);
    }
}

function yp_display_boots_field($json,$array = false){
    $data =  json_decode($json);
    $return = array();
    foreach($data as $item){
        if($item->type == 1){
            $field = get_config_field($item->id);
            if($item->boots){
                $return[] = $field->fieldName .'^'.$item->boots;
            }else{
                $return[] = $field->fieldName;
            }

        }else{
            $group = get_group_field($item->id);
            $field_list = json_decode($group->field_list_boot);

            $fields = array();
            $base = intval($item->boots);
            if(is_array($field_list))foreach($field_list as $f){
                $field = get_config_field($f->id);
                $fields[] = $field->fieldName.'^'.($base + $f->boot_value);
            }
            $boots_group = implode(' ',$fields);
//            if($item->boots){
//                $return[] = $boots_group .'^'.$item->boots;
//            }else{
            $return[] = $boots_group;
//            }
        }
    }

    if($array){
        return $return;
    }else{
        return implode(' ',$return);
    }
}

function yp_display_facet($facet_id,$deploy=false){
    $CI = &get_instance();
    if(!$facet_id) return "";

    $facet = $CI->db2->get_where('facet',array('facet_id'=>$facet_id,'status'=>ACTIVE))->row();

    $aryFieldId = json_decode($facet->field_list);

    if(empty($aryFieldId)) $aryFieldId = array(0);
    $CI->db2->where_in('field_id',$aryFieldId);
    $fields = $CI->db2->get_where('field_config',array('status'=>ACTIVE))->result();

    if(!$deploy){
        foreach($fields as $f){
            $return[] = $f->fieldName;
        }

        return implode(', ',$return);
    }else{
        $facet_options = json_decode($facet->facet_options);
        $field_options = json_decode($facet->field_options);
//        debug($facet_options);
        $xml = "";
        $xml.="\t<str name=\"facet\">on</str>\r\n";
        if($facet_options->gMincount)$xml.="\t\t<str name=\"facet.mincount\">".intval($facet_options->gMincount)."</str>\r\n";
        if($facet_options->gPrefix)$xml.="\t\t<str name=\"facet.prefix\">".intval($facet_options->gPrefix)."</str>\r\n";
        if($facet_options->gLimit)$xml.="\t\t<str name=\"facet.limit\">".intval($facet_options->gLimit)."</str>\r\n";
        if($facet_options->gOffset)$xml.="\t\t<str name=\"facet.offset\">".intval($facet_options->gOffset)."</str>\r\n";
        if($facet_options->gSort && $facet_options->gSort != "notset")$xml.="\t\t<str name=\"facet.sort\">".$facet_options->gSort."</str>\r\n";
        if($facet_options->gMethod  && $facet_options->gMethod != "notset")$xml.="\t\t<str name=\"facet.method\">".$facet_options->gMethod."</str>\r\n";
        if($facet_options->gMissing  && $facet_options->gMissing != "notset")$xml.="\t\t<str name=\"facet.missing\">".$facet_options->gMissing."</str>\r\n";
        if($facet_options->gRangeOther  && $facet_options->gRangeOther != "notset")$xml.="\t\t<str name=\"facet.range.other\">".$facet_options->gRangeOther."</str>\r\n";
        if($facet_options->gRangeInclude  && $facet_options->gRangeInclude != "notset")$xml.="\t\t<str name=\"facet.range.include\">".$facet_options->gRangeInclude."</str>\r\n";

        if($facet_options->gPivotMincount  && $facet_options->gPivotMincount != "notset")$xml.="\t\t<str name=\"facet.pivot.mincount\">".$facet_options->gPivotMincount."</str>\r\n";

        if($facet_options->gPivotFields){
            $gPivotFields = json_decode($facet_options->gPivotFields);
//            debug($gPivotFields);
            $strPivot = array();
            foreach($gPivotFields as $pivot){
                if($pivot[0]) $strPivot[] = $pivot[0];
            }

            if(!empty($strPivot)){
                $xml.="\t\t<str name=\"facet.facet.pivott\">".implode(',',$strPivot)."</str>\r\n";
            }

        }

        if($facet->pivot){
            $xml.="\t\t<str name=\"facet.pivot\">".$facet->pivot."</str> \r\n";
        }
//        debug($field_options);
        if($field_options) foreach($field_options as $item){

            $fields = get_config_field($item->field_id);
            $xml.="\t\t<str name=\"facet.field\">".$fields->fieldName."</str> \r\n";
            if($item->mincount){
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.mincount\">".intval($item->mincount)."</str>\r\n";
            }
            if($item->prefix){
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.prefix\">".$item->prefix."</str>\r\n";
            }
            if($item->limit){
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.limit\">".$item->limit."</str>\r\n";
            }
            if($item->offset){
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.offset\">".$item->offset."</str>\r\n";
            }
            if($item->sort && $item->sort != "notset"){
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.sort\">".$item->sort."</str>\r\n";
            }

            if($item->method && $item->missing != "notset"){
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.method\">".$item->method."</str>\r\n";
            }

            if($item->missing && $item->missing != "notset"){
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.missing\">".$item->missing."</str>\r\n";
            }

            if($item->range_start || $item->range_end){
                $xml.="\t\t<str name=\"facet.range\">".$fields->fieldName."</str>\r\n";
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.range.start\">".$item->range_start."</str>\r\n";
                $xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.range.end\">".$item->range_end."</str>\r\n";
                if($item->range_gap && $item->missing!="notset")$xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.range.gap\">".$item->range_gap."</str>\r\n";
                if($item->range_other && $item->range_other!="notset")$xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.range.other\">".$item->range_other."</str>\r\n";
                if($item->range_include && $item->range_include!="notset")$xml.="\t\t<str name=\"f.".$fields->fieldName.".facet.range.include\">".$item->range_include."</str>\r\n";
            }

        }
//        debug($xml);
        return $xml;
    }


}

function yp_display_advanced_options($json,$array = false){
    $xml = '';
    $data =  json_decode($json,true);
    if(!is_array($data)) return;

    foreach($data as $f){
        $return[] = $f;
    }
    if($array){
        return $return;
    }else{
        if( !empty($data) ){
            $xml .= !empty( $data['spell'] ) ? '"spellcheck": "true",':'';
            if($data['mm']==1) $data['mm'] = $data['mm_numfield'];
            $xml .= '"mm": "'.$data['mm'].'","defType": "edismax"';
        }
        return $xml;
    }
}

function yp_display_boost_phrase($phrase){
    $CI = &get_instance();
    $return = "";

    $boots_phrases = json_decode($phrase);
    $aryBoost = array();
    foreach ($boots_phrases as $word){

            $field = get_config_field($word->field_id);

            $field_name = $field->fieldName;
            $boost = $word->boost;
            $keyword =  $word->phrase;

            $aryBoost[] = "$field_name:\"$keyword\"^$boost";

    }

    $return = implode(' OR ',$aryBoost);

    return $return;

}

function yp_get_highlighting_setting(){
    $highlight =  "<str name=\"hl\">on</str>\r\n
       <str name=\"hl.fl\">classifications_general classifications_non_exact Company_Name_non_exact Product_Services_Keyword_non_exact Brand_Keyword_non_exact Tel_No</str>\r\n
       <str name=\"hl.simple.pre\">&lt;em&gt;</str>\r\n
       <str name=\"hl.simple.post\">&lt;/em&gt;</str>\r\n
       <str name=\"hl.snippets\">20</str>\r\n";
    return $highlight;
}


function yp_get_spell_setting($spell = false){

    $spell_status = ($spell)?'on':'off';

    $spell_settings =  "<str name=\"spellcheck\">$spell_status</str>\r\n
       <str name=\"spellcheck.extendedResults\">true</str>\r\n
       <str name=\"spellcheck.count\">10</str>\r\n
       <str name=\"spellcheck.build\">true</str>\r\n
       <str name=\"spellcheck.collate\">true</str>\r\n
       <str name=\"spellcheck.collateExtendedResults\">true</str>\r\n";
    return $spell_settings;
}

function yp_get_request_handle($fillData){
    //prepare

    $fillData->advance_option = json_decode($fillData->advance_option);
    $fillData->mm = $fillData->advance_option->mm;
    $fillData->mm_numfield = $fillData->advance_option->mm_numfield;
    $fillData->spell = $fillData->advance_option->spell;

    $requestHandler_source = FCPATH.APPPATH."views/xml/request_handler.xml";

    $template = file_get_contents($requestHandler_source);

    $aryPattern = array();
    $aryReplace = array();

    $aryPattern[] = '{yp_note}';
    $aryReplace[] = $fillData->note;

    $aryPattern[] = '{yp_alias}';
    $aryReplace[] = $fillData->alias;

    $aryPattern[] = '{yp_match_mode}';
    $aryReplace[] = ($fillData->mm != 1)?$fillData->mm : $fillData->mm_numfield;

    $aryPattern[] = '{yp_field_list}';
    $aryReplace[] = yp_display_selected_field($fillData->select_field);

    $aryPattern[] = '{yp_sort}';
    $aryReplace[] = yp_display_sort_field($fillData->sort);

    $aryPattern[] = '{yp_field_query}';
    $aryReplace[] = yp_display_condition($fillData->condition);

    $aryPattern[] = '{yp_boots_field}';
    $aryReplace[] = yp_display_boots_field($fillData->boots_field);

    $aryPattern[] = '{yp_facet}';
    $aryReplace[] = yp_display_facet($fillData->facet,true);

    $aryPattern[] = '{yp_highlight}';
    $aryReplace[] = yp_get_highlighting_setting();

    $aryPattern[] = '{yp_spell}';
    $aryReplace[] = yp_get_spell_setting($fillData->spell);

    $aryPattern[] = '{yp_pharse}';
    $aryReplace[] = '';//yp_display_boost_phrase($fillData);

    $template = str_replace($aryPattern,$aryReplace,$template);

    return $template;
}

function yp_get_schema_file($data){
    $requestHander_source = FCPATH.APPPATH."views/xml/schema.xml";

    $template = file_get_contents($requestHander_source);

    $aryPattern = array();
    $aryReplace = array();

    $aryPattern[] = '{yp_field_config}';
    $aryReplace[] = $data['yp_field_config'];

    $aryPattern[] = '{yp_copy_field}';
    $aryReplace[] =  $data['yp_copy_field'];

    $aryPattern[] = '{yp_field_type}';
    $aryReplace[] =  $data['yp_field_type'];

    $aryPattern[] = '{yp_third_party}';
    $aryReplace[] =  $data['yp_third_party'];

    $template = str_replace($aryPattern,$aryReplace,$template);

    return $template;
}

function yp_get_config_file($data){
    $requestHander_source = FCPATH.APPPATH."views/xml/config.xml";

    $template = file_get_contents($requestHander_source);

    $aryPattern = array();
    $aryReplace = array();

    $aryPattern[] = '{yp_request_handle}';
    $aryReplace[] = $data['yp_request_handle'];

    $aryPattern[] = '{yp_third_party_library}';
    $aryReplace[] = $data['yp_third_party_library'];

    $template = str_replace($aryPattern,$aryReplace,$template);

    return $template;
}



function displaySpace($size) {
    $sizes = array(" Bytes", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB");
    if ($size == 0) { return('n/a'); } else {
        return (round($size/pow(1024, ($i = floor(log($size, 1024)))), $i > 1 ? 2 : 0) . $sizes[$i]); }
}

function yp_deploy_IYP($url){

    if(!$url) return false;
    $url.= '/solrconfig/update.php';
    $agent= 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)';

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_VERBOSE, true);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_USERAGENT, $agent);
    curl_setopt($ch, CURLOPT_URL,$url);
    $result=curl_exec($ch);

    return $result;
}