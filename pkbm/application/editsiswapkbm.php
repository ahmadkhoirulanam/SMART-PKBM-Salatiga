<?php
// Periksa apakah parameter 'id' telah disetel dalam URL
if(isset($_GET['id'])) {
  $id_siswa= $_GET['id'];
  $query = "SELECT * FROM siswa where id_siswa=$id_siswa";
  $result = mysqli_query($koneksi, $query);
  if (!$result) {
      echo "Error: " . $query . "<br>" . mysqli_error($koneksi);
     
      exit();
  }
  while ($row = mysqli_fetch_assoc($result)) {
      $namawarga = $row['nama'];;
      $alamat = $row['alamat'];
      $telepon = $row['telepon'];
      $pkbm = $row['pkbm'];
      
     
  }
} else {
    // Jika parameter 'id' tidak ada dalam URL
    echo "Parameter 'id' tidak ditemukan dalam URL.";
}
?>
<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Warga Belajar</h3>
                </div>
              <div class='box-body'>
             
              </form>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <input type='hidden' name='id' value='<?php echo $_GET['id']?>'>
                    <input type='hidden' name='pkbm' value='<?php echo $pkbm?>'>
                    <tr><th width='120px' scope='row'>Nama</th>           <td><input type='text' class='form-control' name='a' value='<?php echo $namawarga ?>'></td></tr>
                    <tr><th scope='row'>Alamat Sekolah</th>               <td><input type='text' class='form-control' name='d' value='<?php echo $alamat ?>'></td></tr>
                    <tr><th scope='row'>No Telpon</th>                    <td><input type='text' class='form-control' name='f' value='<?php echo $telepon ?>'></td></tr>
                    
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>                    
                    <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>                    
                  </div>
              </form>
            </div>

<?php
    if (isset($_POST['update'])) {
        $id = $_POST['id'];
        $nama = $_POST['a'];
        $alamat = $_POST['d'];
        $telepon = $_POST['f'];

        $query1 = "UPDATE siswa SET nama='$nama', alamat='$alamat', telepon='$telepon' WHERE id_siswa='$id_siswa'";
        $result1 = mysqli_query($koneksi, $query1);
        if (!$result1) {
          echo "Error: " . $query1 . "<br>" . mysqli_error($koneksi);
          exit();
      }

        if ($result) {
          echo "<script>alert('Data berhasil diperbarui'); document.location='index.php?view=identitas_pkbm';</script>";
        } else {
          echo "Gagal memperbarui data: " . mysqli_error($koneksi);
        }
    }  
?>
