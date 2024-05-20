<?php

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
  $id_files = $_POST["id_files"];
  $id_pkbm = $_POST["id_pkbm"];
  $keterangan = $_POST["keterangan"];
  $target_dir = "rapor/";
  $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
  $uploadOk = 1;
  $fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

  $sql = "DELETE FROM files where id=$id_files";

  if ($koneksi->query($sql) === TRUE) {
    echo "<script>alert('Data berhasil dihapus'); document.location='index.php?view=ijazah';</script>";
  } else {
    echo "Error: " . $sql . "<br>" . $koneksi->error;
  }
}


?>
<div class="col-xs-12">
  <div class="box">
    <div class="box-header">
      <h3 class="box-title">Data Ijazah Warga Belajar</h3>

    </div><!-- /.box-header -->
    <div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
          <tr>
            <th style='width:30px'>No</th>
            <th>NISN</th>
            <th>Nama Lengkap</th>
            <th>Kejar Paket</th>
            <th>Tahun Akademik</th>
            <th>Dokumentasi Ijazah</th>
            <?php
            if ($_SESSION[level] == "guru") {
            ?>
              <th style='width:70px'>Action</th>

            <?php
            } ?>
          </tr>
        </thead>
        <tbody>
          <?php
          if ($_SESSION[level] == "guru") {
            $tampil = mysqli_query($koneksi, "SELECT siswa.*, files.id AS files_id, files.name, kelas_pkbm.nama_paket, tahun_akademik.nama_tahun  FROM siswa 
          LEFT JOIN kelas_pkbm ON siswa.id_paket = kelas_pkbm.id_paket LEFT JOIN tahun_akademik ON siswa.id_tahun_akademik = tahun_akademik.id_tahun_akademik
          LEFT JOIN files ON siswa.id_siswa = files.id_siswa WHERE pkbm = '$_SESSION[id]' ORDER BY siswa.id_siswa DESC");
          } else {
            $tampil = mysqli_query($koneksi, "SELECT siswa.*, files.id AS files_id, files.name, kelas_pkbm.nama_paket, tahun_akademik.nama_tahun  FROM siswa 
          LEFT JOIN kelas_pkbm ON siswa.id_paket = kelas_pkbm.id_paket LEFT JOIN tahun_akademik ON siswa.id_tahun_akademik = tahun_akademik.id_tahun_akademik
          LEFT JOIN files ON siswa.id_siswa = files.id_siswa");
          }

          $no = 1;
          while ($r = mysqli_fetch_array($tampil)) { ?>
            <tr>
              <td><?php echo $no ?></td>
              <td><?php echo $r[nisn] ?></td>
              <td><?php echo $r[nama] ?></td>
              <td><?php echo $r[nama_paket] ?></td>
              <td><?php echo $r[nama_tahun] ?></td>
              <td>
                <?php
                if (!empty($r[name])) {
                ?>
                  <center>
                    <a class='btn btn-warning btn-xs' title='Edit Data' href='uploads/<?php echo $r[name] ?>'><span class='glyphicon glyphicon-print'></span> Download Ijazah</a>
                  </center><?php
                          } else {
                            ?>
                  <center>
                    <?php
                            if ($_SESSION[level] == "guru") {
                    ?>
                      <a class='btn btn-info btn-xs' title='Edit Data' href='?view=addijazah&id=<?php echo $r[id_siswa] ?>'><span class='glyphicon glyphicon-plus'></span> Tambah Ijazah</a>
                    <?php
                            } else {
                    ?>
                      <a class='btn btn-danger btn-xs' title='Edit Data' href='#'> Belum Ada Ijazah</a>
                    <?php
                            }
                    ?>
                  </center><?php
                          }
                            ?>

              </td>
              <?php
              if ($_SESSION[level] == "guru") {
              ?>
                <td>
                  <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#hapusijazah<?php echo $r[files_id] ?>">
                    <span class='glyphicon glyphicon-remove'></span>Hapus Ijazah
                  </button>
                  <div class="modal fade" id="hapusijazah<?php echo $r[files_id] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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


                            <input type='hidden' name='id_files' value='<?php echo $r[files_id] ?>'>
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
                  <!-- <center>
                 <a class='btn btn-success btn-xs' title='Edit Data' href='?view=admin&act=edit&id=$r[id_user]'><span class='glyphicon glyphicon-pencil'></span></a>
                  <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=admin&hapus=$r[id_user]'><span class='glyphicon glyphicon-remove'></span></a>

                </center> -->
                </td>

              <?php
              }
              ?>


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
    </div><!-- /.box-body -->
  </div><!-- /.box -->
</div>