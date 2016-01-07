<?php if (!defined('BASEPATH')) {exit('No direct script access allowed');}

class mhome extends CI_Model{
	function __construct(){
		parent::__construct();
		$this->auth = unserialize(base64_decode($this->session->userdata($this->config->item('user_data'))));
	}
	
	function getdata($type, $balikan="", $p1="", $p2="", $p3=""){
		switch($type){
			case "data_login":
				$sql = "
					SELECT *
					FROM tbl_user
					WHERE nama_user = '".$p1."'
				";
				//echo $sql;
			break;
			case "services":
				$sql = "
					SELECT *
					FROM tbl_services 
				";
			break;
			case "services_detail":
				$sql = "
					SELECT *
					FROM tbl_services 
					WHERE id = '".$p1."'
				";
			break;
			case "foto_services":
				$sql = "
					SELECT *
					FROM tbl_services_foto 
					WHERE tbl_services_id = '".$p1."'
				";
			break;
			case "berita_home":
				$sql = "
					SELECT *
					FROM tbl_berita
					ORDER BY id DESC
					LIMIT 0,3
				";
			break;
			case "berita_detail":
				$sql = "
					SELECT *
					FROM tbl_berita
					WHERE id = '".$p1."'
				";
			break;
			case "berita_lainnya":
				$sql = "
					SELECT *
					FROM tbl_berita
					WHERE id <> '".$p1."'
					ORDER BY id DESC
					LIMIT 0,3
				";
			break;
			case "gallery":
				$sql = " 
					SELECT A.*, B.lokasi 
					FROM tbl_gallery A 
					LEFT JOIN cl_lokasi B ON B.id = A.cl_lokasi_id
				";				
			break;
			case "testimony":
				$sql = " 
					SELECT A.*
					FROM tbl_testimony A 
				";				
			break;
			case "kota":
				$sql = "
					SELECT A.kota, A.id
					FROM cl_kota A 
				";
			break;
			case "lokasi":
				$sql = "
					SELECT A.lokasi, A.id
					FROM cl_lokasi A 
				";
			break;
			
		}
		
		if($balikan == 'json'){
			return $ci->mhome->result_query($sql,'json',$type);
		}elseif($balikan == 'row_array'){
			return $this->db->query($sql)->row_array();
		}elseif($balikan == 'result_array'){
			return $this->db->query($sql)->result_array();
		}
		
	}

}