<?php

require APPPATH . "/libraries/REST_Controller.php";

use Restserver\Libraries\REST_Controller;

class Tokotani extends REST_Controller
{
	public function __construct()
    {
        parent::__construct();
				$this->load->helper(array( 'url'));

				header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if ($method == "OPTIONS") {
            die();
        }
    }

	public function masuk_post()
	{
		// $where=array('returned'.$this->post('email') );
		// $this->response($where);
		$email=$this->post("email");
		$pw=$this->post("pw");

		$masuk=$this->db->query("select * from pengguna where email='$email' and password='$pw'")->result();

		//$id= array('id_pengguna' => "no" );
		$id= "no";
		foreach ($masuk as $key) {
			//$id= array('id_pengguna' => $key->id_pengguna) ;
			$id= $key->id_pengguna ;

		}

		$gagal = array('status' => 'no' );

		if($masuk){
			$this->session->set_userdata("id_pengguna",$id);
			$this->session->userdata("id_pengguna");

			//$id_p= array('id_pengguna' => $this->session->userdata("id_pengguna")) ;

			$this->response($masuk,REST_Controller::HTTP_OK);

			//$this->response($id_p,REST_Controller::HTTP_OK);
		}else{

			$this->response([$gagal],REST_Controller::HTTP_NOT_FOUND);
			//$this->response($gagal);
		}

	}

	public function tampilPenjualan_get()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$tampil=$this->db->query("select * from penjualan where id_pengguna= $id_p ")->result();

			if($tampil){
				$this->response($tampil,REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}

	public function coba_post()
	{
		//$config['upload_path']          = base_url()."images";
		$config['upload_path']          = './images/';
            $config['allowed_types']        = 'gif|jpg|png';
            $config['max_size']             = 100;
            $config['max_width']            = 1024;
            $config['max_height']           = 768;

            $this->load->library('upload', $config);

            //$this->upload->do_upload('foto1');
                if ( ! $this->upload->do_upload('foto1'))
                {
                        $error = array('error' => $this->upload->display_errors());
                        var_dump($error);
                        //$this->load->view('upload_form', $error);
                }
                else
                {
                        $data = array('upload_data' => $this->upload->data());
                        var_dump($data);
                        //$this->load->view('upload_success', $data);
                }
            echo $foto1	= $this->upload->data('file_name');
	}

	public function tambahPenjualan_post()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$jp=$this->post("judul_produk");
			$kat=$this->post("kategori");
			$satuan=$this->post("satuan");
			$min_pembelian=$this->post("minimal_pembelian");
			$jml_stok=$this->post("jumlah_stok");
			$min_hrg=$this->post("harga_minimal");
			$max_hrg=$this->post("harga_maksimal");
			$trans=$this->post("transportasi");
			$des=$this->post("deskripsi");

			$config['upload_path']          = base_url()."images";
            $config['allowed_types']        = 'gif|jpg|png';
            $config['max_size']             = 100;
            $config['max_width']            = 1024;
            $config['max_height']           = 768;

            $this->load->library('upload', $config);

            //$this->upload->do_upload('foto1');
                /*if ( ! $this->upload->do_upload('foto1'))
                {
                        $error = array('error' => $this->upload->display_errors());
                        var_dump($error);
                        //$this->load->view('upload_form', $error);
                }
                else
                {
                        $data = array('upload_data' => $this->upload->data());
                        var_dump($data);
                        //$this->load->view('upload_success', $data);
                }
            echo $foto1	= $this->upload->data('file_name');
			*/
			$foto1=$this->post("foto1");
			$foto2=$this->post("foto2");
			$foto3=$this->post("foto3");
			$foto4=$this->post("foto4");

			$isi=$this->db->query("INSERT INTO `penjualan`(`id_penjualan`, `id_pengguna`, `judul_produk`, `kategori`, `satuan`, `minimal_pembelian`, `jumlah_stok`, `harga_minimal`, `harga_maksimal`, `transportasi`, `deskripsi`, `foto1`, `foto2`, `foto3`, `foto4`) VALUES (null,$id_p,'$jp','$kat','$satuan',$min_pembelian,$jml_stok,$min_hrg,$max_hrg,'$trans','$des','$foto1','$foto2','$foto3','$foto4')");

			if($isi){
				$sta=array('status'=>"true");
				$this->response([$sta],REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}
	public function hapusPenjualan_get()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$id_penjualan=$this->get("id_penjualan");

			$hapus=$this->db->query("DELETE FROM `penjualan` WHERE id_penjualan=$id_penjualan");

			if($hapus){
				$sta=array('status'=>"true");
				$this->response([$sta],REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}

	public function tampilMitraPetani_get()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$tampil=$this->db->query("select * from mitra_petani where id_pengguna= $id_p ")->result();

			if($tampil){
				$this->response($tampil,REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}
	public function tambahMitraPetani_post()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$nama=$this->post("nama");
			$kota=$this->post("kota");
			$no_telp=$this->post("no_telp");
			$alamat=$this->post("alamat");
			$min_kuantiti=$this->post("min_kuantiti");
			$maks_kuantiti=$this->post("maks_kuantiti");
			$harga=$this->post("harga");

			$isi=$this->db->query("INSERT INTO `mitra_petani`(`id_mitrapetani`, `id_pengguna`, `nama`, `kota`, `no_telp`, `alamat`, `min_kuantiti`, `maks_kuantiti`, `harga`) VALUES (null,$id_p,'$nama','$kota','$no_telp','$alamat',$min_kuantiti,$maks_kuantiti,$harga)");

			if($isi){
				$sta=array('status'=>"true");
				$this->response([$sta],REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}

	public function hapusMitraPetani_get()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$id_mitrapetani=$this->get("id_mitrapetani");

			$hapus=$this->db->query("DELETE FROM `mitra_petani` WHERE id_mitrapetani=$id_mitrapetani");

			if($hapus){
				$sta=array('status'=>"true");
				$this->response([$sta],REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}

	public function tampilMitraBerjejaring_get()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$tampil=$this->db->query("select * from mitra_berjejaring where id_pengguna= $id_p ")->result();

			if($tampil){
				$this->response($tampil,REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}

	public function tambahMitraBerjejaring_post()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$nama_mitra=$this->post("nama_mitra");
			$no_telp=$this->post("no_telp");
			$email=$this->post("email");
			$alamat=$this->post("alamat");
			$tempat_didirikan=$this->post("tempat_didirikan");
			$tanggal_didirikan=$this->post("tanggal_didirikan");
			$nomor_akta=$this->post("nomor_akta");
			$akta_perubahan_terakhir=$this->post("akta_perubahan_terakhir");
			$tanggal_perubahan_terakhir=$this->post("tanggal_perubahan_terakhir");

			$isi=$this->db->query("INSERT INTO `mitra_berjejaring`(`id_mitraberjejaring`, `id_pengguna`, `nama_mitra`, `no_telp`, `email`, `alamat`, `tempat_didirikan`, `tanggal_didirikan`, `nomor_akta`, `akta_perubahan_terakhir`, `tanggal_perubahan_terakhir`) VALUES (null,$id_p,'$nama_mitra','$no_telp','$email','$alamat','$tempat_didirikan','$tanggal_didirikan','$nomor_akta','$akta_perubahan_terakhir','$tanggal_perubahan_terakhir')");

			if($isi){
				$sta=array('status'=>"true");
				$this->response([$sta],REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}

	public function hapusMitraBerjejaring_get()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$id_mitraberjejaring=$this->get("id_mitraberjejaring");

			$hapus=$this->db->query("DELETE FROM `mitra_berjejaring` WHERE id_mitraberjejaring = $id_mitraberjejaring");

			if($hapus){
				$sta=array('status'=>"true");
				$this->response([$sta],REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}

	public function tampilTransaksiPenjualan_get()
	{
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$tampil=$this->db->query("SELECT a . * , c . * FROM  `transaksi_penjualan` AS a
			INNER JOIN  `penjualan` AS b ON a.id_penjualan = b.id_penjualan
			INNER JOIN  `pengguna` AS c ON b.id_pengguna = c.id_pengguna ")->result();

			if($tampil){
				$this->response($tampil,REST_Controller::HTTP_OK);
				//foreach ($masuk as $key->result()) {
				// 	echo $key->email;
				// }
			}else{
				$sta=array('status'=>"false");
				$this->response([$sta],REST_Controller::HTTP_NOT_FOUND);
			}
		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}

	}


	public function KonfirmasiPengiriman_get(){
		$id_p=$this->input->get_request_header('Authorization');

		if($id_p!=null){
			$id_tp=$this->get("id_tp");

			$update=$this->db->query("UPDATE `transaksi_penjualan` SET `status`=2 WHERE id_transPenjualan = $id_tp");

			if($update){
				$sta= array('status_trans' => "2") ;
				$this->response([$sta],REST_Controller::HTTP_OK);
			}else{
				$sta= array('status_trans' => "gagal") ;
				$this->response([$sta],REST_Controller::HTTP_OK);
			}

		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}
	}

	public function StatusPengiriman_get(){
		$id_p=$this->input->get_request_header('Authorization');

		if($id_p!=null){
			$id_tp=$this->get("id_tp");

			$update=$this->db->query("UPDATE `transaksi_penjualan` SET `status`=3 WHERE id_transPenjualan = $id_tp");

			if($update){
				$sta= array('status_trans' => "3") ;
				$this->response([$sta],REST_Controller::HTTP_OK);
			}else{
				$sta= array('status_trans' => "gagal") ;
				$this->response([$sta],REST_Controller::HTTP_OK);
			}

		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}
	}

	public function DaftarPenjualan_get(){
		$id_p=$this->input->get_request_header('Authorization');

		if($id_p!=null){
			$id_tp=$this->get("id_tp");

			$update=$this->db->query("UPDATE `transaksi_penjualan` SET `status`=4 WHERE id_transPenjualan = $id_tp");

			if($update){
				$sta= array('status_trans' => "4") ;
				$this->response([$sta],REST_Controller::HTTP_OK);
			}else{
				$sta= array('status_trans' => "gagal") ;
				$this->response([$sta],REST_Controller::HTTP_OK);
			}

		}else{
			$sta= array('status' => "no") ;
			$this->response([$sta],REST_Controller::HTTP_OK);
		}
	}

	public function NomorPengiriman_post() {
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$nomor_pengiriman=$this->post("nomor_pengiriman");


			$isi=
			$this
			->db
			->query("INSERT INTO `konfirmasipengiriman`( `id_pengiriman`, `id_pengguna`, `nomor_pengiriman`) VALUES (null,$id_p,'$nomor_pengiriman')");

			if($isi) {
				$this->response('OK',REST_Controller::HTTP_OK);
			} else {
				$this->response('NO',REST_Controller::HTTP_NOT_FOUND);
			}
		} else {
			$this->response('NO',REST_Controller::HTTP_NOT_FOUND);
		}
	}

	public function hubungiKami_post() {
		$id_p=$this->input->get_request_header('Authorization');
		if($id_p!=null){
			$judul=$this->post("judul_pertanyaan");
			$kategori=$this->post("kategori");
			$deskripsi=$this->post("deskripsi");
			$foto=$this->post("foto");

			$isi=
			$this
			->db
			->query("INSERT INTO `hubungi_kami`(`id`, `id_pengguna`, `judul_pertanyaan`, `kategori`, `deskripsi`, `foto`) VALUES (null,$id_p,'$judul','$kategori','$deskripsi','$foto')");

			if($isi) {
				$this->response('OK',REST_Controller::HTTP_OK);
			} else {
				$this->response('NO',REST_Controller::HTTP_NOT_FOUND);
			}
		} else {
			$this->response('NO',REST_Controller::HTTP_NOT_FOUND);
		}
	}

	public function s_get()
	{
		$id=$this->get("id");

		if(empty($id)){
		$hasil=$this->db->get("tbl_pelanggan")->result();
		$this->response($hasil,REST_Controller::HTTP_OK);
		}
		else{
		$this->db->where("id",$id);
		$hasil=$this->db->get("pengguna")->result();
		}

		if(empty($hasil)){
			$this->response(["status","false"],REST_Controller::HTTP_NOT_FOUND);
		}else{
			$this->response($hasil,REST_Controller::HTTP_OK);
		}

	}

	public function keluar_get(){
		//session_destroy();
		$this->session->sess_destroy();

		$sta= array('status' => "no") ;
		$this->response([$sta],REST_Controller::HTTP_OK);
	}

}

?>
