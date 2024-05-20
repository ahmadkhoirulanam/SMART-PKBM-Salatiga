<?php
require 'vendor/autoload.php'; // Memuat autoload dari Composer

use PhpOffice\PhpSpreadsheet\IOFactory;

// Koneksi ke database
$host = 'localhost';
$username = 'u178036811_pkbmbaru';
$password = 'Baniusman123';
$database = 'u178036811_pkbmbaru';

$mysqli = new mysqli($host, $username, $password, $database);

if ($mysqli->connect_error) {
    die('Koneksi ke database gagal: ' . $mysqli->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES["file_excel"])) {
    $file_excel = $_FILES["file_excel"]["tmp_name"];

    try {
        $spreadsheet = IOFactory::load($file_excel);
    } catch (Exception $e) {
        die('Error loading file "' . $_FILES["file_excel"]["name"] . '": ' . $e->getMessage());
    }

    $sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
    $pkbm = $_POST[id_pkbm];
    $id_paket = $_POST[paket];
    $id_tahun_akademik = $_POST[tahun];

    // Mulai dari baris kedua untuk menghindari judul kolom
    for ($row = 2; $row <= count($sheetData); $row++) {
        $nipd = $sheetData[$row]['A'];
        $nama = $sheetData[$row]['B'];
        $nisn = $sheetData[$row]['C'];
        $tempat_lahir = $sheetData[$row]['D'];
        $nik = $sheetData[$row]['E'];
        $alamat = $sheetData[$row]['F'];

        // Masukkan data ke dalam database
        $sql = "INSERT INTO siswa (pkbm, id_paket, id_tahun_akademik, nipd, password, nama, nisn, tempat_lahir, nik, alamat) VALUES ('$pkbm', '$id_paket', '$id_tahun_akademik', '$nipd', 'siswa', '$nama', $nisn, '$tempat_lahir', '$nik', '$alamat')";
        if ($mysqli->query($sql) !== true) {
            echo "Error: " . $sql . "<br>" . $mysqli->error;
        }
    }

    echo "<script>alert('Data berhasil ditambah'); document.location='index.php?view=siswa&paket=" . $id_paket . "&tahun_akademik=" . $id_tahun_akademik . "';</script>";
}

$mysqli->close();
?>

<!DOCTYPE html>
<html>

<head>
    <title>Upload Excel</title>
</head>

<body>
    <div class='col-md-12'>
        <div class='box box-info'>
            <div class='box-header with-border'>
                <h3 class='box-title'>Tambah Data Warga Belajar </h3>
            </div>
            <div class='box-body'>
                <div class="alert alert-info mb-5" role="alert">
                    <h4 class="alert-heading">
                        <i class="glyphicon glyphicon-warning-sign"></i>
                        Perhatian
                    </h4>
                    <ul>
                        <li>
                            Untuk mengimpor warga belajar, harap gunakan template excel yang tersedia.
                            <a class="font-weight-bold" target="_blank" href="uploads/warga_belajar.xlsx">
                                <i class="glyphicon glyphicon-download-alt"></i>
                                 Unduh disini.
                            </a>
                        </li>
                        <li>
                            Selalu periksa kembali kebenaran data warga belajar.
                        </li>
                        <li>
                            Mohon periksa kembali data warga belajar.
                        </li>
                        <li class="font-weight-bold">
                            Sesudah mengklik tombol upload, anda tidak bisa membatalkan proses upload.
                        </li>
                    </ul>
                </div>
                <form method="post" enctype="multipart/form-data">
                    <table class='table table-condensed table-bordered'>
                        <tbody>
                            <input type='hidden' name='id_pkbm' value='<?php echo $_SESSION[id] ?>'>
                            <tr>
                                <th scope='row'>Kejar Paket</th>
                                <td>
                                    <select id="categoryFilter" class="form-control" name='paket'>
                                        <!-- <option value="">Show All</option> -->
                                        <option value='0' selected>- Pilih Kejar Paket -</option>
                                        <?php
                                        $query = mysqli_query($koneksi, "SELECT * FROM kelas_pkbm WHERE id_pkbm = '$_SESSION[id]' ORDER BY nama_paket");
                                        while ($data = mysqli_fetch_array($query)) {
                                        ?>
                                            <option value="<?= $data['id_paket'] ?>"><?= $data['nama_paket'] ?></option>
                                        <?php
                                        }
                                        ?>

                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope='row'>Tahun Ajaran Akademik</th>
                                <td>
                                    <select id="categoryFilter" class="form-control" name='tahun'>
                                        <!-- <option value="">Show All</option> -->
                                        <option value='0' selected>- Pilih Tahun Ajaran Akademik -</option>
                                        <?php
                                        $query = mysqli_query($koneksi, "SELECT * FROM tahun_akademik WHERE id_pkbm = '$_SESSION[id]' ORDER BY nama_tahun");
                                        while ($data = mysqli_fetch_array($query)) {
                                        ?>
                                            <option value="<?= $data['id_tahun_akademik'] ?>"><?= $data['nama_tahun'] ?></option>
                                        <?php
                                        }
                                        ?>

                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <th width='120px' scope='row'>File</th>
                                <td><input type="file" name="file_excel" id="file_excel"></td>
                            </tr>
                        </tbody>
                    </table>

                    <input type="submit" value="Upload" name="submit">
                </form>
            </div>
        </div>
    </div>


</body>

</html>