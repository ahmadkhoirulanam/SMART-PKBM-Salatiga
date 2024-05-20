<?php if ($_GET[act]==''){ ?> 
            <div class="col-xs-12">  
              <div class="box">
                <div class="box-header">
                  
                  <h3 class="box-title">Data PKBM Salatiga</h3>
                  <?php if($_SESSION[level]!='kepala'){ ?>
                  <a class='pull-right btn btn-primary btn-sm' href='index.php?view=data_pkbm&act=tambahguru'>Tambahkan Data PKBM</a>
                  <?php } ?>
                </div><!-- /.box-header -->
                
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>NPSN</th>
                        <th>Nama PKBM</th>
                        <th>Alamat PKBM</th>
                        <th>No Telpon</th>
                        <th>SK Pendirian Sekolah</th>
                        <th>SK Izin Operasional </th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                  <?php 
                    $tampil = mysqli_query($koneksi,"SELECT * FROM guru a 
                                          LEFT JOIN jenis_kelamin b ON a.id_jenis_kelamin=b.id_jenis_kelamin 
                                            LEFT JOIN status_kepegawaian c ON a.id_status_kepegawaian=c.id_status_kepegawaian 
                                              LEFT JOIN jenis_ptk d ON a.id_jenis_ptk=d.id_jenis_ptk
                                              ORDER BY a.nip DESC");
                    $no = 1;
                    while($r=mysqli_fetch_array($tampil)){
                    $tanggal = tgl_indo($r[tgl_posting]);
                    echo "<tr><td>$no</td>
                              <td>$r[nip]</td>
                              <td>$r[nama_guru]</td>
                              <td>$r[alamat_jalan]</td>
                              <td>$r[telepon]</td>
                              <td>$r[sk_cpns]</td>
                              <td>$r[sk_pengangkatan]</td>";
                              if($_SESSION[level]!='kepala'){
                        echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=data_pkbm&act=detailguru&id=$r[nip]'><span class='glyphicon glyphicon-search'></span></a>
                                <a class='btn btn-success btn-xs' title='Edit Data' href='?view=data_pkbm&act=editguru&id=$r[nip]'><span class='glyphicon glyphicon-edit'></span></a>
                                <a class='btn btn-danger btn-xs' title='Delete Data' href='?view=data_pkbm&hapus=$r[nip]'><span class='glyphicon glyphicon-remove'></span></a>
                              </center></td>";
                              }else{
                                echo "<td><center>
                                <a class='btn btn-info btn-xs' title='Lihat Detail' href='?view=data_pkbm&act=detailguru&id=$r[nip]'><span class='glyphicon glyphicon-search'></span></a>
                              </center></td>";
                              }
                            echo "</tr>";
                      $no++;
                      }
                      if (isset($_GET[hapus])){
                          mysqli_query($koneksi,"DELETE FROM guru where nip='$_GET[hapus]'");
                          echo "<script>document.location='index.php?view=data_pkbm';</script>";
                      }

                  ?>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
<?php 
}elseif($_GET[act]=='tambahguru'){
  if (isset($_POST[tambah])){
      $rtrw = explode('/',$_POST[al]);
      $rt = $rtrw[0];
      $rw = $rtrw[1];
      $dir_gambar = 'foto_pegawai/';
      $filename = basename($_FILES['ax']['name']);
      $filenamee = date("YmdHis").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_gambar . $filenamee;
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['ax']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"INSERT INTO guru VALUES('$_POST[aa]','$_POST[ab]','$_POST[ac]','$_POST[af]','$_POST[ad]',
                           '$_POST[ae]','$_POST[ba]','$_POST[bv]','$_POST[aq]','$_POST[au]','$_POST[as]','$_POST[ar]', 
                           '$_POST[ag]','$_POST[ak]','$rt','$rw','$_POST[am]','$_POST[an]','$_POST[ao]','$_POST[ap]',
                           '$_POST[ai]','$_POST[ah]','$_POST[aj]','$_POST[at]','$_POST[av]','$_POST[bb]','$_POST[bc]', 
                           '$_POST[bd]','$_POST[be]','$_POST[bf]','$_POST[bg]','$_POST[bi]','$_POST[bh]','$_POST[bj]',
                           '$_POST[aw]','$_POST[bk]','$_POST[bl]','$_POST[bm]','$_POST[bn]','$_POST[bo]','$_POST[bp]',
                           '$_POST[bq]','$_POST[br]','$_POST[bs]','$_POST[bt]','$_POST[bw]','$_POST[bu]','$filenamee')");
        }
      }else{
          mysqli_query($koneksi,"INSERT INTO guru VALUES('$_POST[aa]','$_POST[ab]','$_POST[ac]','$_POST[af]','$_POST[ad]',
                           '$_POST[ae]','$_POST[ba]','$_POST[bv]','$_POST[aq]','$_POST[au]','$_POST[as]','$_POST[ar]', 
                           '$_POST[ag]','$_POST[ak]','$rt','$rw','$_POST[am]','$_POST[an]','$_POST[ao]','$_POST[ap]',
                           '$_POST[ai]','$_POST[ah]','$_POST[aj]','$_POST[at]','$_POST[av]','$_POST[bb]','$_POST[bc]', 
                           '$_POST[bd]','$_POST[be]','$_POST[bf]','$_POST[bg]','$_POST[bi]','$_POST[bh]','$_POST[bj]',
                           '$_POST[aw]','$_POST[bk]','$_POST[bl]','$_POST[bm]','$_POST[bn]','$_POST[bo]','$_POST[bp]',
                           '$_POST[bq]','$_POST[br]','$_POST[bs]','$_POST[bt]','$_POST[bw]','$_POST[bu]','')");
      }
      echo "<script>document.location='index.php?view=data_pkbm&act=detailguru&id=".$_POST[aa]."';</script>";
  }

    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Tambah Data PKBM</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <input type='hidden' name='id' value='$s[nip]'>
                    <tr><th width='120px' scope='row'>NPSN </th>      <td><input type='text' class='form-control' name='aa'></td></tr>
                    <tr><th scope='row'>Password</th>               <td><input type='text' class='form-control' name='ab'></td></tr>
                    <tr><th scope='row'>Nama Sekolah</th>           <td><input type='text' class='form-control' name='ac'></td></tr>
                    <tr><th scope='row'>No Telpon</th>              <td><input type='text' class='form-control' name='ai'></td></tr>
                    <tr><th scope='row'>Alamat Email</th>           <td><input type='text' class='form-control' name='aj'></td></tr>
                    <tr><th scope='row'>Alamat</th>                 <td><input type='text' class='form-control' name='ak'></td></tr>
                    <tr><th scope='row'>SK Pendirian Sekolah</th>                <td><input type='text' class='form-control' name='bb'></td></tr>
                    <tr><th scope='row'>Tanggal SK Pendirian</th>           <td><input type='date' class='form-control' name='bc'></td></tr>
                    <tr><th scope='row'>SK Izin Operasional </th>          <td><input type='text' class='form-control' name='bd'></td></tr>
                    <tr><th scope='row'>Tanggal SK Pendirian </th>         <td><input type='date' class='form-control' name='be'></td></tr>
                  </tbody>
                  </table>
                </div>

                
                <div style='clear:both'></div>
                        <div class='box-footer'>
                          <button type='submit' name='tambah' class='btn btn-info'>Tambahkan</button>
                          <a href='index.php?view=siswa'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                        </div> 
              </div>
            </form>
            </div>";
}elseif($_GET[act]=='editguru'){
  if (isset($_POST[update1])){
      $rtrw = explode('/',$_POST[al]);
      $rt = $rtrw[0];
      $rw = $rtrw[1];
      $dir_gambar = 'foto_pegawai/';
      $filename = basename($_FILES['ax']['name']);
      $filenamee = date("YmdHis").'-'.basename($_FILES['ax']['name']);
      $uploadfile = $dir_gambar . $filenamee;
      if ($filename != ''){      
        if (move_uploaded_file($_FILES['ax']['tmp_name'], $uploadfile)) {
          mysqli_query($koneksi,"UPDATE guru SET 
                           nip          = '$_POST[aa]',
                           password     = '$_POST[ab]',
                           nama_guru         = '$_POST[ac]',
                           tempat_lahir       = '$_POST[ad]',
                           tanggal_lahir = '$_POST[ae]',
                           id_jenis_kelamin       = '$_POST[af]',
                           id_agama           = '$_POST[ag]',
                           hp         = '$_POST[ah]',
                           telepon       = '$_POST[ai]',
                           email        = '$_POST[aj]',
                           alamat_jalan      = '$_POST[ak]',
                           rt = '$rt',
                           rw          = '$rw',
                           nama_dusun = '$_POST[am]',
                           desa_kelurahan = '$_POST[an]',
                           kecamatan = '$_POST[ao]',
                           kode_pos = '$_POST[ap]',
                           nuptk = '$_POST[aq]',
                           pengawas_bidang_studi = '$_POST[ar]', 
                           id_jenis_ptk = '$_POST[as]',
                           tugas_tambahan = '$_POST[at]', 
                           id_status_kepegawaian = '$_POST[au]',
                           id_status_keaktifan = '$_POST[av]',
                           id_status_pernikahan = '$_POST[aw]', 
                           foto = '$filenamee', 

                           nik = '$_POST[ba]', 
                           sk_cpns = '$_POST[bb]', 
                           tanggal_cpns = '$_POST[bc]', 
                           sk_pengangkatan = '$_POST[bd]', 
                           tmt_pengangkatan = '$_POST[be]', 
                           lembaga_pengangkatan = '$_POST[bf]',
                           id_golongan = '$_POST[bg]', 
                           sumber_gaji = '$_POST[bh]',
                           keahlian_laboratorium = '$_POST[bi]',
                           nama_ibu_kandung = '$_POST[bj]',
                           nama_suami_istri = '$_POST[bk]',
                           nip_suami_istri = '$_POST[bl]',
                           pekerjaan_suami_istri = '$_POST[bm]',
                           tmt_pns = '$_POST[bn]',
                           lisensi_kepsek = '$_POST[bo]',
                           jumlah_sekolah_binaan = '$_POST[bp]',
                           diklat_kepengawasan = '$_POST[bq]',
                           mampu_handle_kk = '$_POST[br]',
                           keahlian_breile = '$_POST[bs]',
                           keahlian_bahasa_isyarat = '$_POST[bt]',
                           kewarganegaraan = '$_POST[bu]',
                           niy_nigk = '$_POST[bv]',
                           npwp = '$_POST[bw]' where nip='$_POST[id]'");
        }
      }else{
          mysqli_query($koneksi,"UPDATE guru SET 
                           nip          = '$_POST[aa]',
                           password     = '$_POST[ab]',
                           nama_guru         = '$_POST[ac]',
                           tempat_lahir       = '$_POST[ad]',
                           tanggal_lahir = '$_POST[ae]',
                           id_jenis_kelamin       = '$_POST[af]',
                           id_agama           = '$_POST[ag]',
                           hp         = '$_POST[ah]',
                           telepon       = '$_POST[ai]',
                           email        = '$_POST[aj]',
                           alamat_jalan      = '$_POST[ak]',
                           rt = '$rt',
                           rw          = '$rw',
                           nama_dusun = '$_POST[am]',
                           desa_kelurahan = '$_POST[an]',
                           kecamatan = '$_POST[ao]',
                           kode_pos = '$_POST[ap]',
                           nuptk = '$_POST[aq]',
                           pengawas_bidang_studi = '$_POST[ar]', 
                           id_jenis_ptk = '$_POST[as]',
                           tugas_tambahan = '$_POST[at]', 
                           id_status_kepegawaian = '$_POST[au]',
                           id_status_keaktifan = '$_POST[av]',
                           id_status_pernikahan = '$_POST[aw]',

                           nik = '$_POST[ba]', 
                           sk_cpns = '$_POST[bb]', 
                           tanggal_cpns = '$_POST[bc]', 
                           sk_pengangkatan = '$_POST[bd]', 
                           tmt_pengangkatan = '$_POST[be]', 
                           lembaga_pengangkatan = '$_POST[bf]',
                           id_golongan = '$_POST[bg]', 
                           sumber_gaji = '$_POST[bh]',
                           keahlian_laboratorium = '$_POST[bi]',
                           nama_ibu_kandung = '$_POST[bj]',
                           nama_suami_istri = '$_POST[bk]',
                           nip_suami_istri = '$_POST[bl]',
                           pekerjaan_suami_istri = '$_POST[bm]',
                           tmt_pns = '$_POST[bn]',
                           lisensi_kepsek = '$_POST[bo]',
                           jumlah_sekolah_binaan = '$_POST[bp]',
                           diklat_kepengawasan = '$_POST[bq]',
                           mampu_handle_kk = '$_POST[br]',
                           keahlian_breile = '$_POST[bs]',
                           keahlian_bahasa_isyarat = '$_POST[bt]',
                           kewarganegaraan = '$_POST[bu]',
                           niy_nigk = '$_POST[bv]',
                           npwp = '$_POST[bw]' where nip='$_POST[id]'");
      }
      echo "<script>document.location='index.php?view=data_pkbm&act=detailguru&id=".$_POST[id]."';</script>";
  }

    $detail = mysqli_query($koneksi,"SELECT * FROM guru where nip='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data PKBM</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <input type='hidden' name='id' value='$s[nip]'>
                    <tr><th style='background-color:#E7EAEC' width='160px' rowspan='25'>";
                        if (trim($s[foto])==''){
                          echo "<img class='img-thumbnail' style='width:155px' src='foto_siswa/no-image.jpg'>";
                        }else{
                          echo "<img class='img-thumbnail' style='width:155px' src='foto_pegawai/$s[foto]'>";
                        }
                        echo "</th>
                    </tr>
                    <input type='hidden' name='id' value='$s[nip]'>
                    <input type='hidden' class='form-control' value='$s[nip]' name='aa'>
                    <input type='hidden' class='form-control' value='$s[password]' name='ab'>
                    <tr><th scope='row'>Nama PKBM</th>           <td><input type='text' class='form-control' value='$s[nama_guru]' name='ac'></td></tr>
                    <tr><th scope='row'>No Telpon</th>              <td><input type='text' class='form-control' value='$s[telepon]' name='ai'></td></tr>
                    <tr><th scope='row'>Alamat</th>                 <td><input type='text' class='form-control' value='$s[alamat_jalan]' name='ak'></td></tr>
                    <tr><th scope='row'>SK Pendirian Sekolah</th>                <td><input type='text' class='form-control' value='$s[sk_cpns]' name='bb'></td></tr>
                    <tr><th scope='row'>Tanggal SK Pendirian </th>           <td><input type='text' class='form-control' value='$s[tanggal_cpns]' name='bc'></td></tr>
                    <tr><th scope='row'>SK Izin Operasional </th>          <td><input type='text' class='form-control' value='$s[sk_pengangkatan]' name='bd'></td></tr>
                    <tr><th scope='row'>Tanggal SK Pendirian </th>         <td><input type='text' class='form-control' value='$s[tmt_pengangkatan]' name='be'></td></tr>
                    
                  </tbody>
                  </table>
                </div>

                
                <div style='clear:both'></div>
                        <div class='box-footer'>
                          <button type='submit' name='update1' class='btn btn-info'>Update</button>
                          <a href='index.php?view=siswa'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                        </div> 
              </div>
            </form>
            </div>";
}elseif($_GET[act]=='detailguru'){
    $detail = mysqli_query($koneksi,"SELECT a.*, b.jenis_kelamin, c.status_kepegawaian, d.jenis_ptk, e.nama_agama, f.nama_status_keaktifan, g.nama_golongan, h.status_pernikahan 
                                FROM guru a LEFT JOIN jenis_kelamin b ON a.id_jenis_kelamin=b.id_jenis_kelamin 
                                  LEFT JOIN status_kepegawaian c ON a.id_status_kepegawaian=c.id_status_kepegawaian 
                                    LEFT JOIN jenis_ptk d ON a.id_jenis_ptk=d.id_jenis_ptk 
                                      LEFT JOIN agama e ON a.id_agama=e.id_agama 
                                        LEFT JOIN status_keaktifan f ON a.id_status_keaktifan=f.id_status_keaktifan 
                                          LEFT JOIN golongan g ON a.id_golongan=g.id_golongan
                                            LEFT JOIN status_pernikahan h ON a.id_status_pernikahan=h.id_status_pernikahan
                                              where a.nip='$_GET[id]'");
    $s = mysqli_fetch_array($detail);
    echo "<div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Detail Data Guru</h3>
                </div>
              <div class='box-body'>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-7'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <input type='hidden' name='id' value='$s[nip]'>
                    <tr><th style='background-color:#E7EAEC' width='160px' rowspan='25'>";
                        if (trim($s[foto])==''){
                          echo "<img class='img-thumbnail' style='width:155px' src='foto_siswa/no-image.jpg'>";
                        }else{
                          echo "<img class='img-thumbnail' style='width:155px' src='foto_pegawai/$s[foto]'>";
                        }
                      if($_SESSION[level]!='kepala'){
                        echo "<a href='index.php?view=data_pkbm&act=editguru&id=$_GET[id]' class='btn btn-success btn-block'>Edit Profile</a>";
                      }
                        echo "</th>
                    </tr>
                    <tr><th width='120px' scope='row'>NPSN </th>      <td>$s[nip]</td></tr>
                    
                    <tr><th scope='row'>Nama PKBM</th>           <td>$s[nama_guru]</td></tr>
                    <tr><th scope='row'>No Telpon</th>              <td>$s[telepon]</td></tr>
                    <tr><th scope='row'>Alamat</th>                 <td>$s[alamat_jalan]</td></tr>
                    
                  </tbody>
                  </table>
                </div>

                <div class='col-md-5'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>                  
                    <tr><th scope='row'>SK Pendirian Sekolah</th>                <td>$s[sk_cpns]</td></tr>
                    <tr><th scope='row'>Tanggal SK Pendirian </th>           <td>$s[tanggal_cpns]</td></tr>
                    <tr><th scope='row'>SK Izin Operasional </th>          <td>$s[sk_pengangkatan]</td></tr>
                    <tr><th scope='row'>Tanggal SK Pendirian </th>         <td>$s[tmt_pengangkatan]</td></tr>
                    

                  </tbody>
                  </table>
                </div> 
              </div>
            </form>
            </div>";
}  
?>