<?php
$id = $_GET['id'];

// Proses unggah file jika form dikirim
if (isset($_POST["submit"])) {
  $id_siswa = $_POST["id_siswa"];
  $id_pkbm = $_POST["id_pkbm"];
  $keterangan = $_POST["keterangan"];
  $target_dir = "rapor/";
  $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
  $uploadOk = 1;
  $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

  // Cek apakah file adalah file PDF
  if ($fileType != "pdf") {
    echo "Maaf, hanya file PDF yang diizinkan.";
    $uploadOk = 0;
  }

  // Cek apakah uploadOk diatur ke 0 karena error
  if ($uploadOk == 0) {
    echo "Maaf, file Anda tidak terunggah.";
    // Jika semua kondisi terpenuhi, coba unggah file
  } else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
      echo "File " . basename($_FILES["fileToUpload"]["name"]) . " berhasil diunggah.";

      // Masukkan informasi file ke database
      $name = basename($_FILES["fileToUpload"]["name"]);

      $mime_type = $_FILES["fileToUpload"]["type"];
      $size = $_FILES["fileToUpload"]["size"];

      $sql = "INSERT INTO rapor (name, mime_type, size, id_siswa, keterangan, id_pkbm) VALUES ('$name', '$mime_type', $size, $id_siswa, '$keterangan', '$id_pkbm')";
      if ($koneksi->query($sql) === TRUE) {
        echo "<script>alert('Data berhasil ditambah'); document.location='index.php?view=addrapor&id=$id';</script>";
      } else {
        echo "Error: " . $sql . "<br>" . $koneksi->error;
      }
    } else {
      echo "Maaf, terjadi kesalahan saat mengunggah file.";
    }
  }
} else if (isset($_POST["edit"])) {
  $id_rapor = $_POST["id_rapor"];
  $id_pkbm = $_POST["id_pkbm"];
  $keterangan = $_POST["keterangan"];
  $target_dir = "rapor/";
  $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
  $uploadOk = 1;
  $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

  // Cek apakah file adalah file PDF


  // Cek apakah uploadOk diatur ke 0 karena error
  if ($uploadOk == 0) {
    echo "Maaf, file Anda tidak terunggah.";
    // Jika semua kondisi terpenuhi, coba unggah file
  } else {

    if ($filename != '') {
      if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "File " . basename($_FILES["fileToUpload"]["name"]) . " berhasil diunggah.";

        // Masukkan informasi file ke database
        $name = basename($_FILES["fileToUpload"]["name"]);

        $mime_type = $_FILES["fileToUpload"]["type"];
        $size = $_FILES["fileToUpload"]["size"];
        $sql = "UPDATE rapor SET name='$name', keterangan='$keterangan' WHERE id='$id_rapor'";


        if ($koneksi->query($sql) === TRUE) {
          echo "<script>alert('Data berhasil dirubah'); document.location='index.php?view=addrapor&id=$id';</script>";
        } else {
          echo "Error: " . $sql . "<br>" . $koneksi->error;
        }
      } else {
        echo "Maaf, terjadi kesalahan saat mengunggah file.";
      }
    } else {
      $sql = "UPDATE rapor SET keterangan='$keterangan' WHERE id='$id_rapor'";


      if ($koneksi->query($sql) === TRUE) {
        echo "<script>alert('Data berhasil dirubah'); document.location='index.php?view=addrapor&id=$id';</script>";
      } else {
        echo "Error: " . $sql . "<br>" . $koneksi->error;
      }
    }
  }
} else if (isset($_POST["hapus"])) {
  $id_rapor = $_POST["id_rapor"];
  $id_pkbm = $_POST["id_pkbm"];
  $keterangan = $_POST["keterangan"];
  $target_dir = "rapor/";
  $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
  $uploadOk = 1;
  $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

  $sql = "DELETE FROM rapor where id=$id_rapor";

  if ($koneksi->query($sql) === TRUE) {
    echo "<script>alert('Data berhasil dihapus'); document.location='index.php?view=addrapor&id=$id';</script>";
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
        <h3 class='box-title'>Data Rapor Warga Belajar </h3>
        <!-- <a class='pull-right btn btn-primary btn-sm' href='index.php?view=tambahwargabelajar'>Tambahkan Rapor Warga Belajar</a> -->
        <button type="button" class="pull-right btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">
          Tambah Rapor Warga Belajar
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">Tambah Rapor</h4>
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
                          <th width='120px' scope='row'>Keterangan</th>
                          <td><input type='text' class='form-control' name='keterangan' value=''></td>
                        </tr>

                        <tr>
                          <th width='120px' scope='row'>File</th>
                          <td><input type="file" name="fileToUpload" id="fileToUpload"></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
              </div>
              <div class='modal-footer'>
                <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                <button type='submit' value="Unggah PDF" name="submit" class='btn btn-info'>Update</button>
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
              <th style='width:30px'>No</th>

              <th>Keterangan</th>
              <th>Dokumentasi Rapor</th>
              <th style='width:50px'>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
            $tampil = mysqli_query($koneksi, "SELECT * FROM rapor WHERE id_siswa = $id ORDER BY keterangan ASC");
            $no = 1;
            while ($r = mysqli_fetch_array($tampil)) { ?>
              <tr>
                <td><?php echo $no ?></td>

                <td><?php echo $r[keterangan] ?></td>
                <td>
                  <?php
                  if (!empty($r[name])) {
                  ?>

                    <a class='btn btn-warning btn-xs' title='Edit Data' href='rapor/<?php echo $r[name] ?>'><span class='glyphicon glyphicon-print'></span> Download Rapor</a>
                  <?php
                  } else {
                  ?>
                    <center>
                      <a class='btn btn-info btn-xs' title='Edit Data' href='?view=addrapor&id=<?php echo $r[id_siswa] ?>'><span class='glyphicon glyphicon-plus'></span> Tambah Ijazah</a>
                    </center><?php
                            }
                              ?>

                </td>
                <td>
                  <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#editrapor<?php echo $r[id] ?>">
                    <span class='glyphicon glyphicon-pencil'></span>
                  </button>
                  <div class="modal fade" id="editrapor<?php echo $r[id] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h4 class="modal-title" id="exampleModalLabel">Edit Rapor</h4>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                            <div class='col-md-12'>
                              <table class='table table-condensed table-bordered'>
                                <tbody>
                                  <input type='hidden' name='id_rapor' value='<?php echo $r[id] ?>'>
                                  <input type='hidden' name='id_pkbm' value='<?php echo $_SESSION[id] ?>'>
                                  <tr>
                                    <th width='120px' scope='row'>Keterangan</th>
                                    <td><input type='text' class='form-control' name='keterangan' value='<?php echo $r[keterangan] ?>'></td>
                                  </tr>

                                  <tr>
                                    <th width='120px' scope='row'>File</th>
                                    <td><input type="file" name="fileToUpload" value='<?php echo $r[name] ?>' id="fileToUpload"></td>
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
                  <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#hapusrapor<?php echo $r[id] ?>">
                    <span class='glyphicon glyphicon-remove'></span>
                  </button>
                  <div class="modal fade" id="hapusrapor<?php echo $r[id] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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


                            <input type='hidden' name='id_rapor' value='<?php echo $r[id] ?>'>
                            <input type='hidden' name='id_pkbm' value='<?php echo $_SESSION[id] ?>'>
                            <h4>Apakah Anda yakin menghapus rapor?</h4>

                        </div>
                        <div class='box-footer'>
                          <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                          <button type='submit' value="Unggah PDF" name="hapus" class='btn btn-info'>Hapus</button>
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