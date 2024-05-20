-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2024 at 03:06 AM
-- Server version: 10.11.7-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u178036811_pkbmbaru`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_guru`
--

CREATE TABLE `absensi_guru` (
  `id_absensi_guru` int(5) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `kode_kehadiran` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `absensi_siswa`
--

CREATE TABLE `absensi_siswa` (
  `id_absensi_siswa` int(5) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kehadiran` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(5) NOT NULL,
  `nama_agama` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id_agama`, `nama_agama`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Hindu'),
(4, 'Budha');

-- --------------------------------------------------------

--
-- Table structure for table `elearning`
--

CREATE TABLE `elearning` (
  `id_elearning` int(10) NOT NULL,
  `id_kategori_elearning` int(5) NOT NULL,
  `kodejdwl` int(5) NOT NULL,
  `nama_file` varchar(255) NOT NULL,
  `file_upload` text NOT NULL,
  `tanggal_tugas` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `elearning`
--

INSERT INTO `elearning` (`id_elearning`, `id_kategori_elearning`, `kodejdwl`, `nama_file`, `file_upload`, `tanggal_tugas`, `tanggal_selesai`, `keterangan`) VALUES
(13, 1, 7, 'File Upload Materi 1', 'Contoh_Kasus_AHP.docx', '2015-12-09 08:07:15', '0000-00-00 00:00:00', ''),
(22, 2, 7, 'Tugas Untuk Siswa Kelompok yang Malas', 'cover_Pidana_korupsi.docx', '2015-12-09 22:37:51', '2015-12-23 13:07:09', 'Tolong Dikerjakan, Kalau Tidak Maka nilai Raport anda merah..'),
(23, 2, 7, 'Tugas Pertama ', 'Surat-Keterangan-Kepsek.docx', '2015-12-13 15:02:00', '2016-01-22 15:02:00', 'Selesaikan Secepatnya,..!'),
(24, 1, 5, 'Bahan Untuk Tugas Semester 2', 'journal_profile_matching_beasiswa.pdf', '2016-02-23 09:04:22', '2016-12-23 11:04:22', 'Bahan Untuk Tugas Semester 2 ini tolong dipelajari karena akan banyak keluar di ujian semester nanti.'),
(25, 2, 5, 'Tugas Semester 1 Tahun Ajaran 2015/2016', 'Metode-Profile-Matching.pdf', '2015-12-23 09:11:15', '2016-04-25 09:11:15', 'Silahkan Dijawab dan unutk jawaban di upload disini paling lambat sesuai tanggal selesai..'),
(26, 1, 13, 'Bahan Unutk Peljaran Besok', '20160311072304-Tugas_laura.docx', '2016-03-11 07:22:32', '2016-03-11 07:22:32', ''),
(27, 2, 13, 'Tugas Unutk Dikumpul Besok 12 Maret 2016', '20160311072502-Aturan Main Projects.docx', '2016-03-11 07:24:16', '2016-03-13 07:24:16', ''),
(28, 1, 13, 'kjbkjbkbk', '20160311143928-HITUNG NILAI RAPORT.docx', '2016-03-11 14:39:09', '2016-03-11 14:39:09', 'kjbkbk');

-- --------------------------------------------------------

--
-- Table structure for table `elearning_jawab`
--

CREATE TABLE `elearning_jawab` (
  `id_elearning_jawab` int(5) NOT NULL,
  `id_elearning` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `file_tugas` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `elearning_jawab`
--

INSERT INTO `elearning_jawab` (`id_elearning_jawab`, `id_elearning`, `nisn`, `keterangan`, `file_tugas`, `waktu`) VALUES
(3, 25, '9991268756', 'Ini buk Guru tugas dari saya, Tolong diperiksa,..', '20160309112015-Nilai_Siswa_9982679070.pdf', '2016-03-09 11:20:15'),
(4, 27, '9991268756', 'Ini Tugas saya buk..', '20160311072733-Pengembangan Members.txt', '2016-03-11 07:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `no_ijazah` varchar(255) NOT NULL,
  `pengesahan` date NOT NULL,
  `id_pkbm` varchar(50) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `id_siswa`, `no_ijazah`, `pengesahan`, `id_pkbm`, `mime_type`, `size`, `created_at`) VALUES
(17, '1 Jadwal Sempro 31 Jan 2024.pdf', 1287, '11223', '0000-00-00', '9218814438', 'application/pdf', 76590, '2024-03-19 08:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `forum_komentar`
--

CREATE TABLE `forum_komentar` (
  `id_forum_komentar` int(10) NOT NULL,
  `id_forum_topic` int(10) NOT NULL,
  `nisn_nip` varchar(20) NOT NULL,
  `isi_komentar` text NOT NULL,
  `waktu_komentar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `forum_komentar`
--

INSERT INTO `forum_komentar` (`id_forum_komentar`, `id_forum_topic`, `nisn_nip`, `isi_komentar`, `waktu_komentar`) VALUES
(1, 3, '9980707189', 'Senangi dulu pelajaran yang diharapkan nilainya bagus. Tanpa menyenangi pelajaran tersebut, maka hasil yang diperoleh melalui belajar tidak akan maksimal. Paling tidak, jangan sampai membenci pelajarannya. Hal ini karena akan tidak mungkin seseorang bisa betah lama-lama belajar materi suatu mata pelajaran yang dibencinya, apalagi untuk memahaminya.', '2015-12-12 05:09:15'),
(7, 1, '9980722436', 'Hallo teman teman, Numpang share lowongan ya. lagi di butuhkan segera nih buat posisi Full Time Web Developer/ Web Programmer.', '2016-02-26 00:34:01'),
(13, 1, '9991268756', 'Kami hanya ingin berdoa, ingin beribadah dan menjalankan ibadat kami. Kami tidak pernah menggangu apalagi berusaha untuk mengganggu umat beragama lain apalagi melakukan kristenisasi. Berpikir untuk itu saja kami tidak pernah.', '2016-03-09 10:38:51'),
(12, 1, '195704111980032004', 'Kami cuma ingin memiliki rumah ibadat agar kami dapat berdoa kepada Tuhan kami dengan khusuk. Dosakah itu? apakah itu terlarang di negara yag berazaskan Pancasila ini? Dimanakah rasa damai dan keadilan itu? Masih adakah toleransi di negara ini?', '2016-03-09 10:36:22'),
(3, 3, '9980722436', 'Milikilah rasa ingin tahu yang besar, karena hanya orang-orang yang memiliki rasa ingin tahu yang besar dalam banyak hal lah yang akan selalu senang dalam belajar, dan selalu ingin mempelajari dan memahami hal-hal baru dan banyak hal yang ia temui.', '2015-12-11 17:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `forum_topic`
--

CREATE TABLE `forum_topic` (
  `id_forum_topic` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `judul_topic` varchar(255) NOT NULL,
  `isi_topic` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `forum_topic`
--

INSERT INTO `forum_topic` (`id_forum_topic`, `kodejdwl`, `judul_topic`, `isi_topic`, `waktu`) VALUES
(1, 33, 'Cara Unutk Memahami Rumus Pitagoras dengan mudah.', 'Dalam matematika, teorema Pythagoras adalah suatu keterkaitan dalam geometri Euklides antara tiga sisi sebuah segitiga siku-siku. Teorema ini dinamakan menurut nama filsuf dan matematikawan Yunani abad ke-6 SM, Pythagoras. . Pythagoras mendapat kredit karena ialah yang pertama membuktikan kebenaran universal dari teorema ini melalui pembuktian matematis.', '2015-12-11 08:08:18'),
(2, 7, 'Rumus untuk menghitung pendapatan perkapita', 'Pendapatan per kapita adalah jumlah (nilai) barang dan jasa rata-rata yang tersedia bagi setiap penduduk suatu negara pada suatu periode tertentu.\r\n\r\nPendapatan per kapita dapat digunakan untuk membandingkan kesejahteraan atau standar hidup suatu negara dari tahun ke tahun. Dengan melakukan perbandingan seperti itu, kita dapat mengamati apakah kesejahteraan masyarakat pada suatu negara secara rata-rata telah meningkat. Pendapatan per kapita yang meningkat merupakan salah satu tanda bahwa rata-rata kesejahteraan penduduk telah meningkat. Pendapatan per kapita menunjukkan pula apakah pembangunan yang telah dilaksanakan oleh pemerintah telah berhasil, berapa besar keberhasilan tersebut, dan akibat apa yang timbul oleh peningkatan tersebut.', '2015-12-12 13:13:27'),
(3, 7, 'Cara Mendapatkan Nilai Bagus Dan Menjadi Juara Kelas Di Sekolah', 'Bagaimana caranya agar nilai rapor mata pelajaran di sekolah hasilnya baik dan bagus sehingga syukur-syukur bisa menjadi juara kelas ? Ikuti tips di bawah ini yang didasarkan pada sebuah pengalaman nyata bertahun-tahun dari berbagai sumber. \r\n\r\nPerlu untuk digaris-bawahi, tak dibutuhkan otak yang pintar atau jenius untuk mendapatkan nilai yang bagus di sekolah ataupun untuk menjadi seorang juara kelas. Seseorang yang kemampuan otaknya biasa-biasa saja akan bisa memperoleh hasil yang bagus asalkan ia memiliki niat, kemauan, maupun sikap yang tepat dalam mewujudkan ambisinya.', '2015-12-11 16:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `gedung`
--

CREATE TABLE `gedung` (
  `kode_gedung` varchar(10) NOT NULL,
  `nama_gedung` varchar(100) NOT NULL,
  `jumlah_lantai` varchar(20) NOT NULL,
  `panjang` varchar(20) NOT NULL,
  `tinggi` varchar(20) NOT NULL,
  `lebar` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gedung`
--

INSERT INTO `gedung` (`kode_gedung`, `nama_gedung`, `jumlah_lantai`, `panjang`, `tinggi`, `lebar`, `keterangan`, `aktif`) VALUES
('G001', 'Gedung A', '2', '100', '50', '50', '', 'Y'),
('G002', 'Gedung B', '3', '50', '80', '30', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `golongan`
--

CREATE TABLE `golongan` (
  `id_golongan` int(5) NOT NULL,
  `nama_golongan` varchar(150) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `golongan`
--

INSERT INTO `golongan` (`id_golongan`, `nama_golongan`, `keterangan`) VALUES
(1, 'IV/a', 'Golongan IV/a');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nip` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_guru` varchar(150) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` varchar(50) NOT NULL,
  `niy_nigk` varchar(50) NOT NULL,
  `nuptk` varchar(50) NOT NULL,
  `id_status_kepegawaian` int(5) NOT NULL,
  `id_jenis_ptk` int(5) NOT NULL,
  `pengawas_bidang_studi` varchar(150) NOT NULL,
  `id_agama` int(5) NOT NULL,
  `alamat_jalan` varchar(255) NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `nama_dusun` varchar(100) NOT NULL,
  `desa_kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `tugas_tambahan` varchar(100) NOT NULL,
  `id_status_keaktifan` int(5) NOT NULL,
  `sk_cpns` varchar(150) NOT NULL,
  `tanggal_cpns` date NOT NULL,
  `sk_pengangkatan` varchar(150) NOT NULL,
  `tmt_pengangkatan` date NOT NULL,
  `lembaga_pengangkatan` varchar(150) NOT NULL,
  `id_golongan` int(5) NOT NULL,
  `keahlian_laboratorium` varchar(150) NOT NULL,
  `sumber_gaji` varchar(150) NOT NULL,
  `nama_ibu_kandung` varchar(100) NOT NULL,
  `id_status_pernikahan` int(5) NOT NULL,
  `nama_suami_istri` varchar(100) NOT NULL,
  `nip_suami_istri` varchar(30) NOT NULL,
  `pekerjaan_suami_istri` varchar(100) NOT NULL,
  `tmt_pns` date NOT NULL,
  `lisensi_kepsek` varchar(20) NOT NULL,
  `jumlah_sekolah_binaan` int(5) NOT NULL,
  `diklat_kepengawasan` varchar(20) NOT NULL,
  `mampu_handle_kk` varchar(20) NOT NULL,
  `keahlian_breile` varchar(20) NOT NULL,
  `keahlian_bahasa_isyarat` varchar(20) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `kewarganegaraan` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `password`, `nama_guru`, `id_jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nik`, `niy_nigk`, `nuptk`, `id_status_kepegawaian`, `id_jenis_ptk`, `pengawas_bidang_studi`, `id_agama`, `alamat_jalan`, `rt`, `rw`, `nama_dusun`, `desa_kelurahan`, `kecamatan`, `kode_pos`, `telepon`, `hp`, `email`, `tugas_tambahan`, `id_status_keaktifan`, `sk_cpns`, `tanggal_cpns`, `sk_pengangkatan`, `tmt_pengangkatan`, `lembaga_pengangkatan`, `id_golongan`, `keahlian_laboratorium`, `sumber_gaji`, `nama_ibu_kandung`, `id_status_pernikahan`, `nama_suami_istri`, `nip_suami_istri`, `pekerjaan_suami_istri`, `tmt_pns`, `lisensi_kepsek`, `jumlah_sekolah_binaan`, `diklat_kepengawasan`, `mampu_handle_kk`, `keahlian_breile`, `keahlian_bahasa_isyarat`, `npwp`, `kewarganegaraan`, `foto`) VALUES
('9218814438', '9218814438', 'UPTD SPNF SKB SALATIGA', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '(0298) 3433898', '', '', '', 0, '813/005-5D/BKD-2024', '2024-07-18', '813/005-5D/BKD-2024', '2006-04-08', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', '20240214170606-Logo_of_Ministry_of_Education_and_Culture_of_Republic_of_Indonesia.svg.png'),
('P9934490', 'P9934490', 'PKBM TUNAS HARAPAN', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '+62 815-4286-92', '', 'Sudiyanto@gmail.com', '', 0, '503/Pendidikan/IPPNF/002/411/IV/2022', '2022-05-04', '503/Pendidikan/IPPNF/002/411/IV/2022', '2022-05-04', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P2964419', 'P2964419', 'PKBM AL GHUFRON', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '3', '', 'Jumadi@gmail.com', '', 0, '420/1033', '2001-02-28', '421.9/7461/401', '2018-12-31', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P9970294', 'P9970294', 'PKBM MARGA YASA', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '0878', '', 'Jumadi@gmail.com', '', 0, '421.9/0169/401', '2018-03-28', '421.9/0169/401', '2018-03-28', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P9934634', 'P9934634', 'PKBM SUNAN GIRI', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '455', '', 'Sudiyanto@gmail.com', '', 0, '421.9 / 0224/ 101', '2021-08-08', '421.9 / 0224/ 101', '2015-09-17', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P9934611', 'P9934611', 'PKBM Destiny Institute', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '2333', '', 'Sudiyanto@gmail.com', '', 0, '421.9/0165/101', '2014-07-13', '421.9/0165/101', '2015-07-13', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P9996669', 'P9996669', 'PKBM Jungle School', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '2333', '', 'Jumadi@gmail.com', '', 0, '503/Pendidikan/IPPNF/003/411/VIII/2020', '2020-08-13', '503/Pendidikan/IPPNF/003/411/VIII/2020', '2020-08-13', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P9934621', 'P9934621', 'PKBM KARISMA', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '2333', '', 'Jumadi@gmail.com', '', 0, '421.9/11.62', '2007-09-20', '421.9/11.62', '2015-02-12', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P9934605', 'P9934605', 'PKBM PERMATA', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '3', '', 'Jumadi@gmail.com', '', 0, '421.9/0471/101', '1999-10-25', '421.9/0471/101', '2014-02-11', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P9947912', 'P9947912', 'PKBM AL ISHLAH', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '2333', '', 'Sudiyanto@gmail.com', '', 0, '421.9/0210/101', '2015-09-07', '421.9/0210/101', '2018-12-28', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P9970512', 'P9970512', 'PKBM PIWULANG BECIK', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '455', '', 'Sudiyanto@gmail.com', '', 0, '421.9/3385/401', '2018-08-02', '421.9/3385/401', '2018-08-02', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', ''),
('P2964421', 'P2964421', 'PKBM QARYAH THAYYIBAH', 0, '', '0000-00-00', '', '', '', 0, 0, '', 0, 'Salatiga', '', '', '', '', '', 0, '2333', '', 'Jumadi@gmail.com', '', 0, '421.9/3784', '2008-10-09', '421.9/3784', '2008-10-09', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 0, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `halaman`
--

CREATE TABLE `halaman` (
  `id_halaman` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `judul_seo` varchar(255) NOT NULL,
  `isi_halaman` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `status` enum('psb','journal') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `halaman`
--

INSERT INTO `halaman` (`id_halaman`, `judul`, `judul_seo`, `isi_halaman`, `username`, `status`) VALUES
(1, 'Selamat Datang di Sistem Pendaftaran Siswa Baru', 'selamat-datang-di-sistem-pendaftaran-siswa-baru', 'Sistem PSB online atau sistem informasi aplikasi penerimaan siswa baru online merupakan produk layanan aplikasi perangkat lunak  yang online real time dan 100%   berbasis web. Sistem   ini   berusaha   memenuhi kebutuhan   masyarakat khususnya  bagi orangtua  dan  calon  siswa  untuk  dapat melaksanakan  pendaftaran  ke sekolah dengan  aman  dan  tertib  dengan menyediakan  fitur  otomasi  proses penerimaan  siswa  baru secara  langsung  menggunakan  media internet,  mulai  dari proses pendaftaran, proses seleksi, hingga pengumuman hasil penerimaan siswa secara langsung nyata melalui internet.\r\n\r\nYayasan lokomedia.web.id didirikan di Padang dengan Akte Notaris Leurentia Siti Nyoman tertanggal 6 Maret 1996.Pada tahun pertama ini dibukalah taman kanak-kanak dan plygroup dengan murid berjumlah 73 orang dan kampusnya berlokasi di jalan Thamrin No.22-25', 'admin', 'psb'),
(2, 'Prosedur Pendaftaran Siswa Baru', 'prosedur-pendaftaran-siswa-baru', 'Melakukan  pendaftaran secara online melalui website psb.dek.sch.id\nMembayar uang pendaftaran sebesar Rp 60.000,00 ke Rekening Sekolah :\nNo Rekening : xxxxxxxxxxxxxx\nAtas Nama : BPN 010 SMAK PADANG\nBRI UNIT PASAR BARU PADANG\n\n<b>Note : Bagi Bapak/Ibuk yang sudah melakukan pembayaran dan konfirmasi harap segera megirim pesan ke nomor 082384116431</b>\n\nUntuk Metode Tansfer.\ndengan format pesan : [jenis metode pembaran] [no_rekening] [nama anak/nama pesera] [nomor_konfirmasi]\nContoh Pesan Metode Transfer : Transfer 111112318923 Annisa Mardatilah QC401\n\nUntuk Metode Setoran.\nInvite/Add ID What\'sApp dengan nomor 081267771344\ndengan format pesan : Kirim foto bukti slip setoran dan nama anak/peserta serta nomor konfirmasi\nContoh Format Pesan Whatsapp : [foto bukti slip setor] Annisa Mardatillah QC401\n\nMenyerahkan berkas dan ketentuan sebagai berikut apabila calon siswa dinyatakan lulus tes online.\nFoto kopi  rapor yang sudah dilegalisasi dari semester I - IV (1 rangkap)\nMemperlihatkan rapor asli\nSehat jasmani dan rohani (diperiksa di  SMK SMAK)\nTidak Buta Warna (diperiksa di SMK SMAK Padang)\nPas foto  warna terbaru ukuran 2x3 sebanyak 2 lembar dan 3X4 sebanyak 3 lembar', 'admin', 'psb');

-- --------------------------------------------------------

--
-- Table structure for table `identitas_sekolah`
--

CREATE TABLE `identitas_sekolah` (
  `id_identitas_sekolah` int(5) NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `nss` varchar(50) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `kode_pos` int(7) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kabupaten_kota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `website` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `identitas_sekolah`
--

INSERT INTO `identitas_sekolah` (`id_identitas_sekolah`, `nama_sekolah`, `npsn`, `nss`, `alamat_sekolah`, `kode_pos`, `no_telpon`, `kelurahan`, `kecamatan`, `kabupaten_kota`, `provinsi`, `website`, `email`) VALUES
(1, 'PKBM TUNAS HARAPAN', '', '', '', 0, '', '', 'Argomulyo', 'Kota Salatiga', 'Jawa Tengah', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `ijazah`
--

CREATE TABLE `ijazah` (
  `id` int(11) NOT NULL,
  `id_pkbm` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_siswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_pelajaran`
--

CREATE TABLE `jadwal_pelajaran` (
  `kodejdwl` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kode_pelajaran` varchar(10) NOT NULL,
  `kode_ruangan` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `paralel` varchar(10) NOT NULL,
  `jadwal_serial` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `hari` varchar(20) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jadwal_pelajaran`
--

INSERT INTO `jadwal_pelajaran` (`kodejdwl`, `id_tahun_akademik`, `kode_kelas`, `kode_pelajaran`, `kode_ruangan`, `nip`, `paralel`, `jadwal_serial`, `jam_mulai`, `jam_selesai`, `hari`, `aktif`) VALUES
(5, 20161, 'X.MIPA.1', 'MK02', 'R003', '195806161984000001', '', '', '23:00:00', '23:30:00', 'Senin', 'Ya'),
(13, 20161, 'X.MIPA.1', 'MK01', 'R003', '195704111980032004', '', '', '09:00:00', '11:30:00', 'Senin', 'Ya'),
(14, 20161, 'X.MIPA.1', 'MK03', 'R004', '195806161984032002', '', '', '08:00:00', '10:30:00', 'Selasa', 'Ya'),
(33, 20162, 'X.MIPA.1', 'MK15', 'R001', '195806161984000002', '00', '00', '08:00:00', '10:00:00', 'Senin', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_essai`
--

CREATE TABLE `jawaban_essai` (
  `id_jawaban_essai` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `id_pertanyaan_essai` int(10) NOT NULL,
  `jawaban_essai` text NOT NULL,
  `waktu_tugas` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jawaban_essai`
--

INSERT INTO `jawaban_essai` (`id_jawaban_essai`, `nisn`, `id_pertanyaan_essai`, `jawaban_essai`, `waktu_tugas`) VALUES
(1, '0000261141', 1, 'abdurrahman wahid (Gus Dur)', '2016-03-05 14:16:15'),
(2, '0000261141', 2, '1. Udin Sedunia\r\n2. Sopan Sopian\r\n3. Inul Daratista\r\n4. Angelina Sondak\r\n5. Ruhut Sitompul', '2016-03-05 14:16:11'),
(3, '0000261141', 3, 'Di Kota Padang, Sumatera Barat Kota Padang', '2016-03-05 14:16:08'),
(4, '0000261141', 6, 'Wr Supratman', '2016-03-05 14:16:04'),
(5, '0000240365', 10, '359', '2016-03-05 14:15:41'),
(6, '0000240365', 9, 'PRABOWO, S.Kom, M.Kom', '2016-03-05 14:15:51'),
(7, '9991268756', 10, 'Jawaban dari soal no 1..', '2016-03-09 03:39:36'),
(8, '9991268756', 9, 'Jawaban soal no 2,..', '2016-03-09 03:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_objektif`
--

CREATE TABLE `jawaban_objektif` (
  `id_jawaban_objektif` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `id_pertanyaan_objektif` int(10) NOT NULL,
  `jawaban` varchar(2) NOT NULL,
  `waktu_objektif` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jawaban_objektif`
--

INSERT INTO `jawaban_objektif` (`id_jawaban_objektif`, `nisn`, `id_pertanyaan_objektif`, `jawaban`, `waktu_objektif`) VALUES
(21, '0000261141', 5, 'a', '2016-03-05 14:16:54'),
(20, '0000261141', 1, 'b', '2016-03-05 14:16:51'),
(19, '0000261141', 2, 'c', '2016-03-05 14:16:48'),
(18, '0000240365', 6, 'a', '2016-03-05 14:22:49'),
(22, '0000240365', 8, 'e', '2016-03-05 14:16:40'),
(23, '9991268756', 8, 'a', '2016-03-09 03:39:51'),
(24, '9991268756', 6, 'b', '2016-03-09 03:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id_jenis_kelamin` int(5) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id_jenis_kelamin`, `jenis_kelamin`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_ptk`
--

CREATE TABLE `jenis_ptk` (
  `id_jenis_ptk` int(5) NOT NULL,
  `jenis_ptk` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenis_ptk`
--

INSERT INTO `jenis_ptk` (`id_jenis_ptk`, `jenis_ptk`, `keterangan`) VALUES
(1, 'Tenaga Administrasi Sekolah', ''),
(2, 'Guru Mapel', ''),
(3, 'Guru BK', ''),
(4, 'Guru Kelas', '');

-- --------------------------------------------------------

--
-- Table structure for table `journal_list`
--

CREATE TABLE `journal_list` (
  `id_journal` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_ke` varchar(50) NOT NULL,
  `materi` text NOT NULL,
  `keterangan` text NOT NULL,
  `waktu_input` datetime NOT NULL,
  `users` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `journal_list`
--

INSERT INTO `journal_list` (`id_journal`, `kodejdwl`, `hari`, `tanggal`, `jam_ke`, `materi`, `keterangan`, `waktu_input`, `users`) VALUES
(1, 33, 'Jumat', '2016-07-08', '1', 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisannn.', 'Sebagai pendidik kita tentunya harus mempersiapkan segala sesuatu yang berhubungan dengan administrasi untuk mengajar...dalam kesempatan ini kami akan mencoba membuat draft jurnal kelas', '2016-07-08 08:08:37', '195806161984000002'),
(2, 33, 'Jumat', '2016-07-08', '2', 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisane.', 'Jurnal pembelajaran harian merupakan salah satu perangkat pembelajaran yang diperlukan oleh guru guna mencatat pelaksanaan pembelajaran setiap hari. jurnal pembelajaran dapat membantu proses sejauh mana kita telah mengajar serta menghandle siapa saja murid/guru yang tidak masuk atau yang tidak mengikuti proses KBM.', '2016-07-08 09:11:24', '195806161984000002'),
(5, 33, 'Jumat', '2016-07-08', '3', 'Berikut ini merupakan contoh dari enkripsi RSA dan dekripsinya. Parameter yang digunakan disini berupa bilangan kecil.', 'RSA di bidang kriptografi adalah sebuah algoritma pada enkripsi public key. RSA merupakan algoritma pertama yang cocok untuk digital signature seperti halnya ekripsi, dan salah satu yang paling maju dalam bidang kriptografi public key. RSA masih digunakan secara luas dalam protokol electronic commerce, dan dipercaya dalam mengamnkan dengan menggunakan kunci yang cukup panjang.', '2016-07-08 10:33:39', '1');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` varchar(10) NOT NULL,
  `nama_jurusan` varchar(255) NOT NULL,
  `nama_jurusan_en` varchar(255) NOT NULL,
  `bidang_keahlian` varchar(150) NOT NULL,
  `kompetensi_umum` varchar(150) NOT NULL,
  `kompetensi_khusus` varchar(150) NOT NULL,
  `pejabat` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`, `nama_jurusan_en`, `bidang_keahlian`, `kompetensi_umum`, `kompetensi_khusus`, `pejabat`, `jabatan`, `keterangan`, `aktif`) VALUES
('MIPA', 'Ilmu Pengetahuan Alam', '', 'Biologi, Fisika, kimia', 'Menguasai Semua Bidang Keahlian', 'Menguasai Semua Bidang Biologi', 'Hasan Bin Mail', 'Ketua Jurusan', '', 'Ya'),
('IPS', 'Ilmu Pengetahuan Sosial', '', '', '', '', '', '', '', 'Ya'),
('BAHASA', 'Jurusan Bahasa', '', 'Bahasa Indonesia', '', '', '', '', '', 'Ya'),
('IBBU', 'Jurusan IBBU', '', '', '', '', '', '', '', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_elearning`
--

CREATE TABLE `kategori_elearning` (
  `id_kategori_elearning` int(5) NOT NULL,
  `nama_kategori_elearning` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori_elearning`
--

INSERT INTO `kategori_elearning` (`id_kategori_elearning`, `nama_kategori_elearning`) VALUES
(1, 'Bahan'),
(2, 'Tugas');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_quiz_ujian`
--

CREATE TABLE `kategori_quiz_ujian` (
  `id_kategori_quiz_ujian` int(5) NOT NULL,
  `kategori_quiz_ujian` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori_quiz_ujian`
--

INSERT INTO `kategori_quiz_ujian` (`id_kategori_quiz_ujian`, `kategori_quiz_ujian`) VALUES
(1, 'Quiz Online'),
(2, 'Ujian Online');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `kode_kehadiran` varchar(5) NOT NULL,
  `nama_kehadiran` varchar(20) NOT NULL,
  `nilai` int(2) NOT NULL,
  `bobot` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`kode_kehadiran`, `nama_kehadiran`, `nilai`, `bobot`) VALUES
('H', 'Hadir', 1, '1'),
('I', 'Izin', 1, '0.5'),
('S', 'Sakit', 1, '0.5'),
('A', 'Alpa', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `kode_ruangan` varchar(10) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `nip`, `kode_jurusan`, `kode_ruangan`, `nama_kelas`, `aktif`) VALUES
('X.MIPA.1', '195704111980032004', 'MIPA', 'R001', 'Kelas X IPA 1', 'Ya'),
('X.MIPA.2', '13653450011', 'IPS', 'R002', 'Kelas X IPA 2', 'Ya'),
('X.MIPA.3', '13653450022', 'MIPA', 'R003', 'Kelas X IPA 3', 'Ya'),
('X.MIPA.4', '634534533234', 'MIPA', 'R004', 'Kelas X IPA 4', 'Ya'),
('X.MIPA.5', '63453453354', 'IPS', 'R003', 'Kelas X IPA 5', 'Ya'),
('X.MIPA.6', '13653450022', 'IPS', 'R001', 'Kelas X IPA 6', 'Ya'),
('X.MIPA.7', '634534533234', 'IPS', 'R002', 'Kelas X IPA 7', 'Ya'),
('X.MIPA.8', '13653450011', 'IPS', 'R002', 'Kelas X IPA 8', 'Ya'),
('X.IPS.1', '13653450011', 'IPS', 'R002', 'Kelas X IPS 1', 'Ya'),
('X.IPS.2', '634534533234', 'MIPA', 'R004', 'Kelas X IPS 2', 'Ya'),
('X.IPS.3', '634534533234', 'MIPA', 'R004', 'Kelas X IPS 3', 'Ya'),
('X.IPS.4', '63453453354', 'MIPA', 'R001', 'Kelas X IPS 4', 'Ya'),
('X.IPS.5', '63453453354', 'MIPA', 'R001', 'Kelas X IPS 5', 'Ya'),
('X.IPS.6', '63453453354', 'IPS', 'R003', 'Kelas X IPS 6', 'Ya'),
('XI.MIPA.1', '13653450022', 'MIPA', 'R001', 'Kelas XI IPA 1', 'Ya'),
('XI.MIPA.2', '13653450022', 'MIPA', 'R002', 'Kelas XI IPA 2', 'Ya'),
('XI.MIPA.3', '13653450022', 'MIPA', 'R003', 'Kelas XI IPA 3', 'Ya'),
('XI.MIPA.4', '13653450022', 'MIPA', 'R004', 'Kelas XI IPA 4', 'Ya'),
('XI.MIPA.5', '13653450022', 'MIPA', 'R001', 'Kelas XI IPA 5', 'Ya'),
('XI.MIPA.6', '13653450022', 'MIPA', 'R002', 'Kelas XI IPA 6', 'Ya'),
('XI.IPS.1', '13653450022', 'IPS', 'R003', 'Kelas XI IPS 1', 'Ya'),
('XI.IPS.2', '13653450022', 'IPS', 'R004', 'Kelas XI IPS 2', 'Ya'),
('XI.IPS.3', '13653450022', 'IPS', 'R001', 'Kelas XI IPS 3', 'Ya'),
('XI.IPS.4', '13653450022', 'IPS', 'R002', 'Kelas XI IPS 4', 'Ya'),
('XII.MIPA.1', '13653450022', 'MIPA', 'R003', 'Kelas XII IPA 1', 'Ya'),
('XII.MIPA.2', '13653450022', 'MIPA', 'R001', 'Kelas XII IPA 2', 'Ya'),
('XII.MIPA.3', '13653450022', 'MIPA', 'R002', 'Kelas XII IPA 3', 'Ya'),
('XII.MIPA.4', '13653450022', 'MIPA', 'R001', 'Kelas XII IPA 4', 'Ya'),
('XII.MIPA.5', '13653450022', 'MIPA', 'R003', 'Kelas XII IPA 5', 'Ya'),
('XII.MIPA.6', '13653450022', 'MIPA', 'R004', 'Kelas XII IPA 6', 'Ya'),
('XII.MIPA.7', '13653450022', 'MIPA', 'R001', 'Kelas XII IPA 7', 'Ya'),
('XII.IPS.1', '13653450022', 'IPS', 'R002', 'Kelas XII IPS 1', 'Ya'),
('XII.IPS.2', '13653450022', 'IPS', 'R003', 'Kelas XII IPS 2', 'Ya'),
('XII.IPS.3', '13653450022', 'IPS', 'R001', 'Kelas XII IPS 3', 'Ya'),
('XII.IPS.4', '13653450022', 'IPS', 'R004', 'Kelas XII IPS 4', 'Ya'),
('XII.IPS.5', '13653450022', 'IPS', 'R002', 'Kelas XII IPS 5', 'Ya'),
('XI.BAHASA', '13653450022', 'BAHASA', 'R001', 'Kelas XI Bahasa', 'Ya'),
('X.IBBU', '13653450022', 'IBBU', 'R002', 'Kelas X IBBU', 'Ya'),
('ANU', '63453453354', 'MIPA', 'R001', 'Kelas X IPA 1', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_pkbm`
--

CREATE TABLE `kelas_pkbm` (
  `id_paket` int(10) UNSIGNED NOT NULL,
  `nama_paket` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `id_pkbm` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas_pkbm`
--

INSERT INTO `kelas_pkbm` (`id_paket`, `nama_paket`, `keterangan`, `id_pkbm`, `created_at`) VALUES
(27, 'a', 'aaa', '0', '2024-02-26 07:35:07'),
(28, 'Kejar Paket B', 'Paket B', '9218814438', '2024-02-26 07:42:33'),
(29, 'c', 'ssss', '2147483647', '2024-02-26 08:00:50'),
(30, 'Kejar Paket C', 'Paket C', '9218814438', '2024-02-26 08:05:30'),
(31, 'Kejar Paket A', 'Paket A', '9218814438', '2024-03-02 01:33:41'),
(32, 'Kejar Paket A', 'Paket A Marga Yasa', 'P9970294', '2024-03-06 17:56:16'),
(33, 'Kejar Paket A', 'Paket A', 'P2964421', '2024-03-06 18:23:17'),
(35, 'KEJAR PAKET B', '', 'P2964419', '2024-03-19 04:30:13'),
(36, 'KEJAR PAKET C', '', 'P2964419', '2024-03-19 04:30:27'),
(37, 'KEJAR PAKET A', '', 'P9934605', '2024-03-19 08:30:34'),
(38, 'KEJAR PAKET B', '', 'P9934605', '2024-03-19 08:30:46'),
(39, 'KEJAR PAKET C', '', 'P9934605', '2024-03-19 08:30:54'),
(40, 'KB', 'Kelompok Bermain', 'P9970512', '2024-03-20 01:19:15'),
(41, 'KEJAR PAKET A', '', 'P9996669', '2024-03-20 02:14:32'),
(42, 'Paud', '', 'P9996669', '2024-03-20 02:15:01'),
(43, 'JONI', 'KELAS X', 'P9934634', '2024-05-19 11:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_mata_pelajaran`
--

CREATE TABLE `kelompok_mata_pelajaran` (
  `id_kelompok_mata_pelajaran` int(5) NOT NULL,
  `jenis_kelompok_mata_pelajaran` varchar(50) NOT NULL,
  `nama_kelompok_mata_pelajaran` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kelompok_mata_pelajaran`
--

INSERT INTO `kelompok_mata_pelajaran` (`id_kelompok_mata_pelajaran`, `jenis_kelompok_mata_pelajaran`, `nama_kelompok_mata_pelajaran`) VALUES
(1, 'A', 'Kelompok A (Umum)'),
(2, 'B', 'Kelompok B (Umum)'),
(3, 'C', 'Kelompok C (Peminatan)');

-- --------------------------------------------------------

--
-- Table structure for table `kompetensi_dasar`
--

CREATE TABLE `kompetensi_dasar` (
  `id_kompetensi_dasar` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `ranah` enum('pengetahuan','keterampilan','sikap') NOT NULL,
  `kompetensi_dasar` text NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kompetensi_dasar`
--

INSERT INTO `kompetensi_dasar` (`id_kompetensi_dasar`, `kodejdwl`, `ranah`, `kompetensi_dasar`, `waktu_input`) VALUES
(1, 33, 'pengetahuan', 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisannn.', '2016-07-03 08:10:13'),
(2, 33, 'keterampilan', 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisane.', '2016-07-03 09:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `kode_kurikulum` int(5) NOT NULL,
  `nama_kurikulum` varchar(255) NOT NULL,
  `status_kurikulum` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`kode_kurikulum`, `nama_kurikulum`, `status_kurikulum`) VALUES
(1, 'Kurikulum 2013', 'Ya'),
(2, 'Kurikulum 2016', 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kode_pelajaran` varchar(20) NOT NULL,
  `id_kelompok_mata_pelajaran` int(3) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kode_kurikulum` int(5) NOT NULL,
  `namamatapelajaran` varchar(150) NOT NULL,
  `namamatapelajaran_en` varchar(150) NOT NULL,
  `tingkat` varchar(10) NOT NULL,
  `kompetensi_umum` text NOT NULL,
  `kompetensi_khusus` text NOT NULL,
  `jumlah_jam` varchar(20) NOT NULL,
  `sesi` varchar(50) NOT NULL,
  `urutan` int(3) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kode_pelajaran`, `id_kelompok_mata_pelajaran`, `kode_jurusan`, `nip`, `kode_kurikulum`, `namamatapelajaran`, `namamatapelajaran_en`, `tingkat`, `kompetensi_umum`, `kompetensi_khusus`, `jumlah_jam`, `sesi`, `urutan`, `aktif`) VALUES
('MK01', 1, 'MIPA', '195704111980032004', 1, 'Bahasa Indonesia', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK02', 1, 'IPS', '195806161984000001', 1, 'Matematika', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK03', 2, 'MIPA', '195806161984032002', 1, 'Bahasa Inggris', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK05', 1, 'MIPA', '195806161984000001', 1, 'Aritmatika Dasar', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK04', 3, 'MIPA', '196209051987031007', 1, 'Kalkulus', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK06', 3, 'MIPA', '195806161984000016', 1, 'Pengantar Teknologi', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK07', 1, 'IPS', '195901241986032002', 1, 'Sejarah Indonesia', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK08', 1, 'IPS', '196703011992031006', 1, 'Pendidikan Pancasila', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK09', 1, 'IPS', '196812211997022002', 1, 'Pendidikan Agama', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK10', 2, 'IPS', '196312041987031000', 1, 'Seni Budaya', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK11', 2, 'IPS', '198406142009012003', 1, 'Pendidikan Olahraga', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK12', 2, 'MIPA', '198012112005012005', 1, 'Prakarya Kewirausahaan', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK13', 3, 'IPS', '196305141990032003', 1, 'Geografi', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK14', 3, 'MIPA', '198312252009022007', 1, 'Ekonomi', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK15', 3, 'IPS', '195806161984000002', 1, 'Web Programming', '', '3 (SLTA)', 'Mengenal teknik Pembuatan Web', 'Menguasai Bahasa Pemrograman Web', '3', '', 0, 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `nama_menu` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `urutan` int(3) NOT NULL,
  `status` enum('psb','journal') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `id_parent`, `nama_menu`, `icon`, `link`, `aktif`, `urutan`, `status`) VALUES
(1, 0, 'Beranda', 'home', 'index.mu', 'Ya', 1, 'psb'),
(2, 0, 'Aturan & Prosedur', 'th-list', 'halaman-prosedur-pendaftaran-siswa-baru.mu', 'Ya', 2, 'psb'),
(3, 0, 'Jadwal Pelaksanaan', 'calendar', '#', 'Ya', 3, 'psb'),
(4, 0, 'Alur Pendaftaran', 'retweet', '#', 'Ya', 4, 'psb');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_extrakulikuler`
--

CREATE TABLE `nilai_extrakulikuler` (
  `id_nilai_extrakulikuler` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kegiatan` text NOT NULL,
  `nilai` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_extrakulikuler`
--

INSERT INTO `nilai_extrakulikuler` (`id_nilai_extrakulikuler`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `kegiatan`, `nilai`, `deskripsi`, `user_akses`, `waktu_input`) VALUES
(1, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Mandi-mandii', 87, 'Kegiatan mandi-mandi dilaksanakan di lubuak minturun bersamaan dengan perayaan ulang tahun sekolah.', '1', '2016-04-29 10:11:10'),
(2, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Bakar ayam.', 95, 'Memiliki keterampilan Mengidentifikasi, menyajikan model matematika dan menyelesaikan masalah keseharian.				', '1', '2016-04-29 07:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_keterampilan`
--

CREATE TABLE `nilai_keterampilan` (
  `id_nilai_keterampilan` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kd` varchar(5) NOT NULL,
  `nilai1` float NOT NULL,
  `nilai2` float NOT NULL,
  `nilai3` float NOT NULL,
  `nilai4` float NOT NULL,
  `nilai5` float NOT NULL,
  `nilai6` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_keterampilan`
--

INSERT INTO `nilai_keterampilan` (`id_nilai_keterampilan`, `kodejdwl`, `nisn`, `kd`, `nilai1`, `nilai2`, `nilai3`, `nilai4`, `nilai5`, `nilai6`, `deskripsi`, `user_akses`, `waktu`) VALUES
(1, 5, '9991268756', '4.1', 75, 70, 78, 85, 78, 72, 'Mengabstraksi teks cerita pendek, baik secara lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(2, 5, '9998218087', '1', 88, 90, 98, 96, 0, 0, '', '1', '2016-04-11 18:26:32'),
(3, 5, '9998215055', '1', 67, 98, 76, 90, 0, 0, '', '1', '2016-04-11 18:26:32'),
(4, 5, '9998214335', '1', 87, 88, 0, 0, 0, 0, '', '1', '2016-04-11 18:26:32'),
(5, 5, '9998214151', '1', 89, 0, 0, 90, 0, 0, '', '1', '2016-04-11 18:26:32'),
(6, 5, '9997515863', '1', 89, 80, 88, 0, 0, 0, '', '1', '2016-04-11 18:26:32'),
(7, 5, '9991268756', '4.2', 87, 90, 94, 93, 88, 83, 'Mengabstraksi teks cerita ulang, baik secara lisan maupun tulisan ', '1', '2016-04-14 08:03:27'),
(8, 5, '9998218087', '2', 88, 93, 90, 99, 0, 0, '', '1', '2016-04-14 08:03:27'),
(9, 5, '9998215055', '2', 78, 87, 89, 79, 0, 0, '', '1', '2016-04-14 08:03:27'),
(10, 5, '9991268756', '4.3', 89, 89, 98, 95, 79, 77, 'Mengabstraksi teks pantun, baik secara lisan maupun tulisan', '1', '2016-04-14 08:03:57'),
(11, 5, '9998218087', '3', 78, 87, 89, 88, 0, 0, '', '1', '2016-04-14 08:03:57'),
(12, 5, '9998215055', '3', 70, 78, 87, 90, 0, 0, '', '1', '2016-04-14 08:03:57'),
(13, 5, '9991268756', '4.4', 90, 89, 87, 90, 85, 90, 'Menginterpretasi makna teks pantun, baik secara lisan maupun tulisan ', '1', '2016-04-14 08:04:20'),
(14, 5, '9998218087', '4', 87, 88, 83, 89, 0, 0, '', '1', '2016-04-14 08:04:20'),
(15, 5, '9991268756', '4.5', 99, 87, 98, 95, 96, 91, 'Menyunting teks cerita ulang, sesuai dengan struktur dan kaidah teks baik secara lisan maupun tulisan', '1', '2016-04-14 08:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_pengetahuan`
--

CREATE TABLE `nilai_pengetahuan` (
  `id_nilai_pengetahuan` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kd` varchar(5) NOT NULL,
  `nilai1` float NOT NULL,
  `nilai2` float NOT NULL,
  `nilai3` float NOT NULL,
  `nilai4` float NOT NULL,
  `nilai5` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_pengetahuan`
--

INSERT INTO `nilai_pengetahuan` (`id_nilai_pengetahuan`, `kodejdwl`, `nisn`, `kd`, `nilai1`, `nilai2`, `nilai3`, `nilai4`, `nilai5`, `deskripsi`, `user_akses`, `waktu`) VALUES
(1, 5, '9991268756', '4.1', 89, 90, 89, 95, 90, 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(2, 5, '9998218087', '4.1', 90, 88, 90, 98, 96, 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(3, 5, '9998215055', '', 98, 67, 98, 76, 90, '', '1', '2016-04-11 18:26:32'),
(4, 5, '9998214335', '', 88, 87, 88, 0, 0, '', '1', '2016-04-11 18:26:32'),
(5, 5, '9998214151', '', 0, 89, 0, 0, 90, '', '1', '2016-04-11 18:26:32'),
(6, 5, '9997515863', '', 80, 89, 80, 88, 0, '', '1', '2016-04-11 18:26:32'),
(7, 5, '9991268756', '4.2', 90, 87, 90, 94, 94, 'Membandingkan teks cerita pendek, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:03:27'),
(8, 5, '9998218087', '4.2', 93, 88, 93, 90, 99, 'Menganalisis teks cerita ulang, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:03:27'),
(9, 5, '9998215055', '', 87, 78, 87, 89, 79, '', '1', '2016-04-14 08:03:27'),
(10, 5, '9991268756', '4.3', 89, 89, 89, 98, 95, 'Menganalisis teks pantun, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:03:57'),
(11, 5, '9998218087', '', 87, 78, 87, 89, 88, '', '1', '2016-04-14 08:03:57'),
(12, 5, '9998215055', '', 78, 70, 78, 87, 90, '', '1', '2016-04-14 08:03:57'),
(13, 5, '9991268756', '4.4', 89, 90, 89, 87, 90, 'Membandingkan teks cerita ulang, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:04:20'),
(14, 5, '9998218087', '', 88, 87, 88, 83, 89, '', '1', '2016-04-14 08:04:20'),
(15, 5, '9991268756', '4.5', 87, 90, 87, 78, 90, 'Menganalisis teks cerita ulang, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:04:36'),
(16, 5, '9998218087', '', 98, 99, 98, 89, 90, 'Menganalisis teks pantun, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:04:36'),
(18, 5, '9991268756', '4.6', 90, 89, 90, 98, 78, 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisan', '1', '2016-04-30 10:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_pertanyaan_essai`
--

CREATE TABLE `nilai_pertanyaan_essai` (
  `id_nilai_pertanyaan_essai` int(5) NOT NULL,
  `id_quiz_ujian` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `nilai_essai` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_pertanyaan_essai`
--

INSERT INTO `nilai_pertanyaan_essai` (`id_nilai_pertanyaan_essai`, `id_quiz_ujian`, `nisn`, `nilai_essai`) VALUES
(1, 1, '0000261141', 80),
(2, 4, '0000240365', 70),
(4, 4, '9991268756', 80);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_prestasi`
--

CREATE TABLE `nilai_prestasi` (
  `id_nilai_prestasi` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `jenis_kegiatan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_prestasi`
--

INSERT INTO `nilai_prestasi` (`id_nilai_prestasi`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `jenis_kegiatan`, `keterangan`, `user_akses`, `waktu_input`) VALUES
(2, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Jalan-jalan sore', 'Memiliki keterampilan merencanakan dan melaksanakan percobaan interferensi gelombang cahaya 				', '1', '2016-04-29 08:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_sikap`
--

CREATE TABLE `nilai_sikap` (
  `id_nilai_sikap` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `positif` text NOT NULL,
  `negatif` text NOT NULL,
  `deskripsi` text NOT NULL,
  `status` enum('spiritual','sosial') NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_sikap`
--

INSERT INTO `nilai_sikap` (`id_nilai_sikap`, `kodejdwl`, `nisn`, `positif`, `negatif`, `deskripsi`, `status`, `user_akses`, `waktu`) VALUES
(1, 5, '9999152999', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-18 16:38:53'),
(2, 5, '9998218087', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-18 16:38:53'),
(3, 5, '9999152999', 'Nilai Sosial Posisitf,..', 'Nilai Sosial Negatif,..', 'Nilai Deskripsi Sosial,..', 'sosial', '1', '2016-04-18 16:39:53'),
(4, 5, '9998218087', 'Nilai Sosial Posisitf 2,..', 'Nilai Sosial Negatif 2,..', 'Nilai Deskripsi Sosial 2,..', 'sosial', '1', '2016-04-18 16:39:53'),
(5, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:12:48'),
(6, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:12:48'),
(7, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:05'),
(8, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:05'),
(9, 5, '9998218087', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:05'),
(10, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:34'),
(11, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:34'),
(12, 5, '9998218087', 'Isi dengan Nilai Positif,..', 'Isi dengan Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:34'),
(13, 5, '9999152999', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:34'),
(14, 5, '9991268756', 'Isi dengan Nilai Sosial Posisitf 2,..', 'Isi dengan Nilai Sosial Negatif 2,..', 'Isi dengan Nilai Deskripsi Sosial 2,..', 'sosial', '1', '2016-04-29 20:14:07'),
(15, 5, '9998218087', 'Nilai Sosial Posisitf 2,..', 'Nilai Sosial Negatif 2,..', '', 'sosial', '1', '2016-04-29 20:14:07'),
(16, 5, '9999152999', 'Nilai Sosial Posisitf,..', 'Nilai Sosial Negatif,..', 'Nilai Deskripsi Sosial,..', 'sosial', '1', '2016-04-29 20:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_sikap_semester`
--

CREATE TABLE `nilai_sikap_semester` (
  `id_nilai_sikap_semester` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `spiritual_predikat` varchar(2) NOT NULL,
  `spiritual_deskripsi` text NOT NULL,
  `sosial_predikat` varchar(2) NOT NULL,
  `sosial_deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_sikap_semester`
--

INSERT INTO `nilai_sikap_semester` (`id_nilai_sikap_semester`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `spiritual_predikat`, `spiritual_deskripsi`, `sosial_predikat`, `sosial_deskripsi`, `user_akses`, `waktu_input`) VALUES
(1, 20161, '9991268756', 'X.MIPA.1', 'A', 'Pertahankan Nilai anda,..', 'B', 'Tingkatkan Nilai anda,..', '1', '2016-04-28 10:10:16'),
(2, 20161, '0151379251', 'X.MIPA.1', 'C', 'Tolong Perbaiki Sikap anda,..', 'D', 'Anda Tidak Berutak,..', '1', '2016-04-28 10:10:16'),
(3, 20161, '0004107204', 'X.MIPA.1', 'A', 'Pertahankan Nilai anda,..', 'C', 'Tolong Perbaiki Sikap anda,..', '1', '2016-04-28 10:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_uts`
--

CREATE TABLE `nilai_uts` (
  `id_nilai_uts` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `angka_pengetahuan` float NOT NULL,
  `deskripsi_pengetahuan` text NOT NULL,
  `angka_keterampilan` float NOT NULL,
  `deskripsi_keterampilan` text NOT NULL,
  `waktu_input_uts` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_uts`
--

INSERT INTO `nilai_uts` (`id_nilai_uts`, `kodejdwl`, `nisn`, `angka_pengetahuan`, `deskripsi_pengetahuan`, `angka_keterampilan`, `deskripsi_keterampilan`, `waktu_input_uts`) VALUES
(1, 5, '9991268756', 85, '', 90, '', '2016-04-15 17:54:05'),
(2, 5, '9998218087', 74, '', 83, '', '2016-04-15 17:54:05'),
(3, 13, '9999152999', 89, '', 90, '', '2016-04-21 18:52:57'),
(4, 14, '9999152999', 85, '', 79, '', '2016-04-21 18:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_essai`
--

CREATE TABLE `pertanyaan_essai` (
  `id_pertanyaan_essai` int(11) NOT NULL,
  `id_quiz_ujian` int(5) NOT NULL,
  `pertanyaan_essai` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pertanyaan_essai`
--

INSERT INTO `pertanyaan_essai` (`id_pertanyaan_essai`, `id_quiz_ujian`, `pertanyaan_essai`) VALUES
(1, 1, 'Siapakah Nama Presiden ke 5 Indonesia ?'),
(2, 1, 'Sebutkan Nama-nama Pahlawan Revolusi ?'),
(3, 1, 'Dimanakah Terjadinya Perjanjian Linggarjati ?'),
(5, 2, 'Sebutkan Arti Sila Ke 2 ?'),
(6, 2, 'Siapa Nama Pencipta Lagu Indonesia Raya ?'),
(9, 4, 'Siapa Nama Kepa Sekolah Kita ?'),
(10, 4, 'Berapakah Hasil 234 + 125 ?'),
(11, 5, 'kbkbkjbkjbkbk');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_objektif`
--

CREATE TABLE `pertanyaan_objektif` (
  `id_pertanyaan_objektif` int(11) NOT NULL,
  `id_quiz_ujian` int(11) NOT NULL,
  `pertanyaan_objektif` text NOT NULL,
  `jawab_a` varchar(255) NOT NULL,
  `jawab_b` varchar(255) NOT NULL,
  `jawab_c` varchar(255) NOT NULL,
  `jawab_d` varchar(255) NOT NULL,
  `jawab_e` varchar(255) NOT NULL,
  `kunci_jawaban` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pertanyaan_objektif`
--

INSERT INTO `pertanyaan_objektif` (`id_pertanyaan_objektif`, `id_quiz_ujian`, `pertanyaan_objektif`, `jawab_a`, `jawab_b`, `jawab_c`, `jawab_d`, `jawab_e`, `kunci_jawaban`) VALUES
(1, 1, 'Gubernur Tertua di Sumbar ?', 'Udin Sedunia', 'Saipul Jamil', 'Roma Irama', 'Fauzi Bahar', '', 'd'),
(2, 1, 'Nama-nama Pahlawan Indonesia ?', 'PRABOWO', 'Taufik Hidayat', 'Ahmad Yani', 'Jokowi', '', 'c'),
(3, 1, 'Dimana Terjadinya Pembunuhan Sukarno ?', 'Padang', 'Payakumbuh', 'Bukit Tinggi', 'Semua Benar', '', 'a'),
(5, 1, 'Sebutkan Arti Sila Ke 2 ?', 'Keadilan Bagi Indonedia', 'Kerakyatan yang dipimpin Ndeso', 'Berjuang Untuk Jadi Lebih Baik', 'Kemanusiaan yang adil dan Beradap', '', 'd'),
(6, 4, 'Siapa Nama Pencipta Lagu Indonesia Raya ?', 'Dewiit Safitri', 'Ahmad Dani', 'Aura Kasih', 'Wr.Supratman', '', 'd'),
(8, 4, 'Siapakah nama Presiden ke 2 Indonesia ?', 'Joko Widodo', 'Susilo Bambang Yudoyono', 'Abdulrahman Wahid', 'Megawati', 'Soeharto', 'e');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_penilaian`
--

CREATE TABLE `pertanyaan_penilaian` (
  `id_pertanyaan_penilaian` int(5) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `status` enum('diri','teman') NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pertanyaan_penilaian`
--

INSERT INTO `pertanyaan_penilaian` (`id_pertanyaan_penilaian`, `pertanyaan`, `status`, `waktu_input`) VALUES
(1, 'Bagaimana kenyamanan anda di sekolah ini pada |namamatapelajaran| ?', 'diri', '2016-07-03 04:17:29'),
(2, 'Bagaimana kenyamanan anda tehadap teman di sekolah ini ?', 'diri', '2016-07-03 08:12:17'),
(4, 'Apa perbuatan jahat yang pernah teman anda ini lakukan ?', 'teman', '2016-07-08 05:08:10'),
(5, 'Apakah dia teman yang baik?', 'teman', '2016-07-08 08:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_penilaian_jawab`
--

CREATE TABLE `pertanyaan_penilaian_jawab` (
  `id_pertanyaan_penilaian_jawab` int(10) NOT NULL,
  `id_pertanyaan_penilaian` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `nisn_teman` varchar(20) NOT NULL,
  `jawaban` text NOT NULL,
  `status` enum('diri','teman') NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `waktu_jawab` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pertanyaan_penilaian_jawab`
--

INSERT INTO `pertanyaan_penilaian_jawab` (`id_pertanyaan_penilaian_jawab`, `id_pertanyaan_penilaian`, `nisn`, `nisn_teman`, `jawaban`, `status`, `kode_kelas`, `waktu_jawab`) VALUES
(23, 2, '9991268756', '', 'jjjj', 'diri', 'X.MIPA.1', '2016-07-08 15:57:55'),
(12, 4, '9991268756', '0151379251', 'fff', 'teman', 'X.MIPA.1', '2016-07-08 15:21:34'),
(11, 5, '9991268756', '0151379251', 'eee', 'teman', 'X.MIPA.1', '2016-07-08 15:21:34'),
(15, 5, '9991268756', '0004107204', 'aaaa', 'teman', 'X.MIPA.1', '2016-07-08 15:23:05'),
(16, 4, '9991268756', '0004107204', 'bbbb', 'teman', 'X.MIPA.1', '2016-07-08 15:23:05'),
(17, 5, '9991268756', '9998218087', 'ttt', 'teman', 'X.MIPA.1', '2016-07-08 15:23:34'),
(18, 4, '9991268756', '9998218087', 'yyy', 'teman', 'X.MIPA.1', '2016-07-08 15:23:34'),
(24, 1, '9991268756', '', 'kkkk', 'diri', 'X.MIPA.1', '2016-07-08 15:57:55'),
(25, 5, '9991268756', '0007105659', 'hhh', 'teman', 'X.MIPA.1', '2016-07-08 15:58:39'),
(26, 4, '9991268756', '0007105659', 'nnn', 'teman', 'X.MIPA.1', '2016-07-08 15:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `predikat`
--

CREATE TABLE `predikat` (
  `id_predikat` int(5) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `nilai_a` int(3) NOT NULL,
  `nilai_b` int(3) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `predikat`
--

INSERT INTO `predikat` (`id_predikat`, `kode_kelas`, `nilai_a`, `nilai_b`, `grade`, `keterangan`) VALUES
(1, '0', 86, 100, 'A', 'Sangat Baik'),
(2, '0', 79, 85, 'B', 'Baik'),
(3, '0', 77, 78, 'C', 'Cukup'),
(4, '0', 0, 77, 'D', 'Kurang'),
(7, 'X.MIPA.1', 85, 100, 'A', 'Sangat Baik'),
(8, 'X.MIPA.1', 70, 84, 'B', 'Baik'),
(9, 'X.MIPA.1', 50, 69, 'C', 'Cukup'),
(10, 'X.MIPA.1', 0, 49, 'D', 'Kurang');

-- --------------------------------------------------------

--
-- Table structure for table `psb_aktivasi`
--

CREATE TABLE `psb_aktivasi` (
  `id_aktivasi` int(10) NOT NULL,
  `kode_pendaftaran` varchar(50) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `status` enum('sma','smk','smp') NOT NULL,
  `proses` int(2) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `psb_aktivasi`
--

INSERT INTO `psb_aktivasi` (`id_aktivasi`, `kode_pendaftaran`, `nama_lengkap`, `status`, `proses`, `waktu_input`) VALUES
(1, 'SMA-20160701085110', 'PRABOWO', 'sma', 1, '2016-06-21 12:11:45'),
(2, 'SMK-20160701085110', 'Dewiit Safitri', 'smk', 1, '2016-06-21 15:04:57'),
(3, 'SMA-20160701085111', 'Tommy Utama', 'sma', 1, '2016-07-01 03:13:12'),
(4, 'SMP-20160701094107', 'Willy Fernando', 'smp', 0, '2016-07-01 09:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `psb_pendaftaran`
--

CREATE TABLE `psb_pendaftaran` (
  `id_pendaftaran` int(10) NOT NULL,
  `kode_pendaftaran` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nama_panggilan` varchar(120) NOT NULL,
  `no_induk` varchar(50) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_agama` int(5) NOT NULL,
  `anak_ke` varchar(10) NOT NULL,
  `jumlah_saudara` varchar(10) NOT NULL,
  `status_dalam_keluarga` varchar(100) NOT NULL,
  `alamat_siswa` text NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `berat_badan` int(5) NOT NULL,
  `tinggi_badan` int(5) NOT NULL,
  `golongan_darah` varchar(5) NOT NULL,
  `penyakit_pernah_diderita` varchar(255) NOT NULL,
  `diterima_dikelas` varchar(50) NOT NULL,
  `diterima_tanggal` date NOT NULL,
  `sekolah_asal` varchar(255) NOT NULL,
  `alamat_sekolah_asal` text NOT NULL,
  `nama_ayah` varchar(150) NOT NULL,
  `tempat_lahir_ayah` text NOT NULL,
  `tanggal_lahir_ayah` date NOT NULL,
  `agama_ayah` int(5) NOT NULL,
  `pendidikan_ayah` varchar(100) NOT NULL,
  `pekerjaan_ayah` varchar(255) NOT NULL,
  `alamat_rumah_ayah` text NOT NULL,
  `telpon_rumah_ayah` varchar(15) NOT NULL,
  `alamat_kantor_ayah` text NOT NULL,
  `telpon_kantor_ayah` varchar(15) NOT NULL,
  `nama_ibu` varchar(150) NOT NULL,
  `tempat_lahir_ibu` text NOT NULL,
  `tanggal_lahir_ibu` date NOT NULL,
  `agama_ibu` int(5) NOT NULL,
  `pendidikan_ibu` varchar(100) NOT NULL,
  `pekerjaan_ibu` varchar(255) NOT NULL,
  `alamat_rumah_ibu` text NOT NULL,
  `telpon_rumah_ibu` varchar(15) NOT NULL,
  `alamat_kantor_ibu` text NOT NULL,
  `telpon_kantor_ibu` varchar(15) NOT NULL,
  `nama_wali` varchar(150) NOT NULL,
  `alamat_wali` text NOT NULL,
  `no_telpon_wali` varchar(15) NOT NULL,
  `status` enum('sma','smk','smp') NOT NULL,
  `waktu_daftar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `psb_pendaftaran`
--

INSERT INTO `psb_pendaftaran` (`id_pendaftaran`, `kode_pendaftaran`, `nama`, `nama_panggilan`, `no_induk`, `id_jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `id_agama`, `anak_ke`, `jumlah_saudara`, `status_dalam_keluarga`, `alamat_siswa`, `no_telpon`, `berat_badan`, `tinggi_badan`, `golongan_darah`, `penyakit_pernah_diderita`, `diterima_dikelas`, `diterima_tanggal`, `sekolah_asal`, `alamat_sekolah_asal`, `nama_ayah`, `tempat_lahir_ayah`, `tanggal_lahir_ayah`, `agama_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `alamat_rumah_ayah`, `telpon_rumah_ayah`, `alamat_kantor_ayah`, `telpon_kantor_ayah`, `nama_ibu`, `tempat_lahir_ibu`, `tanggal_lahir_ibu`, `agama_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `alamat_rumah_ibu`, `telpon_rumah_ibu`, `alamat_kantor_ibu`, `telpon_kantor_ibu`, `nama_wali`, `alamat_wali`, `no_telpon_wali`, `status`, `waktu_daftar`) VALUES
(1, 'SMA-20160701085110', 'PRABOWO', 'Robby', '5675345', 1, 'Padang', '1989-06-05', 1, '3', '5', 'Anak Kandung', 'Jl. Angkasa Puri, Perundam 4, Blok C No 2', '081267771344', 75, 170, 'O', 'Tdak Pernah', '1', '2016-06-22', 'SMP N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Nafnizon (Alm)', 'Payakumbuh', '1975-04-12', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0752461692', 'Muro Paiti, Kapur IX', '0752786512', 'Yeni Ermawaty', 'Padang', '1974-01-18', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0752461692', '-', '0', 'Tommy Utama', 'Jl.Ulak Karang Padang', '081266881226', 'sma', '2016-06-22 12:11:45'),
(3, 'SMK-20160701085110', 'Dewiit Safitri', 'Dewi', '5674322', 1, 'Gumarang', '1989-02-12', 1, '3', '5', 'Anak Kandung', 'Jl. Linggar Jati, Padang', '082173054501', 60, 170, 'AB', 'Tdak Pernah', '1', '2016-06-22', 'SMP N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Sukarni', 'Gumarang', '1976-12-01', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0753456790', 'Muro Paiti, Kapur IX', '0753445566', 'Mama Dewi', 'Gumarang', '1973-11-11', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0753456790', '-', '0', 'Adeil Putra', 'Jl.Ulak Karang, Padang', '082190871234', 'smk', '2016-06-22 15:04:57'),
(5, 'SMA-20160701085111', 'Tommy Utama', 'Tommy', '5674327', 1, 'Padang', '1985-08-18', 1, '1', '5', 'Anak Kandung', 'Jl. Simpang DPR, Padang', '081266881226', 70, 160, 'AB', 'Tdak Pernah', '1', '2016-07-01', 'SMA N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Sunandar', 'Payakumbuh', '0004-12-05', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0752461645', 'Muro Paiti, Kapur IX', '0752897855', 'Yunimar', 'Padang', '0000-00-00', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0752461645', '-', '0', 'Willy Fernando', 'Jl.Ulak Karang, Padang', '082167771233', 'sma', '2016-07-01 11:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `psb_pendaftaran_saudara`
--

CREATE TABLE `psb_pendaftaran_saudara` (
  `id_saudara` int(10) NOT NULL,
  `id_pendaftaran` int(10) NOT NULL,
  `nama_saudara` varchar(150) NOT NULL,
  `umur_saudara` int(5) NOT NULL,
  `pendidikan_saudara` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `psb_pendaftaran_saudara`
--

INSERT INTO `psb_pendaftaran_saudara` (`id_saudara`, `id_pendaftaran`, `nama_saudara`, `umur_saudara`, `pendidikan_saudara`) VALUES
(1, 1, 'Willy Fernando', 29, 'S1'),
(2, 1, 'Randy Komara', 25, 'SMA'),
(3, 1, 'Laura Hikmah Izzatin', 18, 'SMA'),
(4, 3, 'Lira Virna', 15, 'SMP'),
(5, 3, 'Airin Stewano', 13, 'SD'),
(10, 5, 'Randy Komara', 25, 'SMA'),
(9, 5, 'Willy Fernando', 28, 'S1'),
(11, 5, 'Laura Hikmah Izzatin', 19, 'SMA');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_ujian`
--

CREATE TABLE `quiz_ujian` (
  `id_quiz_ujian` int(5) NOT NULL,
  `id_kategori_quiz_ujian` int(5) NOT NULL,
  `kodejdwl` int(5) NOT NULL,
  `keterangan` text NOT NULL,
  `batas_waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `quiz_ujian`
--

INSERT INTO `quiz_ujian` (`id_quiz_ujian`, `id_kategori_quiz_ujian`, `kodejdwl`, `keterangan`, `batas_waktu`) VALUES
(4, 1, 5, 'Quiz Online Nilai Akhir Matematika', '2016-04-25 08:54:42'),
(5, 1, 5, 'hhhb', '2016-03-11 16:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `rapor`
--

CREATE TABLE `rapor` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `id_pkbm` varchar(50) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rapor`
--

INSERT INTO `rapor` (`id`, `name`, `id_siswa`, `keterangan`, `id_pkbm`, `mime_type`, `size`, `created_at`) VALUES
(30, '873-Article Text-3555-1-10-20230702 (2).pdf', 1289, 'SASA RAPORT SEMESTER 1 KPB', 'P2964419', 'application/pdf', 430343, '2024-03-19 04:46:26'),
(31, '1 Jadwal Sempro 31 Jan 2024.pdf', 1279, 'semester 1 paket A', '9218814438', 'application/pdf', 76590, '2024-03-19 08:39:08'),
(32, '1 Jadwal Sempro 31 Jan 2024.pdf', 1281, 'semester 1 paket A', '9218814438', 'application/pdf', 76590, '2024-03-20 04:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `kode_ruangan` varchar(10) NOT NULL,
  `kode_gedung` varchar(10) NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `kapasitas_belajar` int(5) NOT NULL,
  `kapasitas_ujian` int(5) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kode_ruangan`, `kode_gedung`, `nama_ruangan`, `kapasitas_belajar`, `kapasitas_ujian`, `keterangan`, `aktif`) VALUES
('R001', 'G001', 'A.1', 35, 30, '', ''),
('R002', 'G001', 'A.2', 40, 35, '', ''),
('R003', 'G002', 'B.1', 34, 29, '', ''),
('R004', 'G002', 'B.2', 45, 40, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sesi`
--

CREATE TABLE `sesi` (
  `id_sesi` int(5) NOT NULL,
  `nama_sesi` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sesi`
--

INSERT INTO `sesi` (`id_sesi`, `nama_sesi`, `keterangan`, `aktif`) VALUES
(1, 'Semester 1', '', 'Ya'),
(2, 'Semester 2', '', 'Ya'),
(3, 'Semester 3', '', 'Ya'),
(4, 'Semester 4', '', 'Ya'),
(5, 'Semester 5', '', 'Ya'),
(6, 'Semester 6', '', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(10) NOT NULL,
  `pkbm` varchar(50) NOT NULL,
  `id_paket` varchar(50) NOT NULL,
  `id_tahun_akademik` varchar(50) DEFAULT NULL,
  `nipd` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(120) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` varchar(50) NOT NULL,
  `id_agama` int(5) NOT NULL,
  `kebutuhan_khusus` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `dusun` varchar(100) NOT NULL,
  `kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `jenis_tinggal` varchar(100) NOT NULL,
  `alat_transportasi` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `skhun` varchar(50) NOT NULL,
  `penerima_kps` varchar(20) NOT NULL,
  `no_kps` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `nama_ayah` varchar(150) NOT NULL,
  `tahun_lahir_ayah` int(4) NOT NULL,
  `pendidikan_ayah` varchar(50) NOT NULL,
  `pekerjaan_ayah` varchar(100) NOT NULL,
  `penghasilan_ayah` varchar(100) NOT NULL,
  `kebutuhan_khusus_ayah` varchar(100) NOT NULL,
  `no_telpon_ayah` varchar(15) NOT NULL,
  `nama_ibu` varchar(150) NOT NULL,
  `tahun_lahir_ibu` int(4) NOT NULL,
  `pendidikan_ibu` varchar(50) NOT NULL,
  `pekerjaan_ibu` varchar(100) NOT NULL,
  `penghasilan_ibu` varchar(100) NOT NULL,
  `kebutuhan_khusus_ibu` varchar(100) NOT NULL,
  `no_telpon_ibu` varchar(15) NOT NULL,
  `nama_wali` varchar(150) NOT NULL,
  `tahun_lahir_wali` int(4) NOT NULL,
  `pendidikan_wali` varchar(50) NOT NULL,
  `pekerjaan_wali` varchar(100) NOT NULL,
  `penghasilan_wali` varchar(50) NOT NULL,
  `angkatan` int(5) NOT NULL,
  `status_awal` varchar(20) NOT NULL,
  `status_siswa` enum('Aktif','Tidak Aktif') NOT NULL,
  `tingkat` varchar(10) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `id_sesi` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `pkbm`, `id_paket`, `id_tahun_akademik`, `nipd`, `password`, `nama`, `id_jenis_kelamin`, `nisn`, `tempat_lahir`, `tanggal_lahir`, `nik`, `id_agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `telepon`, `hp`, `email`, `skhun`, `penerima_kps`, `no_kps`, `foto`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `kebutuhan_khusus_ayah`, `no_telpon_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `kebutuhan_khusus_ibu`, `no_telpon_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `status_awal`, `status_siswa`, `tingkat`, `kode_kelas`, `kode_jurusan`, `id_sesi`) VALUES
(1280, 'P9970294', '32', '23', '1986011320', 'ss', 'Ardan Fahmi', 0, '123', '', '0000-00-00', '342', 0, '', 'salatiga', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 1, '', 'Aktif', '', '1', '1', 0),
(1279, '9218814438', '31', '20163', '12345', 'ws', 'ABDUL HOPUR ROHIM', 0, '12', '', '0000-00-00', '23', 0, '', 'Pati', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 1, '', 'Aktif', '', '1', '1', 0),
(1290, 'P9970512', '40', '0', '240420', 'PBx2024', 'Abdul Aziz', 1, '1234567891', 'Salatiga', '0000-00-00', '1234567891012131', 1, '', 'Tingkir', '02', '03', 'Tingkir Lor', 'Tingkir', 'Tingkir', 50722, '', 'Sepeda motor', '', '', 'abdul@piwulangbecik.org', '', '', '', '20240320082501-cova.png', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, 'Siswa Baru', 'Aktif', '', '', '', 0),
(1275, '9218814438', '31', '20163', '1988041320', 'ss', 'Abrisam Reynard Rafizqy', 0, '43', '', '0000-00-00', '', 0, '', 'salatiga', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', '', '', 0),
(1287, '9218814438', '28', '20163', '16670007', 'siswa', 'Anam tes', 0, '16670007', 'Kemiri', '0000-00-00', '3', 0, '', 'ds', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', '', '', 0),
(1288, '9218814438', '28', '20163', '16670008', 'siswa', 'Ninik Tes', 0, '16670008', 'Tlutup', '0000-00-00', '4', 0, '', 'dff', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', '', '', 0),
(1289, 'P2964419', '35', '1', '1234', '', 'SASA', 0, '0051075422', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', 'filenamee', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 1, '', 'Aktif', '', '1', '1', 0),
(1278, '9218814438', '31', '20163', '098705', '098705', 'ADIPATI NARENDRA', 0, '098705', '', '0000-00-00', '', 0, '', 'salatiga', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', '', '', 0),
(1285, '9218814438', '30', '20163', '1234567', 'siswa', 'a1', 0, '2', 'Pati', '0000-00-00', '3', 0, '', 'ds', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 0, '', 'Aktif', '', '', '', 0),
(1281, '9218814438', '31', '20163', '1234', '1', 'ABIMANYU DAMAR WICAKSONO', 1, '0051075422', 'SALATIGA', '0000-00-00', '3373030805050002', 1, '0', 'PAMOT', '01', '02', 'PAMOT', 'NOBOREJO', 'ARGOMULYO ', 50389, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 1, 'masuk dari kelas 1 s', 'Aktif', '', '1', '1', 0),
(1291, 'P9996669', '41', '-3', '1234', '', 'Ayu', 0, '', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 1, '', 'Aktif', '', '1', '1', 0),
(1292, '9218814438', '30', '-2', '1234', '', 'siti', 0, '0051075422', '', '0000-00-00', '', 0, '', '', '00', '00', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 1, '', 'Aktif', '', '1', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id_sms` int(5) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_autoreply`
--

CREATE TABLE `sms_autoreply` (
  `id_autoreply` int(5) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `isi_pesan` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sms_autoreply`
--

INSERT INTO `sms_autoreply` (`id_autoreply`, `keyword`, `isi_pesan`, `waktu`) VALUES
(1, 'REG INFO', 'Diharapkan kepada semua orang tua lebih memperhatikan pergaulan anak-anaknya.', '2016-04-23 08:16:22'),
(2, 'REG KEGIATAN', 'Kegiatan Pramuka 27-04-2016, Kegiatan Paskibra 12-05-2016, Kegiatan Maraton Bersama Guru 16-05-2016.', '2016-04-23 09:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `sms_inbox`
--

CREATE TABLE `sms_inbox` (
  `id` int(11) NOT NULL,
  `pesan` text DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `modem` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_outbox`
--

CREATE TABLE `sms_outbox` (
  `id_outbox` int(5) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `pesan` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_keaktifan`
--

CREATE TABLE `status_keaktifan` (
  `id_status_keaktifan` int(5) NOT NULL,
  `nama_status_keaktifan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `status_keaktifan`
--

INSERT INTO `status_keaktifan` (`id_status_keaktifan`, `nama_status_keaktifan`, `keterangan`) VALUES
(1, 'Aktif', ''),
(2, 'Tidak Aktif', '');

-- --------------------------------------------------------

--
-- Table structure for table `status_kepegawaian`
--

CREATE TABLE `status_kepegawaian` (
  `id_status_kepegawaian` int(5) NOT NULL,
  `status_kepegawaian` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `status_kepegawaian`
--

INSERT INTO `status_kepegawaian` (`id_status_kepegawaian`, `status_kepegawaian`, `keterangan`) VALUES
(1, 'Tenaga Honor Sekolah\n', ''),
(2, 'Guru Honor Sekolah\n', ''),
(3, 'PNS\r\n', ''),
(4, 'GTY/PTY\r\n', ''),
(5, 'CPNS\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `status_pernikahan`
--

CREATE TABLE `status_pernikahan` (
  `id_status_pernikahan` int(5) NOT NULL,
  `status_pernikahan` varchar(150) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `status_pernikahan`
--

INSERT INTO `status_pernikahan` (`id_status_pernikahan`, `status_pernikahan`, `keterangan`) VALUES
(1, 'Menikah', ''),
(2, 'Belum Menikah', '');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id_tahun_akademik` int(5) NOT NULL,
  `id_pkbm` varchar(255) DEFAULT NULL,
  `nama_tahun` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`id_tahun_akademik`, `id_pkbm`, `nama_tahun`, `keterangan`, `aktif`) VALUES
(12, NULL, 'Tugas 1', 'Reguler', 'Ya'),
(20162, NULL, 'Semester Genap 2016/2017', '2016/2017', 'Ya'),
(20163, '9218814438', '2023/2024', '', 'Ya'),
(1, 'P2964419', '2024/2025', 'V', 'Ya'),
(280000, '1', 'ee', 'ee', 'Ya'),
(23, 'P9970294', '2024/2025', 'Reguler', 'Ya'),
(2, '9218814438', '2024/2025', '', 'Ya'),
(-3, 'P9996669', '2023/2024', '', 'Ya'),
(-2, '9218814438', '2022/2023', '', 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(5) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `jabatan` varchar(150) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'sekolah',
  `aktif` enum('Y','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `email`, `no_telpon`, `jabatan`, `level`, `aktif`) VALUES
(1, 'admin', 'bff0cc42103de1b4721370e84dc24f635a7afeca41198c9b3e03946a1b6b7191d14356408a5e57ce6daf77e6e800c66fac7ab0482d57d48d23e6808e4b562daa', 'Administrator', 'admin@sman3bukittinggi.sch.id', '081267771344', 'Kepala IT', 'superuser', 'Y'),
(2, '196209051987031007', '4f0a97824fd9e90d98c09e68bb726b3427937c8aca281839dc59288176f7f84e29a40706d5dba42b8be88a3734be353d34cd8257545b4828bc02b765fd6bb279', 'Drs. Amri Jaya, M.Pd', 'amri.jaya@gmail.com', '082173054501', 'Kepala Sekolah', 'kepala', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `users_aktivitas`
--

CREATE TABLE `users_aktivitas` (
  `id_users_aktivitas` int(10) NOT NULL,
  `identitas` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `browser` varchar(50) NOT NULL,
  `os` varchar(50) NOT NULL,
  `status` enum('siswa','guru','superuser') NOT NULL,
  `jam` time NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_aktivitas`
--

INSERT INTO `users_aktivitas` (`id_users_aktivitas`, `identitas`, `ip_address`, `browser`, `os`, `status`, `jam`, `tanggal`) VALUES
(1, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '10:59:57', '2016-04-13'),
(2, '9991268756', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:00:27', '2016-04-13'),
(3, '9994030915', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:01:44', '2016-04-14'),
(4, '9975540740', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:20:43', '2016-04-14'),
(5, '195901241986032002', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '11:21:04', '2016-04-14'),
(6, '0006223671', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:18:06', '2016-04-15'),
(7, '195912121986021004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:32', '2016-04-15'),
(8, '197110292005011003', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:40', '2016-04-15'),
(9, '196109191988031006', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:49', '2016-04-16'),
(10, '196202191990032001', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:19:02', '2016-04-16'),
(11, '9999344284', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:24', '2016-04-16'),
(12, '9980725248', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:32', '2016-04-16'),
(13, '0006223671', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:42', '2016-04-16'),
(14, '2', '', ' Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:13:43', '2016-04-23'),
(15, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:15:28', '2016-04-23'),
(16, '1', '', ' Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:27:20', '2016-04-23'),
(17, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:34:28', '2016-04-23'),
(18, '9980708111', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '06:36:21', '2016-04-23'),
(19, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:37:05', '2016-04-23'),
(20, '9994030915', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '06:41:40', '2016-04-23'),
(21, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:43:49', '2016-04-23'),
(22, '9991268756', '::1', 'Firefox 46.0', 'Windows 7', 'siswa', '06:46:06', '2016-04-23'),
(23, '1', '', ' Chrome 49.0.2623.112', 'Windows 7', 'superuser', '07:02:03', '2016-04-23'),
(24, '9980708111', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:21:03', '2016-04-23'),
(25, '9980720559', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:21:21', '2016-04-23'),
(26, '9991268756', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:22:01', '2016-04-23'),
(27, '9999152999', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:29:17', '2016-04-23'),
(28, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '08:40:14', '2016-04-23'),
(29, '1', '', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '08:45:52', '2016-04-23'),
(30, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:13:18', '2016-04-16'),
(31, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '03:12:26', '2016-04-15'),
(32, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:13:18', '2016-04-14'),
(33, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '03:12:26', '2016-04-13'),
(34, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '07:13:18', '2016-04-14'),
(35, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '05:12:26', '2016-04-13'),
(36, '1', '36.68.12.49', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '10:32:19', '2016-04-23'),
(48, '1', '114.4.79.250', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '15:08:36', '2016-04-27'),
(47, '1', '36.84.224.134', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:17:00', '2016-04-27'),
(40, '195704111980032004', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '07:50:45', '2016-04-27'),
(41, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '07:54:08', '2016-04-27'),
(42, '9980708111', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '07:55:08', '2016-04-27'),
(43, '9980722436', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '07:55:23', '2016-04-27'),
(44, '198605012009011001', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '07:55:38', '2016-04-27'),
(45, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '07:55:51', '2016-04-27'),
(46, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '08:01:10', '2016-04-27'),
(49, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '20:16:59', '2016-04-27'),
(50, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '08:27:54', '2016-04-28'),
(51, '198710052010012011', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:41:56', '2016-04-28'),
(52, '195704111980032004', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:42:15', '2016-04-28'),
(53, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '13:12:06', '2016-04-28'),
(54, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '13:30:48', '2016-04-28'),
(55, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '19:15:10', '2016-04-28'),
(56, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:02:22', '2016-04-29'),
(57, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '22:37:57', '2016-04-29'),
(58, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '22:41:40', '2016-04-29'),
(59, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '23:09:20', '2016-04-29'),
(60, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '23:20:06', '2016-04-29'),
(61, '195704111980032004', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:14:36', '2016-04-30'),
(62, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '06:14:55', '2016-04-30'),
(63, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:18:35', '2016-04-30'),
(64, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:19:47', '2016-04-30'),
(65, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:00:28', '2016-04-30'),
(66, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '10:01:25', '2016-04-30'),
(67, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:01:44', '2016-04-30'),
(68, '2', '::1', 'Chrome 50.0.2661.87', 'Windows 7', '', '10:02:29', '2016-04-30'),
(69, '196209051987031007', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:02:51', '2016-04-30'),
(70, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:37:52', '2016-04-30'),
(71, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:58:18', '2016-04-30'),
(72, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '12:57:17', '2016-04-30'),
(74, '1', '::1', 'Chrome 50.0.2661.94', 'Windows 7', 'superuser', '20:17:11', '2016-05-04'),
(75, '1', '::1', 'Chrome 50.0.2661.94', 'Windows 7', 'superuser', '22:34:59', '2016-05-11'),
(76, '1', '::1', 'Chrome 50.0.2661.102', 'Windows 7', 'superuser', '07:21:10', '2016-06-02'),
(77, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '22:52:32', '2016-06-19'),
(78, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:06:29', '2016-06-22'),
(79, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:45:59', '2016-06-22'),
(80, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '07:40:52', '2016-06-23'),
(81, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:41:34', '2016-06-23'),
(82, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '04:56:37', '2016-06-29'),
(83, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '08:46:48', '2016-07-01'),
(84, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:32:49', '2016-07-02'),
(85, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:37:49', '2016-07-03'),
(86, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:24:00', '2016-07-04'),
(87, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '12:24:55', '2016-07-04'),
(88, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:38:17', '2016-07-04'),
(89, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '16:41:51', '2016-07-04'),
(90, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:45:25', '2016-07-05'),
(91, '195704111980032004', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '09:59:50', '2016-07-05'),
(92, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '10:12:22', '2016-07-05'),
(93, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '10:34:34', '2016-07-05'),
(94, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '08:09:08', '2016-07-08'),
(95, '195806161984000002', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '11:15:49', '2016-07-08'),
(96, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:32:28', '2016-07-08'),
(97, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:30:18', '2016-07-08'),
(98, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '13:31:00', '2016-07-08'),
(99, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:49:22', '2016-07-08'),
(100, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '13:50:02', '2016-07-08'),
(101, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:27:03', '2016-07-08'),
(102, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '15:54:51', '2016-07-08'),
(103, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:36:38', '2016-07-09'),
(104, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '06:12:14', '2016-07-09'),
(105, '2', '::1', 'Chrome 51.0.2704.103', 'Windows 7', '', '06:18:50', '2016-07-09'),
(106, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:27:53', '2016-07-09'),
(107, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:57:52', '2016-07-09'),
(108, '195806161984000002', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '07:01:50', '2016-07-09'),
(109, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:41:14', '2016-07-10'),
(110, '195806161984000001', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'guru', '17:47:13', '2018-01-22'),
(111, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '17:51:31', '2018-01-22'),
(112, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '17:54:24', '2018-01-22'),
(113, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '12:50:32', '2018-01-24'),
(114, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '13:00:21', '2018-01-24'),
(115, '1', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'superuser', '14:14:56', '2024-02-14'),
(116, '1', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'superuser', '14:18:53', '2024-02-14'),
(117, '1', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'superuser', '11:38:55', '2024-02-17'),
(118, '1', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'superuser', '11:41:37', '2024-02-17'),
(119, '197712282006042005', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'guru', '11:43:06', '2024-02-17'),
(120, '197712282006042005', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'guru', '12:21:12', '2024-02-17'),
(121, '197712282006042005', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'guru', '12:23:19', '2024-02-17'),
(122, '9218814438', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'guru', '13:47:54', '2024-02-17'),
(123, '1', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'superuser', '17:01:52', '2024-02-17'),
(124, '9218814438', '::1', 'Chrome 121.0.0.0', 'Windows 10', 'guru', '17:03:27', '2024-02-17'),
(125, '1', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '09:41:05', '2024-02-24'),
(126, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '14:10:24', '2024-02-26'),
(127, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '14:28:21', '2024-02-26'),
(128, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '14:11:34', '2024-03-01'),
(129, '1', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '14:46:44', '2024-03-01'),
(130, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '14:48:25', '2024-03-01'),
(131, '1', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '15:05:20', '2024-03-01'),
(132, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '15:07:02', '2024-03-01'),
(133, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '06:44:23', '2024-03-02'),
(134, '1', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '08:27:42', '2024-03-02'),
(135, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '08:30:36', '2024-03-02'),
(136, '1', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '23:09:09', '2024-03-02'),
(137, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '23:10:47', '2024-03-02'),
(138, '9218814438', '::1', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '18:36:03', '2024-03-03'),
(139, '9218814438', '203.89.29.230', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '20:01:20', '2024-03-03'),
(140, '9218814438', '36.71.85.176', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '10:20:33', '2024-03-04'),
(141, '9218814438', '36.71.85.176', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '11:36:26', '2024-03-04'),
(142, '1', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '11:52:14', '2024-03-04'),
(143, '1', '36.71.85.176', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '12:21:19', '2024-03-04'),
(144, '9218814438', '36.71.85.176', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '13:43:44', '2024-03-04'),
(145, '9218814438', '103.98.176.163', 'Firefox 122.0', 'Windows 10', 'guru', '14:59:47', '2024-03-04'),
(146, '1', '103.98.176.163', 'Firefox 122.0', 'Windows 10', 'superuser', '15:49:02', '2024-03-04'),
(147, '1', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '12:17:50', '2024-03-05'),
(148, '1', '103.98.176.163', 'Firefox 123.0', 'Windows 10', 'superuser', '12:19:58', '2024-03-05'),
(149, '1', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '12:21:39', '2024-03-05'),
(150, '9218814438', '114.10.121.219', 'Handheld ', 'Android', 'guru', '15:04:46', '2024-03-05'),
(151, '9218814438', '36.71.85.176', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '15:08:17', '2024-03-05'),
(152, '1', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '17:42:34', '2024-03-05'),
(153, '9218814438', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '17:43:16', '2024-03-05'),
(154, '1', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '20:40:31', '2024-03-05'),
(155, 'P9970294', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '20:43:12', '2024-03-05'),
(156, 'P9970294', '36.80.185.23', 'Firefox 123.0', 'Windows 10', 'guru', '20:47:20', '2024-03-05'),
(157, '9218814438', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '00:39:20', '2024-03-06'),
(158, '1', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '00:42:05', '2024-03-06'),
(159, '9218814438', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '00:45:05', '2024-03-06'),
(160, '9218814438', '36.71.85.176', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '09:00:06', '2024-03-06'),
(161, '9218814438', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '12:23:11', '2024-03-06'),
(162, 'P9970294', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '12:23:37', '2024-03-06'),
(163, 'P9970294', '36.71.82.179', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '20:58:32', '2024-03-06'),
(164, '1', '36.71.82.179', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '21:36:01', '2024-03-06'),
(165, '9218814438', '36.71.82.179', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '21:43:15', '2024-03-06'),
(166, '1', '36.71.82.179', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '21:44:34', '2024-03-06'),
(167, '9218814438', '36.71.82.179', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '21:55:01', '2024-03-06'),
(168, '1', '36.71.82.179', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '22:25:33', '2024-03-06'),
(169, '9218814438', '36.71.82.179', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '22:45:09', '2024-03-06'),
(170, '1', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '00:54:50', '2024-03-07'),
(171, 'P9970294', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '00:55:49', '2024-03-07'),
(172, '1', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '01:00:25', '2024-03-07'),
(173, '9218814438', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '01:04:55', '2024-03-07'),
(174, 'P9934634', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '01:05:16', '2024-03-07'),
(175, '1', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '01:05:35', '2024-03-07'),
(176, 'P2964421', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '01:22:48', '2024-03-07'),
(177, 'P9934611', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '01:26:20', '2024-03-07'),
(178, '1', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '01:30:31', '2024-03-07'),
(179, '1', '36.80.185.23', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '01:37:37', '2024-03-07'),
(180, 'P9934490', '114.10.124.143', 'Handheld ', 'Android', 'guru', '09:37:21', '2024-03-07'),
(181, '1', '103.230.100.50', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '09:55:26', '2024-03-07'),
(182, '9218814438', '103.230.100.50', 'Chrome 109.0.0.0', 'Windows 10', 'guru', '10:22:07', '2024-03-07'),
(183, '9218814438', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '14:11:53', '2024-03-07'),
(184, '9218814438', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '17:48:37', '2024-03-07'),
(185, '1', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '17:56:59', '2024-03-07'),
(186, '9218814438', '36.71.80.151', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '20:19:58', '2024-03-07'),
(187, '1', '103.230.100.50', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '07:47:23', '2024-03-08'),
(188, 'P9934634', '36.71.81.48', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '08:16:13', '2024-03-08'),
(189, '1', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '08:16:44', '2024-03-08'),
(190, 'P9934490', '103.131.18.13', 'Chrome 121.0.0.0', 'Windows 10', 'guru', '08:17:01', '2024-03-08'),
(191, '9218814438', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '08:20:57', '2024-03-08'),
(192, '9218814438', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '08:30:20', '2024-03-08'),
(193, '1', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '08:36:41', '2024-03-08'),
(194, '9218814438', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '08:38:42', '2024-03-08'),
(195, 'P9934490', '103.131.18.13', 'Firefox 123.0', 'Windows 10', 'guru', '08:46:17', '2024-03-08'),
(196, '1', '103.98.176.163', 'Firefox 123.0', 'Windows 10', 'superuser', '10:01:46', '2024-03-13'),
(197, '9218814438', '103.98.176.163', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '09:18:49', '2024-03-15'),
(198, '9218814438', '114.10.9.224', 'Handheld ', 'Android', 'guru', '11:40:40', '2024-03-16'),
(199, '9218814438', '36.80.206.118', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '17:47:39', '2024-03-16'),
(200, '9218814438', '36.80.206.118', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '09:22:18', '2024-03-17'),
(201, '1', '36.80.206.118', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '10:05:54', '2024-03-17'),
(202, '9218814438', '36.80.206.118', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '10:08:00', '2024-03-17'),
(203, '9218814438', '36.80.206.118', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '11:10:11', '2024-03-17'),
(204, '1', '36.80.206.118', 'Chrome 122.0.0.0', 'Windows 10', 'superuser', '11:32:20', '2024-03-17'),
(205, 'P9934634', '36.71.81.44', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '14:32:38', '2024-03-18'),
(206, 'P9934621', '103.47.135.75', 'Chrome 109.0.0.0', 'Windows 10', 'guru', '07:56:34', '2024-03-19'),
(207, 'P9934611', '182.253.89.55', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '09:00:35', '2024-03-19'),
(208, '9218814438', '182.253.89.55', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '09:17:00', '2024-03-19'),
(209, '9218814438', '114.10.20.4', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '10:21:19', '2024-03-19'),
(210, 'P2964419', '103.47.135.81', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '11:29:29', '2024-03-19'),
(211, 'P9934605', '114.10.10.206', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '15:29:14', '2024-03-19'),
(212, '9218814438', '114.10.10.206', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '15:34:49', '2024-03-19'),
(213, 'P9970512', '36.71.83.57', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '08:08:38', '2024-03-20'),
(214, 'P9996669', '36.71.82.112', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '09:07:01', '2024-03-20'),
(215, '9218814438', '114.10.18.101', 'Chrome 123.0.0.0', 'Windows 10', 'guru', '11:35:43', '2024-03-20'),
(216, '9218814438', '180.254.31.127', 'Chrome 122.0.0.0', 'Windows 10', 'guru', '21:46:11', '2024-03-21'),
(217, '9218814438', '180.243.41.66', 'Chrome 123.0.0.0', 'Windows 10', 'guru', '14:18:17', '2024-03-31'),
(218, '9218814438', '103.98.176.164', 'Chrome 123.0.0.0', 'Windows 10', 'guru', '10:59:58', '2024-04-03'),
(219, 'P9970512', '182.2.38.211', 'Chrome 123.0.0.0', 'Windows 10', 'guru', '10:00:25', '2024-04-15'),
(220, '9218814438', '180.243.43.177', 'Chrome 124.0.0.0', 'Windows 10', 'guru', '13:42:09', '2024-05-04'),
(221, 'P9970294', '36.71.80.67', 'Chrome 124.0.0.0', 'Windows 10', 'guru', '14:24:00', '2024-05-09'),
(222, '9218814438', '103.98.176.164', 'Chrome 124.0.0.0', 'Windows 10', 'guru', '12:15:38', '2024-05-13'),
(223, '9218814438', '103.98.176.164', 'Chrome 124.0.0.0', 'Windows 10', 'guru', '18:26:02', '2024-05-13'),
(224, '9218814438', '36.71.84.138', 'Chrome 124.0.0.0', 'Windows 10', 'guru', '17:49:52', '2024-05-19'),
(225, 'P9934634', '36.73.156.46', 'Chrome 124.0.0.0', 'Windows 10', 'guru', '18:14:37', '2024-05-19'),
(226, '9218814438', '36.71.84.138', 'Chrome 124.0.0.0', 'Windows 10', 'guru', '18:40:08', '2024-05-19'),
(227, '9218814438', '103.98.176.164', 'Chrome 124.0.0.0', 'Windows 10', 'guru', '10:05:22', '2024-05-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_guru`
--
ALTER TABLE `absensi_guru`
  ADD PRIMARY KEY (`id_absensi_guru`);

--
-- Indexes for table `absensi_siswa`
--
ALTER TABLE `absensi_siswa`
  ADD PRIMARY KEY (`id_absensi_siswa`);

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `elearning`
--
ALTER TABLE `elearning`
  ADD PRIMARY KEY (`id_elearning`);

--
-- Indexes for table `elearning_jawab`
--
ALTER TABLE `elearning_jawab`
  ADD PRIMARY KEY (`id_elearning_jawab`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_komentar`
--
ALTER TABLE `forum_komentar`
  ADD PRIMARY KEY (`id_forum_komentar`);

--
-- Indexes for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD PRIMARY KEY (`id_forum_topic`);

--
-- Indexes for table `gedung`
--
ALTER TABLE `gedung`
  ADD PRIMARY KEY (`kode_gedung`);

--
-- Indexes for table `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `halaman`
--
ALTER TABLE `halaman`
  ADD PRIMARY KEY (`id_halaman`);

--
-- Indexes for table `identitas_sekolah`
--
ALTER TABLE `identitas_sekolah`
  ADD PRIMARY KEY (`id_identitas_sekolah`);

--
-- Indexes for table `ijazah`
--
ALTER TABLE `ijazah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  ADD PRIMARY KEY (`kodejdwl`);

--
-- Indexes for table `jawaban_essai`
--
ALTER TABLE `jawaban_essai`
  ADD PRIMARY KEY (`id_jawaban_essai`);

--
-- Indexes for table `jawaban_objektif`
--
ALTER TABLE `jawaban_objektif`
  ADD PRIMARY KEY (`id_jawaban_objektif`);

--
-- Indexes for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id_jenis_kelamin`);

--
-- Indexes for table `jenis_ptk`
--
ALTER TABLE `jenis_ptk`
  ADD PRIMARY KEY (`id_jenis_ptk`);

--
-- Indexes for table `journal_list`
--
ALTER TABLE `journal_list`
  ADD PRIMARY KEY (`id_journal`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `kategori_elearning`
--
ALTER TABLE `kategori_elearning`
  ADD PRIMARY KEY (`id_kategori_elearning`);

--
-- Indexes for table `kategori_quiz_ujian`
--
ALTER TABLE `kategori_quiz_ujian`
  ADD PRIMARY KEY (`id_kategori_quiz_ujian`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`kode_kehadiran`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `kelas_pkbm`
--
ALTER TABLE `kelas_pkbm`
  ADD PRIMARY KEY (`id_paket`) USING BTREE;

--
-- Indexes for table `kelompok_mata_pelajaran`
--
ALTER TABLE `kelompok_mata_pelajaran`
  ADD PRIMARY KEY (`id_kelompok_mata_pelajaran`);

--
-- Indexes for table `kompetensi_dasar`
--
ALTER TABLE `kompetensi_dasar`
  ADD PRIMARY KEY (`id_kompetensi_dasar`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`kode_kurikulum`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`kode_pelajaran`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `nilai_extrakulikuler`
--
ALTER TABLE `nilai_extrakulikuler`
  ADD PRIMARY KEY (`id_nilai_extrakulikuler`);

--
-- Indexes for table `nilai_keterampilan`
--
ALTER TABLE `nilai_keterampilan`
  ADD PRIMARY KEY (`id_nilai_keterampilan`);

--
-- Indexes for table `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  ADD PRIMARY KEY (`id_nilai_pengetahuan`);

--
-- Indexes for table `nilai_pertanyaan_essai`
--
ALTER TABLE `nilai_pertanyaan_essai`
  ADD PRIMARY KEY (`id_nilai_pertanyaan_essai`);

--
-- Indexes for table `nilai_prestasi`
--
ALTER TABLE `nilai_prestasi`
  ADD PRIMARY KEY (`id_nilai_prestasi`);

--
-- Indexes for table `nilai_sikap`
--
ALTER TABLE `nilai_sikap`
  ADD PRIMARY KEY (`id_nilai_sikap`);

--
-- Indexes for table `nilai_sikap_semester`
--
ALTER TABLE `nilai_sikap_semester`
  ADD PRIMARY KEY (`id_nilai_sikap_semester`);

--
-- Indexes for table `nilai_uts`
--
ALTER TABLE `nilai_uts`
  ADD PRIMARY KEY (`id_nilai_uts`);

--
-- Indexes for table `pertanyaan_essai`
--
ALTER TABLE `pertanyaan_essai`
  ADD PRIMARY KEY (`id_pertanyaan_essai`);

--
-- Indexes for table `pertanyaan_objektif`
--
ALTER TABLE `pertanyaan_objektif`
  ADD PRIMARY KEY (`id_pertanyaan_objektif`);

--
-- Indexes for table `pertanyaan_penilaian`
--
ALTER TABLE `pertanyaan_penilaian`
  ADD PRIMARY KEY (`id_pertanyaan_penilaian`);

--
-- Indexes for table `pertanyaan_penilaian_jawab`
--
ALTER TABLE `pertanyaan_penilaian_jawab`
  ADD PRIMARY KEY (`id_pertanyaan_penilaian_jawab`);

--
-- Indexes for table `predikat`
--
ALTER TABLE `predikat`
  ADD PRIMARY KEY (`id_predikat`);

--
-- Indexes for table `psb_aktivasi`
--
ALTER TABLE `psb_aktivasi`
  ADD PRIMARY KEY (`id_aktivasi`);

--
-- Indexes for table `psb_pendaftaran`
--
ALTER TABLE `psb_pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`);

--
-- Indexes for table `psb_pendaftaran_saudara`
--
ALTER TABLE `psb_pendaftaran_saudara`
  ADD PRIMARY KEY (`id_saudara`);

--
-- Indexes for table `quiz_ujian`
--
ALTER TABLE `quiz_ujian`
  ADD PRIMARY KEY (`id_quiz_ujian`);

--
-- Indexes for table `rapor`
--
ALTER TABLE `rapor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kode_ruangan`);

--
-- Indexes for table `sesi`
--
ALTER TABLE `sesi`
  ADD PRIMARY KEY (`id_sesi`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id_sms`);

--
-- Indexes for table `sms_autoreply`
--
ALTER TABLE `sms_autoreply`
  ADD PRIMARY KEY (`id_autoreply`);

--
-- Indexes for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_outbox`
--
ALTER TABLE `sms_outbox`
  ADD PRIMARY KEY (`id_outbox`);

--
-- Indexes for table `status_keaktifan`
--
ALTER TABLE `status_keaktifan`
  ADD PRIMARY KEY (`id_status_keaktifan`);

--
-- Indexes for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  ADD PRIMARY KEY (`id_status_kepegawaian`);

--
-- Indexes for table `status_pernikahan`
--
ALTER TABLE `status_pernikahan`
  ADD PRIMARY KEY (`id_status_pernikahan`);

--
-- Indexes for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id_tahun_akademik`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `users_aktivitas`
--
ALTER TABLE `users_aktivitas`
  ADD PRIMARY KEY (`id_users_aktivitas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi_guru`
--
ALTER TABLE `absensi_guru`
  MODIFY `id_absensi_guru` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `absensi_siswa`
--
ALTER TABLE `absensi_siswa`
  MODIFY `id_absensi_siswa` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `id_agama` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `elearning`
--
ALTER TABLE `elearning`
  MODIFY `id_elearning` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `elearning_jawab`
--
ALTER TABLE `elearning_jawab`
  MODIFY `id_elearning_jawab` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `forum_komentar`
--
ALTER TABLE `forum_komentar`
  MODIFY `id_forum_komentar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `forum_topic`
--
ALTER TABLE `forum_topic`
  MODIFY `id_forum_topic` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `golongan`
--
ALTER TABLE `golongan`
  MODIFY `id_golongan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `halaman`
--
ALTER TABLE `halaman`
  MODIFY `id_halaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `identitas_sekolah`
--
ALTER TABLE `identitas_sekolah`
  MODIFY `id_identitas_sekolah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ijazah`
--
ALTER TABLE `ijazah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  MODIFY `kodejdwl` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `jawaban_essai`
--
ALTER TABLE `jawaban_essai`
  MODIFY `id_jawaban_essai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jawaban_objektif`
--
ALTER TABLE `jawaban_objektif`
  MODIFY `id_jawaban_objektif` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  MODIFY `id_jenis_kelamin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_ptk`
--
ALTER TABLE `jenis_ptk`
  MODIFY `id_jenis_ptk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `journal_list`
--
ALTER TABLE `journal_list`
  MODIFY `id_journal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori_elearning`
--
ALTER TABLE `kategori_elearning`
  MODIFY `id_kategori_elearning` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori_quiz_ujian`
--
ALTER TABLE `kategori_quiz_ujian`
  MODIFY `id_kategori_quiz_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas_pkbm`
--
ALTER TABLE `kelas_pkbm`
  MODIFY `id_paket` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `kelompok_mata_pelajaran`
--
ALTER TABLE `kelompok_mata_pelajaran`
  MODIFY `id_kelompok_mata_pelajaran` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kompetensi_dasar`
--
ALTER TABLE `kompetensi_dasar`
  MODIFY `id_kompetensi_dasar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `kode_kurikulum` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `nilai_extrakulikuler`
--
ALTER TABLE `nilai_extrakulikuler`
  MODIFY `id_nilai_extrakulikuler` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nilai_keterampilan`
--
ALTER TABLE `nilai_keterampilan`
  MODIFY `id_nilai_keterampilan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  MODIFY `id_nilai_pengetahuan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `nilai_pertanyaan_essai`
--
ALTER TABLE `nilai_pertanyaan_essai`
  MODIFY `id_nilai_pertanyaan_essai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nilai_prestasi`
--
ALTER TABLE `nilai_prestasi`
  MODIFY `id_nilai_prestasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nilai_sikap`
--
ALTER TABLE `nilai_sikap`
  MODIFY `id_nilai_sikap` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `nilai_sikap_semester`
--
ALTER TABLE `nilai_sikap_semester`
  MODIFY `id_nilai_sikap_semester` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nilai_uts`
--
ALTER TABLE `nilai_uts`
  MODIFY `id_nilai_uts` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pertanyaan_essai`
--
ALTER TABLE `pertanyaan_essai`
  MODIFY `id_pertanyaan_essai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pertanyaan_objektif`
--
ALTER TABLE `pertanyaan_objektif`
  MODIFY `id_pertanyaan_objektif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pertanyaan_penilaian`
--
ALTER TABLE `pertanyaan_penilaian`
  MODIFY `id_pertanyaan_penilaian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pertanyaan_penilaian_jawab`
--
ALTER TABLE `pertanyaan_penilaian_jawab`
  MODIFY `id_pertanyaan_penilaian_jawab` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `predikat`
--
ALTER TABLE `predikat`
  MODIFY `id_predikat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `psb_aktivasi`
--
ALTER TABLE `psb_aktivasi`
  MODIFY `id_aktivasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `psb_pendaftaran`
--
ALTER TABLE `psb_pendaftaran`
  MODIFY `id_pendaftaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `psb_pendaftaran_saudara`
--
ALTER TABLE `psb_pendaftaran_saudara`
  MODIFY `id_saudara` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `quiz_ujian`
--
ALTER TABLE `quiz_ujian`
  MODIFY `id_quiz_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rapor`
--
ALTER TABLE `rapor`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sesi`
--
ALTER TABLE `sesi`
  MODIFY `id_sesi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1293;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id_sms` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_autoreply`
--
ALTER TABLE `sms_autoreply`
  MODIFY `id_autoreply` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_outbox`
--
ALTER TABLE `sms_outbox`
  MODIFY `id_outbox` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_keaktifan`
--
ALTER TABLE `status_keaktifan`
  MODIFY `id_status_keaktifan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  MODIFY `id_status_kepegawaian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status_pernikahan`
--
ALTER TABLE `status_pernikahan`
  MODIFY `id_status_pernikahan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id_tahun_akademik` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `users_aktivitas`
--
ALTER TABLE `users_aktivitas`
  MODIFY `id_users_aktivitas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
