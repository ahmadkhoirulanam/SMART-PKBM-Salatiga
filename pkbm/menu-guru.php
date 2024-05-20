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
            <li><a href="index.php?view=identitas_pkbm"><i class="fa fa-building"></i> <span>Identitas PKBM</span></a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-calendar"></i> <span>Master Data</span><i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=paket"><i class="fa fa-circle-o"></i>Data Kejar Paket</a></li>
                <li><a href="index.php?view=tahunakademik"><i class="fa fa-circle-o"></i>Data Tahun Akademik</a></li>
                <!-- <li><a href="index.php?view=raport&act=detailguru"><i class="fa fa-circle-o"></i>Data Rapor</a></li> -->
              </ul>
            </li> 
            <li><a href="index.php?view=siswa_pkbm"><i class="fa fa-user"></i> <span>Data Warga Belajar</span></a></li>
            <li><a href="index.php?view=rapor"><i class="fa fa-file"></i> <span>Data Rapor Warga Belajar</span></a></li>
            <li><a href="index.php?view=ijazah"><i class="fa fa-book"></i> <span>Data Ijazah Warga Belajar</span></a></li>
            <!-- <li><a href="index.php?view=absensiswa&act=detailabsenguru"><i class="fa fa-th-large"></i> <span>Absensi Siswa</span></a></li>
            <li><a href="index.php?view=bahantugas&act=listbahantugasguru"><i class="fa fa-file"></i><span>Bahan dan Tugas</span></a></li>
            <li><a href="index.php?view=soal&act=detailguru"><i class="fa fa-users"></i><span>Quiz / Ujian Online</span></a></li>
            <li><a href="index.php?view=forum&act=detailguru"><i class="fa fa-th-list"></i> <span>Forum Diskusi</span></a></li>
            <li><a href="index.php?view=kompetensiguru"><i class="fa fa-tags"></i> <span>Kompetensi Dasar</span></a></li>
            <li><a href="index.php?view=journalguru"><i class="fa fa-list"></i> <span>Journal KBM</span></a></li> -->
           
            <li><a href="index.php?view=dokumentasiguru"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
          </ul>
        </section>