<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class backend extends CI_Controller {

	function __construct(){
        parent::__construct();
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		header("If-Modified-Since: Mon, 22 Jan 2008 00:00:00 GMT");
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Cache-Control: private");
		header("Pragma: no-cache");
		$this->auth = unserialize(base64_decode($this->session->userdata($this->config->item('user_data'))));
		$this->host	= $this->config->item('base_url');
		$this->smarty->assign('host',$this->host);
		$this->smarty->assign('auth', $this->auth);
		$this->load->model('mbackend');
		$this->load->library('lib');
	}

	public function index(){
		if(!$this->auth){
			if($this->session->flashdata('error')){
				$this->smarty->assign("error", $this->session->flashdata('error'));
			}
			$this->smarty->display('main-login.html');
		}else{
			$this->smarty->display('main-backend.html');
		}
	}
	
	function modul($p1,$p2){
		if($this->auth){
			$this->smarty->assign("main", $p1);
			$this->smarty->assign("mod", $p2);
			$temp='template/'.$p2.'.html';
			if(!file_exists($this->config->item('appl').APPPATH.'views/'.$temp)){$this->smarty->display('konstruksi.html');}
			else{$this->smarty->display($temp);}
			
		}
	}
	
	function get_form($p1,$p2){
			//echo $_SERVER['DOCUMENT_ROOT'];
			$sts_crud=$this->input->post('editstatus');
			$this->smarty->assign("sts_crud", $sts_crud);
			switch($p1){
				case "product":
					$type=$data=$this->mbackend->getdata('cl_product_type','combo');
					$this->smarty->assign("type", $type);
				break;
				case "berita":
					if($sts_crud=='edit'){
						$data=$this->mbackend->getdata('tbl_'.$p1,'edit',$this->input->post('id'));
						$this->smarty->assign("data", $data);
					}
				break;
				case "services":
					if($sts_crud=='edit'){
						$data_foto = $this->mbackend->getdata('tbl_services_foto','edit',$this->input->post('id'));
						$this->smarty->assign("data_foto", $data_foto);
					}
				break;
				case "gallery":
					$kota = $data=$this->mbackend->getdata('cl_kota','combo');
					$this->smarty->assign("kota", $kota);
				break;
				
			}
			
			
			if($sts_crud=='edit'){
				$data=$this->mbackend->getdata('tbl_'.$p1,'edit',$this->input->post('id'));
				$this->smarty->assign("data", $data);
			}
			$this->smarty->assign("main", $p1);
			$this->smarty->assign("mod", $p2);
			$temp=$p1.'/'.$p2.'.html';
			if(!file_exists($this->config->item('appl').APPPATH.'views/'.$temp)){$this->smarty->display('konstruksi.html');}
			else{$this->smarty->display($temp);}
		
	}
	
	function getdata($p1){
		echo $this->mbackend->getdata($p1);
	}
	
	function simpan_data($p1){
		$post = array();
		
        foreach($_POST as $k=>$v){
			if($this->input->post($k)!=""){
				//$post[$k] = $this->db->escape_str($this->input->post($k));
				$post[$k] = $this->input->post($k);
			}
			
		}
		
		if(isset($post['upload_na'])){
			if(isset($post['upload_na']))unset($post['upload_na']);
			if(isset($post['modul_detil']))unset($post['modul_detil']);
			$id_header=$this->mbackend->simpan_data($p1, $post,'get_id');
			
			unset($_FILES['file_icon_foto_services']);
			
			echo $this->upload($this->input->post('modul_detil'), $id_header, $post);
		}else{
			echo $this->mbackend->simpan_data($p1, $post);
		}
	}
	
	function upload($modul, $id_header, $postnya=""){
		$upload=new lib();
		//print_r ($upload->uploadmultiplenong('__repository/product/'));exit;
		$path='__repository/'.$this->input->post('upload_na').'/';
		$file_name=$upload->uploadmultiplenong($path);
		$sts=1;
		if(count($file_name)>0){
			foreach($file_name as $x){
				switch($modul){
					case "tbl_product_foto":
						$post=array('tbl_product_id'=>$id_header,
									'file_foto'=>$x,
									'flag'=>1
						);
						if($this->input->post('sts_crud')=='edit'){
							$path='__repository/product/';
							$this->mbackend->hapus_foto('tbl_product_foto',$path,'tbl_product_id',$id_header,'file_foto');
							unset($_POST['sts_crud']);
							$_POST['sts_crud']='add';
						}
					break;
					case "tbl_services_foto":
						$post=array('tbl_services_id'=>$id_header,
									'file_foto'=>$x,
									'flag'=>1
						);
						if($this->input->post('sts_crud')=='edit'){
							$path='__repository/services/';
							//echo $id_header;exit;
							//$this->mbackend->hapus_foto('tbl_services_foto',$path,'tbl_services_id',$id_header,'file_foto');
							unset($_POST['sts_crud']);
							$_POST['sts_crud']='add';
						}
					break;
					case "tbl_gallery":
						$post = array(
							'cl_lokasi_id' => $postnya['cl_lokasi_id'],
							'file_foto'=> $x,
							'flag'=>1
						);
					break;
				}
				
				if($this->mbackend->simpan_data($modul, $post)){
					$sts = 1;
				}
			}
		}
		return $sts;
	}
	
	
	
}
