-- Database Backup
-- Generated: 2025-07-01 23:43:09
-- Host: 127.0.0.1
-- Database: sslcommerze

SET FOREIGN_KEY_CHECKS=0;

SET NAMES utf8mb4;

--
-- Table structure for `activity_log`
--
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `activity_log`
--
INSERT INTO `activity_log` VALUES (1, 'default', 'created', 'App\\Models\\User', 'created', 1, NULL, NULL, '{\"attributes\": {\"id\": 1, \"dob\": null, \"name\": \"SupreoX\", \"note\": null, \"email\": \"juyel@supreoxmail.com\", \"image\": null, \"phone\": null, \"editor\": null, \"email2\": null, \"gender\": null, \"phone2\": null, \"salary\": null, \"status\": 1, \"address\": null, \"bank_id\": null, \"creator\": null, \"id_type\": null, \"present\": null, \"desig_id\": null, \"emp_type\": null, \"marriage\": null, \"rec_year\": null, \"username\": null, \"depart_id\": null, \"emer_name\": null, \"id_number\": null, \"join_date\": null, \"signature\": null, \"created_at\": \"2025-06-29T13:48:41.000000Z\", \"deleted_by\": null, \"rec_degree\": null, \"restore_by\": null, \"updated_at\": \"2025-06-29T19:48:41.000000Z\", \"father_name\": null, \"mother_name\": null, \"resign_date\": null, \"annual_leave\": null, \"bank_country\": null, \"basic_salary\": null, \"deleted_time\": null, \"device_token\": null, \"emer_contact\": null, \"eva_end_date\": null, \"emer_relation\": null, \"restored_time\": null, \"bank_branch_id\": null, \"bank_sort_code\": null, \"eva_start_date\": null, \"remember_token\": null, \"report_manager\": null, \"bank_swift_code\": null, \"office_branch_id\": null, \"office_id_number\": null, \"bank_account_name\": null, \"email_verified_at\": null, \"office_card_number\": null, \"bank_account_number\": null, \"bank_routing_number\": null, \"office_work_schedule\": null, \"office_IT_requirement\": null}}', NULL, '2025-06-30 01:48:41', '2025-06-30 01:48:41');
INSERT INTO `activity_log` VALUES (2, 'default', 'Login Into Application', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2025-06-30 01:59:44', '2025-06-30 01:59:44');
INSERT INTO `activity_log` VALUES (3, 'default', 'Login Into Application', NULL, NULL, NULL, 'App\\Models\\User', 1, '[]', NULL, '2025-07-01 23:42:42', '2025-07-01 23:42:42');

--
-- Table structure for `adjustment_types`
--
DROP TABLE IF EXISTS `adjustment_types`;
CREATE TABLE `adjustment_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deduction` tinyint(1) NOT NULL DEFAULT '0',
  `priority_level` int NOT NULL DEFAULT '1',
  `creator_id` bigint unsigned DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_types_creator_id_foreign` (`creator_id`),
  KEY `adjustment_types_editor_id_foreign` (`editor_id`),
  CONSTRAINT `adjustment_types_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `adjustment_types_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `adjustment_types`
--

--
-- Table structure for `admin_emails`
--
DROP TABLE IF EXISTS `admin_emails`;
CREATE TABLE `admin_emails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_report` int DEFAULT '1',
  `email_leave` int DEFAULT '1',
  `email_summary` int DEFAULT '1',
  `delete_report` int DEFAULT '1',
  `delete_report_day` int NOT NULL DEFAULT '180',
  `creator` bigint unsigned DEFAULT NULL,
  `editor` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_emails_creator_foreign` (`creator`),
  KEY `admin_emails_editor_foreign` (`editor`),
  CONSTRAINT `admin_emails_creator_foreign` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_emails_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `admin_emails`
--
INSERT INTO `admin_emails` VALUES (1, 'eteamify@gmail.com', 1, 1, 1, 1, 180, 1, NULL, '2025-06-30 01:48:41', NULL);

--
-- Table structure for `bank_branches`
--
DROP TABLE IF EXISTS `bank_branches`;
CREATE TABLE `bank_branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_branch_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` bigint unsigned NOT NULL,
  `bank_branch_creator` bigint unsigned DEFAULT NULL,
  `bank_branch_editor` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_branches_bank_id_foreign` (`bank_id`),
  KEY `bank_branches_bank_branch_creator_foreign` (`bank_branch_creator`),
  KEY `bank_branches_bank_branch_editor_foreign` (`bank_branch_editor`),
  KEY `bank_branches_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `bank_branches_bank_branch_creator_foreign` FOREIGN KEY (`bank_branch_creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bank_branches_bank_branch_editor_foreign` FOREIGN KEY (`bank_branch_editor`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bank_branches_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `bank_names` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bank_branches_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `bank_branches`
--

--
-- Table structure for `bank_names`
--
DROP TABLE IF EXISTS `bank_names`;
CREATE TABLE `bank_names` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_creator` bigint unsigned DEFAULT NULL,
  `bank_editor` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_names_bank_creator_foreign` (`bank_creator`),
  KEY `bank_names_bank_editor_foreign` (`bank_editor`),
  KEY `bank_names_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `bank_names_bank_creator_foreign` FOREIGN KEY (`bank_creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bank_names_bank_editor_foreign` FOREIGN KEY (`bank_editor`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bank_names_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `bank_names`
--

--
-- Table structure for `basics`
--
DROP TABLE IF EXISTS `basics`;
CREATE TABLE `basics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Mlogo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Flogo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favlogo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `creator` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `basics`
--
INSERT INTO `basics` VALUES (1, 'mlogo.png', NULL, NULL, 'ETeamifY - By SupreoX', NULL, NULL, '2025-06-30 01:48:41', NULL);

--
-- Table structure for `cache`
--
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `cache`
--
INSERT INTO `cache` VALUES ('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:104:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:8:\"Employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:12:\"Activity Log\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:17:\"Download Database\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:14:\"Admin Overview\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:15:\"User Management\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:8:\"All User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:8:\"Add User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:9:\"View User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:9:\"Edit User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:11:\"Delete User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:16:\"Soft Delete User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:12:\"Restore User\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:21:\"Login Another Profile\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:17:\"Add Employee Note\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:8:\"All Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:8:\"Add Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:9:\"View Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:9:\"Edit Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:11:\"Delete Role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:14:\"All Permission\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"Add Permission\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:15:\"View Permission\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:15:\"Edit Permission\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:17:\"Delete Permission\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:5:\"Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:22:\"Leave Application List\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:10:\"View Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:10:\"Edit Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:12:\"Delete Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:16:\"Add Manual Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:17:\"Edit Manual Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:15:\"All Early Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:15:\"Add Early Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:16:\"Edit Early Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:16:\"View Early Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:18:\"Delete Early Leave\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:10:\"Leave Type\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:14:\"Leave Type Add\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:15:\"Leave Type View\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:15:\"Leave Type Edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:17:\"Leave Type Delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:12:\"Daily-Report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:17:\"View Daily-Report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:17:\"Edit Daily-Report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:24:\"Soft Delete Daily-Report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:20:\"Restore Daily-Report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:19:\"Delete Daily-Report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:23:\"All Employee Evaluation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:23:\"Add Employee Evaluation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:24:\"Edit Employee Evaluation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:24:\"View Employee Evaluation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:26:\"Delete Employee Evaluation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:22:\"All Employee Promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:22:\"Add Employee Promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:23:\"Edit Employee Promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:23:\"View Employee Promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:25:\"Delete Employee Promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:24:\"Department & Designation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:11:\"Departments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:14:\"Add Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:15:\"View Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:15:\"Edit Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:17:\"Delete Department\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:11:\"Designation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:15:\"Add Designation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:16:\"View Designation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:16:\"Edit Designation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:18:\"Delete Designation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:13:\"Office Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:17:\"Add Office Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:18:\"View Office Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:18:\"Edit Office Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:20:\"Delete Office Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:13:\"Bank & Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:11:\"Bank Detail\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:15:\"Add Bank Detail\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:16:\"View Bank Detail\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:16:\"Edit Bank Detail\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:18:\"Delete Bank Detail\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:11:\"Bank Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:15:\"Add Bank Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:16:\"View Bank Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:16:\"Edit Bank Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:18:\"Delete Bank Branch\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:8:\"Catering\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:8:\"Add Meal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:9:\"View Meal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:9:\"Edit Meal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:11:\"Delete Meal\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:11:\"Add Payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:12:\"Edit Payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:12:\"View Payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:14:\"Delete Payment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:13:\"Check Balance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:4:\"Page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:8:\"All Page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:8:\"Add Page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:9:\"View Page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:9:\"Edit Page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:11:\"Delete Page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:16:\"Soft Delete Page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:12:\"Restore Page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:7:\"Setting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:11:\"Recycle Bin\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"Super Admin\";s:1:\"c\";s:3:\"web\";}}}', 1751478162);

--
-- Table structure for `cache_locks`
--
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `cache_locks`
--

--
-- Table structure for `catering_food`
--
DROP TABLE IF EXISTS `catering_food`;
CREATE TABLE `catering_food` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `per_cost` int NOT NULL DEFAULT '0',
  `total_cost` int NOT NULL DEFAULT '0',
  `creator` bigint unsigned DEFAULT NULL,
  `editor` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catering_food_creator_foreign` (`creator`),
  KEY `catering_food_editor_foreign` (`editor`),
  KEY `catering_food_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `catering_food_creator_foreign` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catering_food_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catering_food_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `catering_food`
--

--
-- Table structure for `catering_payments`
--
DROP TABLE IF EXISTS `catering_payments`;
CREATE TABLE `catering_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_date` date DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `total_payment` decimal(10,2) DEFAULT NULL,
  `p_creator` bigint unsigned DEFAULT NULL,
  `p_editor` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catering_payments_p_creator_foreign` (`p_creator`),
  KEY `catering_payments_p_editor_foreign` (`p_editor`),
  KEY `catering_payments_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `catering_payments_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catering_payments_p_creator_foreign` FOREIGN KEY (`p_creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `catering_payments_p_editor_foreign` FOREIGN KEY (`p_editor`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `catering_payments`
--

--
-- Table structure for `client_infos`
--
DROP TABLE IF EXISTS `client_infos`;
CREATE TABLE `client_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_detail` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `complete_date` date DEFAULT NULL,
  `budget` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `creator_id` bigint unsigned DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_infos_creator_id_foreign` (`creator_id`),
  KEY `client_infos_editor_id_foreign` (`editor_id`),
  KEY `client_infos_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `client_infos_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `client_infos_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `client_infos_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `client_infos`
--

--
-- Table structure for `currencies`
--
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currencies_editor_foreign` (`editor`),
  CONSTRAINT `currencies_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `currencies`
--
INSERT INTO `currencies` VALUES (1, '৳', 1, '2025-06-29 19:48:41', NULL);

--
-- Table structure for `daily_reports`
--
DROP TABLE IF EXISTS `daily_reports`;
CREATE TABLE `daily_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submit_by` bigint unsigned NOT NULL,
  `submit_date` date DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `check_in` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `editor` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `restore_by` bigint unsigned DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `restored_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_reports_submit_by_foreign` (`submit_by`),
  KEY `daily_reports_editor_foreign` (`editor`),
  KEY `daily_reports_deleted_by_foreign` (`deleted_by`),
  KEY `daily_reports_restore_by_foreign` (`restore_by`),
  CONSTRAINT `daily_reports_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `daily_reports_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `daily_reports_restore_by_foreign` FOREIGN KEY (`restore_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `daily_reports_submit_by_foreign` FOREIGN KEY (`submit_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `daily_reports`
--

--
-- Table structure for `departments`
--
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depart_creator` bigint unsigned DEFAULT NULL,
  `depart_editor` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_depart_creator_foreign` (`depart_creator`),
  KEY `departments_depart_editor_foreign` (`depart_editor`),
  CONSTRAINT `departments_depart_creator_foreign` FOREIGN KEY (`depart_creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `departments_depart_editor_foreign` FOREIGN KEY (`depart_editor`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `departments`
--

--
-- Table structure for `designations`
--
DROP TABLE IF EXISTS `designations`;
CREATE TABLE `designations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depart_id` bigint unsigned DEFAULT NULL,
  `creator_id` bigint unsigned DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designations_depart_id_foreign` (`depart_id`),
  KEY `designations_creator_id_foreign` (`creator_id`),
  KEY `designations_editor_id_foreign` (`editor_id`),
  KEY `designations_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `designations_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `designations_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `designations_depart_id_foreign` FOREIGN KEY (`depart_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `designations_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `designations`
--

--
-- Table structure for `domains`
--
DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domains_domain_unique` (`domain`),
  KEY `domains_tenant_id_foreign` (`tenant_id`),
  CONSTRAINT `domains_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `domains`
--
INSERT INTO `domains` VALUES (2, 'supreox.localhost', 'supreox', '2025-06-30 02:26:08', '2025-06-30 02:26:08');

--
-- Table structure for `early_leaves`
--
DROP TABLE IF EXISTS `early_leaves`;
CREATE TABLE `early_leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `leave_type` bigint unsigned DEFAULT NULL,
  `other_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '1',
  `total_hour` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unpaid_request` int DEFAULT NULL,
  `submit_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_id` bigint unsigned NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `restore_by` bigint unsigned DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `restored_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `early_leaves_leave_type_foreign` (`leave_type`),
  KEY `early_leaves_emp_id_foreign` (`emp_id`),
  KEY `early_leaves_editor_foreign` (`editor`),
  KEY `early_leaves_deleted_by_foreign` (`deleted_by`),
  KEY `early_leaves_restore_by_foreign` (`restore_by`),
  CONSTRAINT `early_leaves_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `early_leaves_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `early_leaves_emp_id_foreign` FOREIGN KEY (`emp_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `early_leaves_leave_type_foreign` FOREIGN KEY (`leave_type`) REFERENCES `leave_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `early_leaves_restore_by_foreign` FOREIGN KEY (`restore_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `early_leaves`
--

--
-- Table structure for `employe_leave_settings`
--
DROP TABLE IF EXISTS `employe_leave_settings`;
CREATE TABLE `employe_leave_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `year_limit` int DEFAULT NULL,
  `month_limit` int DEFAULT NULL,
  `weekoffday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialoffday` text COLLATE utf8mb4_unicode_ci,
  `editor` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employe_leave_settings_editor_foreign` (`editor`),
  CONSTRAINT `employe_leave_settings_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `employe_leave_settings`
--
INSERT INTO `employe_leave_settings` VALUES (1, 14, 3, '[5]', '2024-12-16, 2024-12-20, 2024-12-25, 2024-12-26, 2024-12-27', NULL, '2025-06-30 01:48:41', NULL);

--
-- Table structure for `employee_evaluations`
--
DROP TABLE IF EXISTS `employee_evaluations`;
CREATE TABLE `employee_evaluations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` bigint unsigned NOT NULL,
  `eva_last_date` date DEFAULT NULL,
  `eva_next_date` date DEFAULT NULL,
  `evaluated_by` bigint unsigned DEFAULT NULL,
  `renewed_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_evaluations_emp_id_foreign` (`emp_id`),
  KEY `employee_evaluations_evaluated_by_foreign` (`evaluated_by`),
  CONSTRAINT `employee_evaluations_emp_id_foreign` FOREIGN KEY (`emp_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_evaluations_evaluated_by_foreign` FOREIGN KEY (`evaluated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `employee_evaluations`
--

--
-- Table structure for `employee_promotions`
--
DROP TABLE IF EXISTS `employee_promotions`;
CREATE TABLE `employee_promotions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` bigint unsigned DEFAULT NULL,
  `depart_id` bigint unsigned DEFAULT NULL,
  `desig_id` bigint unsigned DEFAULT NULL,
  `pro_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Unchanged',
  `emp_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `promoted_by` bigint unsigned DEFAULT NULL,
  `pro_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_promotions_emp_id_foreign` (`emp_id`),
  KEY `employee_promotions_depart_id_foreign` (`depart_id`),
  KEY `employee_promotions_desig_id_foreign` (`desig_id`),
  KEY `employee_promotions_promoted_by_foreign` (`promoted_by`),
  CONSTRAINT `employee_promotions_depart_id_foreign` FOREIGN KEY (`depart_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_promotions_desig_id_foreign` FOREIGN KEY (`desig_id`) REFERENCES `designations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_promotions_emp_id_foreign` FOREIGN KEY (`emp_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_promotions_promoted_by_foreign` FOREIGN KEY (`promoted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `employee_promotions`
--

--
-- Table structure for `expenses`
--
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purpose` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `creator_id` bigint unsigned DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_creator_id_foreign` (`creator_id`),
  KEY `expenses_editor_id_foreign` (`editor_id`),
  KEY `expenses_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `expenses_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `expenses_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `expenses_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `expenses`
--

--
-- Table structure for `failed_jobs`
--
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `failed_jobs`
--

--
-- Table structure for `incomes`
--
DROP TABLE IF EXISTS `incomes`;
CREATE TABLE `incomes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purpose` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `creator_id` bigint unsigned DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incomes_creator_id_foreign` (`creator_id`),
  KEY `incomes_editor_id_foreign` (`editor_id`),
  KEY `incomes_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `incomes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `incomes_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `incomes_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `incomes`
--

--
-- Table structure for `job_batches`
--
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `job_batches`
--

--
-- Table structure for `jobs`
--
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `jobs`
--

--
-- Table structure for `leave_types`
--
DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE `leave_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint unsigned DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_types_creator_id_foreign` (`creator_id`),
  KEY `leave_types_editor_id_foreign` (`editor_id`),
  KEY `leave_types_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `leave_types_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leave_types_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leave_types_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `leave_types`
--

--
-- Table structure for `leaves`
--
DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `leave_type_id` bigint unsigned DEFAULT NULL,
  `other_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '1',
  `total_paid` int DEFAULT NULL,
  `total_leave_this_month` int DEFAULT NULL,
  `unpaid_request` int DEFAULT NULL,
  `total_unpaid` int DEFAULT NULL,
  `add_from` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_id` bigint unsigned DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `restore_by` bigint unsigned DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `restored_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  KEY `leaves_emp_id_foreign` (`emp_id`),
  KEY `leaves_editor_foreign` (`editor`),
  KEY `leaves_deleted_by_foreign` (`deleted_by`),
  KEY `leaves_restore_by_foreign` (`restore_by`),
  CONSTRAINT `leaves_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leaves_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leaves_emp_id_foreign` FOREIGN KEY (`emp_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leaves_restore_by_foreign` FOREIGN KEY (`restore_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `leaves`
--

--
-- Table structure for `migrations`
--
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `migrations`
--
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_09_15_000010_create_tenants_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_09_15_000020_create_domains_table', 1);
INSERT INTO `migrations` VALUES (6, '2024_12_03_193256_create_basics_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_12_04_163154_create_designations_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_12_04_193205_create_leaves_table', 1);
INSERT INTO `migrations` VALUES (9, '2024_12_10_121016_create_leave_types_table', 1);
INSERT INTO `migrations` VALUES (10, '2024_12_10_180519_create_daily_reports_table', 1);
INSERT INTO `migrations` VALUES (11, '2024_12_11_131348_create_employe_leave_settings_table', 1);
INSERT INTO `migrations` VALUES (12, '2024_12_21_111600_create_time_zones_table', 1);
INSERT INTO `migrations` VALUES (13, '2024_12_23_152730_create_office_branches_table', 1);
INSERT INTO `migrations` VALUES (14, '2024_12_23_164717_create_bank_names_table', 1);
INSERT INTO `migrations` VALUES (15, '2024_12_23_172423_create_bank_branches_table', 1);
INSERT INTO `migrations` VALUES (16, '2024_12_23_185842_create_departments_table', 1);
INSERT INTO `migrations` VALUES (17, '2024_12_24_152908_create_catering_food_table', 1);
INSERT INTO `migrations` VALUES (18, '2024_12_27_120315_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (19, '2024_12_29_115429_create_catering_payments_table', 1);
INSERT INTO `migrations` VALUES (20, '2025_01_11_120912_create_admin_emails_table', 1);
INSERT INTO `migrations` VALUES (21, '2025_01_30_062738_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (22, '2025_01_30_115053_create_currencies_table', 1);
INSERT INTO `migrations` VALUES (23, '2025_02_08_151246_create_employee_promotions_table', 1);
INSERT INTO `migrations` VALUES (24, '2025_02_09_132522_create_employee_evaluations_table', 1);
INSERT INTO `migrations` VALUES (25, '2025_02_11_145706_create_office_times_table', 1);
INSERT INTO `migrations` VALUES (26, '2025_02_11_182101_create_early_leaves_table', 1);
INSERT INTO `migrations` VALUES (27, '2025_02_13_125913_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (28, '2025_03_09_135703_create_activity_log_table', 1);
INSERT INTO `migrations` VALUES (29, '2025_03_09_135704_add_event_column_to_activity_log_table', 1);
INSERT INTO `migrations` VALUES (30, '2025_03_09_135705_add_batch_uuid_column_to_activity_log_table', 1);
INSERT INTO `migrations` VALUES (31, '2025_03_23_145547_create_pages', 1);
INSERT INTO `migrations` VALUES (32, '2025_04_12_180205_create_salary_statements_table', 1);
INSERT INTO `migrations` VALUES (33, '2025_04_13_125913_create_adjustment_types_table', 1);
INSERT INTO `migrations` VALUES (34, '2025_04_13_130302_create_salary_adjustments_table', 1);
INSERT INTO `migrations` VALUES (35, '2025_05_08_151250_create_client_infos_table', 1);
INSERT INTO `migrations` VALUES (36, '2025_05_14_132440_create_incomes_table', 1);
INSERT INTO `migrations` VALUES (37, '2025_05_14_133505_create_expenses_table', 1);

--
-- Table structure for `model_has_permissions`
--
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `model_has_permissions`
--

--
-- Table structure for `model_has_roles`
--
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `model_has_roles`
--
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);

--
-- Table structure for `notifications`
--
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `notifications`
--

--
-- Table structure for `office_branches`
--
DROP TABLE IF EXISTS `office_branches`;
CREATE TABLE `office_branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_creator` bigint unsigned DEFAULT NULL,
  `branch_editor` bigint unsigned DEFAULT NULL,
  `deletor_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `office_branches_branch_creator_foreign` (`branch_creator`),
  KEY `office_branches_branch_editor_foreign` (`branch_editor`),
  KEY `office_branches_deletor_id_foreign` (`deletor_id`),
  CONSTRAINT `office_branches_branch_creator_foreign` FOREIGN KEY (`branch_creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `office_branches_branch_editor_foreign` FOREIGN KEY (`branch_editor`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `office_branches_deletor_id_foreign` FOREIGN KEY (`deletor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `office_branches`
--

--
-- Table structure for `office_times`
--
DROP TABLE IF EXISTS `office_times`;
CREATE TABLE `office_times` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `office_start` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_end` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `office_times_editor_foreign` (`editor`),
  CONSTRAINT `office_times_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `office_times`
--
INSERT INTO `office_times` VALUES (1, '05:00', '13:30', NULL, '2025-06-29 19:48:41', NULL);

--
-- Table structure for `pages`
--
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_url` int DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `public` int DEFAULT NULL,
  `page_creator` bigint unsigned DEFAULT NULL,
  `page_editor` bigint unsigned DEFAULT NULL,
  `page_deleted_by` bigint unsigned DEFAULT NULL,
  `page_restore_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restore_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_page_creator_foreign` (`page_creator`),
  KEY `pages_page_editor_foreign` (`page_editor`),
  KEY `pages_page_deleted_by_foreign` (`page_deleted_by`),
  KEY `pages_page_restore_by_foreign` (`page_restore_by`),
  CONSTRAINT `pages_page_creator_foreign` FOREIGN KEY (`page_creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pages_page_deleted_by_foreign` FOREIGN KEY (`page_deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pages_page_editor_foreign` FOREIGN KEY (`page_editor`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pages_page_restore_by_foreign` FOREIGN KEY (`page_restore_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `pages`
--

--
-- Table structure for `password_reset_tokens`
--
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `password_reset_tokens`
--

--
-- Table structure for `permissions`
--
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `permissions`
--
INSERT INTO `permissions` VALUES (1, 'Employee', 'web', '2025-02-03 05:35:32', '2025-02-03 05:35:32');
INSERT INTO `permissions` VALUES (2, 'Activity Log', 'web', '2025-02-03 05:35:32', '2025-02-03 05:35:32');
INSERT INTO `permissions` VALUES (3, 'Download Database', 'web', '2025-02-03 05:35:32', '2025-02-03 05:35:32');
INSERT INTO `permissions` VALUES (4, 'Admin Overview', 'web', '2025-02-03 05:35:32', '2025-02-03 05:35:32');
INSERT INTO `permissions` VALUES (5, 'User Management', 'web', '2025-02-03 05:36:03', '2025-02-03 05:36:15');
INSERT INTO `permissions` VALUES (6, 'All User', 'web', '2025-02-03 05:36:32', '2025-02-03 05:36:32');
INSERT INTO `permissions` VALUES (7, 'Add User', 'web', '2025-02-03 05:36:56', '2025-02-03 05:36:56');
INSERT INTO `permissions` VALUES (8, 'View User', 'web', '2025-02-03 05:37:29', '2025-02-03 05:37:29');
INSERT INTO `permissions` VALUES (9, 'Edit User', 'web', '2025-02-03 05:37:37', '2025-02-03 05:37:37');
INSERT INTO `permissions` VALUES (10, 'Delete User', 'web', '2025-02-03 05:37:45', '2025-02-03 05:37:45');
INSERT INTO `permissions` VALUES (11, 'Soft Delete User', 'web', '2025-02-03 05:37:45', '2025-02-03 05:37:45');
INSERT INTO `permissions` VALUES (12, 'Restore User', 'web', '2025-02-03 05:37:45', '2025-02-03 05:37:45');
INSERT INTO `permissions` VALUES (13, 'Login Another Profile', 'web', '2025-02-03 05:37:45', '2025-02-03 05:37:45');
INSERT INTO `permissions` VALUES (14, 'Add Employee Note', 'web', '2025-02-03 05:37:45', '2025-02-03 05:37:45');
INSERT INTO `permissions` VALUES (15, 'All Role', 'web', '2025-02-03 05:38:32', '2025-02-03 05:38:32');
INSERT INTO `permissions` VALUES (16, 'Add Role', 'web', '2025-02-03 05:38:40', '2025-02-03 05:38:40');
INSERT INTO `permissions` VALUES (17, 'View Role', 'web', '2025-02-03 05:38:48', '2025-02-03 05:38:48');
INSERT INTO `permissions` VALUES (18, 'Edit Role', 'web', '2025-02-03 05:38:56', '2025-02-03 05:38:56');
INSERT INTO `permissions` VALUES (19, 'Delete Role', 'web', '2025-02-03 05:39:13', '2025-02-03 05:39:13');
INSERT INTO `permissions` VALUES (20, 'All Permission', 'web', '2025-02-03 05:39:27', '2025-02-03 05:39:27');
INSERT INTO `permissions` VALUES (21, 'Add Permission', 'web', '2025-02-03 05:39:42', '2025-02-03 05:39:42');
INSERT INTO `permissions` VALUES (22, 'View Permission', 'web', '2025-02-03 05:39:52', '2025-02-03 05:39:52');
INSERT INTO `permissions` VALUES (23, 'Edit Permission', 'web', '2025-02-03 05:39:59', '2025-02-03 05:39:59');
INSERT INTO `permissions` VALUES (24, 'Delete Permission', 'web', '2025-02-03 05:40:05', '2025-02-03 05:40:05');
INSERT INTO `permissions` VALUES (25, 'Leave', 'web', '2025-02-03 05:44:31', '2025-02-03 05:44:31');
INSERT INTO `permissions` VALUES (26, 'Leave Application List', 'web', '2025-02-03 05:45:21', '2025-02-03 05:45:21');
INSERT INTO `permissions` VALUES (27, 'View Leave', 'web', '2025-02-03 05:46:25', '2025-02-03 05:46:25');
INSERT INTO `permissions` VALUES (28, 'Edit Leave', 'web', '2025-02-03 05:46:32', '2025-02-03 05:46:32');
INSERT INTO `permissions` VALUES (29, 'Delete Leave', 'web', '2025-02-03 05:46:38', '2025-02-03 05:46:38');
INSERT INTO `permissions` VALUES (30, 'Add Manual Leave', 'web', '2025-02-03 05:46:09', '2025-02-03 05:46:09');
INSERT INTO `permissions` VALUES (31, 'Edit Manual Leave', 'web', '2025-02-03 05:46:09', '2025-02-03 05:46:09');
INSERT INTO `permissions` VALUES (32, 'All Early Leave', 'web', '2025-02-03 05:44:31', '2025-02-03 05:44:31');
INSERT INTO `permissions` VALUES (33, 'Add Early Leave', 'web', '2025-02-03 05:44:31', '2025-02-03 05:44:31');
INSERT INTO `permissions` VALUES (34, 'Edit Early Leave', 'web', '2025-02-03 05:44:31', '2025-02-03 05:44:31');
INSERT INTO `permissions` VALUES (35, 'View Early Leave', 'web', '2025-02-03 05:44:31', '2025-02-03 05:44:31');
INSERT INTO `permissions` VALUES (36, 'Delete Early Leave', 'web', '2025-02-03 05:44:31', '2025-02-03 05:44:31');
INSERT INTO `permissions` VALUES (37, 'Leave Type', 'web', '2025-02-03 05:46:56', '2025-02-03 05:46:56');
INSERT INTO `permissions` VALUES (38, 'Leave Type Add', 'web', '2025-02-03 05:47:07', '2025-02-03 05:47:07');
INSERT INTO `permissions` VALUES (39, 'Leave Type View', 'web', '2025-02-03 05:47:19', '2025-02-03 05:47:19');
INSERT INTO `permissions` VALUES (40, 'Leave Type Edit', 'web', '2025-02-03 05:47:30', '2025-02-03 05:47:30');
INSERT INTO `permissions` VALUES (41, 'Leave Type Delete', 'web', '2025-02-03 05:47:37', '2025-02-03 05:47:37');
INSERT INTO `permissions` VALUES (42, 'Daily-Report', 'web', '2025-02-03 05:48:48', '2025-02-03 06:34:22');
INSERT INTO `permissions` VALUES (43, 'View Daily-Report', 'web', '2025-02-03 05:49:00', '2025-02-03 05:49:00');
INSERT INTO `permissions` VALUES (44, 'Edit Daily-Report', 'web', '2025-02-03 05:49:16', '2025-02-03 05:49:16');
INSERT INTO `permissions` VALUES (45, 'Soft Delete Daily-Report', 'web', '2025-02-03 05:50:42', '2025-02-03 05:50:42');
INSERT INTO `permissions` VALUES (46, 'Restore Daily-Report', 'web', '2025-02-03 05:51:24', '2025-02-03 05:51:24');
INSERT INTO `permissions` VALUES (47, 'Delete Daily-Report', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (48, 'All Employee Evaluation', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (49, 'Add Employee Evaluation', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (50, 'Edit Employee Evaluation', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (51, 'View Employee Evaluation', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (52, 'Delete Employee Evaluation', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (53, 'All Employee Promotion', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (54, 'Add Employee Promotion', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (55, 'Edit Employee Promotion', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (56, 'View Employee Promotion', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (57, 'Delete Employee Promotion', 'web', '2025-02-03 05:51:56', '2025-02-03 05:51:56');
INSERT INTO `permissions` VALUES (58, 'Department & Designation', 'web', '2025-02-03 06:09:55', '2025-02-03 06:11:35');
INSERT INTO `permissions` VALUES (59, 'Departments', 'web', '2025-02-03 06:13:05', '2025-02-03 06:13:05');
INSERT INTO `permissions` VALUES (60, 'Add Department', 'web', '2025-02-03 06:13:21', '2025-02-03 06:13:21');
INSERT INTO `permissions` VALUES (61, 'View Department', 'web', '2025-02-03 06:13:49', '2025-02-03 06:13:49');
INSERT INTO `permissions` VALUES (62, 'Edit Department', 'web', '2025-02-03 06:13:56', '2025-02-03 06:13:56');
INSERT INTO `permissions` VALUES (63, 'Delete Department', 'web', '2025-02-03 06:14:01', '2025-02-03 06:14:01');
INSERT INTO `permissions` VALUES (64, 'Designation', 'web', '2025-02-03 06:14:07', '2025-02-03 06:14:07');
INSERT INTO `permissions` VALUES (65, 'Add Designation', 'web', '2025-02-03 06:14:14', '2025-02-03 06:14:14');
INSERT INTO `permissions` VALUES (66, 'View Designation', 'web', '2025-02-03 06:14:26', '2025-02-03 06:14:26');
INSERT INTO `permissions` VALUES (67, 'Edit Designation', 'web', '2025-02-03 06:14:40', '2025-02-03 06:14:40');
INSERT INTO `permissions` VALUES (68, 'Delete Designation', 'web', '2025-02-03 06:14:52', '2025-02-03 06:14:52');
INSERT INTO `permissions` VALUES (69, 'Office Branch', 'web', '2025-02-03 06:15:34', '2025-02-03 07:01:56');
INSERT INTO `permissions` VALUES (70, 'Add Office Branch', 'web', '2025-02-03 06:15:52', '2025-02-03 06:15:52');
INSERT INTO `permissions` VALUES (71, 'View Office Branch', 'web', '2025-02-03 06:16:56', '2025-02-03 06:16:56');
INSERT INTO `permissions` VALUES (72, 'Edit Office Branch', 'web', '2025-02-03 06:17:05', '2025-02-03 06:17:05');
INSERT INTO `permissions` VALUES (73, 'Delete Office Branch', 'web', '2025-02-03 06:17:34', '2025-02-03 06:17:34');
INSERT INTO `permissions` VALUES (74, 'Bank & Branch', 'web', '2025-02-03 06:17:58', '2025-02-03 07:31:20');
INSERT INTO `permissions` VALUES (75, 'Bank Detail', 'web', '2025-02-03 06:18:22', '2025-02-03 06:18:22');
INSERT INTO `permissions` VALUES (76, 'Add Bank Detail', 'web', '2025-02-03 06:18:35', '2025-02-03 06:18:35');
INSERT INTO `permissions` VALUES (77, 'View Bank Detail', 'web', '2025-02-03 06:18:46', '2025-02-03 06:18:46');
INSERT INTO `permissions` VALUES (78, 'Edit Bank Detail', 'web', '2025-02-03 06:18:53', '2025-02-03 06:18:53');
INSERT INTO `permissions` VALUES (79, 'Delete Bank Detail', 'web', '2025-02-03 06:19:09', '2025-02-03 06:19:09');
INSERT INTO `permissions` VALUES (80, 'Bank Branch', 'web', '2025-02-03 06:19:30', '2025-02-03 08:23:46');
INSERT INTO `permissions` VALUES (81, 'Add Bank Branch', 'web', '2025-02-03 06:19:56', '2025-02-03 06:19:56');
INSERT INTO `permissions` VALUES (82, 'View Bank Branch', 'web', '2025-02-03 06:20:03', '2025-02-03 06:20:03');
INSERT INTO `permissions` VALUES (83, 'Edit Bank Branch', 'web', '2025-02-03 06:20:16', '2025-02-03 06:20:16');
INSERT INTO `permissions` VALUES (84, 'Delete Bank Branch', 'web', '2025-02-03 06:21:08', '2025-02-03 06:21:08');
INSERT INTO `permissions` VALUES (85, 'Catering', 'web', '2025-02-03 06:21:45', '2025-02-03 06:21:45');
INSERT INTO `permissions` VALUES (86, 'Add Meal', 'web', '2025-02-03 06:22:41', '2025-02-03 06:22:41');
INSERT INTO `permissions` VALUES (87, 'View Meal', 'web', '2025-02-03 06:23:33', '2025-02-03 06:23:33');
INSERT INTO `permissions` VALUES (88, 'Edit Meal', 'web', '2025-02-03 06:23:39', '2025-02-03 06:23:39');
INSERT INTO `permissions` VALUES (89, 'Delete Meal', 'web', '2025-02-03 06:23:44', '2025-02-03 06:23:44');
INSERT INTO `permissions` VALUES (90, 'Add Payment', 'web', '2025-02-03 06:23:58', '2025-02-03 06:23:58');
INSERT INTO `permissions` VALUES (91, 'Edit Payment', 'web', '2025-02-03 06:24:14', '2025-02-03 06:24:14');
INSERT INTO `permissions` VALUES (92, 'View Payment', 'web', '2025-02-03 06:24:20', '2025-02-03 06:24:20');
INSERT INTO `permissions` VALUES (93, 'Delete Payment', 'web', '2025-02-03 06:24:32', '2025-02-03 06:24:32');
INSERT INTO `permissions` VALUES (94, 'Check Balance', 'web', '2025-02-03 06:24:44', '2025-02-03 06:24:44');
INSERT INTO `permissions` VALUES (95, 'Page', 'web', '2025-02-03 05:36:03', '2025-02-03 05:36:15');
INSERT INTO `permissions` VALUES (96, 'All Page', 'web', '2025-02-03 05:36:32', '2025-02-03 05:36:32');
INSERT INTO `permissions` VALUES (97, 'Add Page', 'web', '2025-02-03 05:36:56', '2025-02-03 05:36:56');
INSERT INTO `permissions` VALUES (98, 'View Page', 'web', '2025-02-03 05:37:29', '2025-02-03 05:37:29');
INSERT INTO `permissions` VALUES (99, 'Edit Page', 'web', '2025-02-03 05:37:37', '2025-02-03 05:37:37');
INSERT INTO `permissions` VALUES (100, 'Delete Page', 'web', '2025-02-03 05:37:45', '2025-02-03 05:37:45');
INSERT INTO `permissions` VALUES (101, 'Soft Delete Page', 'web', '2025-02-03 05:37:45', '2025-02-03 05:37:45');
INSERT INTO `permissions` VALUES (102, 'Restore Page', 'web', '2025-02-03 05:37:45', '2025-02-03 05:37:45');
INSERT INTO `permissions` VALUES (103, 'Setting', 'web', '2025-02-03 06:25:07', '2025-02-03 06:25:07');
INSERT INTO `permissions` VALUES (104, 'Recycle Bin', 'web', '2025-02-03 06:25:28', '2025-02-03 06:25:28');

--
-- Table structure for `personal_access_tokens`
--
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `personal_access_tokens`
--

--
-- Table structure for `role_has_permissions`
--
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `role_has_permissions`
--
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (18, 1);
INSERT INTO `role_has_permissions` VALUES (19, 1);
INSERT INTO `role_has_permissions` VALUES (20, 1);
INSERT INTO `role_has_permissions` VALUES (21, 1);
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (25, 1);
INSERT INTO `role_has_permissions` VALUES (26, 1);
INSERT INTO `role_has_permissions` VALUES (27, 1);
INSERT INTO `role_has_permissions` VALUES (28, 1);
INSERT INTO `role_has_permissions` VALUES (29, 1);
INSERT INTO `role_has_permissions` VALUES (30, 1);
INSERT INTO `role_has_permissions` VALUES (31, 1);
INSERT INTO `role_has_permissions` VALUES (32, 1);
INSERT INTO `role_has_permissions` VALUES (33, 1);
INSERT INTO `role_has_permissions` VALUES (34, 1);
INSERT INTO `role_has_permissions` VALUES (35, 1);
INSERT INTO `role_has_permissions` VALUES (36, 1);
INSERT INTO `role_has_permissions` VALUES (37, 1);
INSERT INTO `role_has_permissions` VALUES (38, 1);
INSERT INTO `role_has_permissions` VALUES (39, 1);
INSERT INTO `role_has_permissions` VALUES (40, 1);
INSERT INTO `role_has_permissions` VALUES (41, 1);
INSERT INTO `role_has_permissions` VALUES (42, 1);
INSERT INTO `role_has_permissions` VALUES (43, 1);
INSERT INTO `role_has_permissions` VALUES (44, 1);
INSERT INTO `role_has_permissions` VALUES (45, 1);
INSERT INTO `role_has_permissions` VALUES (46, 1);
INSERT INTO `role_has_permissions` VALUES (47, 1);
INSERT INTO `role_has_permissions` VALUES (48, 1);
INSERT INTO `role_has_permissions` VALUES (49, 1);
INSERT INTO `role_has_permissions` VALUES (50, 1);
INSERT INTO `role_has_permissions` VALUES (51, 1);
INSERT INTO `role_has_permissions` VALUES (52, 1);
INSERT INTO `role_has_permissions` VALUES (53, 1);
INSERT INTO `role_has_permissions` VALUES (54, 1);
INSERT INTO `role_has_permissions` VALUES (55, 1);
INSERT INTO `role_has_permissions` VALUES (56, 1);
INSERT INTO `role_has_permissions` VALUES (57, 1);
INSERT INTO `role_has_permissions` VALUES (58, 1);
INSERT INTO `role_has_permissions` VALUES (59, 1);
INSERT INTO `role_has_permissions` VALUES (60, 1);
INSERT INTO `role_has_permissions` VALUES (61, 1);
INSERT INTO `role_has_permissions` VALUES (62, 1);
INSERT INTO `role_has_permissions` VALUES (63, 1);
INSERT INTO `role_has_permissions` VALUES (64, 1);
INSERT INTO `role_has_permissions` VALUES (65, 1);
INSERT INTO `role_has_permissions` VALUES (66, 1);
INSERT INTO `role_has_permissions` VALUES (67, 1);
INSERT INTO `role_has_permissions` VALUES (68, 1);
INSERT INTO `role_has_permissions` VALUES (69, 1);
INSERT INTO `role_has_permissions` VALUES (70, 1);
INSERT INTO `role_has_permissions` VALUES (71, 1);
INSERT INTO `role_has_permissions` VALUES (72, 1);
INSERT INTO `role_has_permissions` VALUES (73, 1);
INSERT INTO `role_has_permissions` VALUES (74, 1);
INSERT INTO `role_has_permissions` VALUES (75, 1);
INSERT INTO `role_has_permissions` VALUES (76, 1);
INSERT INTO `role_has_permissions` VALUES (77, 1);
INSERT INTO `role_has_permissions` VALUES (78, 1);
INSERT INTO `role_has_permissions` VALUES (79, 1);
INSERT INTO `role_has_permissions` VALUES (80, 1);
INSERT INTO `role_has_permissions` VALUES (81, 1);
INSERT INTO `role_has_permissions` VALUES (82, 1);
INSERT INTO `role_has_permissions` VALUES (83, 1);
INSERT INTO `role_has_permissions` VALUES (84, 1);
INSERT INTO `role_has_permissions` VALUES (85, 1);
INSERT INTO `role_has_permissions` VALUES (86, 1);
INSERT INTO `role_has_permissions` VALUES (87, 1);
INSERT INTO `role_has_permissions` VALUES (88, 1);
INSERT INTO `role_has_permissions` VALUES (89, 1);
INSERT INTO `role_has_permissions` VALUES (90, 1);
INSERT INTO `role_has_permissions` VALUES (91, 1);
INSERT INTO `role_has_permissions` VALUES (92, 1);
INSERT INTO `role_has_permissions` VALUES (93, 1);
INSERT INTO `role_has_permissions` VALUES (94, 1);
INSERT INTO `role_has_permissions` VALUES (95, 1);
INSERT INTO `role_has_permissions` VALUES (96, 1);
INSERT INTO `role_has_permissions` VALUES (97, 1);
INSERT INTO `role_has_permissions` VALUES (98, 1);
INSERT INTO `role_has_permissions` VALUES (99, 1);
INSERT INTO `role_has_permissions` VALUES (100, 1);
INSERT INTO `role_has_permissions` VALUES (101, 1);
INSERT INTO `role_has_permissions` VALUES (102, 1);
INSERT INTO `role_has_permissions` VALUES (103, 1);
INSERT INTO `role_has_permissions` VALUES (104, 1);

--
-- Table structure for `roles`
--
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `roles`
--
INSERT INTO `roles` VALUES (1, 'Super Admin', 'web', '2025-06-30 01:48:41', '2025-06-30 01:48:41');

--
-- Table structure for `salary_adjustments`
--
DROP TABLE IF EXISTS `salary_adjustments`;
CREATE TABLE `salary_adjustments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `adjust_type_id` bigint unsigned DEFAULT NULL,
  `month` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `before_salary` decimal(10,2) DEFAULT NULL,
  `net_salary` decimal(10,2) DEFAULT NULL,
  `creator_id` bigint unsigned DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_adjustments_user_id_foreign` (`user_id`),
  KEY `salary_adjustments_adjust_type_id_foreign` (`adjust_type_id`),
  KEY `salary_adjustments_creator_id_foreign` (`creator_id`),
  KEY `salary_adjustments_editor_id_foreign` (`editor_id`),
  CONSTRAINT `salary_adjustments_adjust_type_id_foreign` FOREIGN KEY (`adjust_type_id`) REFERENCES `adjustment_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `salary_adjustments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `salary_adjustments_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `salary_adjustments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `salary_adjustments`
--

--
-- Table structure for `salary_statements`
--
DROP TABLE IF EXISTS `salary_statements`;
CREATE TABLE `salary_statements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `salary_month` date DEFAULT NULL,
  `unpaid_leave` int DEFAULT NULL,
  `unpaid_leave_amount` decimal(10,2) DEFAULT NULL,
  `unpaid_early_leave` int DEFAULT NULL,
  `unpaid_early_leave_amount` decimal(10,2) DEFAULT NULL,
  `net_salary` decimal(10,2) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `salary_paid_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_statements_user_id_foreign` (`user_id`),
  CONSTRAINT `salary_statements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `salary_statements`
--

--
-- Table structure for `sessions`
--
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `sessions`
--
INSERT INTO `sessions` VALUES ('cQvIkSzgxys1elLxmRVoetXKn1hBcjMcKMvrrbzl', 15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUjJua2wyaURGekpiYnNEQWpmcFQ3ekphMEdKbmlObHN1R001Z21ZTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9zdXByZW94LmxvY2FsaG9zdDo4MDAwL3BvcnRhbCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1O30=', 1751391518);
INSERT INTO `sessions` VALUES ('EncT6lqcfPR4JqcqLIuFWxEPDC8snyOzOIHTtpNc', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOGdtU0VqMzRYUnFMZVQzQUY0THdOQW5taG1BUlBaT0JwVE10NFdzUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9iYWNrdXBzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1751391783);

--
-- Table structure for `tenants`
--
DROP TABLE IF EXISTS `tenants`;
CREATE TABLE `tenants` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `tenants`
--
INSERT INTO `tenants` VALUES ('supreox', '2025-06-30 02:26:00', '2025-06-30 02:26:00', '{\"created_at\": \"2025-06-30 02:26:00\", \"updated_at\": \"2025-06-30 02:26:00\", \"tenancy_db_name\": \"tenantsupreox\"}');

--
-- Table structure for `time_zones`
--
DROP TABLE IF EXISTS `time_zones`;
CREATE TABLE `time_zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time_zones_editor_id_foreign` (`editor_id`),
  CONSTRAINT `time_zones_editor_id_foreign` FOREIGN KEY (`editor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `time_zones`
--
INSERT INTO `time_zones` VALUES (1, 'Asia/Dhaka', NULL, '2025-06-29 19:48:41', NULL);

--
-- Table structure for `users`
--
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emer_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emer_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emer_relation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `dob` date DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marriage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_manager` bigint unsigned DEFAULT NULL,
  `depart_id` bigint unsigned DEFAULT NULL,
  `desig_id` bigint unsigned DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `annual_leave` int DEFAULT NULL,
  `emp_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `resign_date` date DEFAULT NULL,
  `eva_start_date` date DEFAULT NULL,
  `eva_end_date` date DEFAULT NULL,
  `id_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rec_degree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rec_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` bigint unsigned DEFAULT NULL,
  `bank_branch_id` bigint unsigned DEFAULT NULL,
  `bank_account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_swift_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_sort_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_routing_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_branch_id` bigint unsigned DEFAULT NULL,
  `office_id_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_card_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_IT_requirement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_work_schedule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` bigint unsigned DEFAULT NULL,
  `editor` bigint unsigned DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `restore_by` bigint unsigned DEFAULT NULL,
  `deleted_time` timestamp NULL DEFAULT NULL,
  `restored_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_report_manager_foreign` (`report_manager`),
  KEY `users_depart_id_foreign` (`depart_id`),
  KEY `users_desig_id_foreign` (`desig_id`),
  KEY `users_bank_id_foreign` (`bank_id`),
  KEY `users_bank_branch_id_foreign` (`bank_branch_id`),
  KEY `users_office_branch_id_foreign` (`office_branch_id`),
  KEY `users_creator_foreign` (`creator`),
  KEY `users_editor_foreign` (`editor`),
  KEY `users_deleted_by_foreign` (`deleted_by`),
  KEY `users_restore_by_foreign` (`restore_by`),
  CONSTRAINT `users_bank_branch_id_foreign` FOREIGN KEY (`bank_branch_id`) REFERENCES `bank_branches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `bank_names` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_creator_foreign` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_depart_id_foreign` FOREIGN KEY (`depart_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_desig_id_foreign` FOREIGN KEY (`desig_id`) REFERENCES `designations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_editor_foreign` FOREIGN KEY (`editor`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_office_branch_id_foreign` FOREIGN KEY (`office_branch_id`) REFERENCES `office_branches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_report_manager_foreign` FOREIGN KEY (`report_manager`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_restore_by_foreign` FOREIGN KEY (`restore_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `users`
--
INSERT INTO `users` VALUES (1, 'SupreoX', NULL, 'juyel@supreoxmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '$2y$12$D0lFdaH6RHAcrV4HP54zDeRVw0.J1kyhUgly0UTpFjr38oOCSlPsC', NULL, NULL, NULL, NULL, NULL, '2025-06-29 19:48:41', '2025-06-30 01:48:41');

SET FOREIGN_KEY_CHECKS=1;
