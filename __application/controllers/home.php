<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class home extends CI_Controller {

	function __construct(){
        parent::__construct();
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		header("If-Modified-Since: Mon, 22 Jan 2008 00:00:00 GMT");
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Cache-Control: private");
		header("Pragma: no-cache");
	//	$this->load->model('mfrontend');		
		$this->load->library('lib');
		$this->host	= $this->config->item('base_url');
		$this->smarty->assign('host',$this->host);
	}

	
	public function index(){
		$this->smarty->display('index-main.html');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */