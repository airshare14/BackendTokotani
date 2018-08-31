<?php
	
	require APPPATH . '/libraries/REST_Controller.php';
	use Restserver\Libraries\REST_Controller;
	
	class Supplier extends REST_Controller{
		public function s_get(){
		
		$id = $this->get('id');
		
		if(empty($id)){
			$hasil = $this->db->get('Supplier')->result();
			$this->response($hasil,REST_Controller::HTTP_OK);	
			
		}else{
			$this->db->where('idSupplier',$id);
			$hasil = $this->db->get('Supplier')->result();
			
			if(empty($hasil)){
				$this->response(['status','false'],REST_Controller::HTTP_NOT_FOUND);	
			
			}else{
				$this->response($hasil,REST_Controller::HTTP_OK);
			}
		}		
		}	
		public function index_post(){
			$data = array(
							'idSupplier' => $this->post('id'),
							'Nama_supplier' => $this->post('nama'),
							'No_telp' => $this->post('no'),
							'Alamat_supplier' => $this->post('alamat'),
						);
			$insert = $this->db->insert('Supplier',$data);
			if($insert){
				$this->response($data,REST_Controller::HTTP_OK);	
			}else{
				$this->response(['status','gagal'],REST_Controller::HTTP_NOT_FOUND);
			}
		}
		public function update_put(){
			$id=$this->put('id');
			$data = array(
							'idSupplier' => $this->post('id'),
							'Nama_supplier' => $this->post('nama'),
							'No_telp' => $this->post('no'),
							'Alamat_supplier' => $this->post('alamat'),
						);
			$this->db->where('idSupplier',$id);
			$update=$this->db->update('supplier',$data);
			
			if($update){
				$this->response($data,REST_Controller::HTTP_OK);	
			}else{
				$this->response(['status','gagal'],REST_Controller::HTTP_NOT_FOUND);
			}
			
		}
		public function hapus_delete(){
			$id=$this->get('id');
			$this->db->where('idSupplier',$id);
			$delete=$this->db->delete('supplier',$data);
			
			if($update){
				$this->response($data,REST_Controller::HTTP_OK);	
			}else{
				$this->response(['status','gagal'],REST_Controller::HTTP_NOT_FOUND);
			}
		}
	}
?>