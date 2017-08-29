<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

$route['default_controller'] = DEFAULT_CONTROLLER;
$route['404_override'] = '';

require_once( BASEPATH .'database/DB'. EXT );
$db =& DB();
$db->order_by('position','ASC');
$query = $db->get_where('app_routes',array('status'=>ACTIVE,'del_flag'=>DEACTIVE));
$result = $query->result();
//print_r($db->last_query());
//echo '<pre>'; print_r($result);echo '</pre>';die('');
//some overwrite

$route['^(en|vn)/tin-tuc/(:any)/(:any)']         = 'article/page/detail/$2/$3';
$route['^(en|vn)/tin-tuc/(:any)']         =     'article/page/category/$2';

foreach( $result as $row )
{
    $route['^(en|vn)'.$row->slug ]  = $row->controller;
//    $route[ $row->slug.'/:any' ]         = $row->controller;
//    $route['^(en|vn)'.$row->controller ] = 'error404';
//    $route[ $row->controller.'/:any' ]   = 'error404';
}



// URI like '/en/about' -> use controller 'about'
//$route['^(en|kr|vn)/(.+)$'] = "$2";
$route['^(en|vn|jp|cn|fr)/(.+)$'] = "$2";

// '/en', '/de', '/fr' and '/nl' URIs -> use default controller
//$route['^(en|kr|vn)$'] = $route['default_controller'];
$route['^(en|vn|jp|cn|fr)$'] = $route['default_controller'];


/* End of file routes.php */
/* Location: ./application/config/routes.php */