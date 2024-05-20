<?php
$id = $_GET['id'];
// Proses unggah file jika form dikirim
if (isset($_POST["submit"])) {

  $id_siswa = $_POST["id_siswa"];
  $id_pkbm = $_POST["id_pkbm"];
  $target_dir = "uploads/";
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
      $ijazah = $_POST['no'];
      $pengesahan = $_POST['pengesahan'];
      $mime_type = $_FILES["fileToUpload"]["type"];
      $size = $_FILES["fileToUpload"]["size"];
      $sql = "INSERT INTO files (name, mime_type, size, id_siswa, no_ijazah, pengesahan, id_pkbm) VALUES ('$name', '$mime_type', $size, $id_siswa, $ijazah, $pengesahan, '$id_pkbm')";
      if ($koneksi->query($sql) === TRUE) {
        echo "Informasi file berhasil dimasukkan ke database.";
        echo "<script>alert('Data berhasil ditambah'); document.location='index.php?view=ijazah';</script>";
      } else {
        echo "Error: " . $sql . "<br>" . $koneksi->error;
      }
    } else {
      echo "Maaf, terjadi kesalahan saat mengunggah file.";
    }
  }
}

$koneksi->close();
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
        <h3 class='box-title'>Data Ijazah Warga Belajar </h3>
      </div>
      <div class='box-body'>

        </form>
        <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
          <div class='col-md-12'>
            <table class='table table-condensed table-bordered'>
              <tbody>
                <input type='hidden' name='id_siswa' value='<?php echo $id ?>'>
                <input type='text' name='id_pkbm' value='<?php echo $_SESSION[id] ?>'>
                <tr>
                  <th width='120px' scope='row'>No. Ijazah</th>
                  <td><input type='text' class='form-control' name='no' value=''></td>
                </tr>
                <tr>
                  <th width='120px' scope='row'>Tanggal Ijazah</th>
                  <td><input type='date' class='form-control' name='pengesahan' value=''></td>
                </tr>
                <tr>
                  <th width='120px' scope='row'>File</th>
                  <td><input type="file" name="fileToUpload" id="fileToUpload"></td>
                </tr>


              </tbody>
            </table>
          </div>
      </div>
      <div class='box-footer'>
        <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
        <button type='submit' value="Unggah PDF" name="submit" class='btn btn-info'>Update</button>
      </div>
      </form>
    </div>


    <!-- <h2>Daftar File PDF yang Telah Diunggah</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Nama File</th>
            <th>Aksi</th>
        </tr>
        <?php
        // Tampilkan daftar file yang sudah diunggah
        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
            echo "<tr><td>" . $row["id"] . "</td><td>" . $row["name"] . "</td><td><a href='<a href='uploads/" . $row["name"] . "' download>Download</a>' download>Download</a></td></tr>";
          }
        } else {
          echo "<tr><td colspan='2'>Belum ada file yang diunggah.</td></tr>";
        }
        ?>
    </table> -->
</body>

</html>