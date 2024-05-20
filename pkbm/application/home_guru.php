<a style='color:#000' href='?view=siswa_pkbm'>
            <div class="col-md-4 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-users"></i></span>
                <div class="info-box-content">
                <?php $siswa = mysqli_fetch_array(mysqli_query($koneksi,"SELECT count(*) as total FROM siswa where pkbm='$_SESSION[id]'")); ?>
                  <span class="info-box-text">Warga Belajar</span>
                  <span class="info-box-number"><?php echo $siswa[total]; ?></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            </a>

            <a style='color:#000' href='?view=ijazah'>
            <div class="col-md-4 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="fa fa-files-o"></i></span>
                <div class="info-box-content">
                <?php $upload = mysqli_fetch_array(mysqli_query($koneksi,"SELECT count(*) as total FROM files where id_pkbm='$_SESSION[id]'")); ?>
                  <span class="info-box-text">Ijazah</span>
                  <span class="info-box-number"><?php echo $upload[total]; ?></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            </a>

            <a style='color:#000' href='?view=rapor'>
            <div class="col-md-4 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-star-o"></i></span>
                <div class="info-box-content">
                <?php $forum = mysqli_fetch_array(mysqli_query($koneksi,"SELECT count(*) as total FROM rapor where id_pkbm='$_SESSION[id]'")); ?>
                  <span class="info-box-text">Rapor</span>
                  <span class="info-box-number"><?php echo $forum[total]; ?></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            </a>