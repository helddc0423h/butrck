-- --------------------------------------------------------
-- Servidor:         127.0.0.1
-- Versão do servidor:    10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:        Win64
-- HeidiSQL Versão:       12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Criação da tabela 'users' (não depende de outras tabelas para chaves estrangeiras)
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nomecompleto` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('USER','ADMIN') NOT NULL DEFAULT 'USER',
  `referral_code` varchar(255) DEFAULT NULL,
  `referral_level` bigint(20) unsigned NOT NULL DEFAULT 1,
  `referral_xp` bigint(20) unsigned NOT NULL DEFAULT 0,
  `referral_commission` decimal(5,2) NOT NULL DEFAULT 0.00,
  `referred_by` varchar(255) DEFAULT NULL,
  `commission_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_deposit` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_cashback` decimal(15,2) NOT NULL DEFAULT 0.00,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `document` varchar(255) DEFAULT NULL,
  `bloqueado` tinyint(1) NOT NULL DEFAULT 0,
  `is_influencer` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_ip` varchar(255) DEFAULT NULL,
  `last_logout` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_referral_code_unique` (`referral_code`),
  KEY `users_email_username_index` (`email`,`username`),
  KEY `users_role_index` (`role`),
  KEY `users_bloqueado_index` (`bloqueado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.users: ~3 rows (aproximadamente)
INSERT INTO `users` (`id`, `nomecompleto`, `email`, `username`, `telefone`, `password`, `role`, `referral_code`, `referral_level`, `referral_xp`, `referral_commission`, `referred_by`, `commission_balance`, `total_deposit`, `total_withdraw`, `total_cashback`, `balance`, `document`, `bloqueado`, `is_influencer`, `last_login`, `last_ip`, `last_logout`, `remember_token`, `created_at`, `updated_at`) VALUES
  (1, 'Jonathan Santos', 'johnsantoos2017@gmail.com', 'user202806', '(87) 98723-2321', '$2y$12$WEZrZmcMC1ZuS8pusqv/gO/LZfToAPOzBg85Tbc0.fiq0QWBs/ItS', 'ADMIN', 'alHz1lwq', 1, 200, 50.00, NULL, 50.00, 30.00, 0.00, 0.00, 200.00, NULL, 0, 0, '2025-07-22 23:43:57', '127.0.0.1', NULL, NULL, '2025-07-22 23:43:57', '2025-07-24 00:06:44'),
  (2, 'Teste de indicação', 'testeindicate@gmail.com', 'Teste172', '(87) 9982-3211', '$2y$12$bWl2QudKVG25es8SqyJBTeDnO5UI2lk/Pt/FoPkkBdhqDVgzuQIJS', 'USER', NULL, 1, 0, 0.00, 'alHz1lwq', 0.00, 50.00, 0.00, 0.00, 0.00, NULL, 0, 0, NULL, NULL, NULL, NULL, '2025-07-23 05:16:08', '2025-07-23 05:19:08'),
  (3, 'TESTE INDICACAO', 'testeindicacao2@gmail.com', 'TESTE649', '(87) 98821-2323', '$2y$12$uTH1oRqBlG3q0mAMcB9Pa.DVXT4bH84lOjEuKh8hiJszBnLk0juCW', 'USER', NULL, 1, 0, 0.00, 'alHz1lwq', 0.00, 200.00, 0.00, 0.00, 122.00, NULL, 0, 0, NULL, NULL, NULL, NULL, '2025-07-23 19:28:52', '2025-07-23 19:35:57');

-- Criação da tabela 'banners'
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `button_link` varchar(255) NOT NULL DEFAULT '/raspadinhas',
  `image_url` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.banners: ~2 rows (aproximadamente)
INSERT INTO `banners` (`id`, `title`, `button_link`, `image_url`, `order`, `active`, `created_at`, `updated_at`) VALUES
  (1, 'ACHOU GANHOU', '/raspadinhas', '/banners/2QrH3EYB4sn3zo3shsucmwsgpSoVyHuVYM41bsdZ.webp', 1, 1, '2025-07-23 23:52:24', '2025-07-23 23:52:24'),
  (2, '1000 COM 1 REAL', '/raspadinhas', '/banners/1yGB2WoHFo2TScbWbv5nyBOVuKtTbLUGNyqShUMj.webp', 2, 1, '2025-07-23 23:52:50', '2025-07-23 23:52:50');

-- Criação da tabela 'config'
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL DEFAULT 'Sistema de Raspadinhas',
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `min_deposit_amount` decimal(10,2) NOT NULL DEFAULT 1.00,
  `max_deposit_amount` decimal(10,2) NOT NULL DEFAULT 10000.00,
  `min_withdraw_amount` decimal(10,2) NOT NULL DEFAULT 10.00,
  `max_withdraw_amount` decimal(10,2) NOT NULL DEFAULT 50000.00,
  `description` text DEFAULT 'A melhor plataforma de raspadinhas online do Brasil. Ganhe prêmios incríveis, PIX na unha e muito mais!',
  `keywords` text DEFAULT 'raspadinha, sorte, prêmios, jogos, online, brasil, pix',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `primary_color` varchar(255) NOT NULL DEFAULT '#4ADE80',
  `secondary_color` varchar(255) NOT NULL DEFAULT '#1F2937',
  `accent_color` varchar(255) NOT NULL DEFAULT '#6366F1',
  `background_color` varchar(255) NOT NULL DEFAULT '#000000',
  `foreground_color` varchar(255) NOT NULL DEFAULT '#FFFFFF',
  `muted_color` varchar(255) NOT NULL DEFAULT '#374151',
  `muted_foreground_color` varchar(255) NOT NULL DEFAULT '#9CA3AF',
  `card_color` varchar(255) NOT NULL DEFAULT '#111827',
  `card_foreground_color` varchar(255) NOT NULL DEFAULT '#FFFFFF',
  `border_color` varchar(255) NOT NULL DEFAULT '#374151',
  `input_color` varchar(255) NOT NULL DEFAULT '#374151',
  `ring_color` varchar(255) NOT NULL DEFAULT '#4ADE80',
  `auto_withdraw_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `auto_withdraw_max_amount` decimal(10,2) NOT NULL DEFAULT 1000.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.config: ~1 rows (aproximadamente)
INSERT INTO `config` (`id`, `app_name`, `logo`, `favicon`, `footer_text`, `contact_email`, `contact_phone`, `address`, `min_deposit_amount`, `max_deposit_amount`, `min_withdraw_amount`, `max_withdraw_amount`, `description`, `keywords`, `created_at`, `updated_at`, `primary_color`, `secondary_color`, `accent_color`, `background_color`, `foreground_color`, `muted_color`, `muted_foreground_color`, `card_color`, `card_foreground_color`, `border_color`, `input_color`, `ring_color`, `auto_withdraw_enabled`, `auto_withdraw_max_amount`) VALUES
  (1, 'Sistema de Raspadinhas', '/images/wqBhdba8EX3lir2aJjFi3Zp9jhZ967hwrAUGubHV.webp', '/images/pjR5qW8QOgixc9V7LyQFHEh98SJ1XRbYtZwYVhOV.webp', 'Sistema de Raspadinhas - Sua sorte está aqui!', 'contato@raspadinhas.com.br', '(11) 99999-9999', 'São Paulo, SP - Brasil', 10.00, 10000.00, 10.00, 50000.00, 'A melhor plataforma de raspadinhas online do Brasil. Ganhe prêmios incríveis, PIX na unha e muito mais!', 'raspadinha, sorte, prêmios, jogos, online, brasil, pix', '2025-07-22 23:40:30', '2025-07-23 23:40:15', '#28e504', 'oklch(26.9% 0 0)', 'oklch(26.9% 0 0)', '#000000', 'oklch(98.5% 0 0)', 'oklch(26.9% 0 0)', 'oklch(70.8% 0 0)', 'oklch(20.5% 0 0)', 'oklch(98.5% 0 0)', 'oklch(26.9% 0 0)', 'oklch(26.9% 0 0)', '#28e504', 0, 1000.00);

-- Criação da tabela 'gatewayskeys'
CREATE TABLE IF NOT EXISTS `gatewayskeys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `primebank_client_id` varchar(255) DEFAULT NULL,
  `primebank_client_secret` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.gatewayskeys: ~1 rows (aproximadamente)
INSERT INTO `gatewayskeys` (`id`, `primebank_client_id`, `primebank_client_secret`, `created_at`, `updated_at`) VALUES
  (1, 'johnteste_b4kpelgxsxbk2c76qlp3a3nh', 'sk_a00f8d966aede8da657839ada1b2d34828bc64edb513bcf005c330fd5e1e7523', '2025-07-22 23:39:21', '2025-07-22 23:39:21');

-- Criação da tabela 'raspadinhas'
CREATE TABLE IF NOT EXISTS `raspadinhas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `totalbuy` int(11) NOT NULL DEFAULT 0,
  `value` decimal(10,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `hot` tinyint(1) NOT NULL DEFAULT 0,
  `max_sales` int(11) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.raspadinhas: ~1 rows (aproximadamente)
INSERT INTO `raspadinhas` (`id`, `name`, `photo`, `title`, `description`, `totalbuy`, `value`, `active`, `hot`, `max_sales`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
  (5, 'raspadinha-magica', '/raspadinhas/CsDcbRYVkUwXwyhphYdJ3uV7GXFuHEjUw3d7c6l7.webp', 'Raspadinha Mágica', 'Raspadinha Mágica', 24, 50.00, 1, 1, NULL, '2025-07-23 18:15:00', '2026-01-30 18:15:00', '2025-07-23 21:15:38', '2025-07-24 00:06:44');

-- Criação da tabela 'raspadinha_prizes' (depende de 'raspadinhas')
CREATE TABLE IF NOT EXISTS `raspadinha_prizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `raspadinha_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `probability` decimal(5,2) NOT NULL,
  `display_value` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `is_jackpot` tinyint(1) NOT NULL DEFAULT 0,
  `max_wins` int(11) DEFAULT NULL,
  `current_wins` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raspadinha_prizes_raspadinha_id_active_index` (`raspadinha_id`,`active`),
  KEY `raspadinha_prizes_probability_index` (`probability`),
  CONSTRAINT `raspadinha_prizes_raspadinha_id_foreign` FOREIGN KEY (`raspadinha_id`) REFERENCES `raspadinhas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.raspadinha_prizes: ~28 rows (aproximadamente)
INSERT INTO `raspadinha_prizes` (`id`, `raspadinha_id`, `name`, `value`, `probability`, `display_value`, `img`, `is_jackpot`, `max_wins`, `current_wins`, `active`, `created_at`, `updated_at`) VALUES
  (20, 5, 'Nada', 0.00, 72.03, 'R$ 0,00', NULL, 0, NULL, 17, 1, '2025-07-23 21:15:38', '2025-07-24 00:06:44'),
  (25, 5, '20.000 Reais', 20000.00, 0.01, 'R$ 20000,00', '/prizes/3NsBQCkU8AsDVUKMpPQigjINaBJE7p3RRu1zlCRB.webp', 1, 0, 0, 1, '2025-07-23 21:34:13', '2025-07-23 23:10:40'),
  (26, 5, 'Moto CG 160 Start', 16500.00, 0.01, 'R$ 16500,00', '/prizes/wcZx4lvOwVev3tlFmCV6npsCfOvFjK1dVjaGZngC.webp', 0, 1, 0, 1, '2025-07-23 21:43:27', '2025-07-23 21:43:31'),
  (27, 5, 'Moto Honda Biz 110i', 13000.00, 0.01, 'R$ 13000,00', '/prizes/6dpZopNLeuWO4KIBEX2YWgCLXugMDK6OGYQZoyUR.webp', 0, 1, 1, 1, '2025-07-23 21:44:03', '2025-07-23 22:01:14'),
  (28, 5, 'Moto Honda Pop 110i', 11500.00, 0.01, 'R$ 11500,00', '/prizes/3bjXRyO9t5l4A9EIP0m30aiv5yKniq5WpjWZkrLu.webp', 0, 1, 0, 1, '2025-07-23 21:44:44', '2025-07-23 21:44:44'),
  (29, 5, 'iPhone 15 Pro', 11000.00, 0.01, 'R$ 11000,00', '/prizes/XaTF5rpngpCrzqNTZECWNs051N67QRRsnRePLYx3.webp', 0, 1, 0, 1, '2025-07-23 21:45:32', '2025-07-23 21:45:32'),
  (30, 5, '10.000 Reais', 10000.00, 0.01, 'R$ 10000,00', '/prizes/8SGBtYgCUBYIMw6yMGdEtWljgmi96ka4QyJXeQPc.webp', 0, 1, 0, 1, '2025-07-23 21:46:01', '2025-07-23 21:46:01'),
  (31, 5, 'iPhone 15 Pro Max', 9500.00, 0.01, 'R$ 9500,00', '/prizes/CXzXpLKHg0gH7Tm4UYjH9xgMVkTOdymTqy1RXQaV.webp', 0, 1, 0, 1, '2025-07-23 21:46:24', '2025-07-23 21:46:24'),
  (32, 5, 'Geladeira Frost Free', 7500.00, 0.01, 'R$ 7500,00', '/prizes/Z9DA9GWz8XA9axyIz94lRm9dLIF0Zv08ARaqqRdG.webp', 0, 1, 0, 1, '2025-07-23 21:47:35', '2025-07-23 21:47:35'),
  (33, 5, 'Apple Watch Ultra 2', 7500.00, 0.01, 'R$ 7500,00', '/prizes/mSaeC4nNxquNZxfiwSrg5dGRf9y57WuUCRKMDdqh.webp', 0, 1, 0, 1, '2025-07-23 21:48:06', '2025-07-23 21:48:06'),
  (34, 5, 'Churrasqueira a gás GS Performance', 5000.00, 0.01, 'R$ 5000,00', '/prizes/YTsv2iX4WEyr3lwNzUz1uoDpLEHIlRYAaCgLSmkc.webp', 0, 1, 1, 1, '2025-07-23 21:48:35', '2025-07-23 21:59:24'),
  (35, 5, 'iPhone 15', 5000.00, 0.01, 'R$ 5000,00', '/prizes/g9WMns7MjIhxU2jcw8MLKhTjPkEk7jxOdyHmBa5T.webp', 0, 1, 0, 1, '2025-07-23 21:49:01', '2025-07-23 21:49:01'),
  (36, 5, '5.000 Reais', 5000.00, 0.01, 'R$ 5000,00', '/prizes/8OM9MBF4fWah5K9gixnYGEhljbN5tv7LgVy0LkKE.webp', 0, 1, 0, 1, '2025-07-23 21:50:23', '2025-07-23 21:50:23'),
  (37, 5, 'PlayStation 5', 4500.00, 0.01, 'R$ 4500,00', '/prizes/lgwq88W6y99W0v6Zei1q6889P9AYpDv9F3BhhCtH.webp', 0, 1, 0, 1, '2025-07-23 21:50:50', '2025-07-23 21:50:50'),
  (38, 5, 'iPhone 12', 2500.00, 0.01, 'R$ 2500,00', '/prizes/HH22Km9LbnFyGiw3yVzpG09TugMqQQuc1CDOkdb9.webp', 0, 0, 0, 1, '2025-07-23 21:51:16', '2025-07-23 23:11:09'),
  (39, 5, 'Apple AirPods 3ª geração', 1900.00, 0.09, 'R$ 1900,00', '/prizes/Hw0gQZTWpKmw94QqCtJnT7UhmH93T4Jq920y9cFg.webp', 0, 1, 0, 1, '2025-07-23 21:51:59', '2025-07-23 21:51:59'),
  (40, 5, 'Air Force 1 x AMBUSH', 1700.00, 0.03, 'R$ 1700,00', '/prizes/xdCN0LKXDNnHRl1B9gQpgdVHVJXP8sOLnffYJCMk.webp', 0, 1, 0, 1, '2025-07-23 21:52:26', '2025-07-23 21:52:26'),
  (41, 5, 'Air Force 1 Low Retro', 1200.00, 0.05, 'R$ 1200,00', '/prizes/RCR1VphXIO3MWg3Rm0lin2JPKRWpFfy8zAuB9mlW.webp', 0, 1, 0, 1, '2025-07-23 21:52:45', '2025-07-23 21:52:45'),
  (42, 5, 'Air Jordan 1 Low Purple', 1100.00, 0.06, 'R$ 1100,00', '/prizes/6iPoORYHf22U2yDfopPRR0eriJhTtigJKkMKEayw.webp', 0, 1, 0, 1, '2025-07-23 21:53:11', '2025-07-23 21:53:11'),
  (43, 5, '1.000 Reais', 1000.00, 0.20, 'R$ 1000,00', '/prizes/JY4JWrmbDiWEO20UI3QNNtutBHLC0udFOBfCeq4d.webp', 0, 3, 0, 1, '2025-07-23 21:53:37', '2025-07-23 21:53:37'),
  (44, 5, '700 Reais', 700.00, 0.10, 'R$ 700,00', '/prizes/aRguxakZbQwr2vb7fFLSnzN9QSMmKzBfdl7Nsydn.webp', 0, 2, 0, 1, '2025-07-23 21:54:04', '2025-07-23 21:54:04'),
  (45, 5, '500 Reais', 500.00, 0.30, 'R$ 500,00', '/prizes/197loyiByg96cuPMNVHmMODqyT25bWx1U2S17HCM.webp', 0, 4, 1, 1, '2025-07-23 21:54:38', '2025-07-23 22:00:37'),
  (46, 5, '100 Reais', 100.00, 1.00, 'R$ 100,00', '/prizes/36cMDSsNSv8xGK2y1jYObC2JXFus8wYne0qEfOko.webp', 0, 7, 0, 1, '2025-07-23 21:55:04', '2025-07-23 21:55:04'),
  (47, 5, '50 Reais', 50.00, 1.00, 'R$ 50,00', '/prizes/OrmjV1IXaKVXvKjFHuQRtyljo3x8EieYpTn2eT6s.webp', 0, NULL, 0, 1, '2025-07-23 21:55:28', '2025-07-23 21:56:46'),
  (48, 5, 'Capinha transparente para iPhone 15', 30.00, 4.00, 'R$ 30,00', '/prizes/kpEgt91VNqq90CiwKcfYmcHaZwvWTUWPdMJwq8Rr.webp', 0, NULL, 1, 1, '2025-07-23 21:55:56', '2025-07-23 22:04:20'),
  (49, 5, '10 Reais', 10.00, 5.00, 'R$ 10,00', '/prizes/JK1XATH5nTDGdNGdONtGXlUTIkNb5S0gL7YToAgq.webp', 0, NULL, 0, 1, '2025-07-23 21:56:32', '2025-07-23 21:56:32'),
  (50, 5, '5 Reais', 5.00, 5.00, 'R$ 5,00', '/prizes/UgdwCI1TOmosLhPf94zUpoUoIrcLELVmFYIQeRW1.webp', 0, NULL, 0, 1, '2025-07-23 21:57:26', '2025-07-23 21:57:26'),
  (51, 5, '1 Real', 1.00, 10.00, 'R$ 1,00', '/prizes/MYeYVv9g0czLzYaNMCt0miLHDQYYwT8sDyB3ETns.webp', 0, NULL, 3, 1, '2025-07-23 21:57:51', '2025-07-23 22:11:39');

-- Criação da tabela 'deposits' (depende de 'users')
CREATE TABLE IF NOT EXISTS `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'DEPOSITO',
  `payment_id` varchar(255) NOT NULL,
  `external_id` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `status` enum('pending','paid','expired','cancelled','failed') NOT NULL DEFAULT 'pending',
  `gateway` enum('primebank','mock','commission') DEFAULT 'primebank',
  `qr_code` text DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deposits_payment_id_unique` (`payment_id`),
  UNIQUE KEY `deposits_external_id_unique` (`external_id`),
  KEY `deposits_user_id_status_index` (`user_id`,`status`),
  KEY `deposits_status_created_at_index` (`status`,`created_at`),
  KEY `deposits_gateway_status_index` (`gateway`,`status`),
  CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.deposits: ~0 rows (aproximadamente)

-- Criação da tabela 'jogos_historico' (depende de 'users' e 'raspadinhas')
CREATE TABLE IF NOT EXISTS `jogos_historico` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `raspadinha_id` bigint(20) unsigned NOT NULL,
  `raspadinha_name` varchar(255) NOT NULL,
  `prize_id` bigint(20) unsigned DEFAULT NULL,
  `prize_name` varchar(255) DEFAULT NULL,
  `prize_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `prize_img` varchar(255) DEFAULT NULL,
  `status` enum('win','loss') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jogos_historico_raspadinha_id_foreign` (`raspadinha_id`),
  KEY `jogos_historico_user_id_created_at_index` (`user_id`,`created_at`),
  CONSTRAINT `jogos_historico_raspadinha_id_foreign` FOREIGN KEY (`raspadinha_id`) REFERENCES `raspadinhas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jogos_historico_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.jogos_historico: ~0 rows (aproximadamente)

-- Criação da tabela 'migrations' (não possui dependências de chaves estrangeiras)
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.migrations: ~23 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
  (1, '2025_07_16_235201_create_config_table', 1),
  (2, '2025_07_17_161923_create_users_table', 1),
  (3, '2025_07_18_140611_create_raspadinhas_table', 1),
  (4, '2025_07_18_140705_create_raspadinha_prizes_table', 1),
  (5, '2025_07_21_164643_create_banners_table', 1),
  (6, '2025_07_21_170345_update_banners_table_remove_unused_fields', 1),
  (7, '2025_07_21_175937_create_ultimos_ganhos_table', 1),
  (8, '2025_07_21_194857_add_hot_column_to_raspadinhas_table', 1),
  (9, '2025_07_21_221118_add_img_column_to_raspadinha_prizes_table', 1),
  (10, '2025_07_21_233947_create_gatewayskeys_table', 1),
  (11, '2025_07_21_234503_create_deposits_table', 1),
  (12, '2025_07_22_121401_add_deposit_withdraw_limits_to_config_table', 1),
  (13, '2025_07_22_121409_add_deposit_withdraw_limits_to_config_table', 1),
  (14, '2025_07_23_000000_create_withdrawals_table', 1),
  (15, '2024_03_20_000000_create_jogos_historico_table', 2),
  (16, '2024_03_21_000000_add_referral_code_to_users', 3),
  (17, '2024_03_21_000001_add_commission_to_users', 3),
  (18, '2024_03_21_000002_add_referred_by_to_users', 4),
  (19, '2025_07_23_162609_add_description_to_deposits_table', 5),
  (20, '2025_07_23_163040_add_commission_gateway_to_deposits_table', 6),
  (21, '2025_07_23_164655_add_is_influencer_to_users_table', 7),
  (22, '2024_03_22_000000_add_transaction_id_to_withdrawals_table', 8),
  (23, '2024_03_22_000001_add_theme_and_auto_withdraw_to_config', 9);

-- Criação da tabela 'ultimos_ganhos'
CREATE TABLE IF NOT EXISTS `ultimos_ganhos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `namewin` varchar(255) NOT NULL,
  `prizename` varchar(255) NOT NULL,
  `valueprize` decimal(10,2) NOT NULL,
  `imgprize` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.ultimos_ganhos: ~7 rows (aproximadamente)
INSERT INTO `ultimos_ganhos` (`id`, `namewin`, `prizename`, `valueprize`, `imgprize`, `active`, `created_at`, `updated_at`) VALUES
  (28, 'Jonathan Santos', 'Churrasqueira a gás GS Performance', 5000.00, '/prizes/YTsv2iX4WEyr3lwNzUz1uoDpLEHIlRYAaCgLSmkc.webp', 1, '2025-07-23 21:59:24', '2025-07-23 21:59:24'),
  (29, 'Jonathan Santos', '500 Reais', 500.00, '/prizes/197loyiByg96cuPMNVHmMODqyT25bWx1U2S17HCM.webp', 1, '2025-07-23 22:00:37', '2025-07-23 22:00:37'),
  (30, 'Jonathan Santos', 'Moto Honda Biz 110i', 13000.00, '/prizes/6dpZopNLeuWO4KIBEX2YWgCLXugMDK6OGYQZoyUR.webp', 1, '2025-07-23 22:01:14', '2025-07-23 22:01:14'),
  (31, 'Jonathan Santos', 'Capinha transparente para iPhone 15', 30.00, '/prizes/kpEgt91VNqq90CiwKcfYmcHaZwvWTUWPdMJwq8Rr.webp', 1, '2025-07-23 22:04:20', '2025-07-23 22:04:20'),
  (32, 'Jonathan Santos', '1 Real', 1.00, '/prizes/MYeYVv9g0czLzYaNMCt0miLHDQYYwT8sDyB3ETns.webp', 1, '2025-07-23 22:04:59', '2025-07-23 22:04:59'),
  (33, 'Jonathan Santos', '1 Real', 1.00, '/prizes/MYeYVv9g0czLzYaNMCt0miLHDQYYwT8sDyB3ETns.webp', 1, '2025-07-23 22:05:23', '2025-07-23 22:05:23'),
  (34, 'Jonathan Santos', '1 Real', 1.00, '/prizes/MYeYVv9g0czLzYaNMCt0miLHDQYYwT8sDyB3ETns.webp', 1, '2025-07-23 22:11:39', '2025-07-23 22:11:39');


-- Criação da tabela 'withdrawals' (depende de 'users')
CREATE TABLE IF NOT EXISTS `withdrawals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `pix_key` varchar(255) NOT NULL,
  `pix_key_type` enum('cpf','cnpj','email','phone','random') NOT NULL,
  `document` varchar(255) NOT NULL,
  `status` enum('pending','completed','cancelled','failed') NOT NULL DEFAULT 'pending',
  `reason` text DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `withdrawals_user_id_foreign` (`user_id`),
  CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela raspadinha.withdrawals: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;