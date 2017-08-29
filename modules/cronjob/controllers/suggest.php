<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Suggest extends MY_Controller {
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
	 * Cronjob controller 
	 */
	
	//form add
	protected $before_add = array();
	
	//form edit
	protected $before_edit = array();
	protected $after_edit = array();
	
	//action insert
	protected $before_insert = array();
	protected $after_insert = array();
	
	//action update
	protected $before_update = array();
	protected $after_update = array();
	
	//form view
	protected $before_view = array();	
	protected $after_view = array();

	/**
	 * @var Solarium\Client
	 */
	public $solarium;
	/**
	 * @var mixed
	 */
	public  $solr_config;
	
    public function __construct(){
        parent::__construct();

		$this->load->library('solarium');
		$this->load->config('solr');
		$solr_config = $this->config->item('solr_server');
//		debug($solr_config);

		$solr = getDBConfig('SOLR',true);
		if($solr){
			$solr_config['endpoint']['localhost']['host'] = $solr[0][0];
			$solr_config['endpoint']['localhost']['port'] = $solr[0][1];
			$solr_config['endpoint']['localhost']['path'] = '/solr/IYP_Suggestion';//$solr[0][2];
		}
//		debug($solr_config);
		$this->solr_config = $solr_config;
		$this->solarium = new Solarium($solr_config);

    }

	public function index(){

		$this->template->set('server',$this->solr_config);

		if($this->solr_config){
			$server = $this->solr_config['endpoint']['localhost']['host'];
			$port = $this->solr_config['endpoint']['localhost']['port'];
			$link = 'http://'.$server.':'.$port.'/solr/admin/cores?wt=json';

			$solrContent = @file_get_contents($link);
			$solr = json_decode($solrContent);

			$this->template->set('solr',$solr);
		}

		$company = $this->model->count_where(
			array('status'=>ACTIVE),array(
			'select'=>'Solr_Index,COUNT(*) as total',
			'from'=>'company','group_by'=>'Solr_Index'),'list');
//		debug($this->db->last_query());
		$this->template->set('company_statistic',$company);
		$this->view('solrs/suggest');
	}
    
    function indexData()
	{
		$aryData = array('ok'=>1);

		//error_reporting(0);

		$client =$this->solarium->client;
		$company = $this->model->find_where('list',array('Solr_Index'=>0,'status'=>ACTIVE),array('from'=>'company','limit'=>50));

		if(!empty($company)){
			// get an update query instance
			$update = $client->createUpdate();
			$aryDoc = array();
			foreach ($company as $k=>$item){
				$doc = $update->createDocument();
				$doc->id = $item->id;
				$doc->Company_Name = $item->Company_Name;

				$this->model->update('company',array('Solr_Index'=>ACTIVE),array('id'=>$item->id));
				$aryDoc[] = $doc;
			}

			$update->addDocuments($aryDoc);
			$update->addCommit();
			$client->update($update);
		}else{
			$aryData['ok'] = 2;
			$aryData['finish']  = "Hoàn thành";
		}
		//count total indexed
		$query = $client->createSelect();
		$query->setQuery("*:*");
		$query->setFields(array('id'));
		$result = $client->select($query);
		$total = $result->getNumFound();
		$aryData['smessage'] = 'Đã index được <b>'.count($company).'</b> bản ghi và tổng số trên solr <b>'.$total.'</b> bản ghi';

		$aryData['processed'] =  count($company);
		$aryData['total_indexed'] = $total;

		echo json_encode($aryData);

	}

	function ping(){

		debug($this->solr_config,false);

		$client = $this->solarium->client;

		// create a ping query
		$ping = $client->createPing();

		// execute the ping query
		try {
			$result = $client->ping($ping);
			echo 'Ping query successful';
			echo '<br/><pre>';
			var_dump($result->getData());
			echo '</pre>';
		} catch (Solarium\Exception $e) {
			echo 'Ping query failed';
		}

	}


	function PrepareFullIndex(){
		$aryData = array('ok'=>true);
		//Clear Data
		$client = $this->solarium->client;
		$query = $client->createQuery($client::QUERY_UPDATE);
		$query->addDeleteQuery('*:*');
		$query->addCommit();
		$result = $client->update($query);

		$this->model->addLog(array(
			'type'=>0,
			'comment'=>'Full-index: Xóa dữ liệu '. $result->getStatus().':'.$result->getQueryTime()));


		//Reset index flag.
		$aryData['ok'] = $this->model->update('company',array('Solr_Index'=>0),array('status'=>ACTIVE));

		if($aryData['ok']){
			$aryData['smessage'] = 'Hoàn tất chuẩn bị.';
			$this->model->addLog(array(
				'type'=>0,
				'comment'=>'Full-index:'.$aryData['smessage']));
		}else{
			$aryData['ok'] = false;
			$aryData['smessage'] = "<span class='text_error'>Lỗi, không thực hiện được</span>";
			$this->model->addLog(array(
				'type'=>2,
				'comment'=>'Full-index:'.$aryData['serror']));
		}

		echo json_encode($aryData);

	}


	function delete(){
		$client = $this->solarium->client;
		$query = $client->createQuery($client::QUERY_UPDATE);
		$query->addDeleteQuery('*:*');
		$query->addCommit();
		$result = $client->update($query);

		echo '<b>Update query executed</b><br/>';
		echo 'Query status: ' . $result->getStatus(). '<br/>';
		echo 'Query time: ' . $result->getQueryTime();
	}



}

//end of Solr