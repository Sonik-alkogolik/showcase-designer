-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: showcase_designer
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-0878881f0d770e2127f8728c16e98aec','i:1;',1781259277),('laravel-cache-0878881f0d770e2127f8728c16e98aec:timer','i:1781259277;',1781259277),('laravel-cache-2a36f15bffb6fece5af7a3b24d0c8575','i:2;',1781002897),('laravel-cache-2a36f15bffb6fece5af7a3b24d0c8575:timer','i:1781002897;',1781002897),('laravel-cache-341dbe620252087756f3f60d2ccd3aa7','i:5;',1781766077),('laravel-cache-341dbe620252087756f3f60d2ccd3aa7:timer','i:1781766077;',1781766077),('laravel-cache-f57ac8b653eb14e20092f15eb7a3129e','i:3;',1780952011),('laravel-cache-f57ac8b653eb14e20092f15eb7a3129e:timer','i:1780952011;',1780952011),('laravel-cache-illuminate:queue:restart','i:1780827485;',2096187485),('laravel-cache-telegram_avatar_sync_cooldown_42','i:1;',1781516064),('laravel-cache-telegram_avatar_sync_cooldown_44','i:1;',1781516078);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_shop_id_name_unique` (`shop_id`,`name`),
  UNIQUE KEY `categories_shop_name_unique` (`shop_id`,`name`),
  KEY `categories_shop_active_sort_idx` (`shop_id`,`is_active`,`sort_order`),
  CONSTRAINT `categories_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (443,15,'Стулья','stulia',NULL,0,1,'2026-04-23 10:45:13','2026-04-23 10:45:13'),(444,15,'Столы','stoly',NULL,0,1,'2026-04-23 10:45:17','2026-04-23 10:45:17'),(445,15,'Комплекты','komplekty',NULL,0,1,'2026-04-23 10:45:24','2026-04-23 10:45:24'),(446,15,'Прочее','procee',NULL,0,1,'2026-04-23 10:46:56','2026-04-23 10:46:56');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_product_unique` (`product_id`,`category_id`),
  KEY `category_product_category_idx` (`category_id`,`product_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_product`
--

LOCK TABLES `category_product` WRITE;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` VALUES (43,2435,445,'2026-04-23 10:45:37','2026-04-23 10:45:37'),(44,2434,445,'2026-04-23 10:45:43','2026-04-23 10:45:43'),(45,2433,443,'2026-04-23 10:45:49','2026-04-23 10:45:49'),(46,2432,443,'2026-04-23 10:45:54','2026-04-23 10:45:54'),(47,2431,443,'2026-04-23 10:45:59','2026-04-23 10:45:59'),(48,2430,443,'2026-04-23 10:46:06','2026-04-23 10:46:06'),(49,2428,443,'2026-04-23 10:46:11','2026-04-23 10:46:11'),(50,2427,446,'2026-04-23 10:47:16','2026-04-23 10:47:16'),(51,2426,444,'2026-04-23 10:47:24','2026-04-23 10:47:24'),(52,2423,444,'2026-04-23 10:47:33','2026-04-23 10:47:33'),(53,2422,444,'2026-04-23 10:47:38','2026-04-23 10:47:38'),(54,2421,444,'2026-04-23 10:47:43','2026-04-23 10:47:43'),(55,2420,444,'2026-04-23 10:47:48','2026-04-23 10:47:48'),(56,2419,444,'2026-04-23 10:47:53','2026-04-23 10:47:53'),(57,2418,444,'2026-04-23 10:47:58','2026-04-23 10:47:58'),(58,2417,444,'2026-04-23 10:48:06','2026-04-23 10:48:06'),(59,2416,444,'2026-04-23 10:48:13','2026-04-23 10:48:13'),(60,2415,444,'2026-04-23 10:48:18','2026-04-23 10:48:18');
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verification_tokens`
--

DROP TABLE IF EXISTS `email_verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verification_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verification_tokens`
--

LOCK TABLES `email_verification_tokens` WRITE;
/*!40000 ALTER TABLE `email_verification_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_runs`
--

DROP TABLE IF EXISTS `import_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_runs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `source_filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mapping` json DEFAULT NULL,
  `image_base_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` int unsigned NOT NULL DEFAULT '0',
  `current_count_before_import` int unsigned NOT NULL DEFAULT '0',
  `available_slots_before_import` int unsigned NOT NULL DEFAULT '0',
  `total_rows` int unsigned NOT NULL DEFAULT '0',
  `imported_count` int unsigned NOT NULL DEFAULT '0',
  `success_count` int unsigned NOT NULL DEFAULT '0',
  `failed_count` int unsigned NOT NULL DEFAULT '0',
  `skipped_due_to_limit` int unsigned NOT NULL DEFAULT '0',
  `failures` json DEFAULT NULL,
  `error_message` text COLLATE utf8mb4_unicode_ci,
  `started_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_runs_shop_id_status_created_at_index` (`shop_id`,`status`,`created_at`),
  KEY `import_runs_user_id_created_at_index` (`user_id`,`created_at`),
  CONSTRAINT `import_runs_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  CONSTRAINT `import_runs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_runs`
--

LOCK TABLES `import_runs` WRITE;
/*!40000 ALTER TABLE `import_runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_01_18_111336_create_personal_access_tokens_table',2),(5,'2026_01_18_112136_create_personal_access_tokens_table',1),(6,'2026_01_19_183428_create_email_verification_tokens_table',3),(7,'2026_01_20_155346_add_telegram_fields_to_users_table',3),(8,'2026_01_30_124655_fix_telegram_fields_types_in_users_table',4),(9,'2026_02_01_140547_add_telegram_fields_to_users_table',5),(10,'2026_02_01_141247_update_telegram_fields_for_linking',5),(11,'2026_02_19_155325_create_subscriptions_table',6),(12,'2020_10_04_115514_create_moonshine_roles_table',7),(13,'2020_10_05_173148_create_moonshine_tables',7),(14,'2026_02_21_141240_create_shops_table',8),(15,'2026_02_22_153905_create_products_table',9),(16,'2026_02_23_152904_create_orders_table',10),(17,'2026_02_28_085251_add_attributes_to_products_table',11),(18,'2026_03_01_103611_create_categories_table',12),(19,'2026_03_02_112205_add_category_id_to_products_table',13),(20,'2026_03_02_112211_migrate_categories_data',13),(21,'2026_03_02_184138_add_default_misc_category',14),(22,'2026_03_02_112150_create_categories_table',15),(23,'2026_03_28_131500_add_notification_fields_to_shops_table',15),(24,'2026_04_09_120500_add_show_in_slider_to_products_table',16),(25,'2026_04_10_150000_add_telegram_avatar_url_to_users_table',17),(26,'2026_04_14_144130_fix_missing_shop_columns_v2',18),(27,'2026_04_18_120000_add_scaling_indexes_for_multi_tenant_tables',19),(28,'2026_04_18_123000_create_import_runs_table',19),(29,'2026_04_18_124000_dedupe_categories_and_add_unique_shop_name',19),(30,'2026_04_18_183000_create_category_product_table',20),(31,'2026_04_18_200000_add_must_change_password_to_users_table',21),(32,'2026_04_18_201000_create_telegram_password_reset_tokens_table',21),(33,'2026_04_19_150000_enforce_user_shop_cascade_and_cleanup_orphans',22),(34,'2026_04_30_090000_add_theme_settings_to_shops_table',23),(35,'2026_04_30_130000_add_onboarding_completed_at_to_users_table',24),(36,'2026_05_02_120000_add_manual_payment_fields_to_subscriptions_table',25),(37,'2026_05_02_150000_create_subscription_payments_table',26),(38,'2026_05_03_120000_add_manager_message_template_to_shops_table',27),(39,'2026_05_31_120000_create_support_tickets_table',28),(40,'2026_05_31_120100_create_support_ticket_messages_table',28);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moonshine_user_roles`
--

DROP TABLE IF EXISTS `moonshine_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moonshine_user_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moonshine_user_roles`
--

LOCK TABLES `moonshine_user_roles` WRITE;
/*!40000 ALTER TABLE `moonshine_user_roles` DISABLE KEYS */;
INSERT INTO `moonshine_user_roles` VALUES (1,'Admin','2026-02-21 08:54:28','2026-02-21 08:54:28');
/*!40000 ALTER TABLE `moonshine_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moonshine_users`
--

DROP TABLE IF EXISTS `moonshine_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moonshine_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `moonshine_user_role_id` bigint unsigned NOT NULL DEFAULT '1',
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moonshine_users_email_unique` (`email`),
  KEY `moonshine_users_moonshine_user_role_id_foreign` (`moonshine_user_role_id`),
  CONSTRAINT `moonshine_users_moonshine_user_role_id_foreign` FOREIGN KEY (`moonshine_user_role_id`) REFERENCES `moonshine_user_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moonshine_users`
--

LOCK TABLES `moonshine_users` WRITE;
/*!40000 ALTER TABLE `moonshine_users` DISABLE KEYS */;
INSERT INTO `moonshine_users` VALUES (1,1,'admin4ik_admin','$2y$12$KzE4kZdRMjptZb5ymLSBsembT2/Y20g.6AaTV4gX2Kp0pLI.YnfnC','admin4ik_admin',NULL,NULL,'2026-02-21 08:56:27','2026-02-21 08:56:27');
/*!40000 ALTER TABLE `moonshine_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint unsigned NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `delivery_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','paid','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `yookassa_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_shop_id_index` (`shop_id`),
  KEY `orders_status_index` (`status`),
  KEY `orders_yookassa_payment_id_index` (`yookassa_payment_id`),
  KEY `orders_shop_status_created_idx` (`shop_id`,`status`,`created_at`),
  CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (91,'App\\Models\\User',42,'auth-token','ba0855912f2bc08d06dc6908e62ee9f8fa680a5fef4e5ed44dc32a21d10bf502','[\"*\"]','2026-04-28 07:42:18',NULL,'2026-04-22 10:33:27','2026-04-28 07:42:18'),(92,'App\\Models\\User',42,'auth-token','71165e771be2583299c00da39a616e90a40553cc0a078575437a89b205c2443b','[\"*\"]','2026-04-23 10:48:50',NULL,'2026-04-22 11:08:43','2026-04-23 10:48:50'),(93,'App\\Models\\User',43,'auth-token','104a0d33c3d31b3ff02f45c0be86bd3b549183fd3e2b445cc9640dc47c0ae47d','[\"*\"]','2026-05-04 08:49:37',NULL,'2026-04-28 18:49:41','2026-05-04 08:49:37'),(98,'App\\Models\\User',42,'auth-token','04a2d7b19f9f5784b91b75f529a12a80b162db0ac8bd17f94e7a0f4bd24c762d','[\"*\"]','2026-05-01 15:20:48',NULL,'2026-05-01 15:20:48','2026-05-01 15:20:48'),(101,'App\\Models\\User',44,'auth-token','a346771d14efa604cde73e56882ebdc9c3c1b1108991ad92ea33380a47b98611','[\"*\"]','2026-05-02 08:17:05',NULL,'2026-05-02 08:13:52','2026-05-02 08:17:05'),(102,'App\\Models\\User',44,'auth-token','22be78bd7754effbb6e8d5f13ce1275a0ed98dc2eda571a0f2c193fa06af2e36','[\"*\"]','2026-05-02 08:27:03',NULL,'2026-05-02 08:26:59','2026-05-02 08:27:03'),(103,'App\\Models\\User',44,'auth-token','cea6ebbb2f3b02074293c1c855097d30f822e9623c94305b0b6cfabb84bcc982','[\"*\"]','2026-05-02 08:29:15',NULL,'2026-05-02 08:28:14','2026-05-02 08:29:15'),(104,'App\\Models\\User',44,'auth-token','c07f7eb5dd2b98c662eef390f7e86f17f5d9b9e3957bc68a6c0f529d1a997ae1','[\"*\"]','2026-05-02 08:29:35',NULL,'2026-05-02 08:29:33','2026-05-02 08:29:35'),(105,'App\\Models\\User',44,'auth-token','a96b5bda83c78732f2f252eadd3be35d7c5000b08d2d99f569bf65e3f62debe7','[\"*\"]','2026-05-02 08:31:51',NULL,'2026-05-02 08:31:27','2026-05-02 08:31:51'),(106,'App\\Models\\User',44,'auth-token','122f9657921450d99a2f615f37d25f74239099b758c6755e4b3cef41da1d3907','[\"*\"]','2026-05-02 09:43:32',NULL,'2026-05-02 08:32:40','2026-05-02 09:43:32'),(107,'App\\Models\\User',44,'auth-token','3dd4778c247077c704b11665bbc92825bd5e94d9e466bd8df607d01aa41db8da','[\"*\"]','2026-05-02 09:25:25',NULL,'2026-05-02 09:24:54','2026-05-02 09:25:25'),(108,'App\\Models\\User',44,'auth-token','8ace519184306280c2ab562b61ee56ffd08435beade005719b2a793c42102544','[\"*\"]','2026-05-02 09:33:27',NULL,'2026-05-02 09:33:26','2026-05-02 09:33:27'),(109,'App\\Models\\User',44,'auth-token','a9bbc24e31e5f40448e5804d2b268f35859f7649f359af01e6899ae397f6edbd','[\"*\"]',NULL,NULL,'2026-05-02 09:37:38','2026-05-02 09:37:38'),(110,'App\\Models\\User',44,'auth-token','fe89f08654990f9b81b78ba93874af98325524b17cec21abe1ad11fb9ba0d883','[\"*\"]','2026-05-02 09:39:21',NULL,'2026-05-02 09:39:20','2026-05-02 09:39:21'),(111,'App\\Models\\User',44,'auth-token','065896edd694e810534e8db728cb93f46b8384904fcf09011c44c3f876a0d0de','[\"*\"]','2026-05-02 09:43:26',NULL,'2026-05-02 09:42:37','2026-05-02 09:43:26'),(112,'App\\Models\\User',44,'auth-token','4e45fa8cae57e66cc7e371222314ad92906f269ee36e97761f8a64abadc96e5d','[\"*\"]','2026-05-02 09:44:36',NULL,'2026-05-02 09:44:35','2026-05-02 09:44:36'),(113,'App\\Models\\User',44,'auth-token','f22f3f1bcb2726375d6ee2dd76ff3ab4f560fd27f628e96a5e650f94e2f256a6','[\"*\"]','2026-05-02 09:57:45',NULL,'2026-05-02 09:56:58','2026-05-02 09:57:45'),(114,'App\\Models\\User',44,'auth-token','ae4fbeb0fc4be0286dc8a4d610440d17cffac0ef7827ed9afe5237c9e16a103a','[\"*\"]','2026-05-02 09:57:58',NULL,'2026-05-02 09:57:58','2026-05-02 09:57:58'),(115,'App\\Models\\User',44,'auth-token','3055f43fd477085b323c52ecfb98ef98abca574a0648abffd669c00657296089','[\"*\"]','2026-05-02 10:11:04',NULL,'2026-05-02 10:10:18','2026-05-02 10:11:04'),(116,'App\\Models\\User',44,'auth-token','ee2747a2bb24963761c98b83dddcaf89676f609710a827dff98817dfecb4ceb7','[\"*\"]','2026-05-02 10:16:44',NULL,'2026-05-02 10:15:56','2026-05-02 10:16:44'),(117,'App\\Models\\User',44,'auth-token','722a2d76f71c8c0bee89df4af24f1abbcd4ca5f76e624b8d0f8d0b70e117c3cd','[\"*\"]','2026-05-02 10:17:13',NULL,'2026-05-02 10:17:10','2026-05-02 10:17:13'),(118,'App\\Models\\User',44,'auth-token','186dfd7d456caa21df955f9b6f5b221be75c776915019e59d06ebef550630b8a','[\"*\"]','2026-05-02 10:25:38',NULL,'2026-05-02 10:23:36','2026-05-02 10:25:38'),(119,'App\\Models\\User',44,'auth-token','7d39b70c789428a7a2ee629f04ed16bc6d82fc05355a0150e294f032b655ece7','[\"*\"]','2026-05-02 10:41:19',NULL,'2026-05-02 10:40:22','2026-05-02 10:41:19'),(120,'App\\Models\\User',44,'auth-token','a98669b72816b65dc2b966cfcb3b4501e0988fef85d6ee718d54962f894acbdb','[\"*\"]','2026-05-02 16:25:43',NULL,'2026-05-02 16:24:14','2026-05-02 16:25:43'),(121,'App\\Models\\User',44,'auth-token','afbac9fd4723e30bf3417057bbf6ff3ebbf52ddd80107f9aac73c8e2c621b163','[\"*\"]','2026-05-02 16:41:52',NULL,'2026-05-02 16:40:24','2026-05-02 16:41:52'),(122,'App\\Models\\User',44,'auth-token','cc888759040a955831d9358893859bec6f2c55537bbc6aed23ec70fc7b404b05','[\"*\"]','2026-05-02 16:44:19',NULL,'2026-05-02 16:42:51','2026-05-02 16:44:19'),(123,'App\\Models\\User',44,'auth-token','9ca654cd77426fa89a4574639f11e3f15f193966ad36a210aa5a4c1b2a2fcdfe','[\"*\"]','2026-05-02 18:44:34',NULL,'2026-05-02 18:44:32','2026-05-02 18:44:34'),(124,'App\\Models\\User',44,'auth-token','1fa96be56a23fd487d6bb481532f5aaf1498d0693a7111413907481d8fa3aada','[\"*\"]','2026-05-02 18:44:37',NULL,'2026-05-02 18:44:36','2026-05-02 18:44:37'),(125,'App\\Models\\User',44,'auth-token','9882c9f397b18a94d956902b854522c9392c4509e95fe32b02e246e9ba6884f5','[\"*\"]','2026-05-02 18:44:39',NULL,'2026-05-02 18:44:38','2026-05-02 18:44:39'),(126,'App\\Models\\User',44,'auth-token','5ffb95f10b9e014eb718ff8ea7cb8cce416151ca387d3760ae02a7474c487eb1','[\"*\"]','2026-05-02 18:44:40',NULL,'2026-05-02 18:44:40','2026-05-02 18:44:40'),(127,'App\\Models\\User',44,'auth-token','186ad00215fc98a7c9c4913b4ce167e702d8cb4221bf16ed121937c3234d7015','[\"*\"]','2026-05-07 06:20:53',NULL,'2026-05-02 18:44:44','2026-05-07 06:20:53'),(128,'App\\Models\\User',45,'auth-token','42e4c3d9b2c5797229ca38eb9bc3833358e013d905d1c655a7fc0312cc5fd708','[\"*\"]','2026-05-04 01:57:19',NULL,'2026-05-04 01:53:13','2026-05-04 01:57:19'),(130,'App\\Models\\User',44,'auth-token','0b83d474667033fd53fbd700b8909d04f161036668b31f0aa549d88448e2578d','[\"*\"]','2026-05-06 10:59:11',NULL,'2026-05-06 10:59:10','2026-05-06 10:59:11'),(131,'App\\Models\\User',44,'auth-token','9b202075b796264b53fbacaead47c922dd983950c327f5ab2b9507cb7fc61148','[\"*\"]','2026-05-12 18:26:49',NULL,'2026-05-06 11:28:58','2026-05-12 18:26:49'),(132,'App\\Models\\User',46,'auth-token','34123c9deb444fdbbe0b317b97153b894c4d8d6a235d45b14810c6dd5a3f66a8','[\"*\"]','2026-05-09 07:00:33',NULL,'2026-05-09 06:57:42','2026-05-09 07:00:33'),(133,'App\\Models\\User',47,'auth-token','87e547c4f9ba26732e7eea2102c18eb20b93a4502cebabe5976296975834e300','[\"*\"]','2026-05-12 09:07:24',NULL,'2026-05-12 09:04:15','2026-05-12 09:07:24'),(134,'App\\Models\\User',48,'auth-token','a71be876230da2e2d68a046a8f4ee2755351fa4621e6cd140e0252d00ec1c501','[\"*\"]','2026-05-16 05:55:29',NULL,'2026-05-16 05:53:21','2026-05-16 05:55:29'),(135,'App\\Models\\User',49,'auth-token','ea760c9c3658037a982bd965acbe06abc890f64218c5f2b26f1ae1b858706dbd','[\"*\"]','2026-05-21 12:55:58',NULL,'2026-05-21 12:53:17','2026-05-21 12:55:58'),(137,'App\\Models\\User',51,'auth-token','f67c066be2ed46cc2ac5774d69229c4c8d79cace42a6e14c6aebb8a8b5798d34','[\"*\"]','2026-05-26 11:03:51',NULL,'2026-05-24 14:23:02','2026-05-26 11:03:51'),(140,'App\\Models\\User',42,'auth-token','0d9c990ae2915a519489c2c6b254b951867d1282456047fd8e00848f1562c5de','[\"*\"]','2026-06-14 09:19:11',NULL,'2026-06-07 09:21:34','2026-06-14 09:19:11'),(141,'App\\Models\\User',42,'auth-token','f7fe672a8679c945a0a55d010298a6329a20e1c0b28abe86984e870da5be3e28','[\"*\"]','2026-06-15 09:24:30',NULL,'2026-06-12 10:13:38','2026-06-15 09:24:30');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT '1',
  `show_in_slider` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_shop_id_index` (`shop_id`),
  KEY `products_category_index` (`category`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_show_in_slider_index` (`show_in_slider`),
  KEY `products_shop_category_idx` (`shop_id`,`category_id`),
  KEY `products_shop_stock_created_idx` (`shop_id`,`in_stock`,`created_at`),
  KEY `products_shop_slider_idx` (`shop_id`,`show_in_slider`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2636 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2415,15,444,'Стол 1',12000.00,'ДШВ 200/100/80. цвета основания белый, черный, серый.','Столы',1,1,'/storage/products/2aZEPdDlEZBlvFPg2ZVZwnltCHk85Clof1U9O1yx.png','{}','2026-04-22 11:47:17','2026-04-23 10:48:18'),(2416,15,444,'Стол 2',12000.00,'ДШВ 160/80/80. цвета основания белый, черный, серый.','Столы',1,0,'/storage/products/MRe6fxNk9hdXRx1XXDBG1NW0kiiTBhe68Qez4aTO.png','{}','2026-04-22 11:50:19','2026-04-23 10:48:13'),(2417,15,444,'Стол 3',4000.00,'ДШВ 80/50/40','Столы',1,1,'/storage/products/B47TXDQh4bPsugQ6t1xeMpa5PXJpbc7LqLnkzNAa.jpg','{}','2026-04-22 11:50:28','2026-04-23 10:48:06'),(2418,15,444,'Стол 4',5000.00,'ДШВ 150/50/50. цвета основания белый, черный, серый.','Столы',1,1,'/storage/products/x08SGGYSzKLlBztqF7SBG9cPmRYG6ak1wN11UPPt.jpg','{}','2026-04-22 11:50:43','2026-04-23 10:47:58'),(2419,15,444,'Стол 5',4000.00,'ДШВ 60/60/40. цвета основания белый, черный, серый.','Столы',1,1,'/storage/products/cp0PzoIliBzcAL8muriqm4IpmBApSgh7G7wMPwA9.jpg','{}','2026-04-22 11:51:19','2026-04-23 10:47:53'),(2420,15,444,'Стол 6',12000.00,'ДШВ 200/100/80. цвета основания белый, черный, серый.','Столы',1,1,'/storage/products/bmEe2NXKkVxSmVAZNrjaJ8fGugYJguZrEs7zvyNp.jpg','{}','2026-04-22 11:51:30','2026-04-23 10:47:48'),(2421,15,444,'Стол 7',7.00,NULL,'Столы',1,1,'/storage/products/iceRnvsx67mhGmhfkLuEScgqO50qHCnPsCpsJpbX.jpg','{}','2026-04-22 11:51:39','2026-04-23 10:47:43'),(2422,15,444,'Стол 8',8000.00,'50/150/80. цвета основания белый, черный, серый.','Столы',1,1,'/storage/products/k2qCBRu04mQerqgziIh9XRk78IhIFxtaZWwbyoeB.jpg','{}','2026-04-22 11:52:00','2026-04-23 10:47:38'),(2423,15,444,'Стол 9',10000.00,'75/150/80, цвета основания белый, черный, серый.','Столы',1,1,'/storage/products/cQyn9jdk0wwmOnETY9Scpii3tt8WEaxe39RuD2EG.jpg','{}','2026-04-22 11:52:13','2026-04-23 10:47:33'),(2426,15,444,'Стол 10',10000.00,'ДШВ 60/80/80\nбелый, черный, серый.','Столы',1,1,'/storage/products/V9C2ZDsiEwJl7ELuLeLuMehcZXuzSCfaTAogSLYH.png','{}','2026-04-23 10:23:01','2026-04-23 10:47:24'),(2427,15,446,'Тумба1',4000.00,'ДШВ 50/50/50','Прочее',1,0,'/storage/products/O9A764bL3EGyofDpOFM8W4k0MHqw3Yp5GN27LORw.png','{}','2026-04-23 10:24:06','2026-04-23 10:47:16'),(2428,15,443,'Стул 1',6000.00,NULL,'Стулья',1,0,'/storage/products/x92VT4g9dSikLilvEPD7b8k2VL2dluvd8ZUv3SKE.jpg','{}','2026-04-23 10:36:45','2026-04-23 10:46:11'),(2430,15,443,'Стул 2',4000.00,NULL,'Стулья',1,0,'/storage/products/xWh8JjJTaYbLwG6LoVlzqlj1F10doRxg6CTBvjan.jpg','{}','2026-04-23 10:37:23','2026-04-23 10:46:06'),(2431,15,443,'Стул 3',6000.00,NULL,'Стулья',1,0,'/storage/products/UGMOSKRqaQ3LbE0dSjzVVpVavri7X046eDnrRMAi.jpg','{}','2026-04-23 10:38:33','2026-04-23 10:45:59'),(2432,15,443,'Стул 4',4000.00,NULL,'Стулья',1,0,'/storage/products/2tjHDeggyUM1BlnnOmJdgmJHb1R3sDzjIKog8or8.jpg','{}','2026-04-23 10:40:04','2026-04-23 10:45:54'),(2433,15,443,'Стул 5',2500.00,NULL,'Стулья',1,0,'/storage/products/PCzlPsmTGF9CwZaMK1yhm4p5yNj3bCYmxePpq1cZ.jpg','{}','2026-04-23 10:41:27','2026-04-23 10:45:49'),(2434,15,445,'Комплект стол и 2 стула',15.00,'-15%','Комплекты',1,0,'/storage/products/NI5WTvlpdrlYazovCfSXkCYUByb2RSVMKyf1OJsE.jpg','{}','2026-04-23 10:43:54','2026-04-23 10:45:43'),(2435,15,445,'Комплект стол и 4 стула',20.00,'-20%','Комплекты',1,1,'/storage/products/4kH1ve1wRJjSWDxmyyf1I6tyV1RcvPr1dhCSaNDm.jpg','{}','2026-04-23 10:44:25','2026-04-23 11:02:05'),(2533,16,NULL,'Маникюр услуга #1',625.00,'Демо-описание товара #3',NULL,1,0,'/storage/products/shop-16/2XcoiGyGXZ7yLwkg6LO0H1WzgZXbFXf4n24m9Sqj.jpg','{}','2026-05-02 08:34:44','2026-05-03 07:36:52'),(2538,16,NULL,'Маникюр услуга #2',1000.00,'Демо-описание товара #8',NULL,1,0,'/storage/products/shop-16/9KhrLBk9QHDr2LEMquHa70BKCPBSzfCOfr9sDSKl.jpg','{}','2026-05-02 08:38:02','2026-05-03 07:37:34'),(2542,16,NULL,'Маникюр услуга #3',1300.00,'Демо-описание товара #12',NULL,1,0,'/storage/products/shop-16/4Tyu7SEamFu8cSsIS8BNQlzHyiHylt7wl4vXBta9.jpg','{}','2026-05-02 08:40:46','2026-05-03 07:37:40'),(2543,16,NULL,'Маникюр услуга #4',1375.00,'Демо-описание товара #13',NULL,1,0,'/storage/products/shop-16/gbLoOTArjbEZdVikWhJz6ZyTR2UAhXpBbxd32AJL.jpg','{}','2026-05-02 08:41:26','2026-05-03 07:37:48'),(2545,16,NULL,'Маникюр услуга #5',1525.00,'Демо-описание товара #15',NULL,1,0,'/storage/products/shop-16/kvzl80jVULdwseixbFreJwmkzmxLZa6xMLyP21Sh.jpg','{}','2026-05-02 08:42:48','2026-05-03 07:37:56'),(2546,16,NULL,'Маникюр услуга #6',1600.00,'Демо-описание товара #16',NULL,1,0,'/storage/products/shop-16/ZdTBAP4BdwXidYHBLEIiPbbh2Exf0KeBcQtJVVgs.jpg','{}','2026-05-02 08:43:30','2026-05-03 07:38:02'),(2547,16,NULL,'Маникюр услуга #7',1675.00,'Демо-описание товара #17',NULL,1,0,'/storage/products/shop-16/CzwOy5YGHyQaTrx1lWeoF33l3NQaI1JJI3BRwBgG.jpg','{}','2026-05-02 08:44:10','2026-05-03 07:38:17'),(2548,16,NULL,'Маникюр услуга #8',1750.00,'Демо-описание товара #18',NULL,1,0,'/storage/products/shop-16/SQC2d3UuzhpWpZIjyTKGDICjlNiEG2lKLHL2n3yM.jpg','{}','2026-05-02 08:44:51','2026-05-03 07:38:23'),(2549,16,NULL,'Маникюр услуга #9',1825.00,'Демо-описание товара #19',NULL,1,0,'/storage/products/shop-16/Z2VuFZ2IWhmLgxCyAg3BJARnyzV0mp6DP3vblazZ.jpg','{}','2026-05-02 08:45:32','2026-05-03 07:38:30'),(2550,16,NULL,'Маникюр услуга #10',1900.00,'Демо-описание товара #20',NULL,1,0,'/storage/products/shop-16/amOYuoJvZUpOUce0Ng4XdNsRdvw3haGCTh9dqk4j.jpg','{}','2026-05-02 08:46:13','2026-05-03 07:38:43'),(2551,17,NULL,'Барбер услуга #1',475.00,'Демо-описание товара #1',NULL,1,0,'/storage/products/shop-17/laOs8ny4vj5c3SfB2QFUPWZ6wd8HImsvPT0JxdYN.jpg','{}','2026-05-02 08:47:16','2026-05-02 16:43:09'),(2552,17,NULL,'Барбер услуга #2',550.00,'Демо-описание товара #2',NULL,1,0,'/storage/products/shop-17/XvBMmOeWi4TOPJUoAFg392MRK4B3S5fJhtNqJH4q.jpg','{}','2026-05-02 08:47:56','2026-05-02 16:43:10'),(2554,17,NULL,'Барбер услуга #3',700.00,'Демо-описание товара #4',NULL,1,0,'/storage/products/shop-17/pBAL1WoJAI7AcJ6gtQFvRNwUqyV56mtprTAz5rBv.jpg','{}','2026-05-02 08:49:14','2026-05-03 07:44:37'),(2556,17,NULL,'Барбер услуга #4',850.00,'Демо-описание товара #6',NULL,1,0,'/storage/products/shop-17/fidzlEtTXEkk1kkEne6jKiYpqC5QQ2hsMAF0i36H.jpg','{}','2026-05-02 08:50:33','2026-05-03 07:44:44'),(2561,17,NULL,'Барбер услуга #5',1225.00,'Демо-описание товара #11',NULL,1,0,'/storage/products/shop-17/wgFQEOSGWGubSObQVkItLyVDX89mfyPkIkfuLwOU.jpg','{}','2026-05-02 08:53:53','2026-05-03 07:44:58'),(2562,17,NULL,'Барбер услуга #6',1300.00,'Демо-описание товара #12',NULL,1,0,'/storage/products/shop-17/e8SzFeGnhn4MYtSIfaagq8Cw8mCgouM0L8phEi7c.jpg','{}','2026-05-02 08:54:34','2026-05-03 07:45:07'),(2565,17,NULL,'Барбер услуга #7',1525.00,'Демо-описание товара #15',NULL,1,0,'/storage/products/shop-17/La7MMFy4qpkjfek8sXsiQr2AHKq6KjLFJ3RKSvko.jpg','{}','2026-05-02 08:56:36','2026-05-03 07:45:18'),(2566,17,NULL,'Барбер услуга #8',1600.00,'Демо-описание товара #16',NULL,1,0,'/storage/products/shop-17/3bIYIaoWPYB0WQBMffhcP8gcwm6X8f6AcpT3pfXN.jpg','{}','2026-05-02 08:57:17','2026-05-03 07:45:26'),(2571,18,NULL,'Автоуслуга #1',475.00,'Демо-описание товара #1',NULL,1,0,'/storage/products/shop-18/UpCtGyOmgiQSfCHoRAKMvZgojVGWtzxD6BPkx2b6.jpg','{}','2026-05-02 09:01:01','2026-05-02 16:43:29'),(2574,18,NULL,'Автоуслуга #2',700.00,'Демо-описание товара #4',NULL,1,0,'/storage/products/shop-18/vJg9kbqK8ApESTWKUcPskMEmxWKnyrk3bbSzvEiX.jpg','{}','2026-05-02 09:02:53','2026-05-03 07:59:30'),(2575,18,NULL,'Автоуслуга #3',775.00,'Демо-описание товара #5',NULL,1,0,'/storage/products/shop-18/2K9WYCM7cGJaPiQzohvckyFaf0LVxhroiDcdSktJ.jpg','{}','2026-05-02 09:03:30','2026-05-03 07:59:36'),(2576,18,NULL,'Автоуслуга #4',850.00,'Демо-описание товара #6',NULL,1,0,'/storage/products/shop-18/O4PD1y0mun5Q9BHRZG4YEGsMXm3Nbzio5jhfBQ0C.jpg','{}','2026-05-02 09:04:08','2026-05-03 07:59:41'),(2578,18,NULL,'Автоуслуга #5',1000.00,'Демо-описание товара #8',NULL,1,0,'/storage/products/shop-18/nfc8okiVXchavyFYDcvzKjInqlzTs20rZ3ZqR2p4.jpg','{}','2026-05-02 09:05:23','2026-05-03 07:59:46'),(2581,18,NULL,'Автоуслуга #6',1225.00,'Демо-описание товара #11',NULL,1,0,'/storage/products/shop-18/vjOdgD4W1gqaRXavfFzSMMWFJBweGZMpocC5vYKa.jpg','{}','2026-05-02 09:07:18','2026-05-03 07:59:52'),(2585,18,NULL,'Автоуслуга #7',1525.00,'Демо-описание товара #15',NULL,1,0,'/storage/products/shop-18/aVYHLtEngqAj1Wx7Pk2fC7BGYDAhqzmQbwXMw4SV.jpg','{}','2026-05-02 09:09:53','2026-05-03 07:59:57'),(2594,19,NULL,'Эвакуация #1',700.00,'Демо-описание товара #4',NULL,1,0,'/storage/products/shop-19/GGbyRFcsHGVhQFrQknZ6tbu2mUC2cdLZAshLinAP.jpg','{}','2026-05-02 09:16:11','2026-05-03 08:05:37'),(2595,19,NULL,'Эвакуация #2',775.00,'Демо-описание товара #5',NULL,1,0,'/storage/products/shop-19/pNImct8LY8MsRh4Pr1rCtm8e1tzCYKfDtImgyTFa.webp','{}','2026-05-02 09:16:56','2026-05-03 08:05:43'),(2596,19,NULL,'Эвакуация #3',850.00,'Демо-описание товара #6',NULL,1,0,'/storage/products/shop-19/p2HsTyhJv9ikQGvIzP6a19u2e8JkOpkc6MWkOa6F.webp','{}','2026-05-02 09:17:41','2026-05-03 08:05:48'),(2597,19,NULL,'Эвакуация #4',925.00,'Демо-описание товара #7',NULL,1,0,'/storage/products/shop-19/itTpFel3ElrWf2aoPD92t1TYYnJx5cgNdmly5qeT.webp','{}','2026-05-02 09:18:24','2026-05-03 08:05:53'),(2600,19,NULL,'Эвакуация #5',1150.00,'Демо-описание товара #10',NULL,1,0,'/storage/products/shop-19/sbWhdEtlqGPO2yYs9yI3Fu1bBDJMBR7LcP0n9fKG.webp','{}','2026-05-02 09:20:16','2026-05-03 08:06:01'),(2602,19,NULL,'Эвакуация #6',1300.00,'Демо-описание товара #12',NULL,1,0,'/storage/products/shop-19/9qlWELY2PCMnUyL739UcQAMfXtvM3r2LZNUXXJk2.jpg','{}','2026-05-02 09:21:32','2026-05-03 08:06:07'),(2603,19,NULL,'Эвакуация #7',1375.00,'Демо-описание товара #13',NULL,1,0,'/storage/products/shop-19/3097gXWvubvThJWz3g2eL275Cil84UwO9bIkKF8C.webp','{}','2026-05-02 09:22:10','2026-05-03 08:06:12'),(2604,19,NULL,'Эвакуация #8',1450.00,'Демо-описание товара #14',NULL,1,1,'/storage/products/shop-19/TYjcZToOKVNimQn9jEcbVkuHCaVGP8R7ZhgDBwTL.webp','{}','2026-05-02 09:22:48','2026-05-03 08:31:41'),(2605,19,NULL,'Эвакуация #9',1525.00,'Демо-описание товара #15',NULL,1,1,'/storage/products/shop-19/432DIGmmjRCMLcJDT8g1FVcUxelXAmmkJHXmzl7c.webp','{}','2026-05-02 09:23:25','2026-05-03 08:31:36'),(2606,19,NULL,'Эвакуация #10',1600.00,'Демо-описание товара #16',NULL,1,1,'/storage/products/shop-19/ywhMnUzx7Y9frEEyLUbyH6zyF0E8gXC3hUDFO8s0.jpg','{}','2026-05-02 09:24:05','2026-05-03 08:31:32'),(2615,20,NULL,'Блюдо #1',775.00,'Демо-описание товара #5',NULL,1,0,'/storage/products/shop-20/XdfurJYxmx5kRevhWt1r31ivHOiWfh0AmTKM2dSZ.webp','{}','2026-05-02 09:31:33','2026-05-03 08:11:51'),(2619,20,NULL,'Блюдо #2',1075.00,'Демо-описание товара #9',NULL,1,0,'/storage/products/shop-20/rqmF8c2wtRku2qrqQHVmqWTT2wDQtNHJ4dnOEPjn.webp','{}','2026-05-02 09:34:55','2026-05-03 08:11:56'),(2621,20,NULL,'Блюдо #3',1225.00,'Демо-описание товара #11',NULL,1,0,'/storage/products/shop-20/ANQm6EpJW5pUCex483Ttxfng60aW1bk4GHUpVgH5.webp','{}','2026-05-02 09:36:31','2026-05-03 08:12:03'),(2622,20,NULL,'Блюдо #4',1300.00,'Демо-описание товара #12',NULL,1,0,'/storage/products/shop-20/Z6nhiBBxZtGx9BV1jXyg1hxj5AVmD7zuff8ti4LZ.jpg','{}','2026-05-02 09:37:17','2026-05-03 08:12:10'),(2624,20,NULL,'Блюдо #5',1450.00,'Демо-описание товара #14',NULL,1,0,'/storage/products/shop-20/ocfJIHpcttDmEwbkLysviJ6lrzE4OJRlZ7U0Wbcz.jpg','{}','2026-05-02 09:38:50','2026-05-03 08:12:16'),(2625,20,NULL,'Блюдо #6',1525.00,'Демо-описание товара #15',NULL,1,0,'/storage/products/shop-20/n8RRgDEsVzhEOEX2B1FESJMWhv2X0BRF0J8MFH3E.webp','{}','2026-05-02 09:39:37','2026-05-03 08:12:21'),(2626,20,NULL,'Блюдо #7',1600.00,'Демо-описание товара #16',NULL,1,0,'/storage/products/shop-20/To6zOC82XB8SXKKJmSB1sZ7znV66Fmp9Vs5wnSYj.webp','{}','2026-05-02 09:40:24','2026-05-03 08:12:27'),(2628,20,NULL,'Блюдо #8',1750.00,'Демо-описание товара #18',NULL,1,0,'/storage/products/shop-20/w5um7EQtdSAYZOIUydZ1xDjFTUYrua35GGrQlHYY.jpg','{}','2026-05-02 09:41:58','2026-05-03 08:12:35'),(2629,20,NULL,'Блюдо #9',1825.00,'Демо-описание товара #19',NULL,1,0,'/storage/products/shop-20/mSZmLwIB8mMusw8T79wRc1fHR4BnvjoeKRfaG6hZ.webp','{}','2026-05-02 09:42:46','2026-05-03 08:12:43'),(2630,20,NULL,'Блюдо #10',1900.00,'Демо-описание товара #20',NULL,1,0,'/storage/products/shop-20/asvsk53ke6t3Lvgv0nd7e44F19JPNAfptewROEzK.webp','{}','2026-05-02 09:43:32','2026-05-03 08:12:50'),(2631,17,NULL,'Барбер услуга #9',1000.00,NULL,NULL,1,0,'/storage/products/shop-17/jj9ZabUaoODdv55gRz2WKsQrNHYnTKhcr8ffKmkF.jpg','{}','2026-05-03 07:48:49','2026-05-03 07:48:49'),(2632,17,NULL,'Барбер услуга #10',1049.97,NULL,NULL,1,0,'/storage/products/shop-17/bNXWgd0B7eQpYtd6KSKEPdY4e3EWo9xDegOfPtjE.jpg','{}','2026-05-03 07:49:25','2026-05-03 07:49:25'),(2633,18,NULL,'Автоуслуга #8',1050.00,'Демо-описание товара',NULL,1,0,'/storage/products/shop-18/1YO5Tju5KqJepooQFLgHxV6CyT6SIa5O3usBMsMf.jpg','{}','2026-05-03 07:59:21','2026-05-03 08:01:36'),(2634,18,NULL,'Автоуслуга #9',1200.00,'Демо-описание товара',NULL,1,0,'/storage/products/shop-18/Wo4ZKsohV5KyjYgylVpt7Yqi3Cc16uBz7zGsyVDn.webp','{}','2026-05-03 08:01:18','2026-05-03 08:02:54'),(2635,18,NULL,'Автоуслуга #10',1099.98,'Демо-описание товара #8',NULL,1,0,'/storage/products/shop-18/n1v5dUxYftclGvhbeenOQ1QQFqScJN732i5GtNVs.jpg','{}','2026-05-03 08:02:45','2026-05-03 08:02:45');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('07FmmuGKAQRCZ3MYX1noEOJnL23qUXq12BgznEAX',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWZCNnZ4ZHliS2ozMDVMMG9hY1dXZEpFQ2FjQXNaV0RQYnhIelpKbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vd2l6YXJkLmpzcCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781773686),('0pdsWER1m1GjJKfUkO25nvKgYDSWhTgn3EwB9m4S',NULL,'172.236.13.105','Mozilla/5.0 (Knoppix; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXFFbUlOckk5dDVWWEpackUzS1ZSREF2S055WnlvamFqeTlueEdLbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP3BhZ2U9aW5zdGFsbCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjp3NkZ5VWhUZ0dQOEdNMGoyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781768411),('1YugEhWas99nbQ5oUbc4Hn6YAWS2nA8jfa7R6ZRq',NULL,'172.71.172.215','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYkczNTBKM292T05XRkJ1aU94SXZSMFZjUE1XMDR1anVycEMyUnJCZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM1OiJodHRwczovL2UtdGdvLnJ1L2FkbWluNGlrLWJyby9sb2dpbiI7czo1OiJyb3V0ZSI7czoxNToibW9vbnNoaW5lLmxvZ2luIjt9czo1NjoibG9naW5fbW9vbnNoaW5lXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1781794556),('1ZZA4QPV7ZKG60SZcqdS7QeLND0fgAzoAPvfgAfC',NULL,'172.236.13.105','Mozilla/5.0 (CentOS; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmJvN095c1VJTVZvbXhYVnRnNE9JRGRyTXQ4aDd6WDhRNkFlS081dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771763),('2mMlCtwwLzfZ6bxNmDrO7K17PyJX2WNQAkfFCE05',NULL,'172.236.13.105','Mozilla/5.0 (ZZ; Linux i686; rv:128.0) Gecko/20100101 Firefox/128.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOThQM3h3V3pNd3lhSzFyNHU0V2ZqeGtyWmdFVkJ3bXM0NkpTdE82MyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3N5c3RlbS92ZXJzaW9uIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781769577),('3l0p2vdNHHvYqucD8dedbc0fKP0N4lTECCJ9jFmT',NULL,'172.236.13.105','Mozilla/5.0 (ZZ; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUFxQWQyUU43YUJ0VmFDaDJ1UWRYTU5tYnQxVjZPOFZiUlBlSjFaNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YyL3ZlcnNpb24iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781772198),('40dKzxQ0pHgR1frbEHRp8BXyuJSbnUDm0GycDKdV',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9','YTozOntzOjY6Il90b2tlbiI7czo0MDoicHpCR3RYNTBjNmxhY2dDeGVqY2ZvVlVUWmFpclJGRDUzZkR2THZxSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL2NvbmZpZyI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781774998),('49JMaH4a9rKD8OTCyamuoXX4KHGv1srGWXtHEK2p',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTENBQ2NkMjJ3djN2dWRJMXlUNE50aW5peFplcnQ5OUdZU01HcW9aSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP3I9aW5zdGFsbGVyJTJGd2VsY29tZSI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjp3NkZ5VWhUZ0dQOEdNMGoyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781768184),('4CvcdRIUzcdGS8kWEKOuwWAdY9o5VeLEF2Y2bEgp',NULL,'3.87.27.156','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXZIaXJoRmtJb1d3TktzeVlLa1pTMjJESmRoZm0zWlNTc1RMMzhWbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZS10Z28ucnUvYXBpL2NvbmZpZyI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781803983),('4rNtKnF3s270oV0fxFeWdZXDQ261lDJ1MaLjIoXn',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.1 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzFoMkJmVk1OS0Y0WUNaU0RTamVBSEVwWmlZWTJWU3lzSUU0b3dPcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTE6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YyL3RlbmFudHMvZGVmYXVsdF90ZW5hbnQvZGF0YWJhc2VzL2RlZmF1bHRfZGF0YWJhc2UvY29sbGVjdGlvbnMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781775013),('4V7S0XJ5tsROmIwpzqXjqNg8QpOkthLLWg52Bndd',NULL,'167.86.75.114','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVpxTENUM09CMzI3clk3bWFEbFI0eGNZdnpidWdRWUQzQ0hHNG5NTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjAxOiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD8lMkYlM0MlM0ZlY2hvJTI4bWQ1JTI4JTIyaGklMjIlMjklMjklM0IlM0YlM0UlMjAlMkZ0bXAlMkZpbmRleDEucGhwPSZjb25maWctY3JlYXRlJTIwJTJGPSZsYW5nPS4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkZ1c3IlMkZsb2NhbCUyRmxpYiUyRnBocCUyRnBlYXJjbWQiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781932079),('5gMrwZlnpyhBUh7xJNAO9Jp720KNXFWnPxgemMUh',NULL,'172.69.109.186','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHNSenlsYmFveUM5NGIxSG8yd0MxMElQdE1DZmJlU0Jab1RGWE9DcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vZS10Z28ucnUvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781930015),('62I1ewEvoTwzQeqsIIo7IMwdjQhoF5tvcdisCEDc',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3BIRjNnTGR2YWxpRnRkR2kzcU5hV2FwcjNUdmhsbk9vMkhIaGs4ayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL3BvZHMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781774375),('7A2YfKWzlhc8iKZ1PtqVItbqjF2F7FPu5Z4dJL0j',1,'172.71.144.45','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN3VCZWdrekFQYmtGdkdSQzdJVnhybEhBUFlweGczcGdwb09SNnhFWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vZS10Z28ucnUvYWRtaW40aWstYnJvL3Jlc291cmNlL3VzZXItcmVzb3VyY2UvdXNlci1pbmRleC1wYWdlIjtzOjU6InJvdXRlIjtzOjIzOiJtb29uc2hpbmUucmVzb3VyY2UucGFnZSI7fXM6NTY6ImxvZ2luX21vb25zaGluZV81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMzoicGFzc3dvcmRfaGFzaF9tb29uc2hpbmUiO3M6NjQ6IjliMWY2MDNmNjMwODQ3OTk4NzkwZjZmM2E1MDZmYzlhYzA1MDMxYzFhMjJmYjIyZWU0YzQxOGVmNGVhMTNhNWIiO30=',1781801640),('7HE2WKoAvRbjY7z3IRjlqTR3us5xaB7linFUT5DW',NULL,'172.236.13.105','Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Safari/101.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid2VZb3FGYkhiR1hteUl1UFdBSXc2UDZCY1RGWFdZMGRIS3htbnpuVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL252aWRpYS1uaW0vZ2V0LXRva2VuIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781775420),('8bZ5vE3zWSeXY2UhGGDRssE52JdySji8aSyZHRqk',NULL,'172.236.13.105','Mozilla/5.0 (Ubuntu; Linux x86_64; rv:126.0) Gecko/20100101 Firefox/126.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVF4OHVoeEJOSjN3V3UwSm83WW5OeUxSUk5Gb2c5OTJjdlZrZUM2cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP3VzZXIlMkZsb2dpbj0iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771468),('8c1Ma3jSLDRR8chwBmKDSl8v9sxL4PLRzNXpS4Wy',NULL,'172.236.13.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2g3MGwwUWVoYklMd3lCajJkeERxZ0U4THZLblphWXJJejU0U2dwVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3NlY3VyaXR5L3RpY2tldCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781771584),('8S7JIl9Cz68hhQM7nEbdiN61EdiOgvKM6TTWEp9l',NULL,'172.236.13.105','Mozilla/5.0 (ZZ; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoic2xpb29DOU8xOVFMNklIeHVCcFpIdXlWc2VicGNMa0daZ1BhWkF6eSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP21vZHVsZT1JbnN0YWxsJnZpZXc9SW5kZXgiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781770441),('8UlEScZv1KRlUyNrd7T80hnijD1xmgZmPglPWZar',NULL,'172.236.13.105','Mozilla/5.0 (Kubuntu; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibWhoV3VjelFYZHJtM1pvMkZ2ZmlnR3FOTzRDcUF4eVhmNHlOQzdMdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL2NsdXN0ZXJzL2t1YmVjb25maWcvazhzIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781773603),('9DPTgZsk03MTGvEJC9LGqTYfJ1XHfl73VPmubyz1',NULL,'172.236.13.105','Mozilla/5.0 (X11; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDRHZkFLMGhEOXlCSllWZXZiSWpJN3VhakRTMWxYTkxFT0VkNGlBRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW5pc3RyYXRvci9tYW5pZmVzdHMvZmlsZXMvam9vbWxhLnhtbCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781769772),('a23CSw31ZZuqVCv7Xt1bpqrY09QobS2U95ZM2Va3',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDM1MThLcE5rcFpxVGxId3B3c3JjeFF3WjhyVnFiSVpBN0RHb0lSaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3JlcXVlc3Rsb2dzIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781772327),('A2J1ous3hHJaTtjCLSDRx8EcTM00zqvoJVVwtJyi',NULL,'172.236.13.105','Mozilla/5.0 (Mac OS X 13_2) AppleWebKit/537.36 (KHTML, like Gecko) Edge/102.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE1URzIzaGVkcXk2a3k4OWNUeTNDQzRaZTdtYjFrTWVSU2FCRFF6WCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL21lIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781771701),('a92v4Okvw4e0p9OdkbqiQ1NHUpplvLGTRyhBdvNA',NULL,'172.236.13.105','Mozilla/5.0 (Knoppix; Linux i686; rv:128.0) Gecko/20100101 Firefox/128.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUW1YUG1HajVkdWtkRFY1WjE3NUNWRDkxbVhYcVlXU0RCUlp1bjlsSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3NlcnZlci92ZXJzaW9uIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781766648),('Ae3LQNevudT0KzuTdTbze1JWPDxDrJIF6liubcSN',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGlaN3RTZVo0aFJkNzNpVW54cVBlYXdRaUh0aFVpRm10RU50R3M4bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL3dvcmtmbG93cy9hcmdvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781772250),('AIqMCIS43BBNJIFDloB5cJA5m5RikW0qd0kIIRdq',NULL,'104.22.104.57','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoicXFFNDhsUDRwd1lVMXNpVHcxUkpnc0ZZVE16OUhnVnBpY3NFWWpyQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZS10Z28ucnUvYXBpL2NvbmZpZyI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781939329),('au0wnSaaam7WN5VGVq6ScmEG97Zks84o2fGY6vBD',NULL,'172.236.13.105','Mozilla/5.0 (X11; Linux i686; rv:132.0) Gecko/20100101 Firefox/132.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTd6cHhRb1o0V2U2ZjVVdnRDV045Ym50elUzeGk5UE1JMXBHTUtrbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vaW5zdGFsbCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781772877),('bi5PANlB3ahcApU6jVUzgUPNn5oawPikYrZ8da2x',NULL,'45.135.195.139','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVlaNkdjS01kQ1dSTlRhQVRqT0V6SXM1cGYwRldpOUx5M1VTZTdOeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP2xhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnRtcCUyRmluZGV4MSI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjp3NkZ5VWhUZ0dQOEdNMGoyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781807627),('BNpamWfjGqHma4iM59fV0Kninl1KfnhPSKpkEjhp',NULL,'78.73.55.156','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY29RcDBVZ2llRHV1UzlBMUpFQ0Z6TEVTM1Y1eDlnRjRsdjFWR0dCYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjAxOiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD8lMkYlM0MlM0ZlY2hvJTI4bWQ1JTI4JTIyaGklMjIlMjklMjklM0IlM0YlM0UlMjAlMkZ0bXAlMkZpbmRleDEucGhwPSZjb25maWctY3JlYXRlJTIwJTJGPSZsYW5nPS4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkZ1c3IlMkZsb2NhbCUyRmxpYiUyRnBocCUyRnBlYXJjbWQiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781891507),('boZMSaoFTEJQ0p5lB9wi6xGtmdyjeLCc1U8U4L9Q',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUElHS3RweklSZUVqdlVURzFjY1JtdXYybjRBdHcxcEd6VzFEYzR6cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3NjaW0vdjIvVXNlcnMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781768426),('BYwJGx9eZnJThjXDYiuCygMmeCRKAk3Kq7CkUByU',NULL,'172.236.13.105','Mozilla/5.0 (Mac OS X 13_2) AppleWebKit/537.36 (KHTML, like Gecko) Safari/128.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidEVRZHVjdGlFU2JxZjRZRGFhU3ZYVGZpTlQyYzdqVGNPSURURGNuUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vcGhwbXlhZG1pbiI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781774817),('bzaZReUlHlZUU1FB8YVbf0JpNvm4Xbq5ahYaTl6J',NULL,'77.83.246.97','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHdpM3o1dGZQaU1MVU5oZW4zTG42bHVFZWszUGdtS1RWZGFZZkplaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTQ4OiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD9mdW5jdGlvbj1jYWxsX3VzZXJfZnVuY19hcnJheSZzPSUyRmluZGV4JTJGJTVDdGhpbmslNUNhcHAlMkZpbnZva2VmdW5jdGlvbiZ2YXJzJTVCMCU1RD1tZDUmdmFycyU1QjElNUQlNUIwJTVEPUhlbGxvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781914103),('bZTeFw3WLwr4HSlCscCmv2pHe7aiuE8yhyYJe3zo',NULL,'45.135.195.139','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSENWOGJTaEpJbjJNNUpTRUY1dzhhN3hTc0lNbElnV2F3VElsVVZHSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjAxOiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD8lMkYlM0MlM0ZlY2hvJTI4bWQ1JTI4JTIyaGklMjIlMjklMjklM0IlM0YlM0UlMjAlMkZ0bXAlMkZpbmRleDEucGhwPSZjb25maWctY3JlYXRlJTIwJTJGPSZsYW5nPS4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkZ1c3IlMkZsb2NhbCUyRmxpYiUyRnBocCUyRnBlYXJjbWQiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781807627),('CaH5JtwBeMG8yryrAif5A3iPeAM9HfoorrKqczrv',NULL,'172.236.13.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36 Edge/18.18362','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2ZDd3pnZ2RzdldyWVBzUWdNaVVwZDJDT3JST2JNNFZtNXB0bll5byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP3M9ZXhhbXBsZSI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjp3NkZ5VWhUZ0dQOEdNMGoyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781774216),('CaZa1wqInX77eR1VthKRDpiNv6yhRTWpCpUZHGjK',NULL,'210.211.122.97','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoicDhNQUJpVDQ1aEpDbVRvWUlvR3BkeFdFU29oVmh2Y09jbGptWVJlSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTQ4OiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD9mdW5jdGlvbj1jYWxsX3VzZXJfZnVuY19hcnJheSZzPSUyRmluZGV4JTJGJTVDdGhpbmslNUNhcHAlMkZpbnZva2VmdW5jdGlvbiZ2YXJzJTVCMCU1RD1tZDUmdmFycyU1QjElNUQlNUIwJTVEPUhlbGxvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781853402),('DDpNqwxPlrSdxN1qpnSHeK5zLhFrf4wORB6Ij2SH',NULL,'210.211.122.97','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoielE5b0xsN0xBekNsbWhrTEFqOFk1NDRXWGo0dFU5SDhtNlRFZTd3TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjAxOiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD8lMkYlM0MlM0ZlY2hvJTI4bWQ1JTI4JTIyaGklMjIlMjklMjklM0IlM0YlM0UlMjAlMkZ0bXAlMkZpbmRleDEucGhwPSZjb25maWctY3JlYXRlJTIwJTJGPSZsYW5nPS4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkZ1c3IlMkZsb2NhbCUyRmxpYiUyRnBocCUyRnBlYXJjbWQiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781853403),('DEJRn2sMwqpbPlRS8814XWgFRDLXsiEAaTO6Qsrp',NULL,'172.236.13.105','Mozilla/5.0 (Debian; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidlhHQTJCaGg4azhqSWdadHVSRnVQUkVrd1U1YTByZDZPc0JkYmxOTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781775678),('Dkjdh6I7L17jazcq7meHm4shlPSJ5ektyTsUWW3U',NULL,'172.236.13.105','Mozilla/5.0 (Fedora; Linux x86_64; rv:130.0) Gecko/20100101 Firefox/130.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoia0RPV0s0VDh1WFk1OG9ueHZvSlh3anM2TEdnNHVQdEdDcWlPMzQxMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL3ZlcnNpb24iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771138),('DuxqUSOjuYgwYFZM5HkBmMdrChPLZw5180lsBwiD',NULL,'172.70.240.54','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic0hoNFBhTE9IdTVGVzlqclpxSEhYOUFjREVveTgwWTBFdlVYVTJxcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vZS10Z28ucnUvYWRtaW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781881584),('e68w78btUxrbZv7ozn7xZgOqdio6qyd0CEn9l2TX',NULL,'172.236.13.105','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieG1wc1M0clR6Z0JVSnJYV2E3Qmp4SjFPRnF2c0U2RHV2S3ZGMHV1dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwPyUyRmluc3RhbGxlcj0iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781774304),('EpE05E6YjkWTS4yX21JPfYciZ85CkbanUC0jihCZ',NULL,'172.236.13.105','Mozilla/5.0 (ZZ; Linux x86_64; rv:129.0) Gecko/20100101 Firefox/129.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjdXaGFXeXpMME1xaVpjWjNwZGhON3hLeDQ5TUgyUDVBWGpmOFJjbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL3NlcnZlcmluZm8iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781768749),('EQdfRT0r8dvcC2Cxc3j8pL7eOzTke9cR2rDyyiQ2',NULL,'172.236.13.105','Mozilla/5.0 (Fedora; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWG1YT2RQb2ZCbTh6Y05DM0RqU1NoNjFpWE5zbTVoZUpJZHRZcVliVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW5pc3RyYXRvci9hdXRoLmpzb24iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781770463),('FbzK9p8QpSB0UirnOmGxU0DffcNYz48SyBOdWJxJ',NULL,'172.236.13.105','Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Safari/101.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUxhYjFURjBrTnh1WDhPVjdvb2VLWHhKaGZjaXpsU3V4Mm5DVVB5NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781769225),('FhKvZEPucR8FSN10MGyJYryiz87HXMcgwVCgmHe7',NULL,'172.236.13.105','Mozilla/5.0 (Windows NT 10.0; rv:109.0) Gecko/20100101 Firefox/117.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVR1N2JNdllydENOT1piS2tMN1RhbHhZVEtpZW5TM3RucHlGaVllSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpLzQvY29uZmlnIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781771555),('FOQiVwUy5Qj2pnCyWGLGhxF5aF71aXvOS92czYGb',NULL,'172.236.13.105','Mozilla/5.0 (Knoppix; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiREJiOEFSRzRzRHBkS3J2WVRZRE5QZUQ3MGEzYndhckZsa3JkdkxlMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL21vbml0b3IvbWVzc2FnZXMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781772512),('fucrXYfLxtrkjsR7tl27DDIqw3cynU6za7qpjMga',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6,2 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNm5oeEdXaUtkdU1mSjFBRUJDdndqVDNwQ3FYcHFqRDF6c2xtNTRHNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTA4OiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD9mb3JtYXQ9anNvbiZtZXRob2Q9U2l0ZXNNYW5hZ2VyLmdldEFsbFNpdGVzJm1vZHVsZT1BUEkmdG9rZW5fYXV0aD1hbm9ueW1vdXMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781773718),('FyKPDfuYkMeeOoxfk61Pt2NldHVARRYxXP1M94Ir',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.1.25 (KHTML, like Gecko) Version/8.0 Safari/600.1.25','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGhGdmwwbkZ3WFVpSmJCdkF6T3BhV3BIcWhWcnNHS1M2MDRpdGFLeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3NlcnZlci92ZXJzaW9uIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781766624),('Gdy1CXk6JhS5P7tPoiYOkMsZjUTGJqRIBanrZ1r4',NULL,'77.83.246.97','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzZ6ZDNlZVJCRXpOTlEyUFQ5TWhVYU5HVTI4MEVScGNDMDZxb244MyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjAxOiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD8lMkYlM0MlM0ZlY2hvJTI4bWQ1JTI4JTIyaGklMjIlMjklMjklM0IlM0YlM0UlMjAlMkZ0bXAlMkZpbmRleDEucGhwPSZjb25maWctY3JlYXRlJTIwJTJGPSZsYW5nPS4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkZ1c3IlMkZsb2NhbCUyRmxpYiUyRnBocCUyRnBlYXJjbWQiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781914104),('gMwOnHHeylRaUYCTzz6SJ9co9WqP7nhmkl4zwyQX',NULL,'172.236.13.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXN4TEZxZUo1R1lYM0pDUEhsRkV5bHhHZ1hZeFplSlJHUGdJbWZvbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3NldHVwLWNvbXBsZXRlIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781771684),('H1kffWD6IUxF3lBxaSDc5DDKLlMyke9mG0j62J1P',NULL,'172.236.13.105','Mozilla/5.0 (SS; Linux i686; rv:133.0) Gecko/20100101 Firefox/133.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoidDdwZXlpS0FpYlZxNDVKaGxpTzZkdzd2NjN4cGdCbFE0SEtHb0IzSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxLjAvd2ViL3JldGFpbmVkLWRhdGEiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781775077),('hnEnQCwBjpULoxZV8UzJQhVV0DhTRxpkcIlvWu7k',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh, Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0tpdkZVdGd5aWFCUjlmSHVQTHBvR3M0RnNaRWNXYWV0UXhIWThCRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW5pc3RyYXRvci9jb21wb25lbnRzL2NvbV9qY2UvamNlLnhtbCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781768190),('hokiS0IiyMAchqE8cnoLgECZ2OKXFjpqQPcvwYyG',1,'172.71.148.162','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoicGloelM3NTM0akNhYU5PU0FMNmRFdjFpeXh0RzByNjJMejEwS3pGayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vZS10Z28ucnUvYWRtaW40aWstYnJvL3Jlc291cmNlL3VzZXItcmVzb3VyY2UvdXNlci1pbmRleC1wYWdlIjtzOjU6InJvdXRlIjtzOjIzOiJtb29uc2hpbmUucmVzb3VyY2UucGFnZSI7fXM6NTY6ImxvZ2luX21vb25zaGluZV81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMzoicGFzc3dvcmRfaGFzaF9tb29uc2hpbmUiO3M6NjQ6IjliMWY2MDNmNjMwODQ3OTk4NzkwZjZmM2E1MDZmYzlhYzA1MDMxYzFhMjJmYjIyZWU0YzQxOGVmNGVhMTNhNWIiO30=',1781883413),('HpJ7bOq1rSgy5I45vhesQ5J9Ecvx7oiMmbmAMtRw',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieUx6aW54UG5SWnk2SWZCUHhHSHlrY2JpMlpSbHozRmREWEhsbVFiRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vaW5pdCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781768965),('I0OWEnNcPmmgXUSpcTuWqDd7LbR56wrwtvlvcjGj',NULL,'210.211.122.97','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoid3RpbzY2Y2ZFTTNHQzg4d1FYR3ZtR0pERmRLdFoySUpaQzZKcjZjTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP2xhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnRtcCUyRmluZGV4MSI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjp3NkZ5VWhUZ0dQOEdNMGoyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781853404),('IB6O49Sq3QxlijQy5aaZQc81CRs1y0AF48X12fed',NULL,'45.135.195.139','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVlYS01OOUl0YmJiclNwNXFPUVhydWxXTjBMNUFIQzFubVlmbHpiUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTQ4OiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD9mdW5jdGlvbj1jYWxsX3VzZXJfZnVuY19hcnJheSZzPSUyRmluZGV4JTJGJTVDdGhpbmslNUNhcHAlMkZpbnZva2VmdW5jdGlvbiZ2YXJzJTVCMCU1RD1tZDUmdmFycyU1QjElNUQlNUIwJTVEPUhlbGxvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781807626),('Id2Dws8guTLBWiGMmytVZMERmQcN210RKDANGkuW',NULL,'172.236.13.105','Mozilla/5.0 (Knoppix; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWJEZ045dWx2VERQN1hXUTdyYlZVVUN0cWxWNXN0Y0VDSDF1NmhubiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vbG9naW4uanNwIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781768793),('iD7ltXwYSksTXOErr36MDqh35p6RuP6gXxiz8Wb1',NULL,'172.236.13.105','Mozilla/5.0 (Kubuntu; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiODZ0eHhqaWdFWXlzekJjWEZkVUVIRFpiSWI2WWk5MXFqQzZZdFVHbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL3ZlcnNpb24iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781774475),('is2Zc09EwN0BSRmhlL6Ue1IcIY21jfO1EUGab3HN',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 14.6) AppleWebKit/620.30 (KHTML, like Gecko) Version/17.0 Safari/620.30','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQW5kTGhxSmVyUUdXY1c4TWswUGI1eUNRdzdMeFJHMFNwSHpXcXduNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vc2V0dXAiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781774863),('j1GNGgEZFHBZoa0u0CvaBGOpao1hZ0P03gvUuqoi',NULL,'172.236.13.105','Mozilla/5.0 (ZZ; Linux i686; rv:132.0) Gecko/20100101 Firefox/132.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV244OFN2OGxzMkp2VGJrVVd0WExncjFHM0Z3RFY0djV6dHJTMTdrNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vc2V0dXAtd2l6YXJkIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781771158),('J8RS6MqK8AeVVohxh72fQgR6iwf5e2RygQ0GJBAW',NULL,'172.236.13.105','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoia1JFU0tXM2paQ1FITWxPVTFPM2d2NUtBTTJpWVlncUxVZDFIeU9UcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YwL2NsdXN0ZXJfbWV0YWRhdGEiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771190),('JhWw8GW2SMS7T8ogGOR49yjFtSeOs2P2UzMXl4Ea',NULL,'172.236.13.105','Mozilla/5.0 (Kubuntu; Linux x86_64; rv:122.0) Gecko/20100101 Firefox/122.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnJLSkxBVVowWVBGc0tuOXdLYldjNGNqYUc0VVAwRWZkMXFjNmw0YiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3BlcnNvbnMvbGF0ZXN0P2J5cGFzcz0lMkZhcGklMkZwdWJsaWMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771970),('jkAxvBf4bXJ81swxvdlnZYN8Ttdve7eBqaooLPaG',NULL,'167.86.75.114','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjNNcWFKcUxPdmdYYzhubFRaOEtvMDdTTERZanFsSlZSaGNGQVd1VCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTQ4OiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD9mdW5jdGlvbj1jYWxsX3VzZXJfZnVuY19hcnJheSZzPSUyRmluZGV4JTJGJTVDdGhpbmslNUNhcHAlMkZpbnZva2VmdW5jdGlvbiZ2YXJzJTVCMCU1RD1tZDUmdmFycyU1QjElNUQlNUIwJTVEPUhlbGxvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781932079),('JVD0ZYVkgnjBvcFND95mCXBIAgnA9enDkgX8xpAT',NULL,'172.236.13.105','Mozilla/5.0 (Ubuntu; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1Z2dlBMdWh6R0lINUlzOHRHSlgxdURLNWRMMzdxY1ZjVGViekZheiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781770999),('jwx4ISWo1UnCka5KZIeYDzQR2rlteMrZIjOKF4ah',NULL,'172.236.13.105','Mozilla/5.0 (SS; Linux x86_64; rv:123.0) Gecko/20100101 Firefox/123.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0kwQnUxSldoZFl2enNRNXoxTUxWMlMzUjZIclRYcEZiaEVWdEhxcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjE6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP3M9JTJGaW5zdGFsbCUyRmluZGV4JTJGaW5kZXgiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781768228),('jZXAcMXuhIRPNVXE9JZB7Udu7Bpxyl61exfBtN9n',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE9WZTNONGpJdjZZYlIzQUVxaHNrNXU4TjhITVR1elVRZVBoRkJ5UiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL21vZHVsZUluZm9ybWF0aW9uIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781769972),('K2mcmfPDp225dRhNVxhiyWEeEnggcLunIkbdpJn6',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh, Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2lyUzRUZW4xdWxXSnM5d205MkozT3kyQndNTURwNFYxTGRqOWUxMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL1RlYWNoZXJRdWVyeS9TZWFyY2hUZWFjaGVySW5TaXRlV2l0aFBhZ2VyUmVjb3JkcyI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781770760),('KL8eOcMsf5So1NsDFmTnpVHluBu90TM8ea9Ln81O',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.11 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUNsNUNWZUlYNDNZYmFkakJpaVJDTXlhbTVRN1Rtcm1XblM2cm9ZQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAzOiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2FwaS92MS91c2VyL3NhdmU/RW5hYmxlPXRydWUmSUQ9JlJvbGU9JUU3JUFFJUExJUU3JTkwJTg2JUU1JTkxJTk4JlVzZXJuYW1lPWZtM3h6IjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781775620),('l72RWr3c1PYv3VTgGiMNOjcEtUklDm5l8oIviRJn',NULL,'172.69.150.154','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUjdEUkRrbUk4NnVLMHJESkp3YVNkWDBTTm5nTzBXQ1hGSEtIQnFoZSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM1OiJodHRwczovL2UtdGdvLnJ1L2FkbWluNGlrLWJyby9sb2dpbiI7czo1OiJyb3V0ZSI7czoxNToibW9vbnNoaW5lLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1NjoibG9naW5fbW9vbnNoaW5lXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1781877376),('LDIohsswVmrkMMZwrT8JcdNY1IohAGUv73wXGXif',NULL,'172.236.13.105','Mozilla/5.0 (Fedora; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzdVaTB6ejhqT21saHJRSHJYb3ZhdTB2UFZwdEc2cU9PbXdVc3pMMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL2RldmljZXMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781774993),('lfsBuEFrbQf5xdDrlGLASnfAu7SwnGBlqehS5emZ',NULL,'167.86.75.114','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUG42Mm9veHE2eWRrSXZQdzJRN20wNTFJZzVFN3BuVGliMVVndlc0diI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP2xhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnRtcCUyRmluZGV4MSI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjp3NkZ5VWhUZ0dQOEdNMGoyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781932080),('ljrqaoYPvMx8clVjLGkB5BxU6pjfPol9Uz7l0SRI',NULL,'172.69.151.125','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoic2lVdHRHaHNrM1RuTmtva0lDVFZSNTZ0OFhHeWg3TXplV3VTWXltWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781877372),('LOydm1aLt5Qw1LEnhJULEtGQuQqvFAXaUGYt4ccU',NULL,'172.236.13.105','Mozilla/5.0 (Kubuntu; Linux i686; rv:128.0) Gecko/20100101 Firefox/128.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoicWZEU1I1RThIdWJvZkgxYU93cE9idWxGSGt2VU5LOHVGblE3NjJmbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL2luZm8iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771083),('M8NsAWUykkxg7DyGkBzjbZMAdhRjwX793fL846SB',NULL,'172.236.13.105','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjFNNlMwdlVjZUx1ZUlKVFR6QURVSDhJSmhvVnFFVmlWTnhhcVdHOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3ZlcnNpb24iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781768815),('mPbKwtua7nh7SJCS3j0EiZgbOsnYK7yfOxxZh3Q4',NULL,'3.87.27.156','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFJMUGlYUVNiYXBkZVM3TXp3R0ZTR0pJdGxhak0wT3ZBWmRUbldESSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vZS10Z28ucnUvYXBpL2VudiI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781833760),('mXrbkBqJuTLnKZ8CDkBEMn9AOqvNh5mGmBlMhIrY',NULL,'172.236.13.105','Mozilla/5.0 (Debian; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG8zajQ1WW5CTzVTU3N2Y3hFTUIzWXFjSWYyRmdveU0xU1lsWXcxbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YyL2Fib3V0IjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781773093),('n6Pa2ueh2ScMGqdGs3TxddAAwSeFJ1jQDmS6koVE',NULL,'151.242.30.224','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVVyTzBVeUFjMk9oekhMQndicDU1NmQ1YjdwVjUwWmtnNlBrcXF4TSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL2F1dGgvdmFsaWRhdGUtc3NvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781792883),('NA4mUJJFWF8v5kKNqU4QCq4IMBSqP2Ux8uZFU3wy',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/608.2.11 (KHTML, like Gecko) Version/13 Safari/608.2.11','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUxPNDI4Qm1JMlVFU1pyU0psVzBDZ1Q0Vm8zV1c2VHdaWnV0eUlwcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL2Jlc3plbC9maXJzdC1ydW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771592),('NHz1cdKZ1sqPfGq4OQTeIbVaL1vyJDs8XSHh2LbQ',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.3','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUJIY1R1NEZDQmc2QngwWTN6dkFsYTNzbE84Q3dTbkIzczFzNTQ3ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL2FwcCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781769968),('nr8y8tdyPz1ltvu2INaHc5vQ99uiWi3JL9cvmmZe',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0FCbEFaeWtUUVpzUXV4RHU0SW9Fc0ZkQ25Ic0dWTDNjR2J2YjZDeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL3N0YXR1cyI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781769135),('pnuP0d1M7DG0RFcY1WEve1B625xpOyLCVEKf2jnF',NULL,'172.236.13.105','Mozilla/5.0 (Knoppix; Linux x86_64; rv:123.0) Gecko/20100101 Firefox/123.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEtuM2JOTjV6QU1qTDRjWHVDVkc2Qjl3THZadk9kTWFzMVhBS3JLbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL2JhY2t1cCI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781771782),('PwM036KCzZyPfKa7CVXr13xZVVnhqf4WMIVbfTeV',NULL,'151.242.30.224','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDJONjFtSlhRNWp6bEhrOWVNT3R2WGVOdlhqNExnSWZKZGNmeHhWQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL2F1dGgvdmFsaWRhdGUtc3NvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781910748),('QN4lyWBrVbXaffWueU9Y8xf9qEpzn9HmhlpITaOE',NULL,'172.236.13.105','Mozilla/5.0 (Ubuntu; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHBHU3JIVklCOTBac3h0VjFGRERBbmk3ZXZoVmJmMWlieGFZMUc5NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAyOiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2FwaS92MS9hcnRpZmFjdC9nZXRBcnRpZmFjdD9hcnRpZmFjdF9wYXRoPS4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781775819),('R3HVY3Yh2usbcP73CAjQC0Q52hpyteMKBzq71Nn4',NULL,'172.236.13.105','Mozilla/5.0 (SS; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUFOVXR6QXBma3VJRkk3VmZvS2hHc2VQOEJYUDlZckRKRkhFRjM1dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781772946),('RLjOpdDJnShaSNCtB8BLOIu1tXLCdX5Kvv0eW4gt',NULL,'172.236.13.105','Mozilla/5.0 (Mac OS X 13_2) AppleWebKit/537.36 (KHTML, like Gecko) Safari/107.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicG4yVUxEYjBBMjZDeWFaZG9nTTdXajlmUWxSbXRabk9PNUt5VEtZRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP3BhZ2U9bG9naW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6dzZGeVVoVGdHUDhHTTBqMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781768149),('S7fnFhYbxjz1qcrO6hYCLe6FqCDPSq2HxgnsJJ0G',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT21hZTR0ME1Qb0Y1SlV3eHZ1VmtyN1pWSWpNUTRNcTE2dVVUY3lZdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP3A9IjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781774659),('TMxM8dR4HxFVxRM4xJ3VAdDUJYjSrjYcJnrUeEVy',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2lURFZad0VJZk1rZ0VBUW1RYUVZNXpPRTdTT05UQ3RzNmZBQ1F3bSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vbG9naW4iO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781769165),('tZUsODNwv7rEQfydiLv3pEr9sXJGmiVTDaH2hKxR',NULL,'172.236.13.105','Mozilla/5.0 (Debian; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWlFQUtweEJyRlE1eWQ4bDJaSm16SlprTWZqQU5EZTFHY2F5b3lVdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTE3OiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2FwaS9wb3J0YWxUc0xvZ2luL3V0aWxzL2dldEU5RGV2ZWxvcEFsbE5hbWVWYWx1ZTI/ZmlsZU5hbWU9cG9ydGFsZGV2XyUyRi4uJTJGd2VhdmVyLnByb3BlcnRpZXMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781774433),('U6tZOGRN1MmrY4DaZQTPXhXFGeXtmE99mpIrdv38',NULL,'172.236.13.105','Mozilla/5.0 (SS; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoia1hmYVl2UVdaVFBJQUU3TUlUdU1ubXR0b3d6RlB5NDNRdGRrZFFCZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL2dldC11c2Vycz9wPTEyMyZwYWdlU2l6ZT0xMjMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781774913),('uwx4uKvERCC93qYorz2N3VImGtIx1lgZ63CV6ctA',NULL,'121.37.158.234','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRks0b0NNVFh3NWRLUVdMTmVUMWg0dmpoNUdIUG9mVXFaMWFLUUFrdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTQ4OiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD9mdW5jdGlvbj1jYWxsX3VzZXJfZnVuY19hcnJheSZzPSUyRmluZGV4JTJGJTVDdGhpbmslNUNhcHAlMkZpbnZva2VmdW5jdGlvbiZ2YXJzJTVCMCU1RD1tZDUmdmFycyU1QjElNUQlNUIwJTVEPUhlbGxvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781904208),('vEAqi9m748r1NoAvfWP0ih5RofJgpABUAf1KSV37',NULL,'172.236.13.105','Mozilla/5.0 (Debian; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUN2VEdiZFc2dEhyRUtWQlg3U1VwYmlaQ25xU2dTNGJ6ZVlUWGJUVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW53ZWIiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781768096),('vvQrn9XSTDIQIrDaYtt3CErWyQZtwC0ommarEqAk',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmt0UmpJWHdrSm1EMVhRWE4xQ3cwTlZQa2JycFpBcWdsSE53S25TaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vaW5zdGFsbC9zZXJ2ZXIiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781775171),('W9CPwcd5gU4mn1n1aODg6TQ7rZ9BqI1it9DkzgN1',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh, Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoib0pxbHc1S1VybUhHd1k5eWNaN0FQZndUQ3lxV2d1WmxaeGRVWWdCTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL3N0YXR1cy9jb25maWciO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771367),('wqQYQz0XpfuqLQpwLS4t549zy3G9hGAcylGGy3pH',NULL,'172.236.13.105','Mozilla/5.0 (Kubuntu; Linux i686; rv:123.0) Gecko/20100101 Firefox/123.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW9PVEdBenBEQnFxODBiVWlUOUZnaE01enU3dzh4MnJZUTRzaDlSMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3YxL3VzZXJzIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781775105),('WUAhpYbcunjOCkvUmeis9rGl0J5GZisUprgNT0cm',NULL,'172.236.13.105','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoicnlhaXEyb2JrcGFXSExjY3RTVk53YlRyOFZNa1lqNmkzT1VwT2l1MyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vZWxmaW5kZXIvZWxmaW5kZXItY2tlLmh0bWwiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781771051),('WxThYpTWOg3bVoBtaHNuh3ZKVnpXVrHqEMMaDxWN',NULL,'172.236.13.105','Mozilla/5.0 (Debian; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiamY5MjZsdXFOdXV2MUliUlZUOUtmWEpINzE5SVZ0U3ZpekR4TWd1dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vbG9naW4/bmV4dD0lMkZhZG1pbiI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781773868),('X4GHDAreMAs76SPODnNAXgQ9UGgmC6YJIk6zJFa2',NULL,'172.236.13.105','Mozilla/5.0 (Fedora; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2ZOdVllTG9tZFNWV0tGQmlXalU5MzZiNVZZVFM2aXhhOTVkSEVIUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYWRtaW4vc2NyaXB0cy9mcmMtY2FtYWRtaW4tbG9naW4uanMiO3M6NToicm91dGUiO3M6Mjc6ImdlbmVyYXRlZDo6UTBkb05KTFI5ME9VbTZjOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1781769166),('X5Cf9c4VKIxzFartC0avk0sw1lGiEtWob6lE8I0t',NULL,'78.73.55.156','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHdjMjRMOVRyMXhJZmQwVTM3RDQxQTNnYVhCYzdLWHFRSDdteWpMMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTQ4OiJodHRwczovLzE3Ni4xMTMuODIuMTUxL2luZGV4LnBocD9mdW5jdGlvbj1jYWxsX3VzZXJfZnVuY19hcnJheSZzPSUyRmluZGV4JTJGJTVDdGhpbmslNUNhcHAlMkZpbnZva2VmdW5jdGlvbiZ2YXJzJTVCMCU1RD1tZDUmdmFycyU1QjElNUQlNUIwJTVEPUhlbGxvIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781891499),('XgzdKuo0IKHQJAkMobNFPZZGCSBKQRiXmpekTYoL',NULL,'172.236.13.105','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmo5WGp0c3dSTDI3TGNKUjhWSmRxODZ5Y204Zmd5RG05MXFIYW9jciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvYXBpL3Nlc3Npb24vcHJvcGVydGllcyI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjpRMGRvTkpMUjkwT1VtNmM4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781773312),('Y17PaloxFf2Ly6tJpEmV1IUGEPFp4J38TXEOURfu',NULL,'77.83.246.97','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0lEcnBSd3pUZHhZcURmbkZxR0lnZHJZZkh1VVQ4QkR6SW1wREdXaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP2xhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnRtcCUyRmluZGV4MSI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjp3NkZ5VWhUZ0dQOEdNMGoyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781914104),('YBTVJpHVRuQUbpRxmSkTkgMf37EYivbT43fHxBwY',NULL,'172.236.13.105','Mozilla/5.0 (Knoppix; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUThVY3ZHZ2RzR0hRSWRpd1NuUG4ya1BsMzRIMzQybU1Ld2JKRzQwbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6Onc2RnlVaFRnR1A4R00wajIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781768746),('YPB3zlI0gb29we3Mzceem30OIZUuCU88Jwpv3J2d',NULL,'78.73.55.156','libredtail-http','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMldpNmlMMGpPYzE0bkl3aUJ3N0FocjZEM0E4NkZkeFBRZk9uNFV1RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTA6Imh0dHBzOi8vMTc2LjExMy44Mi4xNTEvaW5kZXgucGhwP2xhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnRtcCUyRmluZGV4MSI7czo1OiJyb3V0ZSI7czoyNzoiZ2VuZXJhdGVkOjp3NkZ5VWhUZ0dQOEdNMGoyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1781891511),('Zo9S5WQpJfuHttQtJPtC2b1idvneozPrYU8vnKaE',NULL,'3.87.27.156','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlM0cENYblI0WGRHeFRpM1ZmMDlvQmJtb2EzVWg5eGszVjVSVHNKdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vZS10Z28ucnUvYXBpL3NldHRpbmdzIjtzOjU6InJvdXRlIjtzOjI3OiJnZW5lcmF0ZWQ6OlEwZG9OSkxSOTBPVW02YzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1781828029);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_token` text COLLATE utf8mb4_unicode_ci,
  `notification_chat_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Самовывоз',
  `delivery_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `webhook_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_settings` json DEFAULT NULL,
  `manager_message_template` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shops_user_id_index` (`user_id`),
  KEY `shops_user_created_idx` (`user_id`,`created_at`),
  CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (15,42,'Сварка ДНР','eyJpdiI6ImNhZWdCYUpuK0N0aXpaWUZYcjFmK2c9PSIsInZhbHVlIjoibXExS2RlMW5GMFdET293eGt0NThaby9VMk9pWlQ4bXZHTjdwTzcxZS8zeHRlZDczMENmRW5rQUMyWDJhWUdCZyIsIm1hYyI6IjBmYTFjMzQ3ODAzMDZhZGQ2YjM0MDU5MjE2N2M3N2RhMWQwNGVkNGVjNmRmNGI3NzdmNWU0ZWFkOTRlN2Y0MGYiLCJ0YWciOiIifQ==','912468962','@Tm_mixterov','Самовывоз',0.00,NULL,'{\"dots_color\": \"#38E8FF\", \"text_color\": \"#EFF6FF\", \"background_end\": \"#0D1326\", \"background_start\": \"#070B18\"}',NULL,'2026-04-22 11:11:04','2026-05-01 07:25:22'),(16,44,'DEMO Маникюр Studio','eyJpdiI6ImRXWVZOVkVVNkFHVDJ3RUcrVm1mL0E9PSIsInZhbHVlIjoiMlYyblZUaFNEdUd2STRrNkhxSjduMHRRdXJxMStjWHRwNERYSXhkUDY2S25NSDlNNGQzMWZnUG12ZEVoUTNUZiIsIm1hYyI6IjYzZDkzNjJlMTJlNjZjMzRhOGQ5MTZiOGVlZDRkOWRlYzg5NWI4YWJlNzdiZmZmZDUwNDVhNDU1YzQ2MmRkZTAiLCJ0YWciOiIifQ==',NULL,'@tgo_demo_nails_bot','Запись в салон',0.00,NULL,'{\"dots_color\": \"#38E8FF\", \"text_color\": \"#EFF6FF\", \"background_end\": \"#0D1326\", \"background_start\": \"#070B18\"}',NULL,'2026-05-02 08:14:31','2026-05-02 08:14:31'),(17,44,'DEMO Barber Club','eyJpdiI6Ilhoa0FGNmxlTTJjVmVPRU9uUDRTS3c9PSIsInZhbHVlIjoiQWNLdW1MUnBCczhXNk9ZVitiVVc0UnVPMmNxTCsvK1hWc3d3YVB5Q09tS1hFcEVIakJUVkNpL2swNGVXRGpPTiIsIm1hYyI6Ijg3NjdlODE0OTkxNTNiNzhiYTA3MWQ5Nzk3NDljZGU0NjQwZmI4ZTRiMWY0NDdlZTYwODcyZTFjZWMzY2YxNjkiLCJ0YWciOiIifQ==',NULL,'@tgo_demo_barber_bot','Запись к мастеру',0.00,NULL,'{\"dots_color\": \"#38E8FF\", \"text_color\": \"#EFF6FF\", \"background_end\": \"#0D1326\", \"background_start\": \"#070B18\"}','Добрый день! Хотел бы записаться!','2026-05-02 08:15:09','2026-05-03 08:44:40'),(18,44,'DEMO Auto Service','eyJpdiI6IlJDVjNqWXYveUdOMWg4UzRwd2xBSFE9PSIsInZhbHVlIjoia2gwOVk5SzNNQmN0Q1VpZWhHR2hld3hselRnRCtKbTdiMGdIcXkzSWJnNHUvaW42L2JhN09GclpaTTZLaVZFSyIsIm1hYyI6ImI5MWVkMzFjYjYwYjVjM2Q5ZGY0YWFlMTA3NzZiNjNjMDU1YzNmZmY0NDUwYjU3N2Y4YjAyNDZmODE3MWMwYTAiLCJ0YWciOiIifQ==',NULL,'@tgo_demo_autoservice_bot','Выезд мастера',500.00,NULL,'{\"dots_color\": \"#38E8FF\", \"text_color\": \"#EFF6FF\", \"background_end\": \"#0D1326\", \"background_start\": \"#070B18\"}',NULL,'2026-05-02 08:15:48','2026-05-02 08:15:48'),(19,44,'DEMO Эвакуатор 24/7','eyJpdiI6InN2UlBqWlNaWURrbk4vdDU3U0Z1dWc9PSIsInZhbHVlIjoiZ2NOeS8wZ1g3NWtlTUMrMm90dmNRUDl4bmczYmxqQklpSWxVNklWNDVGeGZtNTZDZGdVQWdNVnV4d2lRcjBJdyIsIm1hYyI6ImJmODgyZTgxYTM1YjBiZjliYmZiNDdlN2Y0ZTI0ZmQ2ZmU2ZDIwOTRmYWQwNWJiZTJlNGYyNjRjODUzNTAxOWYiLCJ0YWciOiIifQ==',NULL,'@tgo_demo_evac_bot','Подача эвакуатора',1500.00,NULL,'{\"dots_color\": \"#38E8FF\", \"text_color\": \"#EFF6FF\", \"background_end\": \"#0D1326\", \"background_start\": \"#070B18\"}',NULL,'2026-05-02 08:16:27','2026-05-02 08:16:27'),(20,44,'DEMO Food Delivery','eyJpdiI6IkQyRlVKTTZTOWFXSC9QbTNEWllBZEE9PSIsInZhbHVlIjoici9YY042bVB1dDBaMTl2TVNtMXNkNCtrcVNFYlJhVEI5bTN1TDZCWktrblpmTExpV2hLUWFxYTFVSDVLeTFPQiIsIm1hYyI6ImU0YTA3YWMyN2Y5NzU3MzBhNTdhMzM2NzM2OGQ5ODY4OTZlMTk0MDU2OGZkOTFkZjRmYzgzYmRiZjdkY2Q1MjgiLCJ0YWciOiIifQ==',NULL,'@tgo_demo_fooddelivery_bot','Доставка',250.00,NULL,'{\"dots_color\": \"#38E8FF\", \"text_color\": \"#EFF6FF\", \"background_end\": \"#0D1326\", \"background_start\": \"#070B18\"}',NULL,'2026-05-02 08:17:05','2026-05-02 08:17:05'),(21,43,'Polybuind','eyJpdiI6IkNrVkk4N09nQ1FCK1RXUENnMktjOXc9PSIsInZhbHVlIjoiRURmZ0VjbW1PYkNKYnlFajhFSHhGQ015UzRqV3BvQ1Z2NDBVcGJxQ0U5ODZsUE1GTllzODgvbzZHMmh5ZE1OTSIsIm1hYyI6IjFlZjIxNjY0MDQwZmNmOWYwNThiZGRhMDhjMmEwYzIzNzZiMmNhODJkOGIzMTk2YjMyNGUwMWU3MjhkZGFiY2YiLCJ0YWciOiIifQ==','6619491045','@profplastik','Курьером',0.00,'https://polybuild.com.ua/','{\"dots_color\": \"#38E8FF\", \"text_color\": \"#EFF6FF\", \"search_color\": \"#EFF6FF\", \"card_bg_color\": \"#050B1D\", \"background_end\": \"#0D1326\", \"footer_bg_color\": \"#0A0F1E\", \"shop_name_color\": \"#EFF6FF\", \"background_start\": \"#070B18\", \"card_price_color\": \"#4CAF50\", \"card_title_color\": \"#EEF4FF\", \"categories_color\": \"#FFFFFF\", \"footer_text_color\": \"#9FB0D3\", \"card_button_bg_color\": \"#38E8FF\", \"card_button_text_color\": \"#00151A\", \"manager_send_button_text_color\": \"#FFFFFF\"}',NULL,'2026-05-04 08:21:20','2026-05-04 08:21:20');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_payments`
--

DROP TABLE IF EXISTS `subscription_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `paid_for_month` date NOT NULL,
  `payment_received_at` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscription_payments_user_id_paid_for_month_index` (`user_id`,`paid_for_month`),
  KEY `subscription_payments_subscription_id_payment_received_at_index` (`subscription_id`,`payment_received_at`),
  CONSTRAINT `subscription_payments_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscription_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_payments`
--

LOCK TABLES `subscription_payments` WRITE;
/*!40000 ALTER TABLE `subscription_payments` DISABLE KEYS */;
INSERT INTO `subscription_payments` VALUES (1,35,44,'2026-05-01','2026-05-01 10:15:00',500.00,'manual','subscription-receipts/h6jVMAqJ7pkFYqy7Hadi5OlZZyxIVIBsiGaRcTgF.webp','оплата за месяц','2026-05-02 07:09:47','2026-05-02 07:16:45');
/*!40000 ALTER TABLE `subscription_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `plan` enum('starter','business','premium') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'starter',
  `status` enum('active','expired','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'expired',
  `expires_at` timestamp NULL DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yookassa_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_received_at` datetime DEFAULT NULL,
  `payment_receipt_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_user_id_status_index` (`user_id`,`status`),
  KEY `subscriptions_expires_at_index` (`expires_at`),
  KEY `subscriptions_user_status_expires_idx` (`user_id`,`status`,`expires_at`),
  CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (33,42,'business','active','2026-05-22 10:33:44',0,500.00,NULL,NULL,NULL,NULL,NULL,'2026-04-22 10:33:44','2026-04-22 10:33:44'),(34,43,'business','active','2026-05-28 18:51:00',0,0.00,NULL,NULL,NULL,NULL,NULL,'2026-04-28 18:51:33','2026-04-30 08:49:04'),(35,44,'business','active','2026-06-02 10:09:00',0,500.00,'manual',NULL,'2026-05-01 10:15:00','subscription-receipts/h6jVMAqJ7pkFYqy7Hadi5OlZZyxIVIBsiGaRcTgF.webp','оплата за месяц','2026-05-02 07:09:47','2026-05-02 07:42:15'),(36,45,'starter','active','2026-06-04 01:55:51',0,0.00,NULL,NULL,NULL,NULL,NULL,'2026-05-04 01:55:51','2026-05-04 01:55:51'),(37,46,'starter','active','2026-06-09 06:59:23',0,0.00,NULL,NULL,NULL,NULL,NULL,'2026-05-09 06:59:23','2026-05-09 06:59:23'),(38,47,'starter','active','2026-06-12 09:05:31',0,0.00,NULL,NULL,NULL,NULL,NULL,'2026-05-12 09:05:31','2026-05-12 09:05:31'),(39,49,'starter','active','2026-06-21 12:54:14',0,0.00,NULL,NULL,NULL,NULL,NULL,'2026-05-21 12:54:14','2026-05-21 12:54:14');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_ticket_messages`
--

DROP TABLE IF EXISTS `support_ticket_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_ticket_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `support_ticket_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `sender_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_ticket_messages_support_ticket_id_foreign` (`support_ticket_id`),
  KEY `support_ticket_messages_user_id_foreign` (`user_id`),
  CONSTRAINT `support_ticket_messages_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_ticket_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket_messages`
--

LOCK TABLES `support_ticket_messages` WRITE;
/*!40000 ALTER TABLE `support_ticket_messages` DISABLE KEYS */;
INSERT INTO `support_ticket_messages` VALUES (1,1,42,'user','svarka','Не могу авторизоваться. Опишите, пожалуйста, что вы уже пробовали и на каком шаге остановились.','2026-05-31 11:00:01','2026-05-31 11:00:01'),(2,1,NULL,'admin','Администратор','Попробуйте скопировать токен','2026-06-07 08:01:46','2026-06-07 08:01:46'),(3,1,42,'user','svarka','Понял сейчас попробую!','2026-06-07 08:02:31','2026-06-07 08:02:31'),(4,1,NULL,'admin','Администратор','получилось?','2026-06-07 08:03:54','2026-06-07 08:03:54'),(5,1,NULL,'admin','Администратор','поучилось?','2026-06-07 08:40:35','2026-06-07 08:40:35'),(6,2,44,'user','Admin_user','Не получается создать магазин. Опишите, пожалуйста, что вы уже пробовали и на каком шаге остановились.','2026-06-07 09:18:41','2026-06-07 09:18:41');
/*!40000 ALTER TABLE `support_ticket_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preset` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `current_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reported_at` timestamp NULL DEFAULT NULL,
  `screenshot_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_response` text COLLATE utf8mb4_unicode_ci,
  `last_admin_replied_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_tickets_user_id_foreign` (`user_id`),
  KEY `support_tickets_status_index` (`status`),
  CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
INSERT INTO `support_tickets` VALUES (1,42,'kokoskokosewwe@gmail.com','bot_problem','Не получается прикрепить бота','Не получается прикрепить бота','Не могу авторизоваться. Опишите, пожалуйста, что вы уже пробовали и на каком шаге остановились.','in_progress','https://e-tgo.ru/plans','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-05-31 10:59:57','support-screenshots/sYhOYfZzFVQcTGtCxO8QOYQVl9M1FahlVpBXzxaq.png','поучилось?','2026-06-07 08:40:35','2026-05-31 11:00:01','2026-06-07 08:40:35'),(2,44,'dmitribelitskij@gmail.com','products_problem','Не получается создать магазин','Не получается создать магазин','Не получается создать магазин. Опишите, пожалуйста, что вы уже пробовали и на каком шаге остановились.','open','https://e-tgo.ru/dashboard/support','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','2026-06-07 09:18:33','support-screenshots/zVDcxvnvrQy2HIHyzVkBej5DZ2KZE1BncgPs2iUe.png',NULL,NULL,'2026-06-07 09:18:41','2026-06-07 09:18:41');
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegram_password_reset_tokens`
--

DROP TABLE IF EXISTS `telegram_password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegram_password_reset_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `token_hash` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `telegram_password_reset_tokens_user_id_expires_at_index` (`user_id`,`expires_at`),
  KEY `telegram_password_reset_tokens_token_hash_index` (`token_hash`),
  KEY `telegram_password_reset_tokens_expires_at_index` (`expires_at`),
  KEY `telegram_password_reset_tokens_used_at_index` (`used_at`),
  CONSTRAINT `telegram_password_reset_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegram_password_reset_tokens`
--

LOCK TABLES `telegram_password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `telegram_password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT '0',
  `onboarding_completed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `telegram_id` bigint DEFAULT NULL,
  `telegram_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_linked_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_telegram_id_unique` (`telegram_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (42,'svarka','kokoskokosewwe@gmail.com',NULL,'$2y$12$OVq8kEbZuAOwENWniXHCzen5iWSCNIhHcRDpwwwKnAzX1svDZ1IwO',0,'2026-05-01 06:22:51',NULL,'2026-04-22 10:33:27','2026-05-01 06:22:51',912468962,'Tm_mixterov',NULL,'2026-04-22 11:09:01'),(43,'Евгений','profplastic.kiev@gmail.com',NULL,'$2y$12$CVUuavgNz5SspSgxJn1iDO0x/p1N2y3zNGUXJg7ijBpalKdV7PBO2',0,'2026-05-04 08:41:11',NULL,'2026-04-28 18:49:41','2026-05-04 08:41:11',6619491045,'profplastik','https://api.telegram.org/file/bot8240491675:AAH0ZIn1pbnqV2W7M5PLYP21yc3-9y9XINs/photos/file_5.jpg','2026-05-04 08:21:07'),(44,'Admin_user','dmitribelitskij@gmail.com',NULL,'$2y$12$b7AEQGbq9vfu6EGkHfB.cexm.prB6dqy0q916VMZ/9vrzAmNZ97B.',0,'2026-04-30 19:34:40',NULL,'2026-04-30 09:19:19','2026-06-12 10:11:15',954773719,'vveb_front','https://api.telegram.org/file/bot8240491675:AAH0ZIn1pbnqV2W7M5PLYP21yc3-9y9XINs/photos/file_15.jpg','2026-05-09 07:00:45'),(45,'Jose Avilan','josevln85@gmail.com',NULL,'$2y$12$4Jj3VAy5Wtjbhpl9jAmcvO6sK5U1f0dFBq3ovEhbwi9WKjzywf2Rq',0,'2026-05-04 01:56:41',NULL,'2026-05-04 01:53:13','2026-05-04 01:56:41',6256373811,'leondouglas350','https://api.telegram.org/file/bot8240491675:AAH0ZIn1pbnqV2W7M5PLYP21yc3-9y9XINs/photos/file_4.jpg','2026-05-04 01:54:39'),(46,'test_videorolik','test_videorolik@mail.com',NULL,'$2y$12$pa.4G0o0dSzXrqRsU.yo6uRzth4agn/9l38inOlnjxQBYV7rlMMZ6',0,'2026-05-09 06:58:33',NULL,'2026-05-09 06:57:42','2026-05-09 07:00:33',NULL,NULL,NULL,NULL),(47,'Nalaina','koadro1188@gmail.com',NULL,'$2y$12$mBagFiE9jdWv6x4gVt0vaethslolOZINFiYUi6v3r44ECNgjWrBHy',0,'2026-05-12 09:06:25',NULL,'2026-05-12 09:04:14','2026-05-12 09:06:25',6498304593,'koadrobrindo','https://api.telegram.org/file/bot8240491675:AAH0ZIn1pbnqV2W7M5PLYP21yc3-9y9XINs/photos/file_8.jpg','2026-05-12 09:04:59'),(48,'Юлия','an9202103434@yandex.ru',NULL,'$2y$12$pBlveqg/TD15DBJERX3IUuGcmYUSylLpOfWpgY8latoQlgY29MWiu',0,NULL,NULL,'2026-05-16 05:53:21','2026-05-16 05:53:21',NULL,NULL,NULL,NULL),(49,'natalia','knopa471@gmail.com',NULL,'$2y$12$n2WHDk4VtsEmtLdc8vJDWuKR3LQJF95Wnq5ORaNyhlGIM3bYf.YVS',0,'2026-05-21 12:54:34',NULL,'2026-05-21 12:53:17','2026-05-21 12:54:34',6972646765,'natik831','https://api.telegram.org/file/bot8240491675:AAH0ZIn1pbnqV2W7M5PLYP21yc3-9y9XINs/photos/file_9.jpg','2026-05-21 12:53:48'),(51,'dfdgds','ghjghjhgjhgj890@gmail.com',NULL,'$2y$12$cZ69csXjmdae4dDZjE2SaethpZxw0jBg8k6f8h5BBvk3WQ0HtYG5G',0,NULL,NULL,'2026-05-24 14:23:02','2026-05-24 14:23:02',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-20 10:44:00
