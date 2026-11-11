-- Database: mobile2410020167
CREATE DATABASE IF NOT EXISTS `mobile2410020167` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mobile2410020167`;

DROP TABLE IF EXISTS `sub_kriterias`;
DROP TABLE IF EXISTS `kriterias`;

CREATE TABLE `kriterias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_kriteria` varchar(100) NOT NULL,
  `prioritas` tinyint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sub_kriterias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kriteria_id` bigint unsigned NOT NULL,
  `nama_sub_kriteria` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_kriterias_kriteria_id_foreign` (`kriteria_id`),
  CONSTRAINT `sub_kriterias_kriteria_id_foreign` FOREIGN KEY (`kriteria_id`) REFERENCES `kriterias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `kriterias` (`id`,`nama_kriteria`,`prioritas`,`created_at`,`updated_at`) VALUES (1,'Etika/Moral',1,NOW(),NOW());
INSERT INTO `kriterias` (`id`,`nama_kriteria`,`prioritas`,`created_at`,`updated_at`) VALUES (2,'Pendidikan',2,NOW(),NOW());
INSERT INTO `kriterias` (`id`,`nama_kriteria`,`prioritas`,`created_at`,`updated_at`) VALUES (3,'Kepemimpinan/Pengalaman',3,NOW(),NOW());
INSERT INTO `kriterias` (`id`,`nama_kriteria`,`prioritas`,`created_at`,`updated_at`) VALUES (4,'Integritas',4,NOW(),NOW());
INSERT INTO `kriterias` (`id`,`nama_kriteria`,`prioritas`,`created_at`,`updated_at`) VALUES (5,'Kapabilitas',5,NOW(),NOW());
INSERT INTO `kriterias` (`id`,`nama_kriteria`,`prioritas`,`created_at`,`updated_at`) VALUES (6,'Elektabilitas',6,NOW(),NOW());

INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (1,1,'Ketaatan menjalankan ajaran agama',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (2,1,'Belum pernah di hukum karena pidana maupun perdata',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (3,1,'Tidak mengkonsumsi dan mengedarkan narkoba keteladanan',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (4,2,'SMU',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (5,2,'DII/DIII',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (6,2,'S1/D.IV',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (7,2,'S2/SP1',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (8,2,'S3/SP2',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (9,3,'Tingkat Desa/Kecamatan',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (10,3,'Tingkat Kabupaten/Kota',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (11,3,'Tingkat Nasional',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (12,3,'Tingkat Regional International',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (13,4,'Jujur',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (14,4,'Konsisten',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (15,4,'Komitmen',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (16,5,'Berpihak pada ekonomi rakyat',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (17,5,'Pergerakan anti korupsi',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (18,5,'Kinerja yang baik',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (19,5,'Mendukung reformasi',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (20,6,'Kerja keras para elite dan kader partai',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (21,6,'Apresiasi permasalahan dalam lingkungan masyarakat',NOW(),NOW());
INSERT INTO `sub_kriterias` (`id`,`kriteria_id`,`nama_sub_kriteria`,`created_at`,`updated_at`) VALUES (22,6,'Bersosialisasi',NOW(),NOW());
