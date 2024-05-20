<?php
if ($_GET[act] == '') {
?>
  <div class="col-xs-12">

    <div class="box">
      <div class="box-header">
        <h3 class="box-title">Daftar Warga Belajar</h3>                             
       
        <form style='margin-right:5px; margin-top:0px' class='pull-right' method="post">
          <select name="pilihan" style='padding:4px'>
          <?php
            echo "<option value=''>- Pilih Tahun Akademik -</option>";
            if ($_SESSION[level] == "guru") {
              $tahun = mysqli_query($koneksi, "SELECT * FROM tahun_akademik WHERE id_pkbm = $_SESSION[id] ORDER BY nama_tahun");
            } else {
              $tahun = mysqli_query($koneksi, "SELECT * FROM tahun_akademik ORDER BY id_tahun_akademik DESC");
            }

            while ($k = mysqli_fetch_array($tahun)) {
              if ($_GET[tahun] == $k[id_tahun_akademik]) {
                echo "<option value='$k[id_tahun_akademik]' selected>$k[nama_tahun]</option>";
              } else {
                echo "<option value='$k[id_tahun_akademik]'>$k[nama_tahun]</option>";
              }
            }
            ?>
          </select>
          <input type="submit" style='margin-top:-4px' class='btn btn-success btn-sm'>
          <a style='margin-top:-4px' class='btn btn-info btn-sm margin-top:-4px' title='Tambah Warga Belajar' href='index.php?view=siswa&act=tambahsiswa'><span class='glyphicon glyphicon-plus'></span> Tambah Siswa</a>
          </button>
        </form>

        <?php
        // Cek apakah form telah disubmit
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
          // Ambil nilai yang dipilih dari dropdown
          $pilihan = $_POST['pilihan'];

          // Lakukan sesuatu dengan nilai yang dipilih
          echo "<script>document.location='index.php?view=siswa_paket&id=$_GET[id]&	id_tahun_akademik=$pilihan';</script>";
        }
        ?>



      </div><!-- /.box-header -->
      <div class="box-body">
        <table id="example" class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>No</th>
              <th>NISN</th>
              <th>Nama Siswa</th>
              <th>Kejar Paket</th>
              <th>Tahun Akademik</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
            if ($_GET[id_tahun_akademik] != '' ){
              $tampil = mysqli_query($koneksi, "SELECT s.*, k.nama_paket, t.nama_tahun 
              FROM siswa s
              LEFT JOIN kelas_pkbm k ON s.id_paket = k.id_paket LEFT JOIN tahun_akademik t ON s.id_tahun_akademik = t.id_tahun_akademik
              WHERE s.pkbm = $_SESSION[id] AND s.id_paket = $_GET[id] AND s.id_tahun_akademik= $_GET[id_tahun_akademik]");
            
              }  else{
                $tampil = mysqli_query($koneksi, "SELECT s.*, k.nama_paket, t.nama_tahun 
                FROM siswa s
                LEFT JOIN kelas_pkbm k ON s.id_paket = k.id_paket LEFT JOIN tahun_akademik t ON s.id_tahun_akademik = t.id_tahun_akademik WHERE s.pkbm = $_SESSION[id] && s.id_paket = $_GET[id]");
            
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
                  <center>
                    <a class='btn btn-default btn-xs' title='Lihat Detail' href='?view=siswa&act=detailsiswa&id=<?php echo $r[nisn] ?>'><span class='glyphicon glyphicon-search'></span></a>
                    <a class='btn btn-info btn-xs' title='Edit Siswa' href='?view=siswa&act=editsiswa&id=<?php echo $r[nisn] ?>'><span class='glyphicon glyphicon-edit'></span></a>
                    <a class='btn btn-danger btn-xs' title='Delete Siswa' href='?view=siswa&hapus=<?php echo $r[nisn] ?>' onclick=\"return confirm('Apa anda yakin untuk hapus Data ini?')\"><span class='glyphicon glyphicon-remove'></span></a>
                  </center>
                </td>
              </tr>


            <?php $no++;
            }
            if (isset($_GET[hapus])) {
              mysqli_query($koneksi, "DELETE FROM users where id_user='$_GET[hapus]'");
              echo "<script>document.location='index.php?view=siswa_paket&id=$_GET[id]';</script>";
            }

            ?>
          </tbody>
        </table>
      </div><!-- /.box-body -->
      <?php
      if ($_GET[kelas] == '' and $_GET[tahun] == '') {
        echo "<center style='padding:60px; color:red'>Silahkan Memilih Tahun akademik dan Kelas Terlebih dahulu...</center>";
      }
      ?>
    </div>
  </div>

<?php
} elseif ($_GET[act] == 'listsiswa') {
  cek_session_guru();
  include "raport/raport_nilai_pengetahuan.php";
} elseif ($_GET[act] == 'listsiswaketerampilan') {
  cek_session_guru();
  include "raport/raport_nilai_keterampilan.php";
} elseif ($_GET[act] == 'detailguru') {
  cek_session_guru();
  include "raport/raport_halaman_guru.php";
} elseif ($_GET[act] == 'detailsiswa') {
  cek_session_siswa();
  include "raport/raport_halaman_siswa.php";
} elseif ($_GET[act] == 'listsiswasikap') {
  cek_session_guru();
  include "raport/raport_nilai_sikap.php";
}
?>