            <div class='col-md-12'>
              <div class='box box-info'>
                <div class='box-header with-border'>
                  <h3 class='box-title'>Edit Data Warga Belajar</h3>
                </div>
              <div class='box-body'>
             
              </form>
              <form method='POST' class='form-horizontal' action='' enctype='multipart/form-data'>
                <div class='col-md-12'>
                  <table class='table table-condensed table-bordered'>
                  <tbody>
                    <input type='hidden' name='id' value='<?php echo $_GET['id']?>'>
                    <input type='text' name='pkbm' value='<?php echo $pkbm?>'>
                    <tr><th width='120px' scope='row'>Nama</th>           <td><input type='text' class='form-control' name='a' value='<?php echo $namawarga ?>'></td></tr>
                    <tr><th scope='row'>Alamat Sekolah</th>               <td><input type='text' class='form-control' name='d' value='<?php echo $alamat ?>'></td></tr>
                    <tr><th scope='row'>No Telpon</th>                    <td><input type='text' class='form-control' name='f' value='<?php echo $telepon ?>'></td></tr>
                    
                  </tbody>
                  </table>
                </div>
              </div>
              <div class='box-footer'>                    
                    <a href='index.php'><button type='button' class='btn btn-default pull-right'>Cancel</button></a>
                    <button type='submit' name='update' class='btn btn-info'>Update</button>                    
                  </div>
              </form>
            </div>

<?php
    if (isset($_POST['update'])) {
        $id = $_POST['id'];
        $nama = $_POST['a'];
        $alamat = $_POST['d'];
        $telepon = $_POST['f'];
      
        $query1 = "INSERT INTO siswa VALUES('','$_POST[aa]','$_POST[ac]','$_POST[ad]','$_POST[bd]','$_POST[ab]',
        '$_POST[bb]','$_POST[bc]','$_POST[ba]','$_POST[be]','$_POST[bf]','$_POST[ah]','$rt','$rw',
        '$_POST[aj]','$_POST[ak]','$_POST[al]','$_POST[am]','$_POST[bg]','$_POST[bh]','$_POST[bi]',
        '$_POST[bj]','$_POST[bk]','$_POST[bl]','$_POST[bm]','$_POST[bn]','','$_POST[ca]',
        '$_POST[cb]','$_POST[cc]','$_POST[cd]','$_POST[ce]','$_POST[cf]','$_POST[cg]','$_POST[ch]',
        '$_POST[ci]','$_POST[cj]','$_POST[ck]','$_POST[cl]','$_POST[cm]','$_POST[cn]','$_POST[co]',
        '$_POST[cp]','$_POST[cq]','$_POST[cr]','$_POST[cs]','$_POST[af]','$_POST[an]','$_POST[bo]',
        '','$_POST[ae]','$_POST[ag]','0')";
        $result1 = mysqli_query($koneksi, $query1);
        if (!$result1) {
          echo "Error: " . $query1 . "<br>" . mysqli_error($koneksi);
          exit();
      }

        if ($result) {
          echo "<script>alert('Data berhasil diperbarui'); document.location='index.php?view=siswa_pkbm';</script>";
        } else {
          echo "Gagal memperbarui data: " . mysqli_error($koneksi);
        }
    }  
?>
