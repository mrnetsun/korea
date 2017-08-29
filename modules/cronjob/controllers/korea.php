<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Korea extends MY_Controller {
    /**
	 * Model
	 * @var string
	 */
	public $model_name  = 'cronjob_model';
	/**
	 * 
	 * @var Cronjob_Model
	 */
	public $model;

    /**
     * Home controller
     */

    //form add
    protected $before_add = array();

    //form edit
    protected $before_edit = array();

    //action insert
    protected $before_insert = array();
    protected $after_insert = array();

    //action update
    protected $before_update = array();
    protected $after_update = array();

    //form view
    protected $before_view = array();
    protected $after_view = array();

    //curl object
    protected $ch;


    public function __construct(){
        parent::__construct();

        $this->load->helper('dom');
        $this->load->helper('google');
    }

    public function index(){

        $this->view('korea/index');
    }

    /**
     * sttore all page categories to database
     */
    public function getContent(){
        set_time_limit(0);

        $categories = $this->model->find_where('list',
            array('status'=>1,'url <>'=>''),
            array('from'=>'vocabulary_category'));

        foreach($categories as $category){
            $this->login();
            $html_string = $this->getPageContent($category->url);
            $this->model->update('vocabulary_category',array('detail'=>$html_string),array('id'=>$category->id));
            echo $category->cate_name.'<br/>';
        }

        echo 'Done';
    }

    public function showCategory(){
        $categories = $this->model->find_where('list',
            array('status'=>1,'url <>'=>''),
            array('from'=>'vocabulary_category'));

        $this->view('korea/category',array('categories'=>$categories));
    }

    /**
     * get vocabulary to database của câp 2
     */
    public function vocabulary(){
        set_time_limit(0);

        $categories = $this->model->find_where('list',array('status'=>1,'url <>'=>''),array('from'=>'vocabulary_category'));

        foreach($categories as $category){
            $data = array();
            if($category->url) {
//                $html_string = curl_get_content($category->url);
                $html = str_get_html($category->detail);
                $words = $html->find('div[class="voca_children"]');

                if ($words) {

                    foreach ($words as $k => $w) {
                        $text = explode(':', trim(strip_tags($w->innertext)));

                        $audio = $w->find('a', 0);

                        if($audio){
                            $audio_url = $audio->attr['href'];
                        }else{
                            $audio_url = '';
                        }

                        $tmp = array('title' => trim($text[0])
                        , 'meaning' => trim($text[1])
                        , 'audio' =>$audio_url
                        , 'status' => 1
                        , 'cate_id' => $category->id
                        );
                        $data[] = $tmp;
                    }
                }

                if (!empty($data)) {
                    foreach ($data as $item) {
                        $existed = $this->model->find_where('', array('title' => $item['title']), array('from' => 'vocabulary'));

                        if (!$existed) {
                            $this->model->add('vocabulary', $item);
                        }
                    }
                }

                echo $category->cate_name . '<br>';
            }

            $this->model->update('vocabulary_category',array('status'=>2),array('id'=>$category->id));
        }

        echo 'Done';


    }

    public function crawlerWord(){
        $categories = $this->model->find_where('list',
            array('status'=>1,'url <>'=>''),
            array('from'=>'vocabulary_category'));
        $this->view('korea/crawlerWord',array('categories'=>$categories));
    }

    /**
     * get vocabulary to database của câp 2
     */
    public function vocabularyById($id){
        set_time_limit(0);

        $category = $this->model->get($id,array('from'=>'vocabulary_category'));


            $data = array();
            if($category->url) {
//                $html_string = curl_get_content($category->url);
//                die($category->detail);
                $html = str_get_html($category->detail);

                switch($category->parent_id){
                    case 3:
                        //hinh anh
                        $words = $html->find('div[class="col-xs-6 col-sm-4 col-md-3 col-lg-3 padding"]');

                        if ($words) {

                            foreach ($words as $k => $w) {
//                               debug($w->innertext);

                                $audio = $w->find('a', 0);

                                if($audio){
                                    $audio_url = $audio->attr['href'];
                                }else{
                                    $audio_url = '';
                                }

                                $text = $w->find('div[class="voca_children_img"]',0);
                                $title = trim(strip_tags($text->innertext));

                                $text = $w->find('div[class="voca_childrenb_img"]',0);
                                $meaning = trim(strip_tags($text->innertext));

//                                debug($title.':'.$meaning);

                                $tmp = array('title' => $title
                                , 'meaning' => $meaning
                                , 'audio' =>$audio_url
                                , 'status' => 1
                                , 'cate_id' => $category->id
                                );
                                $data[] = $tmp;
                            }
                        }

                        break;

                    case 4:
                        //am thanh
                        $words = $html->find('div[class="col-xs-12 col-sm-6 col-md-6 col-lg-6 padding"]');
//                        die($category->detail);
                        if ($words) {

                            foreach ($words as $k => $w) {


                                $audio = $w->find('a', 0);

                                if($audio){
                                    $audio_url = $audio->attr['href'];
                                }else{
                                    $audio_url = '';
                                }

                                $text = $w->find('div[class="voca_children_listen"]',0);
                                $title = trim(str_replace(':','',strip_tags($text->innertext)));

                                $text = $w->find('div[class="voca_childrenb_listen"]',0);
                                $meaning = trim(strip_tags($text->innertext));

//                                debug($title.':'.$meaning);

                                $tmp = array('title' => $title
                                , 'meaning' => $meaning
                                , 'audio' =>$audio_url
                                , 'status' => 1
                                , 'cate_id' => $category->id
                                );
                                $data[] = $tmp;
                            }
                        }

                        break;
                    case 5:
                        //am thanh
                        $words = $html->find('div[class="maincontent_vh"]');
                        //ngu phap
                        if(in_array($category->id,array(284,285,286,287,288))){
                            if ($words) {

                                foreach ($words as $k => $w) {

                                    $text = trim($w->innertext);
                                    $t = explode(':',$text);

                                    $tmp = array('title' =>trim($t[0])
                                    , 'meaning' => trim($t[1])
                                    , 'status' => 1
                                    , 'cate_id' => $category->id
                                    );
                                    $data[] = $tmp;
                                }
                            }

                        }else{
                            //btap
                            $words = $html->find('div[class="voca_children"]');
//                        die($category->detail);
                            if ($words) {

                                foreach ($words as $k => $w) {
                                    $text = explode(':', trim(strip_tags($w->innertext)));

                                    $audio = $w->find('a', 0);

                                    if($audio){
                                        $audio_url = $audio->attr['href'];
                                    }else{
                                        $audio_url = '';
                                    }

                                    $tmp = array('title' => trim($text[0])
                                    , 'meaning' => trim($text[1])
                                    , 'audio' =>$audio_url
                                    , 'status' => 1
                                    , 'cate_id' => $category->id
                                    );
                                    $data[] = $tmp;
                                }
                            }

                        }

                        break;

                    case 6:
                        die();
                        //cau hoi
                        if($category->id >= 294){
                            $words = $html->find('div[class="mainquestion1"]');
//                        debug($category->detail,false);
                            if ($words) {

                                foreach ($words as $k => $w) {

                                    $number = $w->find('div[class="number"]',0);
                                    $maincontent = $w->find('div[class="maincontent"]',0);
                                    $mainradio = $w->find('div[class="radio"]');

                                    $options = array();
                                    foreach($mainradio as $radio){
                                        $radio->find('strong',0)->outertext = '';
                                        $text = $radio->innertext;
                                        $true = (strpos($text,'(*)'))?1:0;
                                        $text = trim(str_replace('(*)','',$text));
                                        if($text)$options[] = array($text,$true);
                                    }
                                    $meaning_str = '';

                                    $meaning = $w->find('div[class="maincontent_vietsub"] p');
                                    for($i=0;$i<count($meaning) -1; $i++){
                                        $meaning_str .= $meaning[$i]->outertext;
                                    }

                                    $options_vi = end($meaning);

                                    $aryVi = explode('.',strip_tags($options_vi->innertext));

                                    $aryViOk = array();
                                    foreach($aryVi as $a){
                                        $t = trim(preg_replace('/[0-9]+/', '', strip_tags($a)));
                                        if($t){$aryViOk[] = $t;}
                                    }

                                    $options_vi = array();
                                    foreach($aryViOk as $radio) {
                                        $true = (strpos($radio, '(*)')) ? 1 : 0;
                                        $text = trim(str_replace('(*)', '', $radio));
                                        if($text)$options_vi[] = array($text, $true);
                                    }



                                    $tmp = array('title' => intval($number->innertext)
                                    , 'detail' => trim($maincontent->innertext)
                                    , 'meaning' => $meaning_str
                                    , 'options' =>$options
                                    , 'options_vi'=> $options_vi
                                    , 'status' => 1
                                    , 'cate_id' => $category->id
                                    );
                                    $data[] = $tmp;
                                }
                            }
                        }else{
                            $words = $html->find('div[class="mainquestion"]');
//                        die($category->detail);
                            if ($words) {

                                foreach ($words as $k => $w) {

                                    $number = $w->find('div[class="number"]',0);
                                    $maincontent = $w->find('div[class="maincontent"]',0);
                                    $mainradio = $w->find('div[class="radio"]');

                                    $options = array();
                                    foreach($mainradio as $radio){
                                        $radio->find('strong',0)->outertext = '';
                                        $text = $radio->innertext;
                                        $true = (strpos($text,'(*)'))?1:0;
                                        $text = trim(str_replace('(*)','',$text));
                                        $options[] = array($text,$true);
                                    }

                                    $options_vi = $w->find('div[class="maincontent_vietsub"]',0);
                                    $aryVi = explode('.',strip_tags($options_vi->innertext));

                                    $aryViOk = array();
                                    foreach($aryVi as $a){
                                        $t = trim(preg_replace('/[0-9]+/', '', $a));
                                        if($t){$aryViOk[] = $t;}
                                    }

                                    $options_vi = array();
                                    foreach($aryViOk as $radio) {
                                        $true = (strpos($radio, '(*)')) ? 1 : 0;
                                        $text = trim(str_replace('(*)', '', $radio));
                                        $options_vi[] = array($text, $true);
                                    }



                                    $tmp = array('title' => intval($number->innertext)
                                    , 'detail' => trim($maincontent->innertext)
                                    , 'options' =>$options
                                    , 'options_vi'=> $options_vi
                                    , 'status' => 1
                                    , 'cate_id' => $category->id
                                    );
                                    $data[] = $tmp;
                                }
                            }
                        }


                        break;

                    default:
                        //tu vung
                        $words = $html->find('div[class="voca_children"]');
//                        die($category->detail);
                        if ($words) {

                            foreach ($words as $k => $w) {
                                $text = explode(':', trim(strip_tags($w->innertext)));

                                $audio = $w->find('a', 0);

                                if($audio){
                                    $audio_url = $audio->attr['href'];
                                }else{
                                    $audio_url = '';
                                }

                                $tmp = array('title' => trim($text[0])
                                , 'meaning' => trim($text[1])
                                , 'audio' =>$audio_url
                                , 'status' => 1
                                , 'cate_id' => $category->id
                                );
                                $data[] = $tmp;
                            }
                        }

                }

//                debug($data,false);
//                $html = preg_replace('#<script(.*?)>(.*?)</script>#is', '', $category->detail);
//                $html = str_replace('http://tuvungtienghan.com/themes/css/noview.css','',$html);
//                die ($html);
                $inserted = 0;

                if (!empty($data)) {
                    foreach ($data as $item) {
                        $existed = $this->model->find_where('', array('title' => $item['title']), array('from' => 'vocabulary'));

                        if (!$existed) {
                            $inserted++;
                            $item['cate_id'] = json_encode(array($item['cate_id']));
                            $this->model->add('vocabulary', $item);
                        }else{
                            $aryCate = (array) json_decode($existed->cate_id);
                            if(!in_array($item['cate_id'],$aryCate)){
                                $aryCate[] =  $item['cate_id'];
                            }
                            $item['cate_id'] = json_encode($aryCate);
                            $this->model->update('vocabulary', $item,array('id'=>$existed->id));
                        }
                    }
                    $this->model->update('vocabulary_category',array('status'=>2),array('id'=>$category->id));

                }

            }



        echo json_encode(array('id'=>$category->id,'html'=>  '<br>'.$category->cate_name.':'.count($data).' records<br> Inserted:'.$inserted));


    }

    /**
     * @param $id
     * lấy category con của từng category (các danh mục cấp 1)
     */
    public function  vocabularyCate($id){

        if(!$id) {
            echo 'invalid Id';
            return;
        }


        $cate = $this->model->get($id,array('from'=>'vocabulary_category'));
        $html = str_get_html($cate->detail);

        $cateList = $html->find('div[class="klpt"] li a');

        if($cateList){
            $data = array();
            foreach($cateList as $c){
                $data[] = array('text'=>trim($c->innertext),'link'=>trim($c->attr['href']));

            }

            if(!empty($data)){
                foreach($data as $d){
                    $existed = $this->model->find_where('',array('url'=>$d['link']),array('from'=>'vocabulary_category'));
                    if(!empty($existed)){
                        $this->model->update('vocabulary_category',array('cate_name'=>$d['text'],'parent_id'=>$cate->id,'status'=>1),array('id'=>$existed->id));
                    }else{
                        $this->model->add('vocabulary_category',array('cate_name'=>$d['text'],'url'=>$d['link'],'parent_id'=>$cate->id,'status'=>1));
                    }
                }

                echo "Updated ".count($data)." records.";
            }
        }

    }

    public function word(){
        $this->view('korea/word');
    }


    /**
     * cập nhật thông tin Ảnh/Audio/Phiên âm
     **/
    public function updateWord(){
        $word = $this->model->find_where('',array('status'=>1),array('from'=>'vocabulary'));

        //save audio
        if($word->audio){
            //$file_audio = $this->getMP3($word->audio);
            $normal_audio = $this->getMP3Text($word->title,'normal_',0);
            $slow_audio = $this->getMP3Text($word->title,'slow_',-7);
        }else{
            $normal_audio = $this->getMP3Text($word->title,'normal_',0);
            $slow_audio = $this->getMP3Text($word->title,'slow_',-7);
        }

        //save img
        $image = $this->getImage($word->title);

        //save pronounce
        $pronounce = $this->getPronounce($word->title);


        $this->model->update('vocabulary',
            array('status'=>2,
                'image'=>json_encode(array('real_name'=>$image,'client_name'=>end(explode('/',$image)))),
                'audio'=>$normal_audio,
                'slow_audio'=>$slow_audio,
                'pronounce'=>$pronounce[0],
                'gmeaning'=>$pronounce[1],
                'description'=>$pronounce[2]
            ),array('id'=>$word->id));
        echo json_encode(array('ok'=>true,'id'=>$word->id,'image'=>'<img src="/'.$image.'"/>','text'=>$word->title.':'.$word->meaning));
    }

    //cap nhat file size vao db
    public function audiosize(){
        set_time_limit(0);
        $words = $this->model->find_where('list',array('status'=>2),array('from'=>'vocabulary'));
        foreach($words as $word){
            $audio_byte = filesize($word->audio);
            $slow_audio_byte = filesize($word->slow_audio);
            $this->model->update('vocabulary',array('status'=>1,
                'audio_byte'=>$audio_byte,
                'slow_audio_byte'=>$slow_audio_byte),array('id'=>$word->id));
        }
    }

    public function updateAudio(){
        set_time_limit(0);
        $words = $this->model->find_where('list',array('and'=>'(audio_byte = 0 OR slow_audio_byte = 0)'),array('from'=>'vocabulary'));
        foreach($words as $word){
            if($word->audio_byte == 0){
                //0:nomal; -7 for slow
                $speed = 0;
                $text = $word->title;
                $audio = curl_get_content('https://api.ispeech.org/api/rest?apikey=34b06ef0ba220c09a817fe7924575123&action=convert&voice=krkoreanfemale&speed='.$speed.'&pitch=100&text='.urlencode($text));

                $new_file = $word->audio;

                $f = fopen($new_file,'wb');
                fwrite($f,$audio);
                fclose($f);
            }

            if($word->slow_audio_byte == 0){
                //0:nomal; -7 for slow
                $speed = -7;
                $text = $word->title;
                $audio = curl_get_content('https://api.ispeech.org/api/rest?apikey=34b06ef0ba220c09a817fe7924575123&action=convert&voice=krkoreanfemale&speed='.$speed.'&pitch=100&text='.urlencode($text));

                $new_file = $word->slow_audio;

                $f = fopen($new_file,'wb');
                fwrite($f,$audio);
                fclose($f);
            }

            $audio_byte = filesize($word->audio);
            $slow_audio_byte = filesize($word->slow_audio);
            $this->model->update('vocabulary',
                array('audio_byte'=>$audio_byte,'slow_audio_byte'=>$slow_audio_byte),
                array('id'=>$word->id));

        }


    }

    public function gaudio(){
         $this->view('korea/gaudio');
    }
	
	public function gaudio_update(){
        set_time_limit(0);
        $words = $this->model->find_where('list',array('status'=>1),array('from'=>'vocabulary','limit'=>30));
        //debug($words);
		$a = array();
        foreach($words as $word){
		$a[] = $word->id;
        }

		//$this->model->update('vocabulary',array('status'=>3),'id IN ('.implode(',',$a).')');
		
		$a = array();
        foreach($words as $word){
			$this->gaudioMP3($word);
            $this->model->update('vocabulary',array('status'=>2),array('id'=>$word->id));
            $a[] = $word->id;
        }

        echo json_encode(array('ok'=>true,'audio'=>implode(',',$a)));
    }

    /**
     * Test login và get nội dung
     */
    public function check(){
        $this->login();
        $content = $this->getPageContent('http://tuvungtienghan.com/quan-tri/thay-doi-mat-khau.html');
        echo($content);
    }

    /**
     * @return bool Thực hiện login = Curl
     */
    private function login(){
        //initial request with login data
        $this->ch = curl_init();
        curl_setopt($this->ch , CURLOPT_URL, 'http://tuvungtienghan.com/tai-khoan/dang-nhap-tai-khoan.html');
        curl_setopt($this->ch , CURLOPT_USERAGENT,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/32.0.1700.107 Chrome/32.0.1700.107 Safari/537.36');
        curl_setopt($this->ch , CURLOPT_POST, true);
        curl_setopt($this->ch , CURLOPT_POSTFIELDS, "rg_email=lucdt@ideavietnam.com&rg_password=123456");
        curl_setopt($this->ch , CURLOPT_RETURNTRANSFER, true);
        curl_setopt($this->ch , CURLOPT_COOKIESESSION, true);
        curl_setopt($this->ch , CURLOPT_COOKIEJAR, 'cookie-name');  //could be empty, but cause problems on some hosts
        curl_setopt($this->ch , CURLOPT_COOKIEFILE, '/var/www/ip4.x/file/tmp');  //could be empty, but cause problems on some hosts
        $answer = curl_exec($this->ch );
        if (curl_error($this->ch )) {
            echo curl_error($this->ch );
        }
        return true;
    }

    /**
     * @param $url
     * @return mixed
     * Lấy nội dung của một trang
     */
    private function getPageContent($url){
        //get content
        curl_setopt($this->ch , CURLOPT_URL, $url);
        curl_setopt($this->ch , CURLOPT_POST, false);
        curl_setopt($this->ch , CURLOPT_POSTFIELDS, "");
        $answer = curl_exec($this->ch );
        if (curl_error($this->ch )) {
            echo curl_error($this->ch );
        }
        return $answer;
    }


    /**
     * @param $q
     * @return mixed
     * Lấy phiên âm của text $q từ google
     */
    private function getPronounce($q){
        $gtext = curl_get_content(translate('ko', 'vi', trim($q)));

        $match = array();
        preg_match_all('/"([^"]+)"/', $gtext, $match);

//        debug($match);

       return array($match[1][2],$match[1][0],json_encode($match[1]));
    }

    /**
     * @param $q
     * @return array
     * Lấy ảnh từ google
     */
    public function getImage($q){


//        $html_string = curl_get_content('https://www.google.com.vn/search?as_st=y&tbm=isch&as_q='.$q.'&as_epq=&as_oq=&as_eq=&cr=&as_sitesearch=&safe=images&tbs=isz:m');
        $url = 'https://www.google.com.vn/search?q='.$q.'&safe=active&sa=X&site=imghp&biw=1366&bih=282&tbm=isch&ijn=2&ei=Rg-NV5THLsrX0gT0n5GADQ&start=0&ved=0ahUKEwiUguaywv3NAhXKq5QKHfRPBNAQuT0IGSgB&vet=10ahUKEwiUguaywv3NAhXKq5QKHfRPBNAQuT0IGSgB.Rg-NV5THLsrX0gT0n5GADQ.i';
        $html_string = curl_get_content($url);
        $matches = array();
        preg_match('/(<img[^>]+>)/i', $html_string, $matches);

        if(!empty($matches)){
            $html = str_get_html($matches[0]);
            $image = $html->find('img',0);

            $link = $image->attr['data-src'];


            $info = getimagesize($link);
            $ext = getImageExt($info['mime']);

            $content = curl_get_content($link);

            $imgPath = UPLOAD_DIR.'vocabulary/image/';

            if (!file_exists($imgPath)) {
                mkdir($imgPath, 0777, true);
            }

            $file_name = uniqid('img_').'.'.$ext;

            $path = $imgPath.$file_name;

            $f = fopen($path,'wb');
            fwrite($f,$content);
            fclose($f);

            watermark($path);
        }else{
            $path = '';
            //debug($html_string);
        }


        return $path;

    }


    private function getMP3Text($text,$file_name='',$speed=0){
        $file_name = uniqid($file_name);

        $audio = curl_get_content('https://api.ispeech.org/api/rest?apikey=34b06ef0ba220c09a817fe7924575123&action=convert&voice=krkoreanfemale&speed='.$speed.'&pitch=100&text='.urlencode($text));

        $new_file = UPLOAD_DIR.'vocabulary/audio/'.$file_name.'.mp3';

        $f = fopen($new_file,'wb');
        fwrite($f,$audio);
        fclose($f);

        return $new_file;
    }

    private function getMP3($link,$file_name=''){

         $file_name = uniqid($file_name);

        $audioPath = UPLOAD_DIR.'vocabulary/audio/';

        if (!file_exists($audioPath)) {
            mkdir($audioPath, 0777, true);
        }

        $audio = curl_get_content($link);

        $new_file = $audioPath.$file_name.'.mp3';

        $f = fopen($new_file,'wb');
        fwrite($f,$audio);
        fclose($f);

        return $new_file;
    }
	
	 private function gaudioMP3($word){

         $audioPath = UPLOAD_DIR.'vocabulary/audio/';
         if (!file_exists($audioPath)) {
             mkdir($audioPath, 0777, true);
         }
        //audio normal
		$link = 'https://code.responsivevoice.org/getvoice.php?t='.urlencode($word->title).'&tl=ko&sv=&vn=&pitch=0.5&rate=0.5&vol=1';
        //debug($link,false);
        $audio = curl_get_content($link);
 
        $f = fopen($word->audio ,'wb');
        fwrite($f,$audio);
        fclose($f);
		
		//slow
         $link = 'https://code.responsivevoice.org/getvoice.php?t='.urlencode($word->title).'&tl=ko&sv=&vn=&pitch=0.5&rate=0.3&vol=1';
         //debug($link,false);

        $audio = curl_get_content($link);
 
        $f = fopen($word->slow_audio ,'wb');
        fwrite($f,$audio);
        fclose($f);
 
    }

    private function saveImage($link){

        $content = curl_get_content($link);

        $ext = pathinfo($link, PATHINFO_EXTENSION);
        $imgPath = UPLOAD_DIR.'vocabulary/image/';

        if (!file_exists($imgPath)) {
            mkdir($imgPath, 0777, true);
        }

        $file_name = uniqid('img_').$ext;

        $path = $imgPath.$file_name;

        $f = fopen($path,'wb');
        fwrite($f,$content);
        fclose($f);

        watermark($path);

        return $path;

    }



}

//end of Home