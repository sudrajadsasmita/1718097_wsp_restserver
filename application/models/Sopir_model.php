<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 * Model Sopir_model
 *
 * This Model for ...
 * 
 * @package		CodeIgniter
 * @category	Model
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Sopir_model extends CI_Model
{

  // ------------------------------------------------------------------------

  public function __construct()
  {
    parent::__construct();
  }

  // ------------------------------------------------------------------------


  // ------------------------------------------------------------------------
  public function get($id = null, $limit = 5, $offset = 0)
  {
    if ($id === null) {
      return $this->db->get('tb_sopir', $limit, $offset)->result();
    } else {
      return $this->db->get_where('tb_sopir', ['id_sopir' => $id])->result_array();
    }
  }

  public function count()
  {
    return $this->db->get('tb_sopir')->num_rows();
  }
  public function add($data)
  {
    try {
      $this->db->insert('tb_sopir', $data);
      $error = $this->db->error();
      if (!empty($error['code'])) {
        throw new Exception('Terjadi Kesalahan: ' . $error['message']);
        return false;
      }
      return ['status' => true, 'data' => $this->db->affected_rows()];
    } catch (Exception $ex) {
      return ['status' => false, 'msg' => $ex->getMessage()];
    }
  }

  public function update($id, $data)
  {
    try {
      $this->db->update('tb_sopir', $data, ['id_sopir' => $id]);
      $error = $this->db->error();
      if (!empty($error['code'])) {
        throw new Exception('Terjadi Kesalahan: ' . $error['message']);
        return false;
      }
      return ['status' => true, 'data' => $this->db->affected_rows()];
    } catch (Exception $ex) {
      return ['status' => false, 'msg' => $ex->getMessage()];
    }
  }
  public function delete($id)
  {
    try {
      $this->db->delete('tb_sopir', ['id_sopir' => $id]);
      $error = $this->db->error();
      if (!empty($error['code'])) {
        throw new Exception('Terjadi Kesalahan: ' . $error['message']);
        return false;
      }
      return ['status' => true, 'data' => $this->db->affected_rows()];
    } catch (Exception $ex) {
      return ['status' => false, 'msg' => $ex->getMessage()];
    }
  }

  // ------------------------------------------------------------------------

}

/* End of file Sopir_model.php */
/* Location: ./application/models/Sopir_model.php */