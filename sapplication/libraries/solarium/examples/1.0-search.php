<?php

require(__DIR__ . '/init.php');

htmlHeader();

// create a client instance
$client = new Solarium\Client($config);
$suggester = $client->createSuggester();
//set the suggester to use the handler we just defined
$suggester->setHandler('suggest');
$queryString = "con";
//tokenize query string by whitespace
$queryStringTerms = preg_split("/[\s]+/", $queryString);

//$prepend : terms to be prepended to final suggestions
$prepend = array();

//take only the last 3 terms from query to send to Solr
if (count($queryStringTerms) >= 4) {
    $prepend = array_slice($queryStringTerms, 0, -3);
    $queryString = implode(' ', array_slice($queryStringTerms, -3));
}

/* avoid query automatic tokenization by sending query
   in spellcheck.q parameter */
$suggester->addParam('spellcheck.q', $queryString);

//query for autocomplete suggestions
$suggesterResults = $client->suggester($suggester);
$termsResults = $suggesterResults->getResults();

//set a default empty array as suggestions
$suggestions = array();

//get suggestions for first term (the one we are interested in)
$first = array_shift($termsResults);
if ($first !== null &&
    $first instanceof Solarium_Result_Suggester_Term
) {
    $suggestions = $first->getSuggestions();
}

//prepend words to suggestions if the case
if (count($suggestions) && count($prepend)) {
    $prefix = implode(' ', $prepend);
    foreach ($suggestions as $key => $suggestion) {
        $suggestions[$key] = $prefix . ' ' . $suggestion;
    }
}

//$suggestions contains all suggestions ready to be displayed
