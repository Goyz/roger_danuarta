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
		$services = $this->mhome->getdata('services', 'result_array');
		$news = $this->mhome->getdata('berita_home', 'result_array');
		
		foreach($news as $k=>$v){
			$news[$k]['isi_pendek'] = $this->lib->cutstring($v['isi_berita_ind'], 500);
		}
		
		$this->smarty->assign('services', $services);
		$this->smarty->assign('news', $news);
		$this->smarty->display('index-main.html');
	}
	
	function getdisplay($type, $p1="", $p2=""){
		switch($type){
			case "services":
				$content = "services.html";
				$services = $this->mhome->getdata('services', 'result_array');
				
				$array = array();
				foreach($services as $k =>$v){
					$array[$k]['id'] = $v['id'];
					$array[$k]['nama_services'] = $v['nama_service_ind'];
					$array[$k]['desc_services'] = $v['deskripsi_ind'];
					$array[$k]['foto'] = $v['foto_icon'];
					$array[$k]['detail'] = array();
					$foto_services = $this->mhome->getdata('foto_services', 'result_array', $v['id']);
					foreach($foto_services as $t => $c){
						$array[$k]['detail'][$t]['foto_detail'] = $c['file_foto'];
					}
				}
				
				$this->smarty->assign('services', $services);
				$this->smarty->assign('data_detail', $array);
			break;
			case "news":
				$content = "news.html";
				$berita_detail = $this->mhome->getdata('berita_detail', 'row_array', $p1);
				$berita_lainnya = $this->mhome->getdata('berita_lainnya', 'result_array', $p1);
				
				$this->smarty->assign('berita_detail', $berita_detail);
				$this->smarty->assign('berita_lainnya', $berita_lainnya);
			break;
		}
		
		$this->smarty->display($content);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */