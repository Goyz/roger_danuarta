<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$route['default_controller'] = "home";
$route['404_override'] = '';

$route['backend'] = "backend";
$route['login/backend'] = "backend";

$route['services'] = "home/getdisplay/services";
$route['news/(:any)'] = "home/getdisplay/news/$1";
/* End of file routes.php */
/* Location: ./application/config/routes.php */