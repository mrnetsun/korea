<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	define("SOLR_BASE",dirname(__FILE__).'/solarium/');
    class Solarium
    {
        /**
         * @var \Solarium\Client
         */
		public $client;

        /**
         * @var Solarium\QueryType\Select\Query\Query
         */
        public $query;

        /**
         * @var  Solarium\Core\Query\Result\ResultInterface
         */
        public $resultset;

        public function __construct($config= array())
        {
			require SOLR_BASE.'/vendor/autoload.php';
            if($config){
                $client = new Solarium\Client($config);
                $this->client = $client;

                $query = $this->client->createQuery($client::QUERY_SELECT);

                $this->query = $query;
            }

        }
        public function execute(){
           try{
               $this->resultset = $this->client->execute($this->query);
           }catch (Exception $e){

            }

        }

    }  