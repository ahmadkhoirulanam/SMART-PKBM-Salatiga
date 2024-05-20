<?php
$id = $_SESSION[id];

// Proses unggah file jika form dikirim
if (isset($_POST["submit"])) {
  $id_siswa = $_POST["id_siswa"];
  $id_pkbm = $_POST["id_pkbm"];
  $keterangan = $_POST["keterangan"];
  $nama_paket = $_POST["nama_paket"];

  $sql = "INSERT INTO kelas_pkbm (nama_paket, keterangan, id_pkbm) VALUES ('$nama_paket', '$keterangan', '$id_pkbm')";
  if ($koneksi->query($sql) === TRUE) {
    echo "<script>alert('Data berhasil ditambah'); document.location='index.php?view=paket';</script>";
  } else {
    echo "Error: " . $sql . "<br>" . $koneksi->error;
  }
} else if (isset($_POST["edit"])) {
  $id_paket = $_POST["id_paket"];
  $name = $_POST["nama_paket"];
  $id_pkbm = $_POST["id_pkbm"];
  $keterangan = $_POST["keterangan"];
  $sql = "UPDATE kelas_pkbm SET nama_paket='$name', keterangan='$keterangan' WHERE id_paket='$id_paket'";


  if ($koneksi->query($sql) === TRUE) {
    echo "<script>alert('Data berhasil dirubah'); document.location='index.php?view=paket';</script>";
  } else {
    echo "Error: " . $sql . "<br>" . $koneksi->error;
  }
} else if (isset($_POST["hapus"])) {
  $id_paket = $_POST["id_paket"];
  $id_pkbm = $_POST["id_pkbm"];
  $keterangan = $_POST["keterangan"];

  $sql = "DELETE FROM kelas_pkbm where id_paket='$id_paket'";

  if ($koneksi->query($sql) === TRUE) {
    echo "<script>alert('Data berhasil dihapus'); document.location='index.php?view=paket';</script>";
  } else {
    echo "Error: " . $sql . "<br>" . $koneksi->error;
  }
}


?>

<!DOCTYPE html>
<html>

<head>
  <title>Unggah File PDF</title>
</head>

<body>
  <div class='col-md-12'>
    <div class='box box-info'>
      <div class='box-header with-border'>
        <h3 class='box-title'>Daftar Kejar Paket</h3>
        <!-- <a class='pull-right btn btn-primary btn-sm' href='index.php?view=tambahwargabelajar'>Tambahkan Rapor Warga Belajar</a> -->
        <button type="button" class="pull-right btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">
          Tambah Kejar Paket
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                  <div class='col-md-12'>
                    <table class='table table-condensed table-bordered'>
                      <tbody>
                        <input type='hidden' name='id_siswa' value='<?php echo $id ?>'>
                        <input type='hidden' name='id_pkbm' value='<?php echo $_SESSION[id] ?>'>

                        <tr>
                          <th width='120px' scope='row'>nama_paket</th>
                          <td><input type='text' class='form-control' name='nama_paket' value=''></td>
                        </tr>
                        <tr>
                          <th width='120px' scope='row'>Keterangan</th>
                          <td><input type='text' class='form-control' name='keterangan' value=''></td>
                        </tr>

                      </tbody>
                    </table>
                  </div>
              </div>
              <div class='box-footer'>
                <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                <button type='submit' value="Unggah PDF" name="submit" class='btn btn-info mr-3'>Tambah</button>
              </div>
              </form>

            </div>
          </div>
        </div>
      </div>
      <div class="box-body">
        <table id="example1" class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>No</th>
              <th>nama Kejar Paket</th>
              <th>Keterangan</th>
              <th style='width:18%'>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
            $tampil = mysqli_query($koneksi, "SELECT * FROM kelas_pkbm WHERE id_pkbm = '$id' ORDER BY nama_paket");
            $no = 1;
            while ($r = mysqli_fetch_array($tampil)) { ?>
              <tr>
                <td><?php echo $no ?></td>
                <td><?php echo $r[nama_paket] ?></td>
                <td><?php echo $r[keterangan] ?></td>
                <td>
                    <a class='btn btn-info btn-xs' title='Edit Data' href='?view=siswa_paket&id=<?php echo $r[id_paket] ?>'><span class='glyphicon glyphicon-eye-open'></span> Lihat Siswa</a>
                    <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#editrapor<?php echo $r[id_paket] ?>">
                      <span class='glyphicon glyphicon-pencil'></span>
                    </button>
                    <div class="modal fade" id="editrapor<?php echo $r[id_paket] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h4 class="modal-title" id="exampleModalLabel">Edit Kejar Paket</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                              <div class='col-md-12'>
                                <table class='table table-condensed table-bordered'>
                                  <tbody>
                                    <input type='hidden' name='id_paket' value='<?php echo $r[id_paket] ?>'>
                                    <input type='hidden' name='id_pkbm' value='<?php echo $_SESSION[id] ?>'>
                                    <tr>
                                      <th>Nama Kejar Paket</th>
                                      <td><input type='text' class='form-control' name='nama_paket' value='<?php echo $r[nama_paket] ?>'></td>
                                    </tr>
                                    <tr>
                                      <th>Keterangan</th>
                                      <td><input type='text' class='form-control' name='keterangan' value='<?php echo $r[keterangan] ?>'></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                          </div>

                          <div class='modal-footer'>
                            <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                            <button type='submit' value="Unggah PDF" name="edit" class='btn btn-success'>Edit</button>
                          </div>
                          </form>

                        </div>
                      </div>
                    </div>
                    <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#hapusrapor<?php echo $r[id_paket] ?>">
                      <span class='glyphicon glyphicon-remove'></span>
                    </button>
                    <div class="modal fade" id="hapusrapor<?php echo $r[id_paket] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h4 class="modal-title" id="exampleModalLabel">Hapus Rapor</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>


                              <input type='hidden' name='id_paket' value='<?php echo $r[id_paket] ?>'>
                              <input type='hidden' name='id_pkbm' value='<?php echo $_SESSION[id] ?>'>
                              <h4>Apakah Anda yakin menghapus?</h4>

                          </div>
                          <div class='box-footer'>
                            <a href='#'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                            <button type='submit' value="" name="hapus" class='btn btn-info'>Hapus</button>
                          </div>
                          </form>

                        </div>
                      </div>
                    </div>
                </td>
              </tr>


            <?php $no++;
            }
            if (isset($_GET[hapus])) {
              mysqli_query($koneksi, "DELETE FROM users where id_user='$_GET[hapus]'");
              echo "<script>document.location='index.php?view=admin';</script>";
            }

            ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>

</body>

</html>