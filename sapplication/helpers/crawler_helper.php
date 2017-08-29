<?php
if(!defined('BASEPATH')) {exit('No direct script access allowed');}
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 3/6/2016
 * Time: 2:52 PM
 */
function getUniqid(){
    $today = date("Ymd");
    $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
    $unique = $today . $rand;
    return $unique;
}

function init_company_data(){
    $aryData = array();

    $aryData['Company_Name'] = '';
    $aryData['Slug'] = '';
    $aryData['md5'] = '';
    $aryData['Crawler_url'] = '';
    $aryData['Crawler_Id'] = '';
    $aryData['Tags']='';
    $aryData['Meta_Keyword']='';
    $aryData['Meta_Description']='';
    $aryData['Company_Logo'] = '';
    $aryData['Investment_Value'] = '';
    $aryData['Rate'] = array();
    $aryData['Comment'] = array();
    $aryData['Contact'] = array();
    $aryData['Province'] = '';
    $aryData['Company_Profile'] = '';
    $aryData['Company_Type'] = '';
    $aryData['Company_Market']= '';
    $aryData['Get_In_Touch'] = array();
    $aryData['Verified'] = 0;
    $aryData['Verified_User'] = array();
    $aryData['Verified_Date'] = '';
    $aryData['Sponsor'] = 0;
    $aryData['Sponsor_Date'] = "";
    $aryData['MST'] = "";
    $aryData['Establish'] = "";
    $aryData['Company_Size'] = "";
    $aryData['Categories'] = array();
    $aryData['Product_Serivces'] = array();
    $aryData['Gallery'] = array();
    $aryData['Video'] = array();
    $aryData['del_flag'] = 0;
    $aryData['Solr_Index'] = 0;
    $aryData['Enquery_Email']='';
    $aryData['Reminder_Number'] = 0;
    $aryData['Reminder_Date'] = '';
    $aryData['Delete_Warning'] = 0;



    $data['UpdatedId'] = '';
    $data['UpdatedTime'] = '';

    $data['CreatedId'] = '';
    $data['CreatedTime'] = '';

    $data['del_flag'] = 0;
    $data['status'] = ACTIVE;

    return $aryData;
}

function crawler_trangvangvietnam($url){
    $aryData = init_company_data();
    $tmp = explode('/',$url);
    $number = $tmp[4];

//    $html_string = file_get_contents(UPLOAD_DIR.'/example/trangvangvietnam.txt');
    $html_string = curl_get_content($url);

    //return if cannot get data
    if(!$html_string) return '';

    $html = str_get_html($html_string);
//get company_name
    $title = $html->find('h1');

    $aryData['Company_Name'] = trim($title[0]->innertext);
    if(!$aryData['Company_Name']){
        return '';
    }

    $updated = $html->find('div[class=updatetime]');$matched ='';
    preg_match_all("/\d{1,2}\/\d{1,2}\/\d{4}/",str_replace(')','',str_replace('(','',$updated[0]->innertext)),$matched);

    if($matched[0][0]){
        $tmp = explode('/',$matched[0][0]);
        $aryData['updatedTime'] = $tmp[2].'-'.str_pad($tmp[1],2,'0',STR_PAD_LEFT).'-'.str_pad($tmp[0],2,'0',STR_PAD_LEFT);
    }


    $tmp = explode('-',$aryData['Company_Name']);
    if($tmp[1] && strpos($tmp[1],trim($tmp[0]))!== false){
        $aryData['Company_Name'] = $tmp[1];
    }

    $aryData['Slug'] = to_slug($aryData['Company_Name']);
    $aryData['md5'] = md5(strtolower($aryData['Company_Name']));

    $aryData['Crawler_url'] = $url;
    $aryData['Crawler_Id'] = $number;


//get logo
    foreach($html->find('div[class=detail_logo] img') as $l) {
        $aryData['Company_Logo'] = $l->src;
    }

//
    $aryData['Investment_Value'] = 0;
    $aryData['Rate'] = array('Value'=>0,'Total'=>0);

//get contact

    $contact = $html->find('div[class=detail_dc] div[class=detail_dc1]');
    foreach($contact as $c){
        $text = $c->innertext;
        if($text){
            $doc = new DOMDocument();
            $doc->loadHTML(mb_convert_encoding($text, 'HTML-ENTITIES', 'UTF-8'));
            $div = $doc->getElementsByTagName('div');
            $key = getStandardText($div->item(0)->textContent);
            $val = getStandardText($div->item(1)->textContent);
            $html_val = DOMinnerHTML($div->item(1));

            switch($key){
                case 'Địa chỉ:':
                    $aryData['Contact']['Address'] = $val;
                    $data = array();
                    preg_match_all('/<strong>(.*)<\/strong>/s',$html_val,$data);
                    $aryData['Province'] = trim($data[1][0]);
                    break;
                case 'Điện thoại:':
                    $aryData['Contact']['Tel'] = $val;
                    break;
                case 'Fax:':
                    $aryData['Contact']['Fax']= $val;
                    break;
                case 'Email:':
                    $aryData['Contact']['Email']= $val;
                    break;
                case 'Website:':
                    $aryData['Contact']['Website']= $val;
                    break;
                case 'Loại hình:':
                    $aryData['Company_Type']= $val;
                    break;

                case 'Thị trường:':
                    $aryData['Company_Market']= $val;
                    break;

            }
        }

    }

//facebook
    $aryData['Contact']['Facebook'] = '';

//get profiles
    $profiles = $html->find('p[class=textdc]');
    $aryData['Company_Profile'] = ($profiles[0]->innertext);

//contact person

    $contact = $html->find('div[id=thongtinlienhe]');
    $Get_In_Touch = array();
    foreach($contact as $c){
        $key = getStandardText(strip_tags($c->innertext));
        $tmp = explode(':',$key);
        $tmp[1] = getStandardText($tmp[1]);
        switch($tmp[0]){
            case 'Người liên hệ':
                $Get_In_Touch['Name']= $tmp[1];
                break;
            case 'Email':
                $Get_In_Touch['Email']= $tmp[1];
                break;
            case 'Di động':
                $Get_In_Touch['Mobile']= $tmp[1];
                break;
            default:
                $aryA = $c->find('a');
                if(!empty($aryA)) foreach($aryA as $a){
                    $key = getStandardText(strip_tags($c->innertext));
                    if(!strpos($a->innertext,'yp-thietkewebsitemienphi.gif') && !strpos($a->innertext,'signupfree.gif')){
                        $Get_In_Touch['Extra'][] = $a->innertext;
                    }

                }
                break;
        }
    }
    $aryData['Get_In_Touch'][] = $Get_In_Touch;
//get content
    $content = $html->find('div[id=detail_li]');

    $category_html = '';
    $product_html = '';

    foreach($content as $k=>$c){
        $key = getStandardText(strip_tags($c->innertext));

        if(strpos($c->innertext,'logo-xacthuc.png')){
            $aryData['Verified'] = "1";
        }

        if($key == "Nhà tài trợ"){
            $aryData['Sponsor'] = "1";
        }

        if(strpos($key,'Mã số thuế:')!== false){
            $tmp = explode(':',$key);
            $aryData['MST'] = getStandardText($tmp[1]);
        }

        if(strpos($key,'Năm thành lập:')!== false){
            $tmp = explode(':',$key);
            $aryData['Establish'] = getStandardText($tmp[1]);
        }
        if(strpos($key,'Số nhân viên:')!== false){
            $tmp = explode(':',$key);
            $aryData['Company_Size'] = getStandardText($tmp[1]);
        }

        if($key == 'Ngành nghề kinh doanh'){
            $j =0;
            while(true){
                $j++;
                $sub_key = getStandardText(strip_tags($content[$k+$j]->innertext));
                if($sub_key == 'Sản phẩm dịch vụ'){
                    break;
                }else{
                    $category_html .= $content[$k+$j]->innertext;
                }

            }

        }

        if($key == 'Sản phẩm dịch vụ'){
            $product_html = $content[$k+1]->innertext;
        }
    }

//get Categories
	if($category_html){
		$doc = new DOMDocument();
		$doc->loadHTML(mb_convert_encoding($category_html, 'HTML-ENTITIES', 'UTF-8'));
		$links = $doc->getElementsByTagName('a');
		foreach ($links as $l){
			$aryData['Categories'][] = getStandardText($l->textContent);
		}

	}
//for product & Services
	if($product_html){
		$sub_html = str_get_html($product_html);
		$group = $sub_html->find('div[class=nhomsanphambox]');
		foreach($group as $g){
			$sub = $g->find('div[class=nhomsanpham_txtbold]');
			$items = array();

			$tmpItem = $g->find('a');
			foreach($tmpItem as $a){
				$items[] = getStandardText(strip_tags($a->innertext));
			}

			$aryData['Product_Serivces'][] = array(
				'label'=>getStandardText(strip_tags($sub[0]->innertext)),
				'items'=>$items
			);

		}
	}

//gallery
    $gallery_tmp = $html->find('div[id=detail_images],div[class=featureSelectProductPhoto]');
    $gString = ''; $aryGallery = array(); $gImage = array();
    foreach ($gallery_tmp as $g){
        if(strpos($g->innertext,'yellowpages_arrow.gif')){
            if($gString){
                $aryGallery[] = array('label'=>$gString,'items'=>$gImage);
            }
            $gImage = array();
            $gString = getStandardText(strip_tags($g->innertext));
        }
        $imgs = $g->find('a');
        if(!empty($imgs)) foreach($imgs as $img) $gImage[] = $img->href;
    }

    $aryData['Gallery'] = $aryGallery;

    crawler_trangvangvietnam_image($aryData);

    return $aryData;
}

function crawler_trangvangvietnam_image(&$data){
    //download Images
    if($data['Company_Logo'] || !empty($data['Gallery'])){
        $imgPath = UPLOAD_DIR.'company/tv'.$data['Crawler_Id'].'/';
        if (!file_exists($imgPath)) {
            mkdir($imgPath, 0777, true);
        }
    }


    //copy Logo
    if($data['Company_Logo']){
        $logo = curl_get_content(str_replace(' ','%20',$data['Company_Logo']));
        $ext = pathinfo($data['Company_Logo'], PATHINFO_EXTENSION);
        $new_file = $imgPath.uniqid('logo_').'.'.$ext;
        $data['Company_Logo'] = $new_file;
        $f = fopen($new_file,"w+");
        fwrite($f,$logo);
        fclose($f);
    }
    //copy gallery
    if(!empty($data['Gallery']))foreach($data['Gallery'] as $k=>$g){
        if(!empty($g['items']))foreach($g['items'] as $i=>$img){

            $img_content = curl_get_content(str_replace(' ','%20',$img));
            $ext = pathinfo($img, PATHINFO_EXTENSION);
            $new_file = $imgPath.uniqid('pic_').'.'.$ext;

            $data['Gallery'][$k]['items'][$i] = $new_file;

            $f = fopen($new_file,"w+");
            fwrite($f,$img_content);
            fclose($f);
            watermark($new_file);
        }
    }


}

function crawler_category($page = 1){
    $url = "http://trangvangvietnam.com/findex.asp?page=".$page;
    $html_string = curl_get_content($url);

    //return if cannot get data
    if(!$html_string) return '';

    $html = str_get_html($html_string);

    $pcategory = $html->find('p[class=pcategory]');
    $aryCategory = array();
    $parent = ""; $child = array(); $link ='';
    foreach ($pcategory as $c){

        preg_match_all('#<a\s.*?(?:href=[\'"](.*?)[\'"]).*?>#is', $c->innertext, $link);


        $url = $link[1][0];
        $url = str_replace('../','http://trangvangvietnam.com/',$url);


        $text =  getStandardText(strip_tags($c->innertext));
        $number =  $c->find('span');
        $number = $number[0]->innertext;
        $text = str_replace($number,'',$text);
        $number = str_replace('(','',$number);
        $number = trim(str_replace(')','',$number));

        $style = $c->attr['style'];
        if($style == 'text-transform:capitalize'){

            if(!empty($aryCategory)) $aryCategory[count($aryCategory)-1]['items'] = $child;
            $aryCategory[] = array('label'=>$text,'link'=>$url,'sub'=>0,'number'=>$number);
            $child = array();
        }else{
            if($text != '...More' && $style == 'margin-top:2px; margin-bottom:0px; margin-left:24px'){

                $child[] = array('label'=>$text,'link'=>$url,'sub'=>1,'number'=>$number);
            }
        }


    }

    return $aryCategory;
//    debug($aryCategory);
}

function crawler_list($url,$cate_id){
    $aryCompany = array();
    $html_string = curl_get_content($url);

    //return if cannot get data
    if(!$html_string) return '';

    $html = str_get_html($html_string);
    $company = $html->find('div[class=boxlistings] h2 a');
    foreach($company as $c){

        $url = $c->attr['href'];
        $aryCompany[] = array('name'=>getStandardText(strip_tags($c->innertext)),'link'=>$url,'cate_id'=>$cate_id);

    }
    return $aryCompany;
}

