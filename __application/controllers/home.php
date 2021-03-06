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
		$kota = $this->mhome->getdata('kota', 'result_array');
		$lokasi = $this->mhome->getdata('lokasi', 'result_array');
		//$gallery = $this->mhome->getdata('gallery', 'result_array');
		$testimony = $this->mhome->getdata('testimony', 'result_array');
		$banner = $this->mhome->getdata('banner', 'result_array');
		
		foreach($news as $k=>$v){
			$news[$k]['isi_pendek'] = $this->lib->cutstring( $v['isi_berita_ind'], 500);
		}
		
		foreach($services as $s => $y){
			$link = preg_replace('/[^A-Za-z0-9\-]/', '', $y['nama_service_ind']);
			$link = str_replace(' ', '-', $link);
			$services[$s]['linknya'] = strtolower($link);
		}
		
		$this->smarty->assign('services', $services);
		$this->smarty->assign('news', $news);
		$this->smarty->assign('kota', $kota);
		$this->smarty->assign('lokasi', $lokasi);
		//$this->smarty->assign('gallery', $gallery);
		$this->smarty->assign('testimony', $testimony);
		$this->smarty->assign('banner', $banner);
		$this->smarty->assign('lang', 'ind');
		
		$this->smarty->display('index-main.html');
	}
	
	function en($lang='en'){
		$services = $this->mhome->getdata('services', 'result_array');
		$news = $this->mhome->getdata('berita_home', 'result_array');
		$kota = $this->mhome->getdata('kota', 'result_array');
		$lokasi = $this->mhome->getdata('lokasi', 'result_array');
		$gallery = $this->mhome->getdata('gallery', 'result_array');
		$testimony = $this->mhome->getdata('testimony', 'result_array');
		$banner = $this->mhome->getdata('banner', 'result_array');
		
		foreach($news as $k=>$v){
			$news[$k]['isi_pendek'] = $this->lib->cutstring( $v['isi_berita_eng'] , 500);
		}
		
		foreach($services as $s => $y){
			$link = preg_replace('/[^A-Za-z0-9\-]/', '', $y['nama_service_eng']);
			$link = str_replace(' ', '-', $link);
			$services[$s]['linknya'] = strtolower($link);
		}
		
		$this->smarty->assign('services', $services);
		$this->smarty->assign('news', $news);
		$this->smarty->assign('kota', $kota);
		$this->smarty->assign('lokasi', $lokasi);
		$this->smarty->assign('gallery', $gallery);
		$this->smarty->assign('testimony', $testimony);		
		$this->smarty->assign('banner', $banner);		
		$this->smarty->assign('lang', 'en');
		
		$this->smarty->display('index-main-en.html');
	}
	
	function getdisplay($type, $p1="", $p2="", $p3=""){
		switch($type){
			case "services":
				$content = "services.html";
				$servicess = $this->mhome->getdata('services_detail', 'row_array', $p1);
				$foto_services = $this->mhome->getdata('foto_services', 'result_array', $p1);
				$lokasi = $this->mhome->getdata('lokasi', 'result_array');				
				$services = $this->mhome->getdata('services', 'result_array');				
				
				$this->smarty->assign('servicess', $servicess);
				$this->smarty->assign('foto_services', $foto_services);
				$this->smarty->assign('id', $p1);
				$this->smarty->assign('lang', $p2);
				$this->smarty->assign('linknya', $p3);
				$this->smarty->assign('lokasi', $lokasi);
				$this->smarty->assign('services', $services);				
			break;
			case "news":
				$content = "news.html";
				$lang = $p1;
				$berita_detail = $this->mhome->getdata('berita_detail', 'row_array', $p2);
				$berita_lainnya = $this->mhome->getdata('berita_lainnya', 'result_array', $p2);
				
				$this->smarty->assign('berita_detail', $berita_detail);
				$this->smarty->assign('berita_lainnya', $berita_lainnya);
				$this->smarty->assign('lang', $lang);
				$this->smarty->assign('id', $p2);
			break;
			case "gallery":
				$cl_lokasi = $this->input->post('idp');
				$gallery = $this->mhome->getdata('gallery', 'result_array', $cl_lokasi);
				$this->smarty->assign('gallery', $gallery);			
				
				$content = $this->smarty->fetch('gallery.html');
				$kembalian = array(
					'konten' => $content
				);
				echo json_encode($kembalian);
				exit;
			break;
			case "tutorial":
				$content = "tutorial.html";
				$tutor = $this->mhome->getdata('tutorial', 'result_array', $p1);
				$this->smarty->assign('tutor', $tutor);
			break;
			case "foto_detail":
				$path = $this->host."__repository/".$p1."/".$p2;
				echo "<img src='".$path."' />";
				exit;
			break;
			case "lihat_lokasi":
				$lang = $this->input->post('lang');
				$idnya = $this->input->post('valnya');
				$lokasi = $this->db->get_where('cl_lokasi', array('id'=>$idnya) )->row_array();
				if($lokasi){
					if($lang == 'ind'){
						$cetak = $lokasi['alamat_ind'];
					}else{
						$cetak = $lokasi['alamat_eng'];
					}
					
					$cetak .= "
						<br />
						Telp. : ".$lokasi['tlp']." <br />
						Fax.  : ".$lokasi['fax']." <br />
						Email : ".$lokasi['email']." <br />
					";
					$data=array('cetak'=>$cetak,'longi'=>($lokasi['longitude']!="" ? (float)$lokasi['longitude'] : (float)106.827115),'lat'=>($lokasi['latitude']!="" ? (float)$lokasi['latitude'] : (float)-6.176587));
					echo json_encode($data);
				}
				
				exit;
			break;
			case "product":
				$content = "product.html";
				$lang = $p1;
				$data_type = $this->db->get('cl_product_type')->result_array();
				if($data_type){
					$this->smarty->assign('data_type', $data_type);
					$this->smarty->assign('lang', $lang);
				}else{
					header("Location: ".$this->host."");
				}
			break;
			case "product_detail":
				$id = $this->input->post('idp');
				$lang = $this->input->post('lang');
				$data_header = $this->db->get_where('tbl_product', array('cl_product_type_id'=>$id) )->result_array();
				foreach($data_header as $s => $y){
					$link = preg_replace('/[^A-Za-z0-9\-]/', '', $y['nama_product_ind']);
					$link = str_replace(' ', '-', $link);
					$data_header[$s]['linknya'] = strtolower($link);
				}
				
				$this->smarty->assign('data_header', $data_header);
				$this->smarty->assign('lang', $lang);
				$content = $this->smarty->fetch('product-detail.html');
				
				$kembalian = array(
					'konten' => $content
				);
				echo json_encode($kembalian);
				exit;
			break;
			case "product_detail_2":
				$content = "product-detail-2.html";
				$lokasi = $this->mhome->getdata('lokasi', 'result_array');
				$services = $this->mhome->getdata('services', 'result_array');
				$data_header = $this->db->get_where('tbl_product', array('id'=>$p1) )->row_array();
				$data_detail = $this->db->get_where('tbl_product_foto', array('tbl_product_id'=>$p1) )->result_array();
				
				$this->smarty->assign('data_header', $data_header);
				$this->smarty->assign('data_detail', $data_detail);
				$this->smarty->assign('lokasi', $lokasi);
				$this->smarty->assign('services', $services);
				$this->smarty->assign('id', $p1);
				$this->smarty->assign('lang', $p2);
				$this->smarty->assign('linknya', $p3);
			break;
		}
		
		$this->smarty->display($content);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */