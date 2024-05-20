<?php
$idtest = $_SESSION[id];
if ($_SESSION[level] == "guru") {
  $query = "SELECT * FROM guru where nip='$_SESSION[id]'";
} else {
  $query = "SELECT * FROM guru where nip='$_GET[id]'";
}

$result = mysqli_query($koneksi, $query);
if (!$result) {
  echo "Error: " . $query . "<br>" . mysqli_error($koneksi);
  exit();
}
while ($row = mysqli_fetch_assoc($result)) {
  $nama = $row['nama_guru'];
  $alamat = $row['alamat_jalan'];
  $telepon = $row['telepon'];
  $NPSN = $row['nip'];
  $SKpendirian = $row['sk_cpns'];
  $tglpendirian = $row['tanggal_cpns'];
  $sk_pengangkatan = $row['sk_pengangkatan'];
  $tmt_pengangkatan = $row['tmt_pengangkatan'];
}

?>

<div class='col-md-12'>
  <div class='box box-info'>
    <div class='box-header with-border'>
      <h3 class='box-title'>Data Identitas Sekolah <?php $idtest ?></h3>

    </div>
    <div class='box-body'>


      <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
        <div class='col-md-12'>
          <table class='table table-condensed table-bordered'>
            <tbody>
              <input type='hidden' name='id' value='<?php echo $_SESSION[id] ?>'>

              <tr>
                <th width='120px' scope='row'>Nama Sekolah</th>
                <td><input type='text' class='form-control' name='a' value='<?php echo $nama ?>'></td>
              </tr>
              <tr>
                <th scope='row'>Alamat Sekolah</th>
                <td><input type='text' class='form-control' name='d' value='<?php echo $alamat ?>'></td>
              </tr>
              <tr>
                <th scope='row'>No Telpon</th>
                <td><input type='text' class='form-control' name='f' value='<?php echo $telepon ?>'></td>
              </tr>
              <tr>
                <th scope='row'>SK Pendirian Sekolah</th>
                <td><input type='text' class='form-control' name='SKpendirian' value='<?php echo $SKpendirian ?>'></td>
              </tr>
              <tr>
                <th scope='row'>Tanggal SK Pendirian </th>
                <td><input type='date' class='form-control' name='tglpendirian' value='<?php echo $tglpendirian ?>'></td>
              </tr>
              <tr>
                <th scope='row'>SK Izin Operasional </th>
                <td><input type='text' class='form-control' name='sk_pengangkatan' value='<?php echo $sk_pengangkatan ?>'></td>
              </tr>
              <tr>
                <th scope='row'>Tanggal Izin Operasional</th>
                <td><input type='date' class='form-control' name='tmt_pengangkatan' value='<?php echo $tmt_pengangkatan ?>'></td>
              </tr>
            </tbody>
          </table>
        </div>
    </div>
    <?php
    if ($_SESSION[level] == "guru") {
    ?>
      <div class='box-footer'>
        <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
        <button type='submit' name='update' class='btn btn-info'>Update</button>
      </div><?php
          }
            ?>

    </form>
  </div>

  <?php
  if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $nama = $_POST['a'];
    $alamat = $_POST['d'];
    $telepon = $_POST['f'];
    $SKpendirian = $_POST['SKpendirian'];
    $tglpendirian = $_POST['tglpendirian'];
    $sk_pengangkatan = $_POST['sk_pengangkatan'];
    $tmt_pengangkatan = $_POST['tmt_pengangkatan'];

    $query1 = "UPDATE guru SET nama_guru='$nama', alamat_jalan='$alamat', telepon='$telepon', sk_cpns='$SKpendirian', tanggal_cpns='$tglpendirian', sk_pengangkatan='$sk_pengangkatan', tmt_pengangkatan='$tmt_pengangkatan' WHERE nip='$id'";
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