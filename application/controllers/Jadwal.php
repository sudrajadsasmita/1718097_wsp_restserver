<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Jadwal
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller REST
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

use chriskacerguis\RestServer\RestController;

class Jadwal extends RESTController
{

  public function __construct()
  {
    parent::__construct();
    $this->load->model('Jadwal_model', 'jd');
  }

  public function index_get()
  {
    $id = $this->get('id_jadwal_berangkat', true);
    if ($id === null) {
      $page = $this->get('page');
      $page = (empty($page) ? 1 : $page);
      $total_data = $this->jd->count();
      $total_page = ceil($total_data / 5);
      $start = ($page - 1) * 5;
      $list =  $this->jd->get(null, 5, $start);
      if ($list) {
        $data = [
          'status' => true,
          'page' => $page,
          'total data' => $total_data,
          'total page' => $total_page,
          'data' => $list
        ];
      } else {
        $data = [
          'status' => false,
          'msg' => 'Data Tidak di Temukan'
        ];
      }

      $this->response($data, RestController::HTTP_OK);
    } else {
      $data = $this->jd->get($id);
      if ($data) {
        $this->response([
          'status' => true,
          'data' => $data
        ], RestController::HTTP_OK);
      } else {
        $this->response([
          'status' => false,
          'msg' => $id . ' Data Tidak di Temukan'
        ], RestController::HTTP_NOT_FOUND);
      }
    }
  }
  public function index_post()
  {
    $data = [
      'armada_id' => $this->post('armada_id', true),
      'sopir_id' => $this->post('sopir_id', true),
      'berangkat_surabaya' => $this->post('berangkat_surabaya', true),
      'berangkat_solo' => $this->post('berangkat_solo', true),
      'berangkat_semarang' => $this->post('berangkat_semarang', true),
      'tiba_jakarta' => $this->post('tiba_jakarta', true)
    ];
    $simpan = $this->jd->add($data);
    if ($simpan['status']) {
      $this->response([
        'status' => true,
        'msg' => $simpan['data'] . ' Data Telah di tambahkan'
      ], RestController::HTTP_CREATED);
    } else {
      $this->response([
        'status' => false,
        'msg' => $simpan['msg']
      ], RestController::HTTP_INTERNAL_ERROR);
    }
  }
  public function index_put()
  {
    $data = [
      'armada_id' => $this->put('armada_id', true),
      'sopir_id' => $this->put('sopir_id', true),
      'berangkat_surabaya' => $this->put('berangkat_surabaya', true),
      'berangkat_solo' => $this->put('berangkat_solo', true),
      'berangkat_semarang' => $this->put('berangkat_semarang', true),
      'tiba_jakarta' => $this->put('tiba_jakarta', true)
    ];
    $id = $this->put('id_jadwal_berangkat');
    if ($id === null) {
      $this->response([
        'status' => false,
        'msg' => 'Masukkan Id_jadwal_berangkat'
      ], RestController::HTTP_BAD_REQUEST);
    }
    $simpan = $this->jd->update($id, $data);
    if ($simpan['status']) {
      $status = (int)$simpan['data'];
      if ($status > 0) {
        $this->response([
          'status' => true,
          'msg' => $simpan['data'] . ' Data Telah di Rubah'
        ], RestController::HTTP_OK);
      } else {
        $this->response([
          'status' => false,
          'msg' => 'Tidak ada data yang di rubah'
        ], RestController::HTTP_BAD_REQUEST);
      }
    } else {
      $this->response([
        'status' => false,
        'msg' => $simpan['msg']
      ], RestController::HTTP_INTERNAL_ERROR);
    }
  }
  public function index_delete()
  {
    $id = $this->delete('id_jadwal_berangkat', true);
    if ($id === null) {
      $this->response([
        'status' => false,
        'msg' => 'Masukkan Id_jadwal_berangkat'
      ], RestController::HTTP_BAD_REQUEST);
    }
    $delete = $this->jd->delete($id);
    if ($delete['status']) {
      $status = (int)$delete['data'];
      if ($status > 0) {
        $this->response([
          'status' => true,
          'msg' => $delete['data'] . ' Data Telah di Hapus'
        ], RestController::HTTP_OK);
      } else {
        $this->response([
          'status' => false,
          'msg' => 'Tidak ada data yang di hapus'
        ], RestController::HTTP_BAD_REQUEST);
      }
    } else {
      $this->response([
        'status' => false,
        'msg' => $delete['msg']
      ], RestController::HTTP_INTERNAL_ERROR);
    }
  }
}


/* End of file Jadwal_berangkat.php */
/* Location: ./application/controllers/Jadwal.php */