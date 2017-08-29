<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Weather extends MY_Controller {
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


    public function __construct(){
        parent::__construct();
    }



    public function index(){

       $location  = $this->model->find_where('list',array('status'=>ACTIVE),array('from'=>'city','order_by'=>array('location'=>'ASC')));
       $this->template->set('location',$location);
       $this->view("weathers/index");
    }

    public function updateWeather(){
        $aryData = array('ok'=>0);
        $message = array();

        $this->load->helper('dom');
        $this->load->helper('weather');
        $aryLocation  = $this->model->find_where('list',array('status'=>ACTIVE),array('from'=>'city'));
        $inserted = 0; $updated = 0; $failured = 0;
        foreach($aryLocation as $item){

            if($item->crawler_url){
                //$data = getWeather($item->crawler_url);
                $data = getWeatherMSN($item->crawler_msn);

                if($data['value']){
                    //echo "<span style='color: green;'>-OK</span>";
                    $isExisted = $this->model->find_where('',
                        array('date'=>date("Y-m-d"),'location_id'=>$item->id),
                        array('from'=>'weather_detail'));
                    if($isExisted){

                        //update
                        $this->model->update('weather_detail',
                            array(
                                'status'=>ACTIVE,
                                'detail'=>json_encode($data)
                            ),array('id'=>$isExisted->id));
//                        debug($this->db->last_query());

                    }else{
                        //insert
                        $this->model->add('weather_detail',
                            array('date'=>date("Y-m-d"),
                                'location'=>$item->location,
                                'location_id'=>$item->id,
                                'type'=>'MSN',
                                'status'=>ACTIVE,
                                'keyword'=>$item->keyword,
                                'detail'=>json_encode($data)
                            ));
                    }



                    $this->model->update('city',array('weather'=>1),array('id'=>$item->id));
                    $message[] = "Đã cập nhật bản ghi thời tiết.<br>";
                    $this->model->addLog(array('type'=>TYPE_LOG_INFOR,'comment'=>"Đã cập nhật $item->location bản ghi thời tiết."));
                }else{
                    $failured++;
                    $message[] =  "<span style='color: red;'>-Failure</span>";
                    $this->model->addLog(array('type'=>TYPE_LOG_ERROR,'comment'=>$item->location." cannot update"));

                }

            }

        }
        $message[] =  "Đã thêm mới $inserted và cập nhật $updated bản ghi thời tiết.";
        $this->model->addLog(array('type'=>TYPE_LOG_INFOR,'comment'=>"Đã thêm mới $inserted và cập nhật $updated bản ghi thời tiết. Có $failured bản ghi lỗi."));

        $aryData['smessage'] = implode('<br>',$message);
        echo json_encode($aryData);
    }

    public function prepare(){
        $aryData = array('ok'=>true);
        $this->model->update('city',array('weather'=>0),array('status'=>ACTIVE));
        echo json_encode($aryData);

    }

    public function update()
    {
        $item = $this->model->find_where('',array('weather'=>0),array('from'=>'city '));
        if(!empty($item)){
            $this->getLocationMSN($item->id);
        }else{
            echo json_encode(array('ok'=>false,'smessage'=>__("Hoàn thành.")));
        }
    }

    public function getLocationWeather($id=''){
        $aryData = array('ok'=>true);
        $this->load->helper('dom');
        $this->load->helper('weather');
        $item  = $this->model->get($id,array('from'=>'city'));

        if(!empty($item)){
            $message[] = $item->location;

            if($item->crawler_url){
                $data = getWeather($item->crawler_url);

                if($data['value']){
                    //echo "<span style='color: green;'>-OK</span>";
                    $isExisted = $this->model->find_where('',
                        array('date'=>date("Y-m-d"),'location_id'=>$item->id),
                        array('from'=>'weather_detail'));
                    if($isExisted){

                        //update
                        $this->model->update('weather_detail',
                            array(
                                'status'=>ACTIVE,
                                'detail'=>json_encode($data)
                            ),array('id'=>$isExisted->id));
//                        debug($this->db->last_query());

                    }else{
                        //insert
                        $this->model->add('weather_detail',
                            array('date'=>date("Y-m-d"),
                                'location'=>$item->location,
                                'location_id'=>$item->id,
                                'status'=>ACTIVE,
                                'keyword'=>$item->keyword,
                                'detail'=>json_encode($data)
                            ));
                    }



                    $this->model->update('city',array('weather'=>1),array('id'=>$item->id));
                    $message[] = "Đã cập nhật bản ghi thời tiết.<br>";
                    $this->model->addLog(array('type'=>TYPE_LOG_INFOR,'comment'=>"Đã cập nhật $item->location bản ghi thời tiết."));
                }else{
                    $this->model->update('city',array('weather'=>-1),array('id'=>$item->id));
                    $message[] = "<span style='color: red;'>-Failure</span><br>";
                    $this->model->addLog(array('type'=>TYPE_LOG_ERROR,'comment'=>$item->location." cannot update ". anchor('cronjob/weather/getLocationWeather/'.$item->id,'retry')));
                }

            }

            $aryData['smessage'] = implode(' => ',$message);
        }else{
            $aryData['ok'] = false;
            $aryData['smessage'] = 'Cập nhật xong.';
        }


        echo json_encode($aryData);


    }


    public function getLocationMSN($id=''){
        $aryData = array('ok'=>true);
        $this->load->helper('dom');
        $this->load->helper('weather');
        $item  = $this->model->get($id,array('from'=>'city'));

        if(!empty($item)){
            $message[] = $item->location;

            if($item->crawler_url){
//                $item->crawler_msn ='http://www.msn.com/vi-vn/weather/today/Th%C3%A0nh-Ph%E1%BB%91-Long-Xuy%C3%AAn,An-Giang,Vi%E1%BB%87t-Nam/we-city-10.3768,105.441?q=th%C3%A0nh-ph%E1%BB%91-long-xuy%C3%AAn-an-giang&form=PRWLAS&iso=VN';
                 $data = getWeatherMSN($item->crawler_msn);

                if($data['value']){
                    //echo "<span style='color: green;'>-OK</span>";
                    $isExisted = $this->model->find_where('',
                        array('date'=>date("Y-m-d"),'location_id'=>$item->id),
                        array('from'=>'weather_detail'));
                    if($isExisted){

                        //update
                        $this->model->update('weather_detail',
                            array(
                                'status'=>ACTIVE,
                                'detail'=>json_encode($data)
                            ),array('id'=>$isExisted->id));
//                        debug($this->db->last_query());

                    }else{
                        //insert
                        $this->model->add('weather_detail',
                            array('date'=>date("Y-m-d"),
                                'location'=>$item->location,
                                'location_id'=>$item->id,
                                'type'=>'MSN',
                                'status'=>ACTIVE,
                                'keyword'=>$item->keyword,
                                'detail'=>json_encode($data)
                            ));
                    }



                    $this->model->update('city',array('weather'=>1),array('id'=>$item->id));
                    $message[] = "Đã cập nhật bản ghi thời tiết.<br>";
                    $this->model->addLog(array('type'=>TYPE_LOG_INFOR,'comment'=>"Đã cập nhật $item->location bản ghi thời tiết."));
                }else{
                    $this->model->update('city',array('weather'=>-1),array('id'=>$item->id));
                    $message[] = "<span style='color: red;'>-Failure</span><br>";
                    $this->model->addLog(array('type'=>TYPE_LOG_ERROR,'comment'=>$item->location." cannot update ". anchor('cronjob/weather/getLocationWeather/'.$item->id,'retry')));
                }

            }

            $aryData['smessage'] = implode(' => ',$message);
        }else{
            $aryData['ok'] = false;
            $aryData['smessage'] = 'Cập nhật xong.';
        }


        echo json_encode($aryData);
    }

}

//end of Home