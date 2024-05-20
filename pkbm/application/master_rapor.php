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
            <th>NISN</th>
            <th>Nama Lengkap</th>
            <th>Kejar Paket</th>
            <th>Tahun Akademik</th>
            <th style='width:16%'>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
          if ($_SESSION[level]=="guru"){
            $tampil = mysqli_query($koneksi, "SELECT s.*, k.nama_paket, t.nama_tahun 
          FROM siswa s
          LEFT JOIN kelas_pkbm k ON s.id_paket = k.id_paket LEFT JOIN tahun_akademik t ON s.id_tahun_akademik = t.id_tahun_akademik WHERE s.pkbm = '$_SESSION[id]'");
          }
          else{
            $tampil = mysqli_query($koneksi, "SELECT s.*, k.nama_paket, t.nama_tahun 
          FROM siswa s
          LEFT JOIN kelas_pkbm k ON s.id_paket = k.id_paket LEFT JOIN tahun_akademik t ON s.id_tahun_akademik = t.id_tahun_akademik");
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
                <a class='btn btn-info btn-xs' title='Edit Data' href='?view=addrapor&id=<?php echo $r[id_siswa]?>'><span class='glyphicon glyphicon-eye-open'></span> Lihat Rapor</a>
                 <!-- <a class='btn btn-success btn-xs' title='Edit Data' href='?view=admin&act=edit&id=$r[id_user]'><span class='glyphicon glyphicon-pencil'></span></a>
                  <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=admin&hapus=$r[id_user]'><span class='glyphicon glyphicon-remove'></span></a> -->

                </center>
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