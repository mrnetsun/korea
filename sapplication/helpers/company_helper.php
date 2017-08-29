<?php
if(!defined('BASEPATH')) {exit('No direct script access allowed');}
/**
 * @param $string
 * @param $your_desired_width
 * @return string
 */
function tokenTruncate($string, $your_desired_width) {
    $parts = preg_split('/([\s\n\r]+)/u', $string, null, PREG_SPLIT_DELIM_CAPTURE);
    $parts_count = count($parts);

    $length = 0;
    $last_part = 0;
    for (; $last_part < $parts_count; ++$last_part) {
        $length += strlen($parts[$last_part]);
        if ($length > $your_desired_width) { break; }
    }

    $more = (strlen($string)>$your_desired_width)?'...':'';

    return implode(array_slice($parts, 0, $last_part)).$more;
}
function refineArray($refine){
    $aryResult = array();

    if($refine)foreach($refine as $k=>$rf){
        $newAry = array();
        for($i=0;$i<ceil(count($rf)/2);$i++){
            $m = $i*2+1;
            $newAry[$rf[$m-1]] = $rf[$m];
        }
        $aryResult[$k] = $newAry;
    }

    return $aryResult;
}
/**
 * @return mixed
 */
function getTopKeyword(){
    $CI = &get_instance();
    $CI->db->order_by('position','ASC');
    $results = $CI->db->get_where('top_keyword',array('status'=>ACTIVE,'del_flag'=>0))->result();
    return $results;
}

/**
 * @param $content
 * @param array $param
 * @return string
 */
function page_container($content,$param = array()){
    $class = ($param['class'])?$param['class']:'col-md-8';
    $id = ($param['id'])? 'id ="'.$param['id'].'"':'';
    $title = ($param['title'])? '<h3>'.$param['title'].'</h3>'.'"':'';
    return '<div class="container">
            <div class="row">
                <div '.$id.' class="'.$class.'">
                '.$title.$content.'
                </div>
            </div>
            <div class="gap"></div>
        </div>';
}

/**
 * @return string
 */
function page_search_article(){
    $html = '
    <div class="form-group form-group-icon-right">
        <form id="searchArticle">
        <i class="fa fa-search input-icon input-no-label input-icon-tada"></i>
        <input id="articleKey" type="text" placeholder="'. __("LBL_KEYWORD_SEARCH").'" class="form-control">
        </form>
    </div>
    <script>
        $(document).ready(function(){
         $("#searchArticle").submit(function(){
                var q = $("#articleKey").val();
                var url = "'.site_url('tim-kiem/{q}').'";
                if(q){
                    document.location =  url.replace("{q}",q);
                }else{
                    $("#articleKey").focus()
                }

                return false;

         });
        });
    </script>
    ';
    return $html;
}

/**
 * @param $content
 * @param $background
 * @param array $param
 * @return string
 */
function page_backgroup($content,$background,$param = array()){
    $class = ($param['class'])?$param['class']:'col-md-12';
    $id = ($param['id'])? 'id ="'.$param['id'].'"':'';
    $title = ($param['title'])? '<h2>'.$param['title'].'<h2>'.'"':'';
    return '<div class="bg-holder">
            <div class="bg-parallax" style="background-image:url('.$background.');"></div>
            <div class="bg-mask"></div>
            <div class="bg-holder-content">
                <div class="container">
                    <div class="gap gap-big text-white">
                        <div class="row">
                            <div '.$id.'  class="'.$class.'">
                                '.$title.$content.'
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>';
}

/**
 * @param $aryTeam
 * @param array $aryKey
 * @return string
 */
function page_team($aryTeam,$aryKey=array('name'=>'name','avatar'=>'avatar','title'=>'title')){
    $html = '<div class="row row-wrap" data-gutter="60">';
    foreach($aryTeam as $people){
        $html.='<div class="col-md-3">
                    <div class="thumb text-center">
                        <header class="thumb-header">
                            <img class="round" src="'.$people->{$aryKey['avatar']}.'" alt="'.$people->{$aryKey['name']}.'" title="'.$people->{$aryKey['name']}.'" />
                        </header>
                        <div class="thumb-caption">
                            <h5 class="thumb-title">'.$people->{$aryKey['name']}.'</h5>
                            <p class="thumb-meta text-small">'.$people->{$aryKey['title']}.'</p>
                        </div>
                    </div>
                </div>';
    }
    $html.='</div>';
    return $html;
}

function page_top_member($aryTeam){
    $html = '<div class="topMember">

    ';
//    debug($aryTeam);
    foreach($aryTeam as $k=>$people){
        $html.='<div class="col-md-3">
                    <div class="thumb text-center">
                        <header class="thumb-header">
                            '.base_img($people->avatar).'
                            <div class="memberBadge badge badge-warning">'.($k+1).'</div>
                        </header>

                        <div class="thumb-caption">
                            <h5 class="thumb-title">'.$people->firstName.' '.$people->lastName.'</h5>
                            <p class="thumb-meta text-small">'.$people->badge.'</p>
                            <h5 class="today-score text-small">Hôm nay <span class="btn btn-xs btn-danger">'.$people->score_value.'</span> điểm</h5>

                        </div>
                    </div>
                </div>';
    }
    $html.='
    <div class="gap"></div>
    <div class="col-md-9 text-center">Top 3 thành viên tích cực trong ngày</div>
    </div>';
    return $html;
}

/**
 * @param $uri
 * @param $tag
 * @return string
 */
function page_tags($uri,$tag){
    $html = '';
    $aryTag = explode(',',$tag);
    $objTag = array();
    if(!empty($aryTag)){
        foreach($aryTag as $item){
            $objTag[] = anchor($uri.to_slug($item),$item,array('title'=>$item,'class'=>'text-gray'));
        }
    }

    $html.='<ul class="cloudTag">';
    $html.='<li class="caption">'.__('LBL_TAGS').'</li><li>';
    $html.= implode('</li><li>',$objTag);

    $html.'</li></ul>';

    return $html;
}

/**
 * @return string
 */
function page_search_box(){
    $CI = &get_instance();
    $condition = $CI->session->userdata('search.box');
    $type = ($condition['type'])?$condition['type']:'tat-ca';
    $keyword = $condition['keyword'];
    $location = $condition['location'];

    $aryActive = array('tat-ca'=>'','san-pham'=>'','ten-cong-ty'=>'','dien-thoai'=>'','map'=>'');
    $aryTypeIcon = array('tat-ca'=>'<i class="fa fa-building-o"></i>','san-pham'=>'<i class="fa fa-puzzle-piece"></i>','ten-cong-ty'=>'<i class="fa fa-send"></i> <span >','dien-thoai'=>'<i class="fa fa-send"></i> <span >','map'=>'<i class="fa fa-map-marker"></i>');
    $aryActive[$type] = 'active';

    $html = '
            <div class="tabbable stickyNav">
            <div class="tabButton">
            <ul class="nav nav-tabs" id="searchBox">
                <li class="'.$aryActive['tat-ca'].'" type="tat-ca"><a class="pointer" data-toggle="tab"><i class="fa fa-building-o"></i> <span >'.__("LBL_SEARCH_ALL").'</span></a>
                </li>
                <li class="'.$aryActive['san-pham'].'" type="san-pham"><a class="pointer"  data-toggle="tab"><i class="fa fa-puzzle-piece"></i> <span >'.__("LBL_SEARCH_PRODUCT_SERVICES").'</span></a>
                </li>
                <li class="'.$aryActive['ten-cong-ty'].' '.$aryActive['dien-thoai'].'" type="ten-cong-ty"><a class="pointer"  data-toggle="tab"><i class="fa fa-send"></i> <span >'.__("LBL_SEARCH_COMPANY").'</span></a>
                </li>
                <li class="'.$aryActive['maps'].'" type="maps"><a class="pointer"  data-toggle="tab"><i class="fa fa-map-marker"></i> <span >'.__("LBL_SEARCH_MAP").'</span></a>
                </li>
            </ul>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab-1">
                    <h2>'.__("MSG_FIND_EVERY_THING").'</h2>
                    <div class="boxSearchTopGap"></div>
                    <form id="frmSearchBox" onsubmit="return searchBoxSubmit();">
                        <input type="hidden" id="searchType" name="searchType" value="tat-ca"/>
                        <div class="form-group form-group-lg form-group-icon-left">
                            <div class="logoBoxSearch col-md-4">
                            <a class="logo" href="'.site_url('home').'">
                                <img src="'.THEME_PATH.'/front/img/logo-invert.png" alt="Logo" title="Home" />
                            </a>
                            </div>
                            <div class="logoSplit"></div>
                            <div class="currentType">
                                <a id="dropdownSearch" class="pointer dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                '.$aryTypeIcon[$type].'
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownSearch">
                                <li onclick="selectSearchType(this)" type="tat-ca"><a class="pointer"><i class="fa fa-building-o"></i> <span >'.__("LBL_SEARCH_ALL").'</span></a></li>
                                <li onclick="selectSearchType(this)" type="san-pham"><a class="pointer"><i class="fa fa-puzzle-piece"></i> <span >'.__("LBL_SEARCH_PRODUCT_SERVICES").'</span></a></li>
                                <li onclick="selectSearchType(this)" type="ten-cong-ty"><a class="pointer"><i class="fa fa-send"></i> <span >'.__("LBL_SEARCH_COMPANY").'</span></a></li>
                                <li onclick="selectSearchType(this)" type="maps"><a class="pointer"><i class="fa fa-map-marker"></i> <span >'.__("LBL_SEARCH_MAP").'</span></a></li>
                              </ul>
                            </div>
                            <div class="col-md-6 leftBox"  style="padding-left:0px;">
                                <i class="fa  fa-mail-forward input-icon"></i>
                                <input name="q" id="txtKeyword" value="'.$keyword.'"  class="form-control clearable" autocomplete="off" placeholder="'.__("LBL_WHAT_DO_YOU_FIND").'" type="text" />
                            </div>
                            <div class="col-md-4 rightBox" style="padding-left:0px;">
                                <i class="fa fa-map-marker input-icon"></i>
                                <input id="searchLocation" value="'.$location.'" class="form-control clearable" autocomplete="off" style="" placeholder="'.__("LBL_WHERE").'" type="text" />
                                <select id="searchBusiness" class="form-control" style="display:none;">
                                    <option value="ten-cong-ty">'.__("LBL_SEACH_NAME").'</option>
                                    <option value="dien-thoai">'.__("LBL_SEARCH_PHONE").'</option>
                                </select>
                            </div>
                            <button class="btn btn-primary btn-lg" type="submit"><i class="fa fa-search icon-search"></i><span class="text-search">'.__("BTN_SEARCH").'</span></button>

                        </div>

                    ';

                     $html.='


                    </form>
                </div>
            </div>
            </div>

    ';
    return $html;
}

/**
 * @param $val
 * @param int $total
 * @return string
 */
function page_star($val,$total=0,$flag=true){

    $val = rand(3,5);$total = rand(10,100);

    if($val<5){
        $j = $val%5;
    }else{
        $j = 5;
    }


    $k = $val-$j;

    $html = '<ul class="icon-group booking-item-rating-stars">';
    for($i=1;$i<=$j;$i++) $html.='<li><i class="fa fa-star"></i></li>';
    if($k && $j<5) {
        $html.='<li><i class="fa fa-star-half-empty"></i></li>';
        $j++;
    }
    for($i=$j;$i<5;$i++)$html.='<li><i class="fa fa-star-o"></i></li>';

    if($flag){
        if($val) $html.='<li>'.$val.'</li>';
        if($total) $html.='<li>('.$total.' '.__("LBL_VOTED").')</li>';
    }


    return $html;
}

/**
 * @return string
 */
function page_comment(){
    $html ='
    <div class="fb-comments" data-href="'.(current_url()).'" data-numposts="5"></div>';
    return $html;
}

/**
 * @param $code
 * @return string
 */
function page_banner($code,$key=''){
//    debug($code,false);
    if(!$code) return '';

    $CI = get_instance();
    $group = $CI->db->get_where('banner_position',array('code'=>$code,'status'=>ACTIVE))->row();

    if(empty($group)) return '';
    $CI->db->limit($group->number,0);
    $CI->db->like('position','"'.$code.'"');
    if($group->is_random) {
        $CI->db->order_by('rand()');
    }

    if($key && ($code == 'COM1' || $code == 'COM2')){
        $CI->db->like('categories_company','"'.$key.'"');
    }

    switch($group->campaign_id){
        case 2:
            $CI->db->where('clicked <=',$group->clicks);
            break;

        case 3:
            $CI->db->where('impressed <=',$group->impression);
            break;

        case 4:
        case 5:
        case 6:
        case 7:
            $CI->db->where('start_date <=',date("Y-m-d"));
            $CI->db->where('end_date >=',date("Y-m-d"));
            break;
    }

    $banners =  $CI->db->get_where('banner',array('status'=>ACTIVE,'del_flag'=>0))->result();

//    debug($CI->db->last_query(),false);
    $aryBannerId = array();
    foreach($banners as $banner){
        $aryBannerId[] = $banner->banner_id;
    }
    if(!empty($aryBannerId)){
        $CI->db->query('update '.$CI->db->dbprefix('banner').' SET impressed = impressed +1 where banner_id IN ('.implode(',',$aryBannerId).')');

    }

    $html = $CI->load->view('banner_block',array('group'=>$group,'banners'=>$banners),true);

    return $html;
};

/**
 * @param array $data
 * @return string
 */
function page_client($data=array()){
    $html = '<div class="container">
    <div class="row">
                    <div class="col-md-12" data-wow-delay="0.2s">
                        <div class="carousel slide" data-ride="carousel" id="quote-carousel">
                            <!-- Bottom Carousel Indicators -->
                            <ol class="carousel-indicators">';

                         foreach($data as $k=>$item){
                             $active = ($k==0)?'active':'';
                              $html.='
                                  <li data-target="#quote-carousel" data-slide-to="'.$k.'" class="'.$active.'">
                                  '.json_img($item->image,array('class'=>"img-responsive")).'
                                </li>';
                            }
                        $html .='</ol>
                            <!-- Carousel Slides / Quotes -->
                            <div class="carousel-inner text-center">';
                        foreach($data as $k=>$item){
                            $active = ($k==0)?'active':'';
                            $html .='
                                <!-- Quote  -->
                                <div class="item '.$active.'">
                                    <blockquote>
                                        <div class="row">
                                            <div class="col-sm-8 col-sm-offset-2 slideItem">
                                                <p class="quocte">'.$item->text.'</p>
                                                <div class="name">--<i>'.$item->title.'</i>--</div>
                                            </div>
                                        </div>
                                    </blockquote>
                                </div>';
                              }
                            $html.='
                            </div>
                            <!-- Carousel Buttons Next/Prev -->
                            <a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-chevron-left"></i></a>
                            <a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-chevron-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>';
    return $html;
}

/**
 * @param $company
 * @return mixed
 */
function prepare_company($company){
    $CI = &get_instance();
    if($company->Rate)$company->Rate = json_decode($company->Rate);
    if($company->Comment)$company->Comment = json_decode($company->Comment);
    if($company->Contact)$company->Contact = json_decode($company->Contact);
    if($company->Get_In_Touch)$company->Get_In_Touch = json_decode($company->Get_In_Touch);
    if($company->Categories)$company->Categories = json_decode($company->Categories);
    if($company->Product_Serivces)$company->Product_Serivces = json_decode($company->Product_Serivces);
    if($company->Gallery)$company->Gallery = json_decode($company->Gallery);
    if($company->Video)$company->Video = json_decode($company->Video);

    //check Lat Long
    //if(!$company->Lat || $company->Long){

        $geo = getLatLongByAddress(getStandardText($company->Contact->Address));
        $CI->db->update('company',array('Lat'=>$geo[0],'Long'=>$geo[1]),array('id'=>$company->id));
    //Công Ty Cổ Phần Công Viên Nước Đầm Sen  3 Hòa Bình, P. 3, Q. 11, Tp. Hồ Chí Minh (TPHCM)}

    return $company;
}

/**
 * @param $k
 * @return string
 */
function page_contact_icon($k){
    $html = '';
    switch($k){
        case 'Name':
            $html='<i class="fa fa-user box-icon-gray box-icon-info box-icon-left animate-icon-border-rise round"></i>';
            break;
        case 'Email':
            $html='<i class="fa fa-envelope box-icon-gray box-icon-info box-icon-left animate-icon-border-rise round"></i>';
            break;
        case 'Mobile':
            $html='<i class="fa fa-mobile box-icon-gray box-icon-info box-icon-left animate-icon-border-rise round"></i>';
            break;
    }
    return $html;
}

/**
 * @param $source_image
 * @param string $text
 */
function watermark_text($source_image,$text ='TimDoanhNghiep.Vn' )
{
    $CI = &get_instance();
    $CI->load->library('image_lib');
    $config['source_image']     = $source_image;
    $config['wm_text']          = $text;
    $config['wm_type']          = 'text';
    $config['wm_font_path']     = UPLOAD_DIR.'font/arial-webfont.ttf';
    $config['wm_font_size']     = 12;
    $config['wm_font_color']    = 'ffffff';
    $config['wm_vrt_alignment'] = 'bottom';
    $config['wm_hor_alignment'] = 'left';
    $config['wm_padding']       = '0';
//    debug($config);
    $CI->image_lib->initialize($config);

    if (!$CI->image_lib->watermark()) {
        //echo $CI->image_lib->display_errors();
    }

}

/**
 * @param $source
 */
function watermark($source)
{
    $CI = &get_instance();
    $CI->load->library('image_lib');

    $config['image_library']    = 'gd2';
    $config['source_image']     = $source;
    $config['wm_type']          = 'overlay';
    $config['wm_overlay_path']  = UPLOAD_DIR.'font/watermark.png'; //the overlay image
    $config['wm_opacity']       = 70;
    $config['wm_vrt_alignment'] = 'bottom';
    $config['wm_hor_alignment'] = 'left';

    $CI->image_lib->initialize($config);

    if (!$CI->image_lib->watermark()) {
       // echo $CI->image_lib->display_errors();
    }

}

/**
 * @param $email
 * @param $subject
 * @param $content
 * @param array $params
 * @param int $priority
 * @return mixed
 */
function sendMailQueue($email,$subject,$content,$params = array(),$priority=1){
    $CI = &get_instance();
    //store email to queue
    $ok = $CI->db->insert('email_queue',array(
        'to'=>$email,
        'subject'=>$subject,
        'content'=>$content,
        'params'=>json_encode($params),
        'priority'=>$priority,'status'=>0
    ));

    return $ok;
}

function buildSolrKeyword($keyword){
    $keyword = strip_tags($keyword);
    $match = array();$match2 = array();
    if(strpos($keyword,'"')!== false){
        $strQuery = '("'.preg_replace('/["\']+/','',$keyword).'")';

        //clean phrase match
        preg_match_all('/"([^"]+)"/', $keyword, $match);
        preg_match_all('/\'([^\']+)\'/', $keyword, $match2);

        if (!empty($match)) {
            $aryPattern = array();
            $aryReplace = array();
            foreach ($match[0] as $m) {
                $aryPattern[] = $m;
                $aryReplace[] = "";
            }
            $keyword = str_replace($aryPattern, $aryReplace, $keyword);
        }

        if (!empty($match2)) {
            $aryPattern = array();
            $aryReplace = array();
            foreach ($match2[0] as $m) {
                $aryPattern[] = $m;
                $aryReplace[] = "";
            }
            $keyword = str_replace($aryPattern, $aryReplace, $keyword);
        }

    }else{

        $strQuery = '("'.$keyword.'")';
    }

    $aryKeyword = preg_split("/[\s,\.\*\#\~\+_\"\']+/u", $keyword);
    //remove duplicate
    $aryKeyword = array_flip(array_flip($aryKeyword));

    $non_exact = array();

    if(!empty($match[1])){
        foreach($match[1] as $item) $non_exact[] = '"'.$item.'"';
    }
    if(!empty($match2[1])){
        foreach($match2[1] as $item) $non_exact[] = '"'.$item.'"';
    }

    foreach($aryKeyword as $item){
        if($item) $non_exact[] = $item;
    }

    if(!empty($non_exact)){
        $strQuery.= ' OR ('.implode(' AND ',$non_exact).')';
    }

    return $strQuery;
}

/**
 * @param $email
 * @param $subject
 * @param $content
 * @param array $params
 * @return bool
 */
function sendMail($email,$subject,$content,$params = array()){
    $CI = &get_instance();

    //multi email
    $aryEmail = preg_split('/[\s;,]+/', $email, -1, PREG_SPLIT_NO_EMPTY);
    $email = implode(',',$aryEmail);

    $CI->load->config('email');
    $CI->load->library('email');
    $CI->email = new CI_Email($this->config->item('gmail'));

    $from = ($params['from'])?$params['from']:$CI->config->item('system_email');
    $from_name = ($params['from_name'])?$params['from_name']:$CI->config->item('app_name');

    $bcc = ($params['bcc'])?$params['bcc']:'';
    if($bcc)$this->email->bcc($bcc);

    $reply_to = ($params['reply_to'])?$params['reply_to']:'';
    if($reply_to)$this->email->reply_to($reply_to);

    $CI->email->from($from,$from_name);
    $CI->email->to($email);
    $CI->email->subject($subject);
    $CI->email->message( $content );

    if($this->email->send()) {
        return true;
    }else{
        return false;
    }
}

function displayQuestion($question){
    $html = '';
    $html.='<div class="questionContent">'.$question->content.'</div>';
    if($question->media){
        $html.='
         <div class="sm2-bar-ui dark-text flat textured">

         <div class="bd sm2-main-controls">

          <div class="sm2-inline-texture"></div>
          <div class="sm2-inline-gradient"></div>

          <div class="sm2-inline-element sm2-button-element">
           <div class="sm2-button-bd">
            <a href="#play" class="sm2-inline-button play-pause">Play / pause</a>
           </div>
          </div>

          <div class="sm2-inline-element sm2-inline-status">

           <div class="sm2-playlist">
            <div class="sm2-playlist-target">
             <!-- playlist <ul> + <li> markup will be injected here -->
             <!-- if you want default / non-JS content, you can put that here. -->
             <noscript><p>JavaScript is required.</p></noscript>
            </div>
           </div>

           <div class="sm2-progress">
            <div class="sm2-row">
            <div class="sm2-inline-time">0:00</div>
             <div class="sm2-progress-bd">
              <div class="sm2-progress-track">
               <div class="sm2-progress-bar"></div>
               <div class="sm2-progress-ball"><div class="icon-overlay"></div></div>
              </div>
             </div>
             <div class="sm2-inline-duration">0:00</div>
            </div>
           </div>

          </div>

          <div class="sm2-inline-element sm2-button-element sm2-volume">
           <div class="sm2-button-bd">
            <span class="sm2-inline-button sm2-volume-control volume-shade"></span>
            <a href="#volume" class="sm2-inline-button sm2-volume-control">volume</a>
           </div>
          </div>

         </div>

         <div class="bd sm2-playlist-drawer sm2-element">

          <div class="sm2-inline-texture">
           <div class="sm2-box-shadow"></div>
          </div>

          <!-- playlist content is mirrored here -->

          <div class="sm2-playlist-wrapper">
            <ul class="sm2-playlist-bd">
             <li><a href="'.ROOT_URL.$question->media.'"></a></li>
            </ul>
          </div>

         </div>

    </div>
    <div class="h20"></div>
        ';
    }

    return $html;
}

function displayQuestionAnswer($question,$show_answer = false){
    $CI = &get_instance();
    $type = intval($question->question_type);

    if(!$type) $type = 2;
    return $CI->load->view('questions/type_'.$type,array('show_answer'=>$show_answer,'question'=>$question),true);
}

function displayQuestionFront($question){
    $html = '';
    $html.='<div class="questionContent">'.$question['content'].'</div>';
    if($question['media']){
        $html.= mediaPlayer($question['media']);
    }

    return $html;
}

function mediaPlayer($sound){
    $html = '<div class="questionMedia">
         <div class="sm2-bar-ui dark-text flat textured">

         <div class="bd sm2-main-controls">

          <div class="sm2-inline-texture"></div>
          <div class="sm2-inline-gradient"></div>

          <div class="sm2-inline-element sm2-button-element">
           <div class="sm2-button-bd">
            <a href="#play" class="sm2-inline-button play-pause">Play / pause</a>
           </div>
          </div>

          <div class="sm2-inline-element sm2-inline-status">

           <div class="sm2-playlist">
            <div class="sm2-playlist-target">
             <!-- playlist <ul> + <li> markup will be injected here -->
             <!-- if you want default / non-JS content, you can put that here. -->
             <noscript><p>JavaScript is required.</p></noscript>
            </div>
           </div>

           <div class="sm2-progress">
            <div class="sm2-row">
            <div class="sm2-inline-time">0:00</div>
             <div class="sm2-progress-bd">
              <div class="sm2-progress-track">
               <div class="sm2-progress-bar"></div>
               <div class="sm2-progress-ball"><div class="icon-overlay"></div></div>
              </div>
             </div>
             <div class="sm2-inline-duration">0:00</div>
            </div>
           </div>

          </div>

          <div class="sm2-inline-element sm2-button-element sm2-volume">
           <div class="sm2-button-bd">
            <span class="sm2-inline-button sm2-volume-control volume-shade"></span>
            <a href="#volume" class="sm2-inline-button sm2-volume-control">volume</a>
           </div>
          </div>

         </div>

         <div class="bd sm2-playlist-drawer sm2-element">

          <div class="sm2-inline-texture">
           <div class="sm2-box-shadow"></div>
          </div>

          <!-- playlist content is mirrored here -->

          <div class="sm2-playlist-wrapper">
            <ul class="sm2-playlist-bd">
             <li><a href="'.ROOT_URL.$sound.'"></a></li>
            </ul>
          </div>

         </div>

    </div>
    </div>
    <div class="h20"></div>';
    return $html;
}

function displayQuestionAnswerFront($question,$parram = array()){
    $CI = &get_instance();
    $type = intval($question->question_type);
    if(!$type) $type = 2;
    return $CI->load->view('questions_front/type_'.$type,array('params'=>$parram,'question'=>$question),true);
}

function getMemberPoint($question,$member_answer,$parent=array()){
    if(!empty($parent)){
        $point = 0;
        $total_point = $parent['question_point'];
        $total_sub = $parent['question_sub_point'];

        $total_question = count($parent['sub_questions']);

        switch($question['question_type']){
            case 2:
                $aryAnswer = json_decode($question['answer']);

                if($aryAnswer[$member_answer]->true_plan){
                    $point = ($total_point/$total_question)*$question['point'];
                }else{
                    if($total_sub<0){
                        $point = ($total_sub/$total_question) * abs($question['point_sub']);
                    }
                }
                break;
        }

    }else{
        $point = 0;
        switch($question['question_type']){
            case 2:
                $aryAnswer = json_decode($question['answer']);
                if($aryAnswer[$member_answer]->true_plan){
                    $point = $question['question_point'];
                }else{
                    if($question['question_sub_point']<0){
                        $point = $question['question_sub_point'];
                    }
                }
                break;
        }
    }


    return $point;
}