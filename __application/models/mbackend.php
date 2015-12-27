<?php if (!defined('BASEPATH')) {exit('No direct script access allowed');}

class mbackend extends CI_Model{
	function __construct(){
		parent::__construct();
		//$this->auth = unserialize(base64_decode($this->session->userdata('sipbbg-k3pr1')));
	}
	
	function getdata($type="", $p1="", $p2=""){
		$where = " WHERE 1=1 ";
		switch($type){
			case "tbl_berita":
				$sql = " SELECT * FROM tbl_berita";
				if($p1=='edit'){
					$sql .=" WHERE id=".$p2;
					return $this->result_query($sql,'row_array');
				}
			break;
			case "tbl_reservasi":
				$sql = " SELECT A.*,D.kota,B.lokasi,C.product_type FROM tbl_reservasi A
						LEFT JOIN cl_lokasi B ON A.cl_lokasi_id=B.id
						LEFT JOIN cl_product_type C ON A.cl_product_type=C.id
						LEFT JOIN cl_kota D ON B.cl_kota_id=D.id";
				if($p1=='edit'){
					$sql .=" WHERE id=".$p2;
					return $this->result_query($sql,'row_array');
				}
			break;
			case "tbl_product":
				$sql = " SELECT A.*,B.product_type FROM tbl_product A 
						LEFT JOIN cl_product_type B ON A.cl_product_type_id=B.id";
				if($p1=='edit'){
					$sql .=" WHERE A.id=".$p2;
					return $this->result_query($sql,'row_array');
				}
			break;
			case "tbl_services":
				$sql = " SELECT A.* FROM tbl_services A ";
						
				if($p1=='edit'){
					$sql .=" WHERE A.id=".$p2;
					return $this->result_query($sql,'row_array');
				}
			break;
			case "tbl_product_foto":
				$sql = " SELECT A.*
						FROM tbl_product_foto A 
						LEFT JOIN tbl_product B ON A.tbl_product_id=B.id ";
				if($p1=='edit'){
					$sql .=" WHERE A.id=".$p2;
					return $this->result_query($sql,'row_array');
				}
				if($p1=='get'){
					$sql .=" WHERE A.tbl_product_id=".$p2;
					return $this->result_query($sql);
				}
			break;
			case "tbl_services_foto":
				$sql = " SELECT A.*
						FROM tbl_services_foto A 
						LEFT JOIN tbl_services B ON A.tbl_services_id=B.id ";
				if($p1=='edit'){
					$sql .=" WHERE A.id=".$p2;
					return $this->result_query($sql,'row_array');
				}
				if($p1=='get'){
					$sql .=" WHERE A.tbl_services_id=".$p2;
					return $this->result_query($sql);
				}
			break;
			case "cl_product_type":
				$sql = "SELECT A.* FROM cl_product_type A ";
				//echo $sql;
				if($p1=='edit'){
					$sql .=" WHERE A.id=".$p2;
					return $this->result_query($sql,'row_array');
				}
				if($p1=='combo'){
					return $this->db->query($sql)->result_array();
				}
			break;
			
		}
		return $this->result_query($sql,'json');
	}
	
	function result_query($sql,$type=""){
		switch($type){
			case "json":
				$page = (integer) (($this->input->post('page')) ? $this->input->post('page') : "1");
				$limit = (integer) (($this->input->post('rows')) ? $this->input->post('rows') : "10");
				$count = $this->db->query($sql)->num_rows();
				
				if( $count >0 ) { $total_pages = ceil($count/$limit); } else { $total_pages = 0; } 
				if ($page > $total_pages) $page=$total_pages; 
				$start = $limit*$page - $limit; // do not put $limit*($page - 1)
				if($start<0) $start=0;
				  
				$sql = $sql . " LIMIT $start,$limit";
			
				$data=$this->db->query($sql)->result_array();  
						
				if($data){
				   $responce = new stdClass();
				   $responce->rows= $data;
				   $responce->total =$count;
				   return json_encode($responce);
				}else{ 
				   $responce = new stdClass();
				   $responce->rows = 0;
				   $responce->total = 0;
				   return json_encode($responce);
				} 
			break;
			case "row_obj":return $this->db->query($sql)->row();break;
			case "row_array":return $this->db->query($sql)->row_array();break;
			default:return $this->db->query($sql)->result_array();break;
		}
	}
	// GOYZ CROTZZZ
	function simpan_data($table,$data,$get_id=""){//$sts_crud --> STATUS NYEE INSERT, UPDATE, DELETE
		$this->db->trans_begin();
		$id=$this->input->post('id');
		$sts_crud=$this->input->post('sts_crud');
		unset($data['sts_crud']);
		//print_r($_POST);exit;
		switch ($table){
			case "tbl_product":
				$data['create_date']=date('Y-m-d H:i:s');
				$data['create_by']=$this->auth['nama_user'];
				if($sts_crud=='delete'){
					$path='__repository/product/';
					$this->hapus_foto('tbl_product_foto',$path,'tbl_product_id',$id,'file_foto');
				}
			break;
			case "tbl_services":
				$data['create_date']=date('Y-m-d H:i:s');
				$data['create_by']=$this->auth['nama_user'];
				if($sts_crud=='delete'){
					$path='__repository/services/';
					$this->hapus_foto('tbl_services_foto',$path,'tbl_services_id',$id,'file_foto');
				}
			break;
			case "tbl_berita":
				$data['create_date']=date('Y-m-d H:i:s');
				$data['create_by']=$this->auth['nama_user'];
			break;
			
		}
		//print_r($data);exit;
		switch ($sts_crud){
			case "add":
				$this->db->insert($table,$data);
				$id=$this->db->insert_id();
			break;
			case "edit":
				$this->db->where('id',$id);
				$this->db->update($table,$data);
			break;
			case "delete":
				//unset($data);
				$this->db->where('id',$id);
				$this->db->delete($table);
			break;
		}
		//echo $this->db->last_query();exit;
		
		if($this->db->trans_status() == false){
			$this->db->trans_rollback();
			return 0;
		} else{
			if($get_id=='get_id'){
				$this->db->trans_commit();
				return $id;
			}else{
				return $this->db->trans_commit();
			}
		}
		
	}
	
	
	function konversi_bulan($bln){
		switch($bln){
			case 1:$bulan='Januari';break;
			case 2:$bulan='Februari';break;
			case 3:$bulan='Maret';break;
			case 4:$bulan='April';break;
			case 5:$bulan='Mei';break;
			case 6:$bulan='Juni';break;
			case 7:$bulan='Juli';break;
			case 8:$bulan='Agustus';break;
			case 9:$bulan='September';break;
			case 10:$bulan='Oktober';break;
			case 11:$bulan='November';break;
			case 12:$bulan='Desember';break;
		}
		return $bulan;
	}
	function hapus_foto($tabel,$path,$field_id_header,$id_header,$field_foto_db){
		/*switch($table){
			case "tbl_product_foto":
			
			break;
		}*/
		$ex_foto=$this->mbackend->getdata($tabel,'get',$id_header);
		foreach($ex_foto as $v){
			if(file_exists($path.$v[$field_foto_db])){
				chmod($path.$v[$field_foto_db],0777);
				unlink($path.$v[$field_foto_db]);
			}
		}
		$this->db->where($field_id_header,$id_header);
		$this->db->delete($tabel);
	}
	
	// END GOYZ CROTZZZ
	
}