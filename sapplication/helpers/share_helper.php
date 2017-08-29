<?php

/**
 * CodeIgniter helper for generate share url and buttons (Twitter, Facebook, G+)
 *
 * @version 1.0  
 */

if(!function_exists('facebook_like')){
 function facebook_like($url){
   $formlink  = '<iframe src="http://www.facebook.com/plugins/like.php?href=';
   $formlink .= urlencode($url);
   $formlink .= ';layout=button_count&show_faces=true&width=450&';
   $formlink .= 'action=like&colorscheme=light&height=21" scrolling="no"';
   $formlink .= 'frameborder="0" style="border:none; overflow:hidden;';
   $formlink .= 'width:450px;height:21px;" allowTransparency="true"></iframe>';               
   return $formlink;
  }
 }

function send_facebook($url){
	$html = '
	<li class="send_mail">
                                <div id="fb-root"></div>
                                <script>(function (d, s, id) {
                                        var js, fjs = d.getElementsByTagName(s)[0];
                                        if (d.getElementById(id)) return;
                                        js = d.createElement(s); js.id = id;
                                        js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3";
                                        fjs.parentNode.insertBefore(js, fjs);
                                    }(document, \'script\', \'facebook-jssdk\'));</script>
                                <div class="fl mr5" style="width: 45px;height:20px">
                                    <div class="fb-send fl mr5" style="position: absolute;z-index: 9999" data-href="http://vneconomy.vn/news-20160331121631542.htm" data-colorscheme="dark"></div>
                                </div>
                                <div class="fl mr20">
                                    <span class="fl sprite img_face">&nbsp;</span>
                                    <iframe onload="return renderFbLike(this, 140, 21);" style="display: none;float:left;" src="//www.facebook.com/plugins/like.php?href=http://vneconomy.vn/news-20160331121631542.htm&amp;width=150&amp;layout=button_count&amp;action=like&amp;show_faces=false&amp;share=true&amp;height=21&amp;locale=en_US" scrolling="no" frameborder="0" style="width: 140px; border: none; overflow: hidden; height: 21px; float: left;" allowtransparency="true"></iframe>
                                </div>


                            </li>';
	return $html;
}

function share_facebook($url){
	$html ='
	<li class="rrssb-facebook">
        <a href="https://www.facebook.com/sharer/sharer.php?u='.urlencode($url).'" class="popup">
          <span class="rrssb-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 29 29"><path d="M26.4 0H2.6C1.714 0 0 1.715 0 2.6v23.8c0 .884 1.715 2.6 2.6 2.6h12.393V17.988h-3.996v-3.98h3.997v-3.062c0-3.746 2.835-5.97 6.177-5.97 1.6 0 2.444.173 2.845.226v3.792H21.18c-1.817 0-2.156.9-2.156 2.168v2.847h5.045l-.66 3.978h-4.386V29H26.4c.884 0 2.6-1.716 2.6-2.6V2.6c0-.885-1.716-2.6-2.6-2.6z"/></svg>
          </span>
          <span class="rrssb-text">facebook</span>
        </a>
      </li>';
	return $html;
}

function share_linkin($url,$text){
	$html='
	<li class="rrssb-linkedin">
        <!-- Replace href with your meta and URL information -->
        <a href="http://www.linkedin.com/shareArticle?mini=true&amp;url='.urlencode($url).'&amp;title='.urlencode($text).'" class="popup">
          <span class="rrssb-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28"><path d="M25.424 15.887v8.447h-4.896v-7.882c0-1.98-.71-3.33-2.48-3.33-1.354 0-2.158.91-2.514 1.802-.13.315-.162.753-.162 1.194v8.216h-4.9s.067-13.35 0-14.73h4.9v2.087c-.01.017-.023.033-.033.05h.032v-.05c.65-1.002 1.812-2.435 4.414-2.435 3.222 0 5.638 2.106 5.638 6.632zM5.348 2.5c-1.676 0-2.772 1.093-2.772 2.54 0 1.42 1.066 2.538 2.717 2.546h.032c1.71 0 2.77-1.132 2.77-2.546C8.056 3.593 7.02 2.5 5.344 2.5h.005zm-2.48 21.834h4.896V9.604H2.867v14.73z"/></svg>
          </span>
          <span class="rrssb-text">linkedin</span>
        </a>
      </li>';
	return $html;
}

function share_twitter($url,$text){
	$html='
	<li class="rrssb-twitter">
        <a href="https://twitter.com/intent/tweet?text='.urlencode($text.' bởi @finddoanhnghiep :'.$url).'"
        class="popup">
          <span class="rrssb-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 28"><path d="M24.253 8.756C24.69 17.08 18.297 24.182 9.97 24.62a15.093 15.093 0 0 1-8.86-2.32c2.702.18 5.375-.648 7.507-2.32a5.417 5.417 0 0 1-4.49-3.64c.802.13 1.62.077 2.4-.154a5.416 5.416 0 0 1-4.412-5.11 5.43 5.43 0 0 0 2.168.387A5.416 5.416 0 0 1 2.89 4.498a15.09 15.09 0 0 0 10.913 5.573 5.185 5.185 0 0 1 3.434-6.48 5.18 5.18 0 0 1 5.546 1.682 9.076 9.076 0 0 0 3.33-1.317 5.038 5.038 0 0 1-2.4 2.942 9.068 9.068 0 0 0 3.02-.85 5.05 5.05 0 0 1-2.48 2.71z"/></svg>
          </span>
          <span class="rrssb-text">twitter</span>
        </a>
      </li>';
	return $html;
}

function share_google($url,$text){
	$html='
	<li class="rrssb-googleplus">
        <!-- Replace href with your meta and URL information.  -->
        <a href="https://plus.google.com/share?url='.urlencode($url).'" class="popup">
          <span class="rrssb-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M21 8.29h-1.95v2.6h-2.6v1.82h2.6v2.6H21v-2.6h2.6v-1.885H21V8.29zM7.614 10.306v2.925h3.9c-.26 1.69-1.755 2.925-3.9 2.925-2.34 0-4.29-2.016-4.29-4.354s1.885-4.353 4.29-4.353c1.104 0 2.014.326 2.794 1.105l2.08-2.08c-1.3-1.17-2.924-1.883-4.874-1.883C3.65 4.586.4 7.835.4 11.8s3.25 7.212 7.214 7.212c4.224 0 6.953-2.988 6.953-7.082 0-.52-.065-1.104-.13-1.624H7.614z"/></svg>            </span>
          <span class="rrssb-text">google+</span>
        </a>
      </li>';
	return $html;
}

function button_print(){
	$html='

	 <span>
        <a class="text-gray"  href="javascript:window.print()">
          <i class="fa fa-print"></i> '.__("LBL_PRINT").'
        </a>
      </span>';
	return $html;
}
 
 if(!function_exists('social_link')){
	function social_link($text){
		$url = current_url();

		$html = '<ul class="rrssb-buttons">';
//		$html .= send_facebook($url);
		$html .= share_facebook($url);
		$html .= share_google($url,$text);
		$html .= share_twitter($url,$text);
		$html .= share_linkin($url,$text);
//		$html .= facebook_like($url);
		$html.="</ul>";
		return $html;	 
	}
 }


function shareThis(){
	//a2a_floating_style a2a_vertical_style
	$html='<div class="a2a_kit a2a_kit_size_22 a2a_floating_style a2a_vertical_style"
	style="left:3px; top:50%; margin-top: -100px;
	opacity: 0.8!important;
    filter: alpha(opacity=80)!important;;">
    <a class="a2a_button_facebook"></a>
    <a class="a2a_button_twitter"></a>
    <a class="a2a_button_google_plus"></a>
    <a class="a2a_button_pinterest"></a>
    <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
</div>
<script async src="//static.addtoany.com/menu/page.js"></script>
	';
	return $html;
}
?>