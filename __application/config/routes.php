<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$route['default_controller'] = "home";
$route['en'] = "home/en";
$route['404_override'] = '';

$route['backend'] = "backend";
$route['login/backend'] = "backend";

$route['services'] = "home/getdisplay/services";
$route['product/(:any)'] = "home/getdisplay/product/$1";
$route['product-detail'] = "home/getdisplay/product_detail";
$route['news/(:any)'] = "home/getdisplay/news/$1";

$route['submit-reservasi'] = "backend/simpan_data/tbl_reservasi_frontend";
$route['lihat-lokasi'] = "home/getdisplay/lihat_lokasi";

$route['submit-subscriber'] = "backend/simpan_data/newsletter_frontend";
//$route['foto/(:any)/(:any)'] = "home/getdisplay/foto_detail/$1/$2";

/* End of file routes.php */
/* Location: ./application/config/routes.php */