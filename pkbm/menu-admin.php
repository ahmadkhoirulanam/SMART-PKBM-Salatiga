<section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="<?php echo $foto; ?>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><?php echo $nama; ?></p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>

          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header" style='color:#fff; text-transform:uppercase; border-bottom:2px solid #00c0ef'>MENU <?php echo $level; ?></li>
            <li><a href="index.php"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
            <li><a href="pkbm.php"><i class="fa fa-building"></i> <span>Daftar PKBM</span></a></li>
            <li><a href="index.php?view=warga_belajar"><i class="fa fa-users"></i> <span>Data Warga Belajar</span></a></li>
            <li><a href="index.php?view=rapor"><i class="fa fa-file"></i> <span>Data Rapor Warga Belajar</span></a></li>
            <li><a href="index.php?view=ijazah"><i class="fa fa-book"></i> <span>Data Ijazah Warga Belajar</span></a></li>
            <!-- <li class="treeview">
              <a href="#"><i class="fa fa-th"></i> <span>Data Master</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=identitas"><i class="fa fa-circle-o"></i> Data Identitas Sekolah</a></li>
                <li><a href="index.php?view=kurikulum"><i class="fa fa-circle-o"></i> Data Kurikulum</a></li>
                <li><a href="index.php?view=tahunakademik"><i class="fa fa-circle-o"></i> Data Tahun Akademik</a></li>
                <li><a href="index.php?view=gedung"><i class="fa fa-circle-o"></i> Data Gedung</a></li>
                <li><a href="index.php?view=ruangan"><i class="fa fa-circle-o"></i> Data Ruangan</a></li>
                <li><a href="index.php?view=golongan"><i class="fa fa-circle-o"></i> Data Golongan</a></li>
                <li><a href="index.php?view=ptk"><i class="fa fa-circle-o"></i> Data Jenis PTK</a></li>
                <li><a href="index.php?view=jurusan"><i class="fa fa-circle-o"></i> Data Jurusan</a></li>
                <li><a href="index.php?view=kelas"><i class="fa fa-circle-o"></i> Data Kelas</a></li>
                <li><a href="index.php?view=statuspegawai"><i class="fa fa-circle-o"></i> Data Status Kepegawaian</a></li>
              </ul>
            </li> -->
            <li class="treeview">
              <a href="#"><i class="fa fa-user"></i> <span>Data Pengguna</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <!-- <li><a href="index.php?view=siswa"><i class="fa fa-circle-o"></i> Data Siswa</a></li> -->
                <li><a href="index.php?view=data_pkbm"><i class="fa fa-circle-o"></i> Data Sekolah</a></li>
                <li><a href="index.php?view=admin"><i class="fa fa-circle-o"></i> Data Administrator</a></li>
              </ul>
            </li>

           
            <li><a href="index.php?view=dokumentasiguru"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
          </ul>
        </section>