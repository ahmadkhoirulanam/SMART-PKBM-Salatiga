<?php
if ($_SESSION[level] == 'guru') {
}

?>
<div class="col-xs-12">
  <div class="box">
    <div class="box-header">
      <h3 class="box-title">Data Rapor Warga Belajar</h3>
      
    </div><!-- /.box-header -->
    <div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
          <tr>
            <th style='width:30px'>No</th>
            <th>Nama PKBM</th>
            <th>Jumlah Warga Belajar</th>
            <th style='width:16%'>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
          if ($_SESSION[level]=="guru"){
            $tampil = mysqli_query($koneksi, "SELECT s.*, k.nama_paket, t.nama_tahun 
          FROM siswa s
          LEFT JOIN kelas_pkbm k ON s.id_paket = k.id_paket LEFT JOIN tahun_akademik t ON s.id_tahun_akademik = t.id_tahun_akademik WHERE s.pkbm = $_SESSION[id]");
          }
          else{
            $tampil = mysqli_query($koneksi, "SELECT * FROM guru");
          }
          $no = 1;
          while ($r = mysqli_fetch_array($tampil)) { ?>
            <tr>
              <td><?php echo $no ?></td>
              <td><?php echo $r[nama_guru] ?></td>
              <td>
              <?php $siswa = mysqli_fetch_array(mysqli_query($koneksi, "SELECT count(*) as total FROM siswa where pkbm='$r[nip]'")); ?>
              <?php echo $siswa[total]; ?>
              </td>
              <td>
                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=wargabelajarpkbm&id=<?php echo $r[nip]?>'><span class='glyphicon glyphicon-eye-open'></span> Lihat Daftar Warga Belajar</a>
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
  </div><!-- /.box -->
</div>