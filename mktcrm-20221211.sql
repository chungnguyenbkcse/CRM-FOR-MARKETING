-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mktcrm
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_audit`
--

DROP TABLE IF EXISTS `accounts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_audit`
--

LOCK TABLES `accounts_audit` WRITE;
/*!40000 ALTER TABLE `accounts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bugs`
--

DROP TABLE IF EXISTS `accounts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bugs`
--

LOCK TABLES `accounts_bugs` WRITE;
/*!40000 ALTER TABLE `accounts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cases`
--

DROP TABLE IF EXISTS `accounts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cases`
--

LOCK TABLES `accounts_cases` WRITE;
/*!40000 ALTER TABLE `accounts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_contacts`
--

DROP TABLE IF EXISTS `accounts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_contacts`
--

LOCK TABLES `accounts_contacts` WRITE;
/*!40000 ALTER TABLE `accounts_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cstm`
--

DROP TABLE IF EXISTS `accounts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cstm`
--

LOCK TABLES `accounts_cstm` WRITE;
/*!40000 ALTER TABLE `accounts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_opportunities`
--

DROP TABLE IF EXISTS `accounts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_opportunities`
--

LOCK TABLES `accounts_opportunities` WRITE;
/*!40000 ALTER TABLE `accounts_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES ('102ca705-2c60-5a88-fcc5-6316df0c9190','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','jjwg_Maps','module',90,0),('105517da-3f4a-f7f8-bee2-6316dfe5cca9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOS_PDF_Templates','module',89,0),('10d6905e-11ec-a51a-e6d5-6316dfa9807a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOD_IndexEvent','module',90,0),('10fd2104-2be9-3bb1-a5ee-6316df29c19d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOS_Product_Categories','module',90,0),('1133c3a1-6d3e-50b2-801b-6316dfe3e077','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','SecurityGroups','module',90,0),('11b9eed2-7955-52d9-1b2b-6316df77d706','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Bugs','module',90,0),('11ff6563-817b-db5f-c7df-6316df0a83d5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOS_Products','module',90,0),('12f6c1dd-073f-5a48-b0dc-6316de6446ac','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Leads','module',90,0),('12fe4ae6-b1de-0590-37ea-631ccfbb3c25','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOS_Invoices','module',89,0),('13a87b94-81bc-9fba-6a4e-6316df279935','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOP_Case_Updates','module',90,0),('1415069e-ab84-7c02-6088-6316dfe69f5a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOS_Products','module',90,0),('142de054-c001-1129-ac2d-6316df2c1bb3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','jjwg_Areas','module',90,0),('14346882-4280-082d-2669-6316dffcdf76','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Accounts','module',90,0),('143489bc-69c5-52dd-a97b-631ccfb630de','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Spots','module',89,0),('1493cc7b-6e94-7c92-c8e3-6316dffdd549','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Contacts','module',90,0),('14f403d4-38e4-9e9c-bab6-631ccf5410f2','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Documents','module',89,0),('151a0c47-eb99-eb26-6a09-6316df6dda4a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Prospects','module',89,0),('15396fe0-21f4-ed99-a168-6316dfd2e96e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Spots','module',90,0),('15676901-dab3-59e8-d591-6316df081697','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOS_Invoices','module',90,0),('15a5f734-b113-8449-6360-631ccff5c169','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Project','module',89,0),('16d709bd-1cad-484a-2d7b-63215e9f630a','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','jjwg_Areas','module',96,0),('175a87cf-5bd1-75d7-151a-6316dfbe74ae','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Calls','module',90,0),('1769b9fe-24ac-059e-0fa2-6316df5ae573','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOS_PDF_Templates','module',90,0),('179b5201-8333-5fb5-888d-63215ea33d49','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Cases','module',96,0),('17b8968b-0eb7-755f-db6a-6316df9c71ce','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Prospects','module',90,0),('18017b5c-a0d4-51dc-199e-6316df662757','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Notes','module',89,0),('182e6e52-7cef-faaf-372b-6316df53ec71','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Project','module',90,0),('1868b0ef-12f4-7e1c-5a2f-632827e0d4c2','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','jjwg_Address_Cache','module',96,0),('188b96eb-07af-2256-44fe-63215efb1abb','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AM_TaskTemplates','module',96,0),('18fde6f5-dbc2-7cb5-3a18-6316df8fcf8e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','SurveyResponses','module',90,0),('193e5e9f-e13f-035e-63a6-6316df820a4b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOS_Quotes','module',90,0),('195be5e5-75b4-bcb9-a98b-6316df32b9a8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','SecurityGroups','module',90,0),('197639bd-cd0a-3ff8-68e5-6316df3473a5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOK_KnowledgeBase','module',90,0),('19af17bd-30f0-bb8b-d05f-632827bfb9dd','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Emails','module',96,0),('19d1e023-690a-86c0-fd7a-6316df815365','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','ProjectTask','module',90,0),('19ec3bcf-6ffe-cac2-156f-6316df243a0d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOW_WorkFlow','module',90,0),('19eea4a9-5088-27d3-e1a0-6316df7b6882','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','jjwg_Maps','module',90,0),('19f93307-c5f9-0941-6f2d-63215ee5f153','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOS_Invoices','module',96,0),('1ad42121-a2c5-bc06-a3e7-6316dfd31d23','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','SurveyQuestionOptions','module',90,0),('1b44fb5e-47b0-fcd2-f5ff-6316df891eac','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOP_Case_Events','module',90,0),('1bc97b64-d748-0cfb-dcbe-6316dfbed8d0','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOS_Products','module',90,0),('1d138b41-a943-41eb-cfd3-6316df555fea','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','EmailMarketing','module',89,0),('1d44ea65-69ab-787a-a08a-6316df191809','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Bugs','module',90,0),('1d8047f4-c554-0370-46cb-631ccf6dbcf8','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOS_PDF_Templates','module',89,0),('1d81243c-6ecc-3280-ea16-6316de57c31e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Leads','module',90,0),('1e285511-f83d-a8f9-a66d-63215ecad1b8','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Opportunities','module',96,0),('1e9c61dc-077f-2dfe-8baa-632827102763','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOD_Index','module',96,0),('1f5ecd97-ca5c-9548-0a05-6316df234429','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','TemplateSectionLine','module',89,0),('1fe2f2ae-12b8-db83-0e08-6316dfb0be73','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','jjwg_Areas','module',90,0),('213d3485-84ed-1a42-30b0-6316dfe59e51','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Calls_Reschedule','module',90,0),('214e9f09-a5f8-963b-544b-6316df471142','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Project','module',90,0),('216ef590-e5eb-9efc-89a1-6316df01c170','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Prospects','module',90,0),('21780283-6ab5-8348-18e1-6316dfca85ff','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Spots','module',90,0),('217a952e-9842-c203-368a-6316dfa29f8e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOP_Case_Updates','module',90,0),('217caf3e-fd82-8cda-8967-6316df824203','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOS_PDF_Templates','module',90,0),('218c2c0e-e6b3-988a-165f-6316df07682d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','OutboundEmailAccounts','module',90,0),('218efdd3-4a5d-0f4a-b1c2-6316dfcdc0a2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','SecurityGroups','module',90,0),('2249adeb-eb53-0b33-76b7-6316df312815','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','ProjectTask','module',90,0),('228ea1af-9add-8322-721f-631ccf0cb867','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','ProjectTask','module',89,0),('229f89be-1f0a-706d-f676-6316df623039','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Notes','module',90,0),('23075562-4ad8-b980-3055-6316df920f25','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOK_KnowledgeBase','module',90,0),('24071981-6892-7087-f0a6-6316df941163','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOD_IndexEvent','module',90,0),('240eb50a-d7ce-b6df-df08-6316df182c1a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Calls','module',90,0),('2422dd49-6e13-11f8-b4e4-6316df40fee5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','jjwg_Maps','module',90,0),('243cb288-b6ab-4422-d000-631ccf599aca','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','EAPM','module',89,0),('24fb3a33-46cf-5ede-fa98-632827910b93','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Calls_Reschedule','module',96,0),('252a7aed-6146-f3b9-2a2c-6316df5943ca','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','SurveyResponses','module',90,0),('2568ba55-47b4-333e-f401-6316df45808e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOS_Invoices','module',90,0),('25bf1490-dec7-8649-fa66-6316df9dcfa7','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOS_Products','module',90,0),('2787f0d3-8fe7-7b49-05c0-6316df526cd8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','SurveyQuestionOptions','module',90,0),('278eb9d5-5191-142e-006f-632827e5b06f','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Meetings','module',96,0),('27ab511d-027c-c83d-b3a4-63215e838368','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOS_PDF_Templates','module',96,0),('27ce6e75-001d-6621-4ad4-6316df3b9715','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Bugs','module',90,0),('27f67868-6c1d-ab29-28b9-63215edd36b0','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','jjwg_Address_Cache','module',96,0),('28780fdc-0887-0dcb-b6b3-632827173c69','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Notes','module',96,0),('28c62dc2-be40-9913-3693-63215e12dcf2','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOK_Knowledge_Base_Categories','module',96,0),('2a1a1437-5453-fc50-74cc-631ccf98cea4','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOS_Product_Categories','module',89,0),('2a6bc630-7201-6714-aeed-63282705e690','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Leads','module',96,0),('2adf3b84-e7f1-65bd-f018-631ccf335342','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Surveys','module',89,0),('2ae24e60-687f-b491-c03d-63282774930a','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOP_Case_Events','module',96,0),('2b330d7c-5909-ce7f-ebc5-6316df0a4e44','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','TemplateSectionLine','module',90,0),('2b74da39-ae2b-40e7-22fb-6316df4fd5c1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOP_Case_Updates','module',90,0),('2bd5456a-398a-5e25-d17c-6316df7bc19e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Prospects','module',90,0),('2c357a3b-358b-54c2-c7d3-6316df1f3449','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','ProjectTask','module',90,0),('2cb38961-b273-f928-5d31-6316df9f1fc9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Notes','module',90,0),('2ce89766-445c-91bd-29f0-6316df9a876a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOW_WorkFlow','module',90,0),('2e3b1e8a-d291-9943-144b-6316dfd4dc40','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','SecurityGroups','module',90,0),('2f158b3b-af60-08b8-dc95-6316df1670e4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Calls','module',90,0),('2f240c88-c3a5-f1d8-946f-6316de82c2b8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Leads','module',90,0),('2f414465-35aa-6031-cfac-6316df318158','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOS_Contracts','module',89,0),('2f981d0b-066c-2c60-3649-6316df1c3f12','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','SurveyResponses','module',90,0),('30414808-7a04-ecbb-830c-632827c7bb98','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','SecurityGroups','module',96,0),('3093032f-0649-02dd-21db-6316df844ab9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','FP_Event_Locations','module',90,0),('311cbf03-d5a1-02e9-2356-63215ec490f3','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','EmailTemplates','module',96,0),('31657248-f577-4e01-9f6a-6316df0ca5de','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Calls_Reschedule','module',90,0),('3186a169-8945-a756-94b7-6316df8765ef','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOD_IndexEvent','module',90,0),('31a04728-d597-53fe-994f-6316df04b8dc','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Bugs','module',90,0),('31becbb8-8ac0-729e-9cbc-6316df95f1ff','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','SurveyQuestionOptions','module',90,0),('332db35d-2e3c-a370-168b-6316dfd95c93','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOS_Invoices','module',90,0),('3376ed56-58ec-d6a8-739c-631ccfb95f32','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AM_ProjectTemplates','module',89,0),('33e18d02-675c-df26-095f-6316dfeaecdc','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','OutboundEmailAccounts','module',90,0),('340abc82-abd5-c96e-f954-6316df442a4c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','SurveyQuestionResponses','module',90,0),('342c1b5d-2a84-612b-6b9f-6316df212a9a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOK_KnowledgeBase','module',90,0),('34839d79-c435-ceaf-f842-63215e6a6945','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Calls_Reschedule','module',96,0),('34b26918-c5f4-31e7-a3ac-631ccf307b0c','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Campaigns','module',89,0),('3534cc8f-9554-c409-64be-6316df619fa9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOS_Products','module',90,0),('35515902-d836-458f-df23-632827dde687','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Tasks','module',96,0),('35c03e1e-59b8-a2b1-1942-6316dfb8d5cb','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Prospects','module',90,0),('35c3f10c-6d30-6cb1-49c8-6316df75d568','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','SecurityGroups','module',90,0),('35f0d3a1-0a65-d732-2bdc-6316dfcec873','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOP_Case_Updates','module',90,0),('35ff1f30-9764-41fd-03e7-631ccf0ef46d','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','SurveyQuestionResponses','module',89,0),('363282b5-4194-feb9-c89e-6316df200cc2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Notes','module',90,0),('3682652b-ebc5-42a6-ab78-6316dff2ae93','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','TemplateSectionLine','module',90,0),('36b7421d-f2b7-625a-fc48-63215ebd3e06','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Bugs','module',96,0),('36d65afa-1f40-c9d9-a3e9-6316df9c2bba','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOR_Scheduled_Reports','module',89,0),('37a8c0dd-60a0-9135-fe31-6316dfcaf749','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','jjwg_Areas','module',90,0),('37cb5b90-9005-81ce-b4ba-632827fbc70c','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOP_Case_Updates','module',96,0),('37f585be-7b4a-486a-bcb5-6316df61e4de','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOS_Contracts','module',90,0),('381943bb-5b1d-1b2e-bd21-6316df13d9ef','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Calls','module',90,0),('3840c76b-75e1-314a-3674-6316dfcd84c3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','EmailMarketing','module',90,0),('39030bf2-0b66-6b22-734e-6316df8e7562','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOK_KnowledgeBase','module',90,0),('396f6253-2c1d-b424-113d-6316dfac044b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','ProspectLists','module',90,0),('39c42bd7-529d-bc4d-2ee6-6316df4a4be4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOS_Quotes','module',90,0),('3a3c4f34-8352-221a-e458-6316df3b6039','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','jjwg_Maps','module',90,0),('3a46f632-3d78-c7d9-46fb-6316dfba492e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','ProjectTask','module',90,0),('3ae582be-83c3-d144-f86d-631ccfca76b2','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOS_Products','module',89,0),('3b40929d-26fd-ee6f-d467-6316df65d731','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','SurveyResponses','module',90,0),('3b514319-6c2c-862b-8a45-6328275f3370','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Cases','module',96,0),('3bdd58d6-32a9-3acc-0a8f-6316df1cccc1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','FP_events','module',89,0),('3be405aa-876e-de88-2a36-631ccf28b9db','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOS_Contracts','module',89,0),('3c66f47d-e4e0-3432-313b-6316df485bcc','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOW_WorkFlow','module',90,0),('3c7659f2-9e7d-afa3-4018-6316df2bad3d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOD_IndexEvent','module',90,0),('3d407e4e-c09d-b507-382e-6316df06cd96','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOR_Reports','module',89,0),('3d60482a-eca2-96b7-b831-632827388c36','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','OutboundEmailAccounts','module',96,0),('3e169f1f-aaa4-d85d-95b9-631ccf0d6928','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AM_TaskTemplates','module',89,0),('3e7601fd-c1bc-7409-b28d-6316df3c9637','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','SecurityGroups','module',90,0),('3ea905ea-449c-d813-e1c1-6316df4695a1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOS_PDF_Templates','module',90,0),('3f7c1072-e121-99cf-7bfd-6316dff95d2f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AM_ProjectTemplates','module',89,0),('3fd0042c-442e-da6a-813e-6316df5ba048','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Bugs','module',90,0),('40199a18-4d38-eae0-1f3d-6316dfd372a4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Calls_Reschedule','module',90,0),('40767271-5b55-1660-efcc-6316dff3266e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','OutboundEmailAccounts','module',90,0),('40cebcc8-2109-3047-39a7-63215ec14aea','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','SecurityGroups','module',96,0),('417205f5-31bf-6750-b283-6316dfff13fd','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','SurveyQuestionOptions','module',90,0),('41f947b2-d436-a429-13ae-6316df3af0c4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOS_Quotes','module',90,0),('4230b9bd-94c6-3bd3-1752-6316dfa33bff','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','TemplateSectionLine','module',90,0),('43034d6d-cf30-98cb-21b6-6316df14026c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOR_Scheduled_Reports','module',90,0),('43626ccc-f492-ea95-b9dd-6316df64bfb6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','SurveyQuestionOptions','module',90,0),('43954322-1f01-1693-3c81-6316df04b183','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Bugs','module',90,0),('43c59270-30a5-4831-a85f-6316dff184b6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Notes','module',90,0),('440c874c-4d2a-70bc-40ab-6316dfad2c99','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOD_Index','module',89,0),('444747ad-b5a9-b317-82bb-6316df3165d9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','EmailMarketing','module',90,0),('447575a5-f73a-f5a9-2c64-6316df1f1693','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOP_Case_Updates','module',90,0),('44a16762-83a8-eedc-a90b-6316df8dbb64','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Opportunities','module',89,0),('45120601-07db-1156-01fe-632827ddfc61','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOR_Reports','module',96,0),('45830a54-6658-7aa8-19ca-6316dfe9ef39','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOD_IndexEvent','module',90,0),('45b24d2b-0905-92fa-b008-6316dfd0f422','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOS_Contracts','module',90,0),('45cf2364-7fd4-c749-6adc-63215e04d450','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Notes','module',96,0),('45ef00d2-8b16-6728-615c-63282776adb9','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Alerts','module',96,0),('4668ae33-c08f-50b5-cedf-6316df0dacba','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','SurveyResponses','module',90,0),('46fde863-42c7-1540-6fcc-631ccfd781a8','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','SurveyQuestions','module',89,0),('47090038-c933-2d2a-b1f5-6316dfa771c2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Spots','module',90,0),('47336da5-1833-ac4d-2eb9-6316df0150db','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','SurveyQuestionResponses','module',90,0),('4742275e-f8ad-25fb-415c-6316df057767','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','jjwg_Areas','module',90,0),('47d45a12-436f-1f46-f13c-6316df1bbecb','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Campaigns','module',89,0),('47d7ac25-4e42-5a4e-295b-6316dfe43520','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOW_WorkFlow','module',90,0),('47dff884-7822-d2f4-8dd0-632827200c94','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Bugs','module',96,0),('484d0b8e-20a7-97c2-3e2c-6316dff4d407','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOP_Case_Updates','module',89,0),('48651742-e874-01c9-fd23-6316dfa8cb53','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Users','module',89,0),('48fa776a-5f21-8e2b-f69f-6316df1a01c3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Prospects','module',90,0),('49416855-dfff-72eb-a2cc-6316df57c537','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','FP_events','module',90,0),('49512dbd-b8df-d90c-bf69-632827121cb1','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','TemplateSectionLine','module',96,0),('49eda20c-6c24-80e3-b39f-6316df5aaf99','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Notes','module',90,0),('4a058855-dd8c-1363-0d38-6316dfac5287','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','OutboundEmailAccounts','module',90,0),('4a128f1b-6ae7-1b1c-6ceb-6316dfe0ebf1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOS_Quotes','module',90,0),('4b77407d-7f27-84d4-8053-6316df2ec6ce','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Tasks','module',89,0),('4c529d39-1cf6-79f6-22e6-6316df66cd41','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','SurveyResponses','module',90,0),('4c569558-24f3-d59e-49dc-6316df622363','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOR_Scheduled_Reports','module',90,0),('4d2b56a7-116b-26cc-ca21-6316dff3ad0a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOK_Knowledge_Base_Categories','module',89,0),('4da86a1a-09fe-b16f-4bd3-6316dfc957cb','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AM_ProjectTemplates','module',90,0),('4e3dbecc-e240-eb6f-8cdf-6316df90b909','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','TemplateSectionLine','module',90,0),('4ec202fa-2c5a-2fb8-34ec-63215e15fd30','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AM_ProjectTemplates','module',96,0),('4f0841e5-9521-61d5-aebb-6316df41fabd','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','jjwg_Address_Cache','module',89,0),('4f4181f5-3b43-dd63-3745-63215eadc37a','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOK_KnowledgeBase','module',96,0),('4f77942c-5612-f8cf-5e8d-6316df0632a1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','SurveyQuestionOptions','module',90,0),('4fc88e21-64b7-983e-9193-6316df4198f6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Opportunities','module',90,0),('4fe688af-6b8d-51bc-10a8-6316df21632f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOP_Case_Updates','module',90,0),('50455093-e724-915a-78e0-631ccf3b3643','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','EmailMarketing','module',89,0),('506a419d-c974-846a-efad-6316dfccb6dd','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','jjwg_Maps','module',90,0),('517bdd34-0c9e-af6f-8aa5-632827336668','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Documents','module',96,0),('51ad0619-526b-9a54-738f-63215ea2cca6','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','OutboundEmailAccounts','module',96,0),('51d74ec8-1b4f-97bd-8078-6316dfbe2321','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','SurveyQuestionResponses','module',90,0),('522f116a-36ad-c0b6-5995-6316dfb749d0','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOW_WorkFlow','module',90,0),('523d5e80-1087-bea2-5074-6316dff78a74','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Notes','module',90,0),('52443f6f-d218-a956-23bd-6316df71a788','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOS_PDF_Templates','module',90,0),('5265b4a4-cf63-c6b2-ac4b-6316dfade242','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOR_Reports','module',90,0),('529f6ac1-a5bf-53bd-498c-6316dfe1b02e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOS_Quotes','module',90,0),('52d7f672-6c45-abb5-901c-63215e682579','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOS_Product_Categories','module',96,0),('52ee8bdb-6013-f615-084c-6316dff5f68d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Users','module',90,0),('538a909d-a223-876c-8e1c-6328272949ba','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','ProspectLists','module',96,0),('53a02782-be40-16f3-537a-6316dfe66da4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','EmailMarketing','module',90,0),('53c8d902-0300-c3ea-73c9-6316df584547','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Campaigns','module',90,0),('54b039f5-19e0-ea50-a94a-6316df61ad14','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','TemplateSectionLine','module',90,0),('54cf8ce3-8b0e-6236-9ba9-632827d686b2','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOR_Scheduled_Reports','module',96,0),('54f36d6e-b979-836e-cd0b-6316dfe285f4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Tasks','module',90,0),('552f51fa-9762-aed9-80d6-6316dfd25065','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Prospects','module',90,0),('556c3138-a37f-fc56-a2d2-6316dfbea96a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','FP_events','module',90,0),('55c9ab16-dc27-e828-f3e4-6316dffd3a75','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOD_Index','module',90,0),('560423b4-ed79-233f-409d-6316dfb4e386','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOS_Contracts','module',90,0),('564f8877-c40f-88b5-5b93-6316df3815b5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','OutboundEmailAccounts','module',90,0),('569b0803-8338-b8d4-53d6-6328273c3508','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','SurveyResponses','module',96,0),('56dffa0e-820e-2b90-d221-6316dfab7367','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOR_Scheduled_Reports','module',90,0),('572b9c67-9266-2ee6-7ecd-6316dfbca56c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOS_Products','module',90,0),('57540408-2fbb-c4f0-421c-6316df855666','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOS_Product_Categories','module',90,0),('582aa88e-9636-9121-7eca-63215e7a7717','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Calls','module',96,0),('5988f981-83fb-2f85-d126-6316dfed0f1d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Surveys','module',89,0),('59ad53a7-fbe5-8fd2-3bf2-6316df948ac7','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','jjwg_Address_Cache','module',90,0),('5a55358e-e93b-90da-767d-6316df9ef494','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOS_Quotes','module',90,0),('5a8e4db1-31dd-c7c8-82fd-6316dfdceb64','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOK_Knowledge_Base_Categories','module',90,0),('5ac04da8-e31f-bdfd-882c-6316df51bf42','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOD_IndexEvent','module',90,0),('5b40eaaf-f731-c2f1-b859-6316df84e5cf','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','SurveyQuestions','module',89,0),('5bec0460-03d2-3e71-c336-6316df509db2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','jjwg_Maps','module',90,0),('5ca4e39e-078b-ff94-1fdd-6316dfa5b06a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOW_WorkFlow','module',90,0),('5cb77bd0-6969-2f07-df21-6316df7fbbf4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Tasks','module',90,0),('5cf25a66-29a9-aefa-9b6b-6316df657860','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','TemplateSectionLine','module',90,0),('5d2313e6-2c9f-73ab-63e5-6316dfa874db','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Opportunities','module',90,0),('5d75d4a9-26f2-c0e8-a87b-631ccfd79d66','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Users','module',89,0),('5da9f57e-cea9-b4f2-c09c-6316dfca615d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Notes','module',90,0),('5e5afbdc-6fd7-d0a4-ccd5-6316dfbd717d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOP_Case_Updates','module',90,0),('5e882d37-57d5-fcdf-7cc0-6316dff4df69','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AM_TaskTemplates','module',89,0),('5ea820a6-80ec-939b-1d9b-6316df07b3f4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','FP_events','module',90,0),('5f340573-dc49-0a3a-86cd-63215ed7cda1','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','jjwg_Markers','module',96,0),('5f5f29d9-3b72-d0a6-67d4-631ccf492b1a','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOS_Quotes','module',89,0),('5fc5c7b2-af77-d0a0-9af4-631ccf8fd273','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOK_Knowledge_Base_Categories','module',89,0),('600e3afa-b53c-ac21-0b1f-632827b32c80','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Prospects','module',96,0),('604df89d-fa37-55d1-691b-6316df3a2760','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Campaigns','module',90,0),('61000dcb-1254-8dfe-529e-63215eb6796a','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','TemplateSectionLine','module',96,0),('616ea9bb-8799-4175-b540-6316df4c036d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AM_ProjectTemplates','module',90,0),('61cb3ff3-49ad-f2a4-47e1-63282764edf3','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOS_Contracts','module',96,0),('62186ae2-9da0-ef55-d6d1-6316df428a55','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOS_PDF_Templates','module',90,0),('6223d270-5277-b8f8-59bc-6316dfa191ff','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOS_Contracts','module',90,0),('623d9100-bc50-798f-b0dc-6316df2f2fb5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOR_Reports','module',90,0),('624b4c2d-9225-534e-de38-6316dfb97944','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','EmailMarketing','module',90,0),('624d006d-bfbc-a4ea-4d9a-6316df50397c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','EmailTemplates','module',90,0),('6288f03d-136b-2ab1-2f8f-6316df543be7','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOS_Quotes','module',90,0),('632adc4c-2cd5-2743-2744-6316df9dda75','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','jjwg_Address_Cache','module',90,0),('63d71d33-9002-6777-f34f-63215e9ae05a','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','FP_events','module',96,0),('63f9ad1f-a9a8-705b-3f48-6328279f1e2f','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Surveys','module',96,0),('648eb251-5785-02fe-6d83-63215ed34eae','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','ProspectLists','module',96,0),('64b9aaa7-28c3-7d2f-e6c8-6316df2ba325','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','TemplateSectionLine','module',90,0),('64eaf74f-70bd-b548-db8f-6316dfe0e709','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOD_Index','module',90,0),('6548a7fe-9534-12f4-0c55-632827921f73','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Spots','module',96,0),('65abf813-f76a-7977-e5e2-6316dfaaad0e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Tasks','module',90,0),('65db2817-976d-90f6-1f39-6316df1fd6a1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOR_Scheduled_Reports','module',90,0),('65e3c4f2-44fa-bef5-4f6f-6316df3066f7','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Surveys','module',90,0),('660a0d04-8e55-183a-340c-63215ee717e9','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Emails','module',96,0),('66d5388c-f124-8157-9780-6316df0daf66','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Users','module',90,0),('68203e79-3219-a755-0b18-6316df7ac1c8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOD_IndexEvent','module',90,0),('68342fb8-1b3a-1eaf-f555-6316df1c86db','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Opportunities','module',90,0),('68a49c44-5151-0afc-b606-6316df3d7b14','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','FP_events','module',90,0),('68b49ed3-0240-25a9-6127-6316dffc40d3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AM_TaskTemplates','module',90,0),('6a3a0f39-b198-8c51-8a2f-63215edc21d5','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOS_Contracts','module',96,0),('6a906c56-2ba4-52c5-ea89-6316dffd29cd','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOK_Knowledge_Base_Categories','module',90,0),('6a9dce58-d9ba-31a6-9a21-6316df23e975','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOS_Contracts','module',90,0),('6ac18158-9b0b-71f8-aa86-6316df7e71cb','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AM_ProjectTemplates','module',90,0),('6ace80db-11dd-497d-df36-6316df64fa0e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','jjwg_Address_Cache','module',90,0),('6b6d4919-cbf6-4525-bdb0-631ccfdca5e2','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Contacts','module',89,0),('6bba0cfe-acdb-67bb-29cd-63215e205901','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Accounts','module',96,0),('6bfdef6c-c2f9-a3e0-6c55-632827cf9d31','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Project','module',96,0),('6c3b037c-6bc6-7865-1c0f-631ccfdbbaa7','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOW_WorkFlow','module',89,0),('6c6f0b43-698b-38ab-6441-6316df4993fc','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOS_Invoices','module',90,0),('6cf2d25d-e228-4a1a-af72-6316dfc8d2f6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOS_PDF_Templates','module',90,0),('6d58bda2-3bda-ab7d-acaa-631ccfdd788b','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOK_KnowledgeBase','module',89,0),('6e0ab189-c84e-db93-7eaa-6328272a83c5','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOS_Invoices','module',96,0),('6e8f1ef2-410d-36f2-d992-6316df55d27c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Campaigns','module',90,0),('6ea6001c-f7ff-6128-e384-6316df8e4f42','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','OutboundEmailAccounts','module',90,0),('6f4d98ff-6feb-5bed-09d2-6316df50ec2f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Surveys','module',90,0),('6f61180c-d70e-806f-2a0d-6316df65286b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','FP_Event_Locations','module',89,0),('711810f5-f11c-e4a5-c8a7-63282725fc97','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','SurveyQuestionResponses','module',96,0),('71aef94e-46a1-f497-7598-6316dfaa5f34','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOD_Index','module',90,0),('72a9b56c-d003-f22a-4f7c-6316dfe8fd79','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOR_Reports','module',90,0),('72ca02ca-137c-9135-6061-6316de4f35e5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Cases','module',89,0),('72d9ce7d-1007-60f3-2335-6316df093a04','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','jjwg_Address_Cache','module',90,0),('733c8735-55ca-50ff-ec06-63215e81f760','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Prospects','module',96,0),('73f1259e-c946-35c9-4e6e-63215eb63d83','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','SurveyResponses','module',96,0),('7437f8a8-2f91-5cfd-ee44-631ccf247b41','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','SurveyQuestionOptions','module',89,0),('74b969ea-328c-432c-4d88-6316dfae33bf','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AM_TaskTemplates','module',90,0),('751cbd12-e12f-8afc-eca0-6316df74ad96','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','EmailMarketing','module',90,0),('753d9571-b090-f7c7-7a80-6316df2e1770','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AM_ProjectTemplates','module',90,0),('75465247-54e2-b004-1439-6316dfad62a3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOW_Processed','module',89,0),('758fca5f-672f-fa3f-df56-6316df4799e5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','SurveyQuestions','module',90,0),('7596c670-a419-032a-7969-6316df9cf19d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOS_Contracts','module',90,0),('75beb321-338d-9da0-c2eb-6316dfbc4257','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','FP_events','module',90,0),('75c89956-92f3-9649-dcc1-6316dfdec93c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','ProspectLists','module',90,0),('75dfffcd-c52f-2c36-2a2a-63215e27f6ec','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','FP_Event_Locations','module',96,0),('766394ec-0e49-60e9-7375-6316df6b7f83','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOR_Scheduled_Reports','module',90,0),('76fa7241-7a2c-c0a3-853c-631ccf9cb4dc','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOW_Processed','module',89,0),('77aeb476-e76f-0790-0ec4-631ccf146395','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Accounts','module',89,0),('77df01ac-2257-8742-370f-6316dfec8774','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Calls','module',90,0),('7808207f-b438-bb62-f08b-6316dff3091d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','EAPM','module',89,0),('783af7bf-f8ca-be22-c9e5-6328277e0868','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','ProjectTask','module',96,0),('78426ef8-eda5-0c10-cdb6-6328277fb5b4','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','EAPM','module',96,0),('7a10d080-abb4-228c-4f00-6328274c5fed','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOS_PDF_Templates','module',96,0),('7b163f42-0259-a2a9-1e6a-6316df8fe005','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','jjwg_Address_Cache','module',90,0),('7b652611-8f73-7fd2-fb03-6316dfec691c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Users','module',90,0),('7b66c5d5-855f-0db5-48d8-63215e28cd27','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Meetings','module',96,0),('7bdc3f8d-7cb7-48db-d6ca-6316df08a328','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','FP_Event_Locations','module',90,0),('7d0fe907-672d-6331-7c27-6316df109fcc','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOS_PDF_Templates','module',90,0),('7d63e953-64f8-cd81-2e53-6316dff66ad7','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','FP_events','module',90,0),('7d6bea85-8a85-8120-ff12-6316df5ba84c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Tasks','module',90,0),('7da22468-9601-9439-4236-6316df8ddd68','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AM_ProjectTemplates','module',90,0),('7db5c564-e53f-abd9-2823-63215e2c1c0a','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOS_Products','module',96,0),('7dc7de98-a7a3-33ae-5a60-6316df96923a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Campaigns','module',90,0),('7e324bf0-9dff-8cda-5b6b-632827c02fb2','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','SurveyQuestions','module',96,0),('7e79a040-4e45-5b45-8de6-631ccf484b15','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','FP_events','module',89,0),('7f40b71b-20ce-bcd7-2927-6316df8f5002','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOK_Knowledge_Base_Categories','module',90,0),('7fb96df6-a567-b5ae-dc51-6316dff172e4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOW_Processed','module',90,0),('7fdc5db8-7216-3689-8154-6316df71b4a9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Surveys','module',90,0),('7ffd0de5-bc5c-fd91-a3e7-6316df5581fd','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOR_Reports','module',90,0),('8003c985-e737-d5e8-ea85-6316df514d59','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AM_TaskTemplates','module',90,0),('800652cb-11ac-1fc1-d068-6316df6bd73f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Opportunities','module',90,0),('800f0c50-3cf8-a505-f4a3-6316df867fc8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','SurveyQuestions','module',90,0),('8233b4a0-f628-faf9-a2bc-6316de16afd3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Cases','module',90,0),('830d7b7d-cba4-b9d5-ec6d-6316df4f9d81','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOR_Scheduled_Reports','module',90,0),('832c3d90-72cb-b1ba-57cb-6316dfedd45b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','ProspectLists','module',90,0),('8477a845-187f-d065-433f-632827494edf','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Campaigns','module',96,0),('84b11d91-d2c8-e6ad-abfa-63215e1b72a0','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Project','module',96,0),('852d9333-686f-75ad-29b1-6316df6dd8e8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','jjwg_Markers','module',89,0),('854f4e19-fa8c-8688-7033-6316dfd36d36','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOS_Contracts','module',90,0),('8559f1d1-5d4c-8e40-bf61-63215ed62d7d','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOD_IndexEvent','module',96,0),('85a79fda-7fc3-9737-26df-6316dfd345b7','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','EmailMarketing','module',90,0),('85e8ee0d-60d8-88e8-60d2-63282758ac5f','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AM_ProjectTemplates','module',96,0),('86624801-6d4a-be51-7f0a-63282710aaa7','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOS_Product_Categories','module',96,0),('866d5f8b-c8f8-3e55-83d7-63215e198ec9','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Surveys','module',96,0),('86f48d8f-8545-fc2f-04eb-6316df15ff2d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOS_Product_Categories','module',89,0),('87a56378-4d78-eab4-87c9-6316dfdece13','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Users','module',90,0),('87bb2cd9-69f6-a9f9-3d1b-6316df2b1960','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOD_Index','module',90,0),('87e88cf9-77c8-b9e0-7714-6316debdfd2b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Leads','module',89,0),('8910c3d6-a702-175a-942e-6316df9e830b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Tasks','module',90,0),('892e773c-e7f5-2401-a618-6316dfcaf97b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Campaigns','module',90,0),('8980be81-0297-ae9d-3ab5-6316de85432f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Cases','module',90,0),('89b93a48-b63b-4252-d7fd-6316df30abf2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','jjwg_Address_Cache','module',90,0),('89fc8dfc-87d2-0a4d-55e2-6316df1c9b7b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','FP_Event_Locations','module',90,0),('8a33289f-8d9f-742a-4bef-631ccf068c1a','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Opportunities','module',89,0),('8ab8f572-df66-1393-e905-6316df51decb','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOW_Processed','module',90,0),('8b1212f2-2854-6281-1cd6-632827b335b7','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','SurveyQuestionOptions','module',96,0),('8b760dea-1d46-65f6-d5b8-631ccf87b53e','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','jjwg_Maps','module',89,0),('8ba19ca2-aa12-18dd-4879-6316df104dc9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Meetings','module',89,0),('8ced7efc-f733-9f4c-cdda-6316df4a5247','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','FP_events','module',90,0),('8d4d0eb3-fed2-97df-7144-6316dff91ec1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','jjwg_Areas','module',90,0),('8deb49be-5887-83cb-b278-63215e21c88b','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Tasks','module',96,0),('8e25c513-fc23-f6af-cd0a-6316df33cb9d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOR_Scheduled_Reports','module',90,0),('8e470c99-71c3-dd8f-4c8b-6316dffb1833','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOR_Reports','module',90,0),('8f7d8880-649d-f607-2331-6316df849e1e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOS_Product_Categories','module',90,0),('903f76b3-c600-989a-2aa9-6316dfb7ef33','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Opportunities','module',90,0),('9117ab80-432e-8e0c-984e-6328271d3c11','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','EmailMarketing','module',96,0),('9198d219-2390-9df1-adda-6316dfe8839a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Surveys','module',90,0),('919e446f-bed1-54a1-7499-6316dffd52c3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','jjwg_Markers','module',90,0),('921a3a52-50d6-e2f0-2f9f-6316df80bd69','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','EAPM','module',90,0),('92413321-72d1-2381-ba41-631ccf5f591d','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','FP_Event_Locations','module',89,0),('92416e65-a1f4-cddc-0a88-6316df9a6301','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AM_TaskTemplates','module',90,0),('92540c32-bca2-7ca9-b572-6316df1eafc8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','ProjectTask','module',90,0),('928c6c91-bba1-e4f6-8993-632827f563a4','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOS_Products','module',96,0),('92be1864-6c99-8830-1fb7-63215ee0c3fa','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','ProjectTask','module',96,0),('92c7e7c3-6213-3f84-766b-6316dfd8e217','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Tasks','module',90,0),('9317753c-26eb-cd3e-5b65-6316df87ebad','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOD_Index','module',90,0),('93358818-0220-789f-6440-6316dff3b244','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','SurveyQuestions','module',90,0),('93eb027a-b835-1bf9-64a7-631ccf8ebcbd','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Prospects','module',89,0),('94185905-918f-3b8f-f343-6316dfccfaa5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Users','module',90,0),('942b0d89-6d52-08cc-7adb-6316df045b6f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOW_Processed','module',90,0),('957f0382-5d38-8f3f-ed6d-6316df42ff34','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','jjwg_Markers','module',90,0),('95d267e2-74ba-141d-31a4-631ccff61ea8','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','EmailTemplates','module',89,0),('95f55f09-c32a-9533-2126-6316df6e19f1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOP_Case_Events','module',89,0),('960349a8-64c4-a736-ece4-6316df8bb44d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','EmailMarketing','module',90,0),('96b3fab7-44d0-a8f4-cfba-6316de0f267d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Cases','module',90,0),('971b5a08-909a-a48a-9e33-6316dfa17ed0','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AM_ProjectTemplates','module',90,0),('974fea87-4906-976d-8cfa-63215e7574ad','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','SurveyQuestionResponses','module',96,0),('97786f9a-eb90-8c4e-d06f-6316dfa39e2c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOR_Reports','module',90,0),('97ed8c64-9b10-2a7b-eea4-6316df928564','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Meetings','module',90,0),('99fda53f-b22c-944f-d584-6316dfb4697c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOS_Product_Categories','module',90,0),('9a45423d-49e2-f678-1d82-6316df9a2772','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','jjwg_Markers','module',90,0),('9a9fe8de-a4a7-4c21-0fbc-6316dfb6ad79','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Accounts','module',89,0),('9ab42d6d-3eed-f0cd-ebdf-631ccffd3d40','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','jjwg_Markers','module',89,0),('9b2d0f33-6bad-59dc-6547-6316df042d9f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','jjwg_Address_Cache','module',90,0),('9b90cc9f-a123-af67-30e1-6316dfa3e198','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Alerts','module',89,0),('9be296bc-d67b-ca60-55a5-6316df8ada09','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Tasks','module',90,0),('9c8a23b8-55e6-8d1c-64c4-6316df7b0348','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Surveys','module',90,0),('9f86df44-b7dd-6f3e-5698-6316dff19a70','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Campaigns','module',90,0),('a021c786-2f94-e8fe-b5cd-6316dfb04219','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Users','module',90,0),('a030a4e9-81ea-abd1-7a1a-6316df53ddd6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Opportunities','module',90,0),('a031b49e-be46-5f72-6214-631ccf368979','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOD_IndexEvent','module',89,0),('a040e49c-b552-bbae-4e95-6316dfbf795d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','SurveyQuestions','module',90,0),('a066018f-3d8e-1236-5508-6316dfe0acef','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Meetings','module',90,0),('a0705011-f162-a930-431d-63215e2e3795','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Campaigns','module',96,0),('a0a9a0f6-ca72-e8fd-9983-632827d2bcd6','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOS_Quotes','module',96,0),('a1998fd8-04bb-6a9d-15ee-6316df661c19','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AM_ProjectTemplates','module',90,0),('a1c911e7-6f28-319f-91ed-631ccf7d9cb1','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Notes','module',89,0),('a25243b5-d3cb-1a53-27fa-6316de90eae3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Cases','module',90,0),('a2ccc0b1-8b85-a151-8754-63215e48bdc9','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Alerts','module',96,0),('a2f0a31d-9ea7-bde2-d6ce-6316df7b1873','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','EAPM','module',90,0),('a300ce1b-9188-171d-4041-63215eddd555','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','SurveyQuestions','module',96,0),('a30a7dd9-c19d-fbcf-f9a9-6328272452e8','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AM_TaskTemplates','module',96,0),('a30b957e-9a93-08db-4038-6316df6c964f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Contacts','module',89,0),('a354dc96-4852-0689-63ba-632827ac42a3','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Users','module',96,0),('a359fee0-2607-2a22-2529-6316df71aeae','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOW_Processed','module',90,0),('a4a59873-cecd-ae8e-d7d0-63215e85cb25','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOD_Index','module',96,0),('a4e276fa-8cd9-9da4-2a50-6316dfd6ab69','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','FP_Event_Locations','module',90,0),('a56efba9-e1b5-2e54-b192-6316df0ff36c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Alerts','module',90,0),('a5aed616-db03-260e-5b43-6316df1cfe7a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','EmailTemplates','module',89,0),('a6177166-380d-e768-e359-6316df587d28','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Documents','module',89,0),('a6ffe613-fdf3-fbc7-22b5-6316df65c399','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOS_Product_Categories','module',90,0),('a78780c2-e060-435b-9d3b-6316de80074c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Leads','module',90,0),('a78ec465-c251-0afb-fb87-6316dffc6323','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOD_Index','module',90,0),('a7c2ba50-22f0-80d0-e50e-6316df866268','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','SurveyQuestionResponses','module',89,0),('a7f3f078-d836-5f94-6509-6316dfc6d66d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Accounts','module',90,0),('a7fcf696-572b-9568-f8f3-6316df3862a8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Opportunities','module',90,0),('a81af86c-2e18-fc81-a585-6316df5ec73a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Meetings','module',90,0),('a83ba716-24f4-363f-de35-6316dfb39df7','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','jjwg_Markers','module',90,0),('a85f0335-0966-7e41-5d4a-6316dfd13d6a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Contacts','module',90,0),('a8c7ce8f-8f73-fe08-3b9c-6316df8a3479','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Surveys','module',90,0),('ab3218a2-0aae-5d50-bf6e-6316df7d6489','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOK_Knowledge_Base_Categories','module',90,0),('aba6fc3a-f41f-04e3-42e7-6316dfd55994','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Contacts','module',90,0),('abc9846d-4c55-c3eb-79b0-6316df1df333','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Spots','module',89,0),('abe859d1-26de-8185-9f00-6316df2d87d4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','SurveyQuestions','module',90,0),('ac0a1f25-dd2b-f500-bb96-631ccfbf4462','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','jjwg_Areas','module',89,0),('ad38c2c3-0b86-e146-6ce3-6316df73637f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Campaigns','module',90,0),('ad468a79-d4e4-ef23-38b0-6316df19d1b0','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Project','module',89,0),('ae2bcb8a-7811-4b7b-41bf-6316dff3191e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Alerts','module',90,0),('ae44bcd2-00d6-2df0-d685-6316df43b14f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Emails','module',89,0),('ae7f65ca-f44c-d5e8-1226-6316df31a86f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOW_Processed','module',90,0),('aeaef5da-307b-b206-e672-6316df385897','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','EAPM','module',90,0),('aed18c05-ddd9-df60-3814-6316dfbb9750','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Users','module',90,0),('af0f45fb-36ed-bf23-069c-632827e2a627','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOK_Knowledge_Base_Categories','module',96,0),('af43dcf5-af6a-b639-ffd8-6316de820298','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Cases','module',90,0),('af8acf88-d107-d45f-9a1d-63215e196b23','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','access','SurveyQuestionOptions','module',89,0),('b01da86f-6990-f9a3-6c19-6316dfe76003','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOR_Reports','module',90,0),('b07b2c34-54f7-88e9-c9ea-6316df7c27b0','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Meetings','module',90,0),('b0c9fd75-3690-2bc1-2f77-631ccf97be3c','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Calls','module',89,0),('b15a66ac-6782-85b4-fa2a-6316de0b619b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Leads','module',90,0),('b1ef8820-8be5-7512-fd10-632827ebd223','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOW_WorkFlow','module',96,0),('b2547a6a-59fd-e361-f212-632827205c55','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Contacts','module',96,0),('b3897334-b8cf-2e52-3a1a-63215e185aab','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOS_Quotes','module',96,0),('b3a69eae-b099-5f9b-d01c-6316dff37013','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','SurveyQuestionResponses','module',90,0),('b3b09e5a-6ef0-08a1-f382-6316df27a56e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOP_Case_Events','module',90,0),('b4aeb968-cc2d-ec02-e952-6321626d70c6','2022-09-14 05:10:11','2022-09-14 05:10:11','1','1','divide','Leads','module',90,0),('b5f9cdb0-5461-880c-4c84-6316df1f231c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AM_TaskTemplates','module',90,0),('b660e208-f1ee-3d51-c6d6-6316df358105','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','jjwg_Areas','module',89,0),('b66cb9d1-06aa-0da3-8b96-6316dfa52835','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Accounts','module',90,0),('b6769a59-e3db-8ca8-4706-6316dff9a6d7','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','EAPM','module',90,0),('b692fed3-e49a-30d6-b348-6316df23f9bc','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','EmailTemplates','module',90,0),('b6b3a33f-676d-32dc-600b-63215e9885a3','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Documents','module',96,0),('b6d873f3-33ae-7b16-e4a6-6316dfc8487f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','SurveyQuestions','module',90,0),('b701054b-f6ba-ffa1-233c-631ccf048dcf','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOD_Index','module',89,0),('b7045dbe-7fc8-c9ec-3b28-6316df9560fd','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Emails','module',90,0),('b7573008-aa4f-28a9-d724-6316dfa48996','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Surveys','module',90,0),('b7623dcb-4053-28c0-f0ca-6316df1a58cb','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','jjwg_Markers','module',90,0),('b8a31fa9-19a1-0899-0102-6316dfcb36a5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Calls_Reschedule','module',89,0),('b8e5f679-b145-227c-7562-6316df0619f1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Meetings','module',90,0),('b8ecec04-27d6-4d83-8a1b-63215e6aceeb','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOP_Case_Events','module',96,0),('b93756db-d140-8665-c105-6316dff38c27','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOS_Invoices','module',89,0),('ba938611-3de5-1fdd-cc14-63215e3ed4b6','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','SurveyQuestionOptions','module',96,0),('ba9396d6-7c1f-bc82-6978-6316dfad6813','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Documents','module',90,0),('baccd447-b512-013f-7794-6316de3b5cd5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Cases','module',90,0),('bacfff24-266b-cf03-eae9-6316dfa1dfd9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Alerts','module',90,0),('bb47bfec-1bfb-d054-99fe-6316dfd2b005','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOW_Processed','module',90,0),('bb5ede50-3d59-aafd-4e11-631ccf7e5f17','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','jjwg_Address_Cache','module',89,0),('bb6ae81e-1e91-4fb0-d1ed-631ccf09fa0e','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Emails','module',89,0),('bbb0d293-4269-7efd-8804-63282716abe5','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOK_KnowledgeBase','module',96,0),('bc190c58-7011-ecb1-13ac-6316df484da2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Project','module',90,0),('bd05540d-6c5f-0379-8dfc-6316dfd6cf86','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Contacts','module',90,0),('bdbd9e27-e630-f849-8b1b-6316df71560b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Project','module',90,0),('be8355f6-d0a9-d87c-9053-6316df396b07','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','EAPM','module',90,0),('beb119c5-be9a-bdac-ae03-6316dea2f018','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Leads','module',90,0),('beca2f35-27d0-6d01-8ee3-6316df53c2fd','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','ProspectLists','module',89,0),('bed5360e-f3ff-57b7-f51a-63215eaf1d53','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','EmailMarketing','module',96,0),('bef77ca8-a700-7786-3b88-6316df74abc2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Emails','module',90,0),('bf0b3c12-88b4-b262-d7b0-6316df5cbd2a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Spots','module',90,0),('bf82ce2e-d0c0-206c-c687-6328270f69a4','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOW_Processed','module',96,0),('c027f825-7da2-0e9f-d067-63282792bfce','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Accounts','module',96,0),('c059dfe9-7ed9-5f53-640d-6316dfc89bf5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','SurveyQuestionResponses','module',90,0),('c0c8e594-f999-692f-7518-6316dfbb3ea9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Calls_Reschedule','module',90,0),('c0dbd955-5a81-f8ea-d47f-6316df320413','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Meetings','module',90,0),('c0f23b38-d69e-005c-49fd-6316df5daf35','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','EmailTemplates','module',90,0),('c1147829-9b88-fe5d-9d07-6316dfeb8720','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','jjwg_Areas','module',90,0),('c1da6d92-cdb0-931e-ce59-6316dfeed825','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','FP_Event_Locations','module',90,0),('c2538915-b3da-0cd2-b8a4-6316df1b93ae','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','SurveyQuestions','module',90,0),('c291b0ac-00e2-2bd9-ea16-6316df9b296d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Documents','module',90,0),('c2b5add8-0f9b-5f1d-0952-6316df096859','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','OutboundEmailAccounts','module',89,0),('c376074e-c5fd-a87e-d1a6-6316df8bb35d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Alerts','module',90,0),('c428f234-7c17-4903-0cfe-631ccf0a1832','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOP_Case_Events','module',89,0),('c4a6fdb2-7084-12c7-c16b-631ccf878c10','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Leads','module',89,0),('c4e3d33b-b7b6-68c0-03a7-6316de10eac5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Cases','module',90,0),('c5d166c6-fcbd-691e-02fe-63215e327981','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOW_WorkFlow','module',96,0),('c6284822-a06a-970f-0202-6316df20525e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Emails','module',90,0),('c6773ddf-695f-2abd-7377-631ccfe42948','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Meetings','module',89,0),('c6cfc10d-9627-e311-1838-6316df714a2b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Accounts','module',90,0),('c6ebfaec-f35e-3caf-c342-6316df234a95','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOP_Case_Events','module',90,0),('c72b9b82-3cbc-bfe2-fa2e-6316df2cdbe1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOS_Product_Categories','module',90,0),('c7300259-8b33-1981-3bd3-6316dfd26473','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','SecurityGroups','module',90,0),('c7b5f6c4-4a1d-8e8c-9ac9-6316df900a53','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOK_Knowledge_Base_Categories','module',90,0),('c7d44142-613d-fcb2-b34a-6316dfd811d6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AM_TaskTemplates','module',90,0),('c82f455f-5466-a297-ec4e-6316dfa1f2b9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','SecurityGroups','module',89,0),('c853dc35-9c05-f430-e9aa-631ccf8c1c90','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Calls_Reschedule','module',89,0),('c88f609d-785a-cb51-0102-6316dfad746e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Calls_Reschedule','module',90,0),('c9089819-fffa-0305-df9a-6316df0c70b2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','jjwg_Markers','module',90,0),('c9ae7653-f56d-2557-2d80-6316dfeac5a2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Meetings','module',90,0),('ca1e097a-de30-6c34-fd35-6328270023b2','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','jjwg_Areas','module',96,0),('ca50b0fd-e7ed-c1c7-6f5d-6316df83a3ea','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Alerts','module',90,0),('ca606a71-56de-e5b1-9b2e-6316dfbfd622','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','EAPM','module',90,0),('ca621692-177e-cff6-bf05-6316df7d2f91','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Documents','module',90,0),('ca725f4d-165a-985e-6aac-6316df0a7502','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','SurveyQuestionResponses','module',90,0),('caa00d74-1ceb-cfce-84be-6316df2ce38d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Prospects','module',90,0),('caf2c047-8c2b-60be-617c-63215e55ad4d','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOP_Case_Updates','module',96,0),('cafd97cc-3e8d-449a-e047-6316df31cc46','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','OutboundEmailAccounts','module',90,0),('cb35b700-6afd-6124-7f11-6316df3112e6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Contacts','module',90,0),('cb8b7f34-0908-18fc-4366-6316df488518','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','EmailTemplates','module',90,0),('cbd901ac-95d0-db8e-a232-6316df0a00a3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','FP_Event_Locations','module',90,0),('cbf431e9-5aaf-4526-f9b4-6316df11fb3d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Project','module',90,0),('cc0877eb-7abf-c6a1-c8ef-6316df7093f2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOK_KnowledgeBase','module',89,0),('cc65b3dd-1dc9-1fe3-f362-6316df96ae66','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOS_Invoices','module',90,0),('cc8a2a11-a534-7825-7b6e-6328276db441','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','FP_events','module',96,0),('cd43fe0e-da30-80f2-cf3a-6316df2916b6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','ProspectLists','module',90,0),('cee1fd92-3496-bb1e-5256-6316dfac346b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Emails','module',90,0),('cf07775c-0e7f-f109-9f20-631ccff0cc23','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOP_Case_Updates','module',89,0),('cf750f35-2220-bafd-0823-6316df707f2a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOD_Index','module',90,0),('cf827a28-b449-489a-91ec-6316dedd7ed5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Leads','module',90,0),('d0fac591-8381-a72d-7fff-63215e8207a2','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Spots','module',96,0),('d13141dc-67f7-7415-cd98-6316df4bf027','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','Spots','module',90,0),('d143c2a1-08fc-0d8f-dbe6-63215ea409a3','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Users','module',96,0),('d236cfea-8c4a-d883-31c6-631ccf981e04','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Tasks','module',89,0),('d270a285-59b0-0288-9c39-631ccf84ec12','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','SecurityGroups','module',89,0),('d271abed-2f9c-3aea-e227-6316df3cea96','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AM_TaskTemplates','module',90,0),('d368ad14-645d-61c8-d35a-6316df2a6b6b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOP_Case_Events','module',90,0),('d3ee8072-e9d8-39aa-f18e-63215e323007','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOW_Processed','module',96,0),('d4210478-3228-2dd9-8968-6316df5e670f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOP_Case_Events','module',90,0),('d4416480-57b5-7a54-9b0e-6316df87f3ad','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','EAPM','module',90,0),('d460745d-de8c-ee03-7e27-6316df9bab21','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Accounts','module',90,0),('d4c7cef4-5592-5f40-f8a6-6316dfb1236e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','SurveyQuestionResponses','module',90,0),('d5351b12-b44f-c3f3-2ce2-63282729bfc8','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','jjwg_Maps','module',96,0),('d5ba6be6-590f-b83b-df99-6316df0823d5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Contacts','module',90,0),('d67c7048-af44-49c9-c02c-6316df4a4909','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','EmailTemplates','module',90,0),('d6de144a-4c1f-88c9-bcda-6316dfda202a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Project','module',90,0),('d712baa2-4a9b-b424-083b-6316df139b65','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','FP_Event_Locations','module',90,0),('d7134fdb-8ce0-9152-71c9-6316df0cd27f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Documents','module',90,0),('d7272871-5d08-891d-4c5b-6316de4ff3a4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Bugs','module',89,0),('d76de103-d6ba-8962-c92e-6316dfc7637c','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','ProspectLists','module',90,0),('d7ca0515-dc0d-0081-c785-6316dff90105','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOK_KnowledgeBase','module',90,0),('d812b98a-d4c9-7e04-8ab1-631ccf089a7d','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Cases','module',89,0),('d8854d3e-8cd5-eb32-7cf8-6316dfcf4bd1','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','ProjectTask','module',89,0),('d8f8f915-f87c-2828-8f09-6316df76bbc6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','jjwg_Maps','module',89,0),('d9217da4-3ba0-5c46-410e-6316dfe7e225','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','AOK_Knowledge_Base_Categories','module',90,0),('d94d0421-f17f-c640-2fa4-6316df445f4f','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOW_WorkFlow','module',90,0),('d9657073-b249-c237-d4e8-6316df886000','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','jjwg_Areas','module',90,0),('da10c209-3ee2-b026-39ef-6316df778cb2','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Emails','module',90,0),('da87e046-52d5-f393-c768-6316df64b671','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','SurveyQuestionOptions','module',90,0),('da8ca166-0bb3-39d1-cfe6-6316dfff3266','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Alerts','module',90,0),('dac53ff3-6f4e-7ff0-3fb0-6316dfcfc02e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOS_Products','module',89,0),('db70bb2e-5575-14ce-c811-63215ed76a4c','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOR_Reports','module',96,0),('dcbec328-43e4-08b4-9edc-632827c5471e','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Opportunities','module',96,0),('dccac5a1-15f0-429b-6a13-63215eaab2ca','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Leads','module',96,0),('dcfa0c0f-a694-5284-59f2-631ccfd6fb47','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOR_Reports','module',89,0),('dd2cb83e-5493-7db8-a520-631ccfbc5d27','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','OutboundEmailAccounts','module',89,0),('de1dfb14-e1bb-fbab-64ce-6316dfd42b96','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','AOP_Case_Events','module',90,0),('df2f183d-72ee-e408-2d18-6316dfe8f403','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOS_Invoices','module',90,0),('df54cf6a-a136-a693-4d06-6316dfbc72cc','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Documents','module',90,0),('df73a6e3-50c9-d1ac-d1f7-6316df044e06','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOK_KnowledgeBase','module',90,0),('dfe509f8-06ce-853d-1ee8-6328272cf881','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','FP_Event_Locations','module',96,0),('e0904fab-7fc9-5e9a-1d07-631ccfcee73f','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Alerts','module',89,0),('e0a94cee-755c-6303-d447-6316dfa6db09','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Emails','module',90,0),('e0b90b7b-fcd2-05e1-c101-6316df6ded97','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Spots','module',90,0),('e1348491-b774-e9ec-010b-6316df3f1eb4','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','EmailTemplates','module',90,0),('e1b898d9-8c87-fcb6-72ae-6316df7ed68d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOK_Knowledge_Base_Categories','module',90,0),('e23a34f1-e607-1bb2-9297-6316df31d295','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','jjwg_Markers','module',90,0),('e2cd5218-1905-4d6f-a849-6316df4666a6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','ProspectLists','module',90,0),('e2f9e37e-aaca-cd94-7880-631ccf3d03e9','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','Bugs','module',89,0),('e3167015-d712-f6f8-51aa-6316df9470d5','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','AOW_Processed','module',90,0),('e38eb4d6-b06a-9c13-614d-6316dfdb7a9a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Accounts','module',90,0),('e470f019-6fb9-141e-2180-6316df29f849','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Spots','module',90,0),('e4ff7e83-6594-7d9d-96ad-63215e5ef3e9','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','Contacts','module',96,0),('e5a79a35-80a1-c5d7-c0a0-6316df9fa306','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','ProjectTask','module',90,0),('e70b0e50-bbc5-fe76-0600-6316df1ff5cc','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Documents','module',90,0),('e72b9c9b-c38e-a0a3-9dd7-6316dfbc7f06','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Project','module',90,0),('e7483a4c-d7a9-de29-3e77-6316df5f0502','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOP_Case_Events','module',90,0),('e7a0f86f-2b28-1ccc-fe86-6316dfe19f82','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','AOS_Product_Categories','module',90,0),('e8984550-747a-cdd6-9412-6316dffb0815','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','Calls','module',89,0),('e89f205e-efd6-504a-a83f-6316dfe8f56e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOW_WorkFlow','module',89,0),('e8d46936-85f2-ccd3-74d6-6316dfba5b83','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Emails','module',90,0),('e9011d4f-4d5e-aacf-d38f-63215e81cb98','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','EAPM','module',96,0),('e9470b7a-9043-fb91-bbdc-631ccf0917b8','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','TemplateSectionLine','module',89,0),('e9f5023f-cdc3-3e1b-8443-6328274b524c','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','Calls','module',96,0),('ea12fb06-e694-cab5-6783-632827c17576','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','EmailTemplates','module',96,0),('ea3ac625-005e-bf71-457c-6316dfdfa987','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','EmailTemplates','module',90,0),('eadb5bf2-51c1-de45-44b5-6316dfd8a42a','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOD_IndexEvent','module',89,0),('eb4db4f2-6786-79af-f16d-63215eb570b5','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','jjwg_Maps','module',96,0),('eb5b493d-2e09-e2f1-e404-632827c985d8','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','jjwg_Markers','module',96,0),('eb6560fa-27b4-a096-f100-6316ded00996','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Bugs','module',90,0),('eb9bf438-f67c-62b2-1acb-631ccf4418ef','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','AOR_Scheduled_Reports','module',89,0),('ebba5c1b-c05b-a6b7-876e-6316df439ddb','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','SurveyResponses','module',89,0),('ebcbd00c-aa6f-56c6-c2b0-6316df30fa54','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','import','Contacts','module',90,0),('ebd058f9-67db-c2c4-754f-6316dfbd23e8','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','AOS_Products','module',90,0),('ebf208d3-fe3e-53f6-344a-6316df024090','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','AOK_KnowledgeBase','module',90,0),('ec100b5d-8083-e2ee-86b8-6316dfd189b6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','SurveyResponses','module',90,0),('ecdd9c8e-da89-00fb-520c-63215e992b94','2022-09-14 04:55:13','2022-09-14 04:55:13','1','1','bu','AOR_Scheduled_Reports','module',96,0),('ed18a829-8e20-8b17-eb3d-6316df13f429','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Alerts','module',90,0),('edca059a-6cc6-2b46-2302-6328270f6ed5','2022-09-19 08:23:54','2022-09-19 08:23:54','1','1','branch','AOD_IndexEvent','module',96,0),('ee09741a-1adc-6437-9746-6316df43eca0','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Calls_Reschedule','module',90,0),('ee8e0b2c-47b1-1323-76c3-631ccf844fc6','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','SurveyResponses','module',89,0),('eec7ac41-1af1-ae73-95ac-6316df14dce0','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','ProspectLists','module',90,0),('eefa0fc7-7d92-362b-db2f-6316dfd5b0b6','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','AOS_Invoices','module',90,0),('ef2c9f66-860b-bcf5-2958-6316df6c21aa','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','massupdate','Documents','module',90,0),('f1746c92-648b-a8d1-6357-6316df4a5a20','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','export','Accounts','module',90,0),('f2820e60-ab53-f3a3-168f-6316dfef4c8b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','delete','Calls_Reschedule','module',90,0),('f2db1936-0917-80fa-c226-6316df7bfd20','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','jjwg_Maps','module',90,0),('f2e6e9ec-d27b-4c56-713d-6316dfc69a8d','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','list','ProjectTask','module',90,0),('f31f47a2-ce3a-398c-c6f2-6316dff88a76','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','access','AOS_Quotes','module',89,0),('f34d557f-9919-0d7b-d1ea-6316df50077b','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','view','Calls','module',90,0),('f3eb9da5-4b43-21d6-0957-631ccf605e78','2022-09-10 17:53:31','2022-09-10 17:53:31','1','1','mkt','ProspectLists','module',89,0),('fc2f0cd2-a3c0-a93e-5314-6316df46a8f9','2022-09-06 05:47:31','2022-09-06 05:47:31','1','','edit','Calls','module',90,0);
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
INSERT INTO `acl_roles` VALUES ('3618d1f7-3eac-2e11-d0a6-631aa46ec64c','2022-09-09 02:26:21','2022-09-14 07:12:28','1','1','Role BU_Q10','Role of BU',0),('60a56750-f8f5-b323-b710-63470b86bb97','2022-10-12 18:45:18','2022-10-12 18:45:18','1','1','Role RO DL TB','',0),('7a0bb7a5-8eb4-6e41-be66-6346976166eb','2022-10-12 10:29:28','2022-10-12 10:29:28','1','1','Role RO TELE','',0),('7e9d9fce-e2e9-dabe-de4b-6321809a28d7','2022-09-14 07:21:00','2022-09-19 08:27:29','1','1','Role RO Q10','This is role RO Q10',0),('7f18f530-1593-32ca-2711-631cc1b64de0','2022-09-10 16:56:53','2022-09-13 12:04:28','1','1','test','',1),('98df1461-26e0-dad1-82e2-63470c4d04b8','2022-10-12 18:50:18','2022-10-12 18:50:18','1','1','Role BU_DL_TB','',0),('a8a06751-bdc7-6245-a86c-63217f18824e','2022-09-14 07:13:40','2022-09-14 07:13:40','1','1','Role BU_TB','This is role for bu tb',0),('aaa2bb50-d34a-18a8-20ed-631aa36a8fd9','2022-09-09 02:21:35','2022-09-09 02:21:35','1','1','Role MKT','Role of MKT',0),('b329c6f0-24d9-a2c0-324c-632828771d55','2022-09-19 08:30:02','2022-09-19 08:30:02','1','1','Role RO NTT','Role of RO NTT',0),('ca9a06cc-fa08-23d1-17d5-633b96a297d9','2022-10-04 02:12:18','2022-10-04 02:12:18','1','1','Role BU_TELE','',0),('e953f290-d6b8-5baf-1ecb-63217f15aec0','2022-09-14 07:17:14','2022-09-14 07:17:14','1','1','Role BU_NTT','This is branch NTT',0),('ebe0e79b-131b-d193-5dac-6328292eac56','2022-09-19 08:33:38','2022-09-19 08:33:38','1','1','Role RO TB','Role of RO TB',0),('f0c9f37e-dea4-91f4-1d6c-63207197e5be','2022-09-13 12:04:53','2022-09-13 12:07:53','1','1','Role Super-MKT','This is role Super-MKT',0);
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_actions`
--

DROP TABLE IF EXISTS `acl_roles_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_actions`
--

LOCK TABLES `acl_roles_actions` WRITE;
/*!40000 ALTER TABLE `acl_roles_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_users`
--

DROP TABLE IF EXISTS `acl_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_users`
--

LOCK TABLES `acl_roles_users` WRITE;
/*!40000 ALTER TABLE `acl_roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `target_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url_redirect` varchar(255) DEFAULT NULL,
  `reminder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES ('1ce0e7d5-9064-7a6e-2490-633a67748421','Khách hàng mới','2022-10-03 04:37:43','2022-10-03 04:37:43','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'2ca94880-44b1-f16a-d2df-63282b8f2314',0,'Leads','info','index.php',NULL),('4a933f33-95e5-7cea-156a-633a647bc37f','Khách hàng mới','2022-10-03 04:27:04','2022-12-09 07:03:42','1e53686b-f1aa-8dac-5bcf-63282bc67ade','1','Bạn được giao 1 khách hàng mới!',0,'1e53686b-f1aa-8dac-5bcf-63282bc67ade',1,'Leads','info','index.php',''),('59da9760-043a-51e0-4643-63845c5b556d','Khách hàng mới','2022-11-28 06:58:30','2022-11-28 06:59:00','c1abb968-9c8d-474e-c297-63282bf888ad','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'c1abb968-9c8d-474e-c297-63282bf888ad',1,'Leads','info','index.php',''),('5cbab69f-62a2-6d71-124e-6392dd398978','Khách hàng mới','2022-12-09 07:00:17','2022-12-09 07:04:33','1e53686b-f1aa-8dac-5bcf-63282bc67ade','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'1e53686b-f1aa-8dac-5bcf-63282bc67ade',1,'Leads','info','index.php',''),('65088fa8-dabd-8d98-d7b4-6392df8f9059','Khách hàng mới','2022-12-09 07:11:04','2022-12-09 07:41:30','1e53686b-f1aa-8dac-5bcf-63282bc67ade','1','Bạn được giao 1 khách hàng mới!',0,'1e53686b-f1aa-8dac-5bcf-63282bc67ade',1,'Leads','info','index.php',''),('68d2057f-8fee-9eee-4ac2-63846d10bc95','Khách hàng mới','2022-11-28 08:13:41','2022-11-28 08:13:41','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'c1abb968-9c8d-474e-c297-63282bf888ad',0,'Leads','info','index.php',NULL),('6e29e646-d0bd-972d-2d93-63845912a45d','Khách hàng mới','2022-11-28 06:48:42','2022-11-28 06:59:04','c1abb968-9c8d-474e-c297-63282bf888ad','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'c1abb968-9c8d-474e-c297-63282bf888ad',1,'Leads','info','index.php',''),('6ee4d007-68fc-f13d-e12a-633ced0c1c4c','Khách hàng mới','2022-10-05 02:36:06','2022-10-05 02:36:06','1','1','Bạn được giao 1 khách hàng mới!',0,'2ca94880-44b1-f16a-d2df-63282b8f2314',0,'Leads','info','index.php',NULL),('76765655-d505-070f-92e4-6392da9c0f39','Khách hàng mới','2022-12-09 06:50:05','2022-12-09 07:03:48','1e53686b-f1aa-8dac-5bcf-63282bc67ade','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'1e53686b-f1aa-8dac-5bcf-63282bc67ade',1,'Leads','info','index.php',''),('890bbbb9-8c20-9c79-e2c2-633cf1bc6982','Khách hàng mới','2022-10-05 02:53:39','2022-10-05 02:53:39','1','1','Bạn được giao 1 khách hàng mới!',0,'2ca94880-44b1-f16a-d2df-63282b8f2314',0,'Leads','info','index.php',NULL),('91080b88-7412-9d0d-3d6b-6347146e7c69','Khách hàng mới','2022-10-12 19:23:54','2022-10-12 19:23:54','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'2ca94880-44b1-f16a-d2df-63282b8f2314',0,'Leads','info','index.php',NULL),('916a6322-4f83-6de9-85e1-633a69e67d9b','Khách hàng mới','2022-10-03 04:46:01','2022-10-03 04:46:01','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'2ca94880-44b1-f16a-d2df-63282b8f2314',0,'Leads','info','index.php',NULL),('93a305e7-78cb-075f-917a-634795fd253a','Khách hàng mới','2022-10-13 04:36:52','2022-10-13 04:36:52','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'ce9806a2-8b0a-bc73-1b6d-63469814cb69',0,'Leads','info','index.php',NULL),('9738db8d-d44e-d709-cd07-633a678c2a86','Khách hàng mới','2022-10-03 04:41:26','2022-10-03 04:41:26','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'20e484bd-e9a4-72a4-ccd9-631aa25c91b9',0,'Leads','info','index.php',NULL),('bc837b3c-0103-2edc-172d-633a5d38a7e8','Khách hàng mới','2022-10-03 03:55:53','2022-10-03 03:57:54','1e53686b-f1aa-8dac-5bcf-63282bc67ade','1','Bạn được giao 1 khách hàng mới!',0,'1e53686b-f1aa-8dac-5bcf-63282bc67ade',1,'Leads','info','index.php',''),('bdea0dd9-0824-fb0b-db22-633cec9aea44','Khách hàng mới','2022-10-05 02:30:25','2022-10-05 02:30:25','1','1','Bạn được giao 1 khách hàng mới!',0,'2ca94880-44b1-f16a-d2df-63282b8f2314',0,'Leads','info','index.php',NULL),('c187f9df-fe89-bd05-22a1-633a6b177f05','Khách hàng mới','2022-10-03 04:54:37','2022-12-09 07:07:01','1e53686b-f1aa-8dac-5bcf-63282bc67ade','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'1e53686b-f1aa-8dac-5bcf-63282bc67ade',1,'Leads','info','index.php',''),('c772a626-ad26-28b1-a781-6346a490748e','Khách hàng mới','2022-10-12 11:26:04','2022-11-28 06:57:15','62213397-e5c8-5e5d-d4be-63282ab9f739','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'62213397-e5c8-5e5d-d4be-63282ab9f739',1,'Leads','info','index.php',''),('ca37088b-aa54-7293-b87e-633cef307d40','Khách hàng mới','2022-10-05 02:43:34','2022-10-05 02:43:34','1','1','Bạn được giao 1 khách hàng mới!',0,'2ca94880-44b1-f16a-d2df-63282b8f2314',0,'Leads','info','index.php',NULL),('cb524268-da0d-8e3f-b5af-638468e607ac','Khách hàng mới','2022-11-28 07:53:05','2022-11-28 07:53:05','1','1','Bạn được giao 1 khách hàng mới!',0,'c1abb968-9c8d-474e-c297-63282bf888ad',0,'Leads','info','index.php',NULL),('d55e3b00-6271-cab4-d719-63915521d824','Khách hàng mới','2022-12-08 03:09:47','2022-12-09 07:07:03','1e53686b-f1aa-8dac-5bcf-63282bc67ade','aacec1bd-6737-81e3-7365-631aa18cd430','Bạn được giao 1 khách hàng mới!',0,'1e53686b-f1aa-8dac-5bcf-63282bc67ade',1,'Leads','info','index.php','');
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates`
--

DROP TABLE IF EXISTS `am_projecttemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `priority` varchar(100) DEFAULT 'High',
  `override_business_hours` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates`
--

LOCK TABLES `am_projecttemplates` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_audit`
--

DROP TABLE IF EXISTS `am_projecttemplates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_projecttemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_audit`
--

LOCK TABLES `am_projecttemplates_audit` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_contacts_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_contacts_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_contacts_1_alt` (`am_projecttemplates_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_contacts_1_c`
--

LOCK TABLES `am_projecttemplates_contacts_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_contacts_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_contacts_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_project_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_project_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_project_1_c`
--

LOCK TABLES `am_projecttemplates_project_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_project_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_project_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_users_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_users_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_users_1_alt` (`am_projecttemplates_ida`,`users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_users_1_c`
--

LOCK TABLES `am_projecttemplates_users_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_users_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_users_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates`
--

DROP TABLE IF EXISTS `am_tasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `priority` varchar(100) DEFAULT 'High',
  `percent_complete` int(255) DEFAULT '0',
  `predecessors` int(255) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT '0',
  `relationship_type` varchar(100) DEFAULT 'FS',
  `task_number` int(255) DEFAULT NULL,
  `order_number` int(255) DEFAULT NULL,
  `estimated_effort` int(255) DEFAULT NULL,
  `utilization` varchar(100) DEFAULT '0',
  `duration` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates`
--

LOCK TABLES `am_tasktemplates` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates_am_projecttemplates_c`
--

DROP TABLE IF EXISTS `am_tasktemplates_am_projecttemplates_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates_am_projecttemplates_c`
--

LOCK TABLES `am_tasktemplates_am_projecttemplates_c` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates_am_projecttemplates_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates_am_projecttemplates_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates_audit`
--

DROP TABLE IF EXISTS `am_tasktemplates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_tasktemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates_audit`
--

LOCK TABLES `am_tasktemplates_audit` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aobh_businesshours`
--

DROP TABLE IF EXISTS `aobh_businesshours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aobh_businesshours` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `opening_hours` varchar(100) DEFAULT '1',
  `closing_hours` varchar(100) DEFAULT '1',
  `open` tinyint(1) DEFAULT NULL,
  `day` varchar(100) DEFAULT 'monday',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aobh_businesshours`
--

LOCK TABLES `aobh_businesshours` WRITE;
/*!40000 ALTER TABLE `aobh_businesshours` DISABLE KEYS */;
/*!40000 ALTER TABLE `aobh_businesshours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_index`
--

DROP TABLE IF EXISTS `aod_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_index` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `last_optimised` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_index`
--

LOCK TABLES `aod_index` WRITE;
/*!40000 ALTER TABLE `aod_index` DISABLE KEYS */;
INSERT INTO `aod_index` VALUES ('1','Index','2022-09-06 05:51:30','2022-09-06 05:51:30','1','1',NULL,0,NULL,NULL,'modules/AOD_Index/Index/Index');
/*!40000 ALTER TABLE `aod_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_index_audit`
--

DROP TABLE IF EXISTS `aod_index_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_index_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aod_index_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_index_audit`
--

LOCK TABLES `aod_index_audit` WRITE;
/*!40000 ALTER TABLE `aod_index_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_index_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_indexevent`
--

DROP TABLE IF EXISTS `aod_indexevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_indexevent` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `success` tinyint(1) DEFAULT '0',
  `record_id` char(36) DEFAULT NULL,
  `record_module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record_module` (`record_module`),
  KEY `idx_record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_indexevent`
--

LOCK TABLES `aod_indexevent` WRITE;
/*!40000 ALTER TABLE `aod_indexevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_indexevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_indexevent_audit`
--

DROP TABLE IF EXISTS `aod_indexevent_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_indexevent_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aod_indexevent_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_indexevent_audit`
--

LOCK TABLES `aod_indexevent_audit` WRITE;
/*!40000 ALTER TABLE `aod_indexevent_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_indexevent_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledge_base_categories`
--

DROP TABLE IF EXISTS `aok_knowledge_base_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledge_base_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledge_base_categories`
--

LOCK TABLES `aok_knowledge_base_categories` WRITE;
/*!40000 ALTER TABLE `aok_knowledge_base_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledge_base_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledge_base_categories_audit`
--

DROP TABLE IF EXISTS `aok_knowledge_base_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledge_base_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledge_base_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledge_base_categories_audit`
--

LOCK TABLES `aok_knowledge_base_categories_audit` WRITE;
/*!40000 ALTER TABLE `aok_knowledge_base_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledge_base_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase`
--

DROP TABLE IF EXISTS `aok_knowledgebase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `revision` varchar(255) DEFAULT NULL,
  `additional_info` text,
  `user_id_c` char(36) DEFAULT NULL,
  `user_id1_c` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase`
--

LOCK TABLES `aok_knowledgebase` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase_audit`
--

DROP TABLE IF EXISTS `aok_knowledgebase_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledgebase_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase_audit`
--

LOCK TABLES `aok_knowledgebase_audit` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase_categories`
--

DROP TABLE IF EXISTS `aok_knowledgebase_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase_categories` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aok_knowledgebase_id` varchar(36) DEFAULT NULL,
  `aok_knowledge_base_categories_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aok_knowledgebase_categories_alt` (`aok_knowledgebase_id`,`aok_knowledge_base_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase_categories`
--

LOCK TABLES `aok_knowledgebase_categories` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events`
--

DROP TABLE IF EXISTS `aop_case_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events`
--

LOCK TABLES `aop_case_events` WRITE;
/*!40000 ALTER TABLE `aop_case_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events_audit`
--

DROP TABLE IF EXISTS `aop_case_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events_audit`
--

LOCK TABLES `aop_case_events_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates`
--

DROP TABLE IF EXISTS `aop_case_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_updates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates`
--

LOCK TABLES `aop_case_updates` WRITE;
/*!40000 ALTER TABLE `aop_case_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates_audit`
--

DROP TABLE IF EXISTS `aop_case_updates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_updates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates_audit`
--

LOCK TABLES `aop_case_updates_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_updates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_charts`
--

DROP TABLE IF EXISTS `aor_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_charts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `x_field` int(11) DEFAULT NULL,
  `y_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_charts`
--

LOCK TABLES `aor_charts` WRITE;
/*!40000 ALTER TABLE `aor_charts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_conditions`
--

DROP TABLE IF EXISTS `aor_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `logic_op` varchar(255) DEFAULT NULL,
  `parenthesis` varchar(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parameter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_conditions_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_conditions`
--

LOCK TABLES `aor_conditions` WRITE;
/*!40000 ALTER TABLE `aor_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_fields`
--

DROP TABLE IF EXISTS `aor_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_fields` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `field_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `field_function` varchar(100) DEFAULT NULL,
  `sort_by` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `group_by` tinyint(1) DEFAULT NULL,
  `group_order` varchar(100) DEFAULT NULL,
  `group_display` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_fields_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_fields`
--

LOCK TABLES `aor_fields` WRITE;
/*!40000 ALTER TABLE `aor_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports`
--

DROP TABLE IF EXISTS `aor_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `report_module` varchar(100) DEFAULT NULL,
  `graphs_per_row` int(11) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports`
--

LOCK TABLES `aor_reports` WRITE;
/*!40000 ALTER TABLE `aor_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports_audit`
--

DROP TABLE IF EXISTS `aor_reports_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aor_reports_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports_audit`
--

LOCK TABLES `aor_reports_audit` WRITE;
/*!40000 ALTER TABLE `aor_reports_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_scheduled_reports`
--

DROP TABLE IF EXISTS `aor_scheduled_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_scheduled_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `schedule` varchar(100) DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email_recipients` longtext,
  `aor_report_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_scheduled_reports`
--

LOCK TABLES `aor_scheduled_reports` WRITE;
/*!40000 ALTER TABLE `aor_scheduled_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_scheduled_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts`
--

DROP TABLE IF EXISTS `aos_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `total_contract_value_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT 'Type',
  `contract_account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts`
--

LOCK TABLES `aos_contracts` WRITE;
/*!40000 ALTER TABLE `aos_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_audit`
--

DROP TABLE IF EXISTS `aos_contracts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_contracts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_audit`
--

LOCK TABLES `aos_contracts_audit` WRITE;
/*!40000 ALTER TABLE `aos_contracts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_documents`
--

DROP TABLE IF EXISTS `aos_contracts_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_documents`
--

LOCK TABLES `aos_contracts_documents` WRITE;
/*!40000 ALTER TABLE `aos_contracts_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices`
--

DROP TABLE IF EXISTS `aos_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_invoices` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `quote_number` int(11) DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `template_ddown_c` text,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices`
--

LOCK TABLES `aos_invoices` WRITE;
/*!40000 ALTER TABLE `aos_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices_audit`
--

DROP TABLE IF EXISTS `aos_invoices_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_invoices_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices_audit`
--

LOCK TABLES `aos_invoices_audit` WRITE;
/*!40000 ALTER TABLE `aos_invoices_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups`
--

DROP TABLE IF EXISTS `aos_line_item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_line_item_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups`
--

LOCK TABLES `aos_line_item_groups` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups_audit`
--

DROP TABLE IF EXISTS `aos_line_item_groups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_line_item_groups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups_audit`
--

LOCK TABLES `aos_line_item_groups_audit` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates`
--

DROP TABLE IF EXISTS `aos_pdf_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `type` varchar(100) DEFAULT NULL,
  `pdfheader` text,
  `pdffooter` text,
  `margin_left` int(255) DEFAULT '15',
  `margin_right` int(255) DEFAULT '15',
  `margin_top` int(255) DEFAULT '16',
  `margin_bottom` int(255) DEFAULT '16',
  `margin_header` int(255) DEFAULT '9',
  `margin_footer` int(255) DEFAULT '9',
  `page_size` varchar(100) DEFAULT NULL,
  `orientation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates`
--

LOCK TABLES `aos_pdf_templates` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates_audit`
--

DROP TABLE IF EXISTS `aos_pdf_templates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_pdf_templates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates_audit`
--

LOCK TABLES `aos_pdf_templates_audit` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories`
--

DROP TABLE IF EXISTS `aos_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_product_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '0',
  `parent_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories`
--

LOCK TABLES `aos_product_categories` WRITE;
/*!40000 ALTER TABLE `aos_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories_audit`
--

DROP TABLE IF EXISTS `aos_product_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_product_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories_audit`
--

LOCK TABLES `aos_product_categories_audit` WRITE;
/*!40000 ALTER TABLE `aos_product_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products`
--

DROP TABLE IF EXISTS `aos_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `maincode` varchar(100) DEFAULT 'XXXX',
  `part_number` varchar(25) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `cost_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `price_usdollar` decimal(26,6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `aos_product_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products`
--

LOCK TABLES `aos_products` WRITE;
/*!40000 ALTER TABLE `aos_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_audit`
--

DROP TABLE IF EXISTS `aos_products_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_audit`
--

LOCK TABLES `aos_products_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes`
--

DROP TABLE IF EXISTS `aos_products_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_quotes` (
  `id` char(36) NOT NULL,
  `name` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `item_description` text,
  `number` int(11) DEFAULT NULL,
  `product_qty` decimal(18,4) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_cost_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_list_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `product_unit_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `vat_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `product_total_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) DEFAULT '5.0',
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes`
--

LOCK TABLES `aos_products_quotes` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes_audit`
--

DROP TABLE IF EXISTS `aos_products_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes_audit`
--

LOCK TABLES `aos_products_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes`
--

DROP TABLE IF EXISTS `aos_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `approval_issue` text,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `template_ddown_c` text,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `stage` varchar(100) DEFAULT 'Draft',
  `term` varchar(100) DEFAULT NULL,
  `terms_c` text,
  `approval_status` varchar(100) DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes`
--

LOCK TABLES `aos_quotes` WRITE;
/*!40000 ALTER TABLE `aos_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

DROP TABLE IF EXISTS `aos_quotes_aos_invoices_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_aos_invoices_c`
--

LOCK TABLES `aos_quotes_aos_invoices_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_audit`
--

DROP TABLE IF EXISTS `aos_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_audit`
--

LOCK TABLES `aos_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

DROP TABLE IF EXISTS `aos_quotes_os_contracts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_os_contracts_c`
--

LOCK TABLES `aos_quotes_os_contracts_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_project_c`
--

DROP TABLE IF EXISTS `aos_quotes_project_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_project_c`
--

LOCK TABLES `aos_quotes_project_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_project_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_project_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_actions`
--

DROP TABLE IF EXISTS `aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `action_order` int(255) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `parameters` longtext,
  PRIMARY KEY (`id`),
  KEY `aow_action_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_actions`
--

LOCK TABLES `aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_conditions`
--

DROP TABLE IF EXISTS `aow_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_conditions`
--

LOCK TABLES `aow_conditions` WRITE;
/*!40000 ALTER TABLE `aow_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed`
--

DROP TABLE IF EXISTS `aow_processed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_processed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  KEY `aow_processed_index_status` (`status`),
  KEY `aow_processed_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed`
--

LOCK TABLES `aow_processed` WRITE;
/*!40000 ALTER TABLE `aow_processed` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed_aow_actions`
--

DROP TABLE IF EXISTS `aow_processed_aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed_aow_actions`
--

LOCK TABLES `aow_processed_aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_processed_aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed_aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow`
--

DROP TABLE IF EXISTS `aow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_workflow` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `flow_module` varchar(100) DEFAULT NULL,
  `flow_run_on` varchar(100) DEFAULT '0',
  `status` varchar(100) DEFAULT 'Active',
  `run_when` varchar(100) DEFAULT 'Always',
  `multiple_runs` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aow_workflow_index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow`
--

LOCK TABLES `aow_workflow` WRITE;
/*!40000 ALTER TABLE `aow_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow_audit`
--

DROP TABLE IF EXISTS `aow_workflow_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aow_workflow_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow_audit`
--

LOCK TABLES `aow_workflow_audit` WRITE;
/*!40000 ALTER TABLE `aow_workflow_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs`
--

LOCK TABLES `bugs` WRITE;
/*!40000 ALTER TABLE `bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_audit`
--

DROP TABLE IF EXISTS `bugs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_audit`
--

LOCK TABLES `bugs_audit` WRITE;
/*!40000 ALTER TABLE `bugs_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_contacts`
--

DROP TABLE IF EXISTS `calls_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_contacts`
--

LOCK TABLES `calls_contacts` WRITE;
/*!40000 ALTER TABLE `calls_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_leads`
--

DROP TABLE IF EXISTS `calls_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_leads`
--

LOCK TABLES `calls_leads` WRITE;
/*!40000 ALTER TABLE `calls_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule`
--

DROP TABLE IF EXISTS `calls_reschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_reschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule`
--

LOCK TABLES `calls_reschedule` WRITE;
/*!40000 ALTER TABLE `calls_reschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule_audit`
--

DROP TABLE IF EXISTS `calls_reschedule_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_calls_reschedule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule_audit`
--

LOCK TABLES `calls_reschedule_audit` WRITE;
/*!40000 ALTER TABLE `calls_reschedule_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_users`
--

DROP TABLE IF EXISTS `calls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_users`
--

LOCK TABLES `calls_users` WRITE;
/*!40000 ALTER TABLE `calls_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log`
--

DROP TABLE IF EXISTS `campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log`
--

LOCK TABLES `campaign_log` WRITE;
/*!40000 ALTER TABLE `campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_trkrs`
--

DROP TABLE IF EXISTS `campaign_trkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(255) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_trkrs`
--

LOCK TABLES `campaign_trkrs` WRITE;
/*!40000 ALTER TABLE `campaign_trkrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_trkrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_audit`
--

DROP TABLE IF EXISTS `campaigns_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_audit`
--

LOCK TABLES `campaigns_audit` WRITE;
/*!40000 ALTER TABLE `campaigns_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Open',
  `contact_created_by_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_audit`
--

DROP TABLE IF EXISTS `cases_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_audit`
--

LOCK TABLES `cases_audit` WRITE;
/*!40000 ALTER TABLE `cases_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_bugs`
--

DROP TABLE IF EXISTS `cases_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_bugs`
--

LOCK TABLES `cases_bugs` WRITE;
/*!40000 ALTER TABLE `cases_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_cstm`
--

DROP TABLE IF EXISTS `cases_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_cstm`
--

LOCK TABLES `cases_cstm` WRITE;
/*!40000 ALTER TABLE `cases_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('notify','fromaddress','do_not_reply@example.com'),('notify','fromname','SuiteCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.25'),('MySettings','tab','YTozODp7aTowO3M6NDoiSG9tZSI7aToxO3M6ODoiQWNjb3VudHMiO2k6MjtzOjg6IkNvbnRhY3RzIjtpOjM7czoxMzoiT3Bwb3J0dW5pdGllcyI7aTo0O3M6NToiTGVhZHMiO2k6NTtzOjEwOiJBT1NfUXVvdGVzIjtpOjY7czo4OiJDYWxlbmRhciI7aTo3O3M6OToiRG9jdW1lbnRzIjtpOjg7czo2OiJFbWFpbHMiO2k6OTtzOjU6IlNwb3RzIjtpOjEwO3M6OToiQ2FtcGFpZ25zIjtpOjExO3M6NToiQ2FsbHMiO2k6MTI7czo4OiJNZWV0aW5ncyI7aToxMztzOjU6IlRhc2tzIjtpOjE0O3M6NToiTm90ZXMiO2k6MTU7czoxMjoiQU9TX0ludm9pY2VzIjtpOjE2O3M6MTM6IkFPU19Db250cmFjdHMiO2k6MTc7czo1OiJDYXNlcyI7aToxODtzOjk6IlByb3NwZWN0cyI7aToxOTtzOjEzOiJQcm9zcGVjdExpc3RzIjtpOjIwO3M6NzoiUHJvamVjdCI7aToyMTtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtpOjIyO3M6MTY6IkFNX1Rhc2tUZW1wbGF0ZXMiO2k6MjM7czo5OiJGUF9ldmVudHMiO2k6MjQ7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtpOjI1O3M6MTI6IkFPU19Qcm9kdWN0cyI7aToyNjtzOjIyOiJBT1NfUHJvZHVjdF9DYXRlZ29yaWVzIjtpOjI3O3M6MTc6IkFPU19QREZfVGVtcGxhdGVzIjtpOjI4O3M6OToiamp3Z19NYXBzIjtpOjI5O3M6MTI6Impqd2dfTWFya2VycyI7aTozMDtzOjEwOiJqandnX0FyZWFzIjtpOjMxO3M6MTg6Impqd2dfQWRkcmVzc19DYWNoZSI7aTozMjtzOjExOiJBT1JfUmVwb3J0cyI7aTozMztzOjEyOiJBT1dfV29ya0Zsb3ciO2k6MzQ7czoxNzoiQU9LX0tub3dsZWRnZUJhc2UiO2k6MzU7czoyOToiQU9LX0tub3dsZWRnZV9CYXNlX0NhdGVnb3JpZXMiO2k6MzY7czoxNDoiRW1haWxUZW1wbGF0ZXMiO2k6Mzc7czo3OiJTdXJ2ZXlzIjt9'),('portal','on','0'),('tracker','Tracker','1'),('system','skypeout_on','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Cases','1'),('sugarfeed','module_Contacts','1'),('sugarfeed','module_Leads','1'),('sugarfeed','module_Opportunities','1'),('Update','CheckUpdates','manual'),('system','name','SuiteCRM'),('system','adminwizard','1'),('notify','allow_default_outbound','0');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `joomla_account_id` varchar(255) DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT NULL,
  `portal_user_type` varchar(100) DEFAULT 'Single',
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_audit`
--

DROP TABLE IF EXISTS `contacts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_audit`
--

LOCK TABLES `contacts_audit` WRITE;
/*!40000 ALTER TABLE `contacts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_bugs`
--

DROP TABLE IF EXISTS `contacts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_bugs`
--

LOCK TABLES `contacts_bugs` WRITE;
/*!40000 ALTER TABLE `contacts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cases`
--

DROP TABLE IF EXISTS `contacts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cases`
--

LOCK TABLES `contacts_cases` WRITE;
/*!40000 ALTER TABLE `contacts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cstm`
--

DROP TABLE IF EXISTS `contacts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cstm`
--

LOCK TABLES `contacts_cstm` WRITE;
/*!40000 ALTER TABLE `contacts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

LOCK TABLES `contacts_users` WRITE;
/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_remove_documents`
--

DROP TABLE IF EXISTS `cron_remove_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_remove_documents`
--

LOCK TABLES `cron_remove_documents` WRITE;
/*!40000 ALTER TABLE `cron_remove_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_remove_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_revisions`
--

DROP TABLE IF EXISTS `document_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_revisions`
--

LOCK TABLES `document_revisions` WRITE;
/*!40000 ALTER TABLE `document_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_accounts`
--

DROP TABLE IF EXISTS `documents_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_accounts`
--

LOCK TABLES `documents_accounts` WRITE;
/*!40000 ALTER TABLE `documents_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_bugs`
--

DROP TABLE IF EXISTS `documents_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_bugs`
--

LOCK TABLES `documents_bugs` WRITE;
/*!40000 ALTER TABLE `documents_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cases`
--

DROP TABLE IF EXISTS `documents_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cases`
--

LOCK TABLES `documents_cases` WRITE;
/*!40000 ALTER TABLE `documents_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_contacts`
--

DROP TABLE IF EXISTS `documents_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_contacts`
--

LOCK TABLES `documents_contacts` WRITE;
/*!40000 ALTER TABLE `documents_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_opportunities`
--

DROP TABLE IF EXISTS `documents_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_opportunities`
--

LOCK TABLES `documents_opportunities` WRITE;
/*!40000 ALTER TABLE `documents_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eapm`
--

DROP TABLE IF EXISTS `eapm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eapm`
--

LOCK TABLES `eapm` WRITE;
/*!40000 ALTER TABLE `eapm` DISABLE KEYS */;
/*!40000 ALTER TABLE `eapm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addr_bean_rel`
--

DROP TABLE IF EXISTS `email_addr_bean_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addr_bean_rel`
--

LOCK TABLES `email_addr_bean_rel` WRITE;
/*!40000 ALTER TABLE `email_addr_bean_rel` DISABLE KEYS */;
INSERT INTO `email_addr_bean_rel` VALUES ('916190a0-941f-c311-0981-6316df58b9d3','968ba1c5-a651-8b7a-2755-6316df3440da','1','Users',1,0,'2022-09-06 05:47:31','2022-09-06 05:47:31',0);
/*!40000 ALTER TABLE `email_addr_bean_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `confirm_opt_in` varchar(255) DEFAULT 'not-opt-in',
  `confirm_opt_in_date` datetime DEFAULT NULL,
  `confirm_opt_in_sent_date` datetime DEFAULT NULL,
  `confirm_opt_in_fail_date` datetime DEFAULT NULL,
  `confirm_opt_in_token` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES ('968ba1c5-a651-8b7a-2755-6316df3440da','chungnguyen10012000@gmail.com','CHUNGNGUYEN10012000@GMAIL.COM',0,0,'confirmed-opt-in',NULL,NULL,NULL,NULL,'2022-09-06 05:47:00','2022-12-08 21:14:40',0);
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses_audit`
--

DROP TABLE IF EXISTS `email_addresses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_email_addresses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses_audit`
--

LOCK TABLES `email_addresses_audit` WRITE;
/*!40000 ALTER TABLE `email_addresses_audit` DISABLE KEYS */;
INSERT INTO `email_addresses_audit` VALUES ('deb88a9e-d4a5-cda4-a352-6319911a1b1d','968ba1c5-a651-8b7a-2755-6316df3440da','2022-09-08 06:55:17','1','confirm_opt_in','enum','not-opt-in','confirmed-opt-in',NULL,NULL);
/*!40000 ALTER TABLE `email_addresses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_cache`
--

DROP TABLE IF EXISTS `email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_cache`
--

LOCK TABLES `email_cache` WRITE;
/*!40000 ALTER TABLE `email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `outbound_email_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_prospect_lists`
--

DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_prospect_lists`
--

LOCK TABLES `email_marketing_prospect_lists` WRITE;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext,
  `body_html` longtext,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('1f687a3c-4fd8-46eb-368a-6316df5c8465','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','Two Factor Authentication email','This template is used to send a user a code for Two Factor Authentication.','Two Factor Authentication Code','Two Factor Authentication code is $code.','<div><table width=\"550\"><tbody><tr><td><p>Two Factor Authentication code is <b>$code</b>.</p>  </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>',0,NULL,0,'system'),('6464c705-6265-83f8-03b5-6316dfbb8c79','2013-05-24 14:31:45','2022-09-06 05:47:31','1','1','off','Event Invite Template','Default event invite template.','You have been invited to $fp_events_name','Dear $contact_name,\r\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\r\n$fp_events_description\r\nYours Sincerely,\r\n','\r\n<p>Dear $contact_name,</p>\r\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\r\n<p>$fp_events_description</p>\r\n<p>If you would like to accept this invititation please click accept.</p>\r\n<p> $fp_events_link or $fp_events_link_declined</p>\r\n<p>Yours Sincerely,</p>\r\n',0,NULL,NULL,'system'),('8a511b7e-92ba-4172-393c-6316df3b7b11','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','Case Closure','Template for informing a contact that their case has been closed.','$acase_name [CASE:$acase_case_number] closed','Hi $contact_first_name $contact_last_name,\r\n\r\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\r\n					   Status:				$acase_status\r\n					   Reference:			$acase_case_number\r\n					   Resolution:			$acase_resolution','<p> Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\r\n					    <table border=\"0\"><tbody>\r\n					    <tr><td>Status</td><td>$acase_status</td></tr>\r\n					    <tr><td>Reference</td><td>$acase_case_number</td></tr>\r\n					    <tr><td>Resolution</td><td>$acase_resolution</td></tr>\r\n					    </tbody></table>',0,NULL,NULL,'system'),('8c7e0499-0d2a-f66a-7205-6316dff74e91','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\r\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\r\n\r\nClick on the link below to reset your password:\r\n\r\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>',0,NULL,0,'system'),('9959ff6b-baf7-8fea-6d40-6316df1f328e','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','Joomla Account Creation','Template used when informing a contact that they\'ve been given an account on the joomla portal.','Support Portal Account Created','Hi $contact_name,\r\n					   An account has been created for you at $portal_address.\r\n					   You may login using this email address and the password $joomla_pass','<p>Hi $contact_name,</p>\r\n					    <p>An account has been created for you at <a href=\"$portal_address\">$portal_address</a>.</p>\r\n					    <p>You may login using this email address and the password $joomla_pass</p>',0,NULL,NULL,'system'),('a73a01d3-5325-3c69-fcb2-6316df419e32','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','Case Creation','Template to send to a contact when a case is received from them.','$acase_name [CASE:$acase_case_number]','Hi $contact_first_name $contact_last_name,\r\n\r\n					   We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\r\n					   Status:		$acase_status\r\n					   Reference:	$acase_case_number\r\n					   Description:	$acase_description','<p> Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\r\n					    <table border=\"0\"><tbody>\r\n					    <tr><td>Status</td><td>$acase_status</td></tr>\r\n					    <tr><td>Reference</td><td>$acase_case_number</td></tr>\r\n					    <tr><td>Description</td><td>$acase_description</td></tr>\r\n					    </tbody></table>',0,NULL,NULL,'system'),('cb431e9b-9aaa-c11c-a4ca-6316dfeb95fd','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','Contact Case Update','Template to send to a contact when their case is updated.','$acase_name update [CASE:$acase_case_number]','Hi $user_first_name $user_last_name,\r\n\r\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description','<p>Hi $contact_first_name $contact_last_name,</p>\r\n					    <p> </p>\r\n					    <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\r\n					    <p style=\"padding-left:30px;\">$aop_case_updates_description</p>',0,NULL,NULL,'system'),('dd2ae326-4297-ffc8-52c9-6316df951b87','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','User Case Update','Email template to send to a Sugar user when their case is updated.','$acase_name (# $acase_case_number) update','Hi $user_first_name $user_last_name,\r\n\r\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description\r\n                        You may review this Case at:\r\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;','<p>Hi $user_first_name $user_last_name,</p>\r\n					     <p> </p>\r\n					     <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					     <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\r\n					     <p style=\"padding-left:30px;\">$aop_case_updates_description</p>\r\n					     <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>',0,NULL,NULL,'system'),('ea6de4fa-c034-a4db-ca2f-6316df653a66','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\r\nHere is your account username and temporary password:\r\nUsername : $contact_user_user_name\r\nPassword : $contact_user_user_hash\r\n\r\n$config_site_url\r\n\r\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>',0,NULL,0,'system'),('f590046d-bfe4-146c-b467-6316dfe4ffc3','2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','off','Confirmed Opt In','Email template to send to a contact to confirm they have opted in.','Confirm Opt In','Hi $contact_first_name $contact_last_name, \\n Please confirm that you have opted in by selecting the following link: $sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_email_address','<p>Hi $contact_first_name $contact_last_name,</p>\r\n             <p>\r\n                Please confirm that you have opted in by selecting the following link:\r\n                <a href=\"$sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_confirm_opt_in_token\">Opt In</a>\r\n             </p>',0,NULL,NULL,'system');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailman`
--

DROP TABLE IF EXISTS `emailman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `related_confirm_opt_in` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailman`
--

LOCK TABLES `emailman` WRITE;
/*!40000 ALTER TABLE `emailman` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `orphaned` tinyint(1) DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`),
  KEY `idx_email_cat` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_beans`
--

DROP TABLE IF EXISTS `emails_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_beans`
--

LOCK TABLES `emails_beans` WRITE;
/*!40000 ALTER TABLE `emails_beans` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_email_addr_rel`
--

DROP TABLE IF EXISTS `emails_email_addr_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_email_addr_rel`
--

LOCK TABLES `emails_email_addr_rel` WRITE;
/*!40000 ALTER TABLE `emails_email_addr_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_email_addr_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_text`
--

DROP TABLE IF EXISTS `emails_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_text`
--

LOCK TABLES `emails_text` WRITE;
/*!40000 ALTER TABLE `emails_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('90e0f9c2-20ab-a323-3bcb-6320bca7afb9','Leads c6af6513-1c27-f936-d588-631ed5c6c11d aacec1bd-6737-81e3-7365-631aa18cd430','2022-09-13 17:24:42','2022-09-13 17:24:44','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,1,'aacec1bd-6737-81e3-7365-631aa18cd430','c6af6513-1c27-f936-d588-631ed5c6c11d','Leads'),('92873c3a-bd04-4c86-6aa0-63204d9cc1a4','Leads 190529f8-84aa-ac39-f895-631b0061bab8 1','2022-09-13 09:31:28','2022-09-13 09:31:28','1','1',NULL,0,'1','190529f8-84aa-ac39-f895-631b0061bab8','Leads'),('cacd2a20-5dee-7e48-b904-63204d32fe39','Leads 190529f8-84aa-ac39-f895-631b0061bab8 1','2022-09-13 09:31:25','2022-09-13 09:31:26','1','1',NULL,1,'1','190529f8-84aa-ac39-f895-631b0061bab8','Leads');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_meta_data`
--

DROP TABLE IF EXISTS `fields_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_meta_data`
--

LOCK TABLES `fields_meta_data` WRITE;
/*!40000 ALTER TABLE `fields_meta_data` DISABLE KEYS */;
INSERT INTO `fields_meta_data` VALUES ('Accountsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Accounts','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Accountsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Accounts','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Accountsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Accounts','float',10,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Accountsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Accounts','float',11,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Casesjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Cases','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Casesjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Cases','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Casesjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Cases','float',10,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Casesjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Cases','float',11,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Contactsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Contacts','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Contactsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Contacts','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Contactsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Contacts','float',10,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Contactsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Contacts','float',11,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Leadsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Leads','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Leadsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Leads','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Leadsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Leads','float',10,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Leadsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Leads','float',11,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Meetingsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Meetings','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Meetingsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Meetings','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Meetingsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Meetings','float',10,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Meetingsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Meetings','float',11,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Opportunitiesjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Opportunities','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Opportunitiesjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Opportunities','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Opportunitiesjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Opportunities','float',10,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Opportunitiesjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Opportunities','float',11,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Projectjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Project','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Projectjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Project','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Projectjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Project','float',10,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Projectjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Project','float',11,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Prospectsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Prospects','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Prospectsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Prospects','varchar',255,0,NULL,'2022-09-06 05:47:31',0,0,0,0,1,'true',NULL,'','',''),('Prospectsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Prospects','float',10,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','',''),('Prospectsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Prospects','float',11,0,'0.00000000','2022-09-06 05:47:31',0,0,0,0,1,'true','8','','','');
/*!40000 ALTER TABLE `fields_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_rel`
--

DROP TABLE IF EXISTS `folders_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_rel`
--

LOCK TABLES `folders_rel` WRITE;
/*!40000 ALTER TABLE `folders_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_subscriptions`
--

DROP TABLE IF EXISTS `folders_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_subscriptions`
--

LOCK TABLES `folders_subscriptions` WRITE;
/*!40000 ALTER TABLE `folders_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations`
--

DROP TABLE IF EXISTS `fp_event_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations`
--

LOCK TABLES `fp_event_locations` WRITE;
/*!40000 ALTER TABLE `fp_event_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_audit`
--

DROP TABLE IF EXISTS `fp_event_locations_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_event_locations_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_audit`
--

LOCK TABLES `fp_event_locations_audit` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

DROP TABLE IF EXISTS `fp_event_locations_fp_events_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_fp_events_1_c`
--

LOCK TABLES `fp_event_locations_fp_events_1_c` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events`
--

DROP TABLE IF EXISTS `fp_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `invite_templates` varchar(100) DEFAULT NULL,
  `accept_redirect` varchar(255) DEFAULT NULL,
  `decline_redirect` varchar(255) DEFAULT NULL,
  `activity_status_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events`
--

LOCK TABLES `fp_events` WRITE;
/*!40000 ALTER TABLE `fp_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_audit`
--

DROP TABLE IF EXISTS `fp_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_audit`
--

LOCK TABLES `fp_events_audit` WRITE;
/*!40000 ALTER TABLE `fp_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_contacts_c`
--

DROP TABLE IF EXISTS `fp_events_contacts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_contacts_c`
--

LOCK TABLES `fp_events_contacts_c` WRITE;
/*!40000 ALTER TABLE `fp_events_contacts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_contacts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_delegates_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_delegates_1_c`
--

LOCK TABLES `fp_events_fp_event_delegates_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_locations_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_locations_1_c`
--

LOCK TABLES `fp_events_fp_event_locations_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_leads_1_c`
--

DROP TABLE IF EXISTS `fp_events_leads_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_leads_1_c`
--

LOCK TABLES `fp_events_leads_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_leads_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_leads_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_prospects_1_c`
--

DROP TABLE IF EXISTS `fp_events_prospects_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_prospects_1_c`
--

LOCK TABLES `fp_events_prospects_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_maps`
--

DROP TABLE IF EXISTS `import_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_maps`
--

LOCK TABLES `import_maps` WRITE;
/*!40000 ALTER TABLE `import_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_autoreply`
--

DROP TABLE IF EXISTS `inbound_email_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_autoreply`
--

LOCK TABLES `inbound_email_autoreply` WRITE;
/*!40000 ALTER TABLE `inbound_email_autoreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_cache_ts`
--

DROP TABLE IF EXISTS `inbound_email_cache_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_cache_ts`
--

LOCK TABLES `inbound_email_cache_ts` WRITE;
/*!40000 ALTER TABLE `inbound_email_cache_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_cache_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache`
--

DROP TABLE IF EXISTS `jjwg_address_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_address_cache` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `lat` float(10,8) DEFAULT NULL,
  `lng` float(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache`
--

LOCK TABLES `jjwg_address_cache` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache_audit`
--

DROP TABLE IF EXISTS `jjwg_address_cache_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_address_cache_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache_audit`
--

LOCK TABLES `jjwg_address_cache_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas`
--

DROP TABLE IF EXISTS `jjwg_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_areas` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `coordinates` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas`
--

LOCK TABLES `jjwg_areas` WRITE;
/*!40000 ALTER TABLE `jjwg_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas_audit`
--

DROP TABLE IF EXISTS `jjwg_areas_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_areas_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas_audit`
--

LOCK TABLES `jjwg_areas_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_areas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps`
--

DROP TABLE IF EXISTS `jjwg_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `distance` float(9,4) DEFAULT NULL,
  `unit_type` varchar(100) DEFAULT 'mi',
  `module_type` varchar(100) DEFAULT 'Accounts',
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps`
--

LOCK TABLES `jjwg_maps` WRITE;
/*!40000 ALTER TABLE `jjwg_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_audit`
--

DROP TABLE IF EXISTS `jjwg_maps_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_maps_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_audit`
--

LOCK TABLES `jjwg_maps_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_areas_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_areas_c`
--

LOCK TABLES `jjwg_maps_jjwg_areas_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_markers_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_markers_c`
--

LOCK TABLES `jjwg_maps_jjwg_markers_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers`
--

DROP TABLE IF EXISTS `jjwg_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_markers` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `jjwg_maps_lat` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_lng` float(11,8) DEFAULT '0.00000000',
  `marker_image` varchar(100) DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers`
--

LOCK TABLES `jjwg_markers` WRITE;
/*!40000 ALTER TABLE `jjwg_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers_audit`
--

DROP TABLE IF EXISTS `jjwg_markers_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_markers_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers_audit`
--

LOCK TABLES `jjwg_markers_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_markers_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `day_has_phone_number` date DEFAULT NULL,
  `month_has_phone_number` varchar(255) DEFAULT NULL,
  `year_has_phone_number` varchar(255) DEFAULT NULL,
  `successful_trading_day` date DEFAULT NULL,
  `successful_trading_month` varchar(255) DEFAULT NULL,
  `data_sources` varchar(255) DEFAULT NULL,
  `ro_name` varchar(255) DEFAULT NULL,
  `owned_branch` varchar(255) DEFAULT NULL,
  `receiving_branch` varchar(255) DEFAULT NULL,
  `facebook_or_zalo_name` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone_number_primary` varchar(255) DEFAULT NULL,
  `phone_number_extra` varchar(255) DEFAULT NULL,
  `citizen_identification` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `citizen_identification_issuance_date` date DEFAULT NULL,
  `citizen_identification_issuance_place` varchar(255) DEFAULT NULL,
  `address_follow_citizen_identification` varchar(255) DEFAULT NULL,
  `district_customer_live` varchar(255) DEFAULT NULL,
  `career` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `real_fee` double DEFAULT NULL,
  `card_bark_type` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `transaction_amount` double DEFAULT NULL,
  `real_transaction_amount` double DEFAULT NULL,
  `note` text,
  `sale_stage` varchar(255) DEFAULT NULL,
  `lead_status` varchar(255) DEFAULT NULL,
  `payment_day` int(11) DEFAULT NULL,
  `contact_date` date DEFAULT NULL,
  `MKT_day_shared_BU` datetime DEFAULT NULL,
  `is_record` tinyint(1) DEFAULT '0',
  `day_shared_RO` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES ('2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 06:48:42','2022-12-09 04:11:08','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,'',NULL,NULL,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'New',NULL,'',NULL,NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','0','1',NULL,'TEST1',NULL,NULL,'0965037839',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',2,NULL,'JCB','3',10000000,NULL,NULL,'11','23',20,NULL,'2022-11-30 16:53:00',0,'2022-11-30 16:53:00'),('3331037a-6b8d-cbe0-22e7-638470e5e320','2022-11-28 08:24:39','2022-12-09 14:44:34','1e53686b-f1aa-8dac-5bcf-63282bc67ade','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,'',NULL,NULL,'LÊ VĂN HAN',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'New',NULL,'',NULL,NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08',NULL,'1','RO TB 2','3','4','test 3',NULL,'LÊ VĂN HAN','0989433232','035 648 7895','312261517','2022-12-08','2022-12-09','tb','àew','tb','hs','1',2.5,2,'JCB','3',40000000,100000000,NULL,'2','2',10,'2022-12-09','2022-12-08 10:09:00',0,'2022-12-08 10:09:00'),('68432e07-8302-226c-5dc1-6392da67c274','2022-12-09 06:50:05','2022-12-09 14:11:04','1','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,'',NULL,NULL,'NGUYỄN HOÀNG TIẾN',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'New',NULL,'',NULL,NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','RO TB 2','3',NULL,'nguyễn hoàng tiến',NULL,'NGUYỄN HOÀNG TIẾN','0365214587',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',2,NULL,'Master','4',30,NULL,NULL,'11','23',12,'2022-12-09','2022-12-09 14:11:04',0,'2022-12-09 14:11:04'),('827b74b9-38f9-f0f0-c26a-63478d536619','2022-10-13 04:00:34','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,'',NULL,NULL,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'New',NULL,'',NULL,NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4','0','0','0','Khoa test',NULL,NULL,'0916387798',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',2,NULL,'1','2',20,NULL,'test 13/10','11','23',5,NULL,'2022-11-28 06:41:31',0,'2022-11-28 06:41:31'),('c9dca761-da35-71ef-9950-633cf17e200d','2022-10-05 02:53:39','2022-10-12 11:26:04','aacec1bd-6737-81e3-7365-631aa18cd430','1',NULL,0,'',NULL,NULL,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'New',NULL,'',NULL,NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','RO Q10 1','2','2','lead 1',NULL,NULL,'0989439677',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',2.5,NULL,'JCB','3',2000000,NULL,'this note','11','23',10,NULL,'2022-10-12 11:26:04',0,'2022-10-12 11:26:04'),('d56206dd-8f0f-e94d-5dd0-633cf312bd9e','2022-10-05 03:00:53','2022-10-12 19:18:09','aacec1bd-6737-81e3-7365-631aa18cd430','1',NULL,0,'',NULL,NULL,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'New',NULL,'',NULL,NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','0',NULL,'4','lead 2',NULL,NULL,'0989439612',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',2.5,NULL,'Visa','16',2000,NULL,'this note','0',NULL,11,NULL,NULL,0,'2022-10-06 11:32:00'),('efdc7fb4-bc53-1454-4104-6347140eb24b','2022-10-12 19:23:54','2022-10-12 19:23:54','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,NULL,NULL,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'New',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','RO Q10 2','2','2','lead 3',NULL,NULL,'0989439611',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',2.5,NULL,'JCB','2',2000000,NULL,NULL,'11','23',10,NULL,'2022-10-12 19:23:54',0,'2022-10-12 19:23:54');
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_audit`
--

DROP TABLE IF EXISTS `leads_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_audit`
--

LOCK TABLES `leads_audit` WRITE;
/*!40000 ALTER TABLE `leads_audit` DISABLE KEYS */;
INSERT INTO `leads_audit` VALUES ('11209435-ab8d-602e-010d-634795109cc7','827b74b9-38f9-f0f0-c26a-63478d536619','2022-10-13 04:36:52','aacec1bd-6737-81e3-7365-631aa18cd430','owned_branch','enum','0','5',NULL,NULL),('16dc9479-b29d-51e0-df24-634795ebe137','827b74b9-38f9-f0f0-c26a-63478d536619','2022-10-13 04:36:52','aacec1bd-6737-81e3-7365-631aa18cd430','card_bark_type','enum','Master','',NULL,NULL),('1e4e72e8-2bb6-ff55-4f6b-634795b592b3','827b74b9-38f9-f0f0-c26a-63478d536619','2022-10-13 04:36:52','aacec1bd-6737-81e3-7365-631aa18cd430','sale_stage','enum','1','10',NULL,NULL),('2652474e-482f-32c9-836f-638585cbf798','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:08:03','1','lead_status','enum','23','1',NULL,NULL),('30fb811d-521a-23d5-5b32-638727bec661','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-30 09:51:29','1','card_bark_type','enum',NULL,'JCB',NULL,NULL),('32061f7f-d17e-7254-8986-633a5c2e388e','673eee13-cfe4-b462-07f0-6336a0424211','2022-10-03 03:54:25','1','ro_name','enum','RO NTT 1','RO Q10 2',NULL,NULL),('357ca8b9-772c-b781-0348-638587b40f48','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:15:48','1','owned_branch','enum',NULL,'1',NULL,NULL),('3c029ebe-bda6-8134-d30b-63858779aa0c','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:15:48','1','sale_stage','enum','11','10',NULL,NULL),('4178e0da-eb3e-82ff-574c-638587b6ec78','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:15:48','1','lead_status','enum','23','1',NULL,NULL),('43be98d2-34b4-9663-bfed-633a5c4e0baa','673eee13-cfe4-b462-07f0-6336a0424211','2022-10-03 03:54:25','1','owned_branch','enum','1','2',NULL,NULL),('5275b318-c9d1-5143-80f8-633a5cd9f323','673eee13-cfe4-b462-07f0-6336a0424211','2022-10-03 03:54:25','1','sale_stage','enum','3','10',NULL,NULL),('5a1b9ea9-9d0d-797a-a6b2-634712be6e35','d56206dd-8f0f-e94d-5dd0-633cf312bd9e','2022-10-12 19:18:09','aacec1bd-6737-81e3-7365-631aa18cd430','payment_day','int','10','11',NULL,NULL),('5fb15956-0c62-7bc2-6562-633cf3fb215f','c9dca761-da35-71ef-9950-633cf17e200d','2022-10-05 03:03:26','78e20ef0-7018-d656-107b-631aa2369613','ro_name','enum','RO Q10 2','RO Q10 1',NULL,NULL),('606e55dc-7bd7-18c9-089b-633a5c8ffbc3','673eee13-cfe4-b462-07f0-6336a0424211','2022-10-03 03:54:25','1','lead_status','enum','3','1',NULL,NULL),('659e249e-3816-668b-2c56-6392dd39c543','68432e07-8302-226c-5dc1-6392da67c274','2022-12-09 07:00:17','aacec1bd-6737-81e3-7365-631aa18cd430','MKT_day_shared_BU','datetime','2022-12-09 13:50:06','2022-12-09 13:50:00',NULL,NULL),('66c02978-2b0f-6808-484f-63845ce75772','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 06:58:30','aacec1bd-6737-81e3-7365-631aa18cd430','MKT_day_shared_BU','datetime','2022-11-28 06:48:42','2022-11-28 06:48:00',NULL,NULL),('68ec087a-93ae-80fb-ae43-639152a44ffb','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 02:57:28','aacec1bd-6737-81e3-7365-631aa18cd430','transaction_amount','decimal','20000000','50000000000',NULL,NULL),('6a0f4d6d-79a5-2349-ca1d-6392ddc2cfa8','68432e07-8302-226c-5dc1-6392da67c274','2022-12-09 07:00:17','aacec1bd-6737-81e3-7365-631aa18cd430','day_shared_RO','datetime','2022-12-09 13:50:06','2022-12-09 13:50:00',NULL,NULL),('6b499fb7-1512-3868-3bc1-6385a99ba76b','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 06:41:24','1','MKT_day_shared_BU','datetime','2022-11-29 11:15:49','2022-11-29 11:15:00',NULL,NULL),('6c3c2201-d32d-5dfc-1a04-6392df21382a','68432e07-8302-226c-5dc1-6392da67c274','2022-12-09 07:11:04','1','MKT_day_shared_BU','datetime','2022-12-09 14:00:17','2022-12-09 14:00:00',NULL,NULL),('6c530b4c-9a11-24db-9a3a-6392d883b409','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 06:42:35','aacec1bd-6737-81e3-7365-631aa18cd430','contact_date','date',NULL,'2022-12-09',NULL,NULL),('6d2f352d-2e8b-e73a-8912-633cf34b8b59','c9dca761-da35-71ef-9950-633cf17e200d','2022-10-05 03:03:26','78e20ef0-7018-d656-107b-631aa2369613','MKT_day_shared_BU','datetime','2022-10-05 02:53:39','2022-10-05 02:53:00',NULL,NULL),('6ede3b74-1594-8b4e-8872-63845885b4fd','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','ro_name','enum','RO DL TB 1','0',NULL,NULL),('6fae9c75-ee9e-7147-3dd6-6392e7e5b9a3','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 07:44:34','1e53686b-f1aa-8dac-5bcf-63282bc67ade','real_transaction_amount','double','1000000000','100000000',NULL,NULL),('7020020f-e1db-c4d0-604e-639252dc6c07','2d69653d-48eb-fff5-6c94-63845977f397','2022-12-08 21:11:08','aacec1bd-6737-81e3-7365-631aa18cd430','MKT_day_shared_BU','datetime','2022-11-30 16:53:18','2022-11-30 16:53:00',NULL,NULL),('70adf3dc-a3e6-e731-c4bf-63846dd886b7','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 08:13:41','aacec1bd-6737-81e3-7365-631aa18cd430','MKT_day_shared_BU','datetime','2022-11-28 14:53:05','2022-11-28 14:53:00',NULL,NULL),('7130c51f-17e6-bbd8-9974-6385a946e262','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 06:41:24','1','day_shared_RO','datetime','2022-11-29 11:15:49','2022-11-29 11:15:00',NULL,NULL),('71e0d909-853f-a3d9-6d40-63845c90ea51','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 06:58:30','aacec1bd-6737-81e3-7365-631aa18cd430','day_shared_RO','datetime','2022-11-28 06:48:42','2022-11-28 06:48:00',NULL,NULL),('73dd0458-304d-3171-618b-6392526f2d13','2d69653d-48eb-fff5-6c94-63845977f397','2022-12-08 21:11:08','aacec1bd-6737-81e3-7365-631aa18cd430','day_shared_RO','datetime','2022-11-30 16:53:18','2022-11-30 16:53:00',NULL,NULL),('757caf04-27ef-3b52-eb1f-633cf3089020','c9dca761-da35-71ef-9950-633cf17e200d','2022-10-05 03:03:26','78e20ef0-7018-d656-107b-631aa2369613','day_shared_RO','datetime','2022-10-05 02:53:39','2022-10-05 02:53:00',NULL,NULL),('76cf1534-b79b-00f2-fbf1-63846ddf9ae6','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 08:13:41','aacec1bd-6737-81e3-7365-631aa18cd430','day_shared_RO','datetime','2022-11-28 14:53:05','2022-11-28 14:53:00',NULL,NULL),('77398b0c-fa4e-654f-6524-6385a9592763','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 06:41:24','1','transaction_amount','decimal','10','10000000',NULL,NULL),('7757249d-ed42-4941-1c81-6392df19cbe0','68432e07-8302-226c-5dc1-6392da67c274','2022-12-09 07:11:04','1','day_shared_RO','datetime','2022-12-09 14:00:17','2022-12-09 14:00:00',NULL,NULL),('7822f0c6-5e3b-752f-a6e2-6392d85c01a6','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 06:42:35','aacec1bd-6737-81e3-7365-631aa18cd430','service','enum',NULL,'1',NULL,NULL),('7dfbc48f-d697-9649-0825-63846d1649ad','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 08:13:41','aacec1bd-6737-81e3-7365-631aa18cd430','sale_stage','enum','11','10',NULL,NULL),('7e0d1b86-301c-de04-2c5c-63845c979705','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 06:58:30','aacec1bd-6737-81e3-7365-631aa18cd430','sale_stage','enum','11','10',NULL,NULL),('7e749b04-e29c-b6fb-1f06-6392d80c8506','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 06:42:35','aacec1bd-6737-81e3-7365-631aa18cd430','sale_stage','enum','11','2',NULL,NULL),('81b14bf4-5849-b7b7-0eb8-639157b26780','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','successful_trading_day','date',NULL,'2022-12-08',NULL,NULL),('82ef1fdf-d532-5320-831a-63858501379e','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:08:03','1','ro_name','enum','RO TB 1','0',NULL,NULL),('844c1b8b-8234-ff01-7617-6392d8225be2','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 06:42:35','aacec1bd-6737-81e3-7365-631aa18cd430','lead_status','enum','23','0',NULL,NULL),('849d61b3-f315-1ead-1dda-63478ee222ec','827b74b9-38f9-f0f0-c26a-63478d536619','2022-10-13 04:06:34','aacec1bd-6737-81e3-7365-631aa18cd430','owned_branch','enum','5','0',NULL,NULL),('850f7872-9f91-03e1-2714-63846d0ff2e3','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 08:13:41','aacec1bd-6737-81e3-7365-631aa18cd430','lead_status','enum','23','1',NULL,NULL),('88c752df-54ea-f64c-33a8-638458fbcded','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','owned_branch','enum','5','0',NULL,NULL),('891b4f82-b71e-75b2-9668-63915782732f','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','phone_number_extra','varchar',NULL,'035 648 7895',NULL,NULL),('8a6f8b2a-fa2a-b8e4-2dbc-63478e3ddffd','827b74b9-38f9-f0f0-c26a-63478d536619','2022-10-13 04:06:34','aacec1bd-6737-81e3-7365-631aa18cd430','facebook_or_zalo_name','varchar','Khoa Nguyen','Khoa Nguyenn',NULL,NULL),('8b5da9be-1f88-5078-b340-633a58f7e862','673eee13-cfe4-b462-07f0-6336a0424211','2022-10-03 03:33:25','1','sale_stage','enum','10','3',NULL,NULL),('8c554461-415c-f26b-4c9e-63845c4b0259','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 06:58:30','aacec1bd-6737-81e3-7365-631aa18cd430','lead_status','enum','23','1',NULL,NULL),('8ed8cdc4-404c-b3d9-a8a1-6385851048f7','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:08:03','1','owned_branch','enum','3','',NULL,NULL),('8f99e02c-6f43-88d0-3e48-6384589f0f56','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','facebook_or_zalo_name','varchar','Khoa Nguyenn','Khoa test',NULL,NULL),('8faff63b-e4d4-91fc-c621-639157759e72','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','citizen_identification','varchar',NULL,'2549161616',NULL,NULL),('9079048d-b33d-1f68-9256-63478e5fefee','827b74b9-38f9-f0f0-c26a-63478d536619','2022-10-13 04:06:34','aacec1bd-6737-81e3-7365-631aa18cd430','phone_number_primary','varchar','0916387797','0916387798',NULL,NULL),('954f47b5-5b09-3a64-a71f-639157ddd5aa','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','birthday','date',NULL,'2022-12-08',NULL,NULL),('95a8791a-7831-0799-8150-638728a631f8','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-30 09:53:18','aacec1bd-6737-81e3-7365-631aa18cd430','sale_stage','enum','11','10',NULL,NULL),('96fbf4c2-241f-948a-dd88-638458c343b8','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','MKT_day_shared_BU','datetime','2022-10-13 04:36:52','2022-10-13 04:36:00',NULL,NULL),('98690405-f2f6-8998-c51d-633a58a9d7a5','673eee13-cfe4-b462-07f0-6336a0424211','2022-10-03 03:33:25','1','lead_status','enum','1','3',NULL,NULL),('9b382a97-6ff0-c3f5-196f-638728a23c95','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-30 09:53:18','aacec1bd-6737-81e3-7365-631aa18cd430','lead_status','enum','23','1',NULL,NULL),('9be623b1-f0e2-c90c-be2d-63915771d417','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','MKT_day_shared_BU','datetime','2022-12-08 10:09:47','2022-12-08 10:09:00',NULL,NULL),('9dd2508c-f567-2be6-3a3a-638458cb5ba9','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','day_shared_RO','datetime','2022-10-13 04:36:52','2022-10-13 04:36:00',NULL,NULL),('a18751ac-43ee-5091-85dc-63915724a282','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','day_shared_RO','datetime','2022-12-08 10:09:47','2022-12-08 10:09:00',NULL,NULL),('a359fd37-2525-d5b4-efa0-63858590ecfb','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:08:03','1','MKT_day_shared_BU','datetime','2022-11-28 15:13:41','2022-11-28 15:13:00',NULL,NULL),('a5416bcd-4bec-ca26-9d95-63845883d9ad','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','service','enum','5','1',NULL,NULL),('a828e373-4df9-f612-1890-63915733ed16','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','citizen_identification_issuance_date','date',NULL,'2022-12-09',NULL,NULL),('ac17a180-dc95-4e40-cfe7-6384589eb05d','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','card_bark_type','enum',NULL,'1',NULL,NULL),('ad178b5d-4b8e-559a-d8dc-6392de17b1e8','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 07:08:13','aacec1bd-6737-81e3-7365-631aa18cd430','citizen_identification','varchar','2549161616','312261517',NULL,NULL),('adc02549-9c56-0562-f5e1-639157171eb7','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','citizen_identification_issuance_place','varchar',NULL,'tb',NULL,NULL),('b37dccf0-b2d0-d371-c721-638458820c5a','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','transaction_amount','decimal','20000000','20',NULL,NULL),('b457cf6e-514e-aafe-3871-639157463eac','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','address_follow_citizen_identification','varchar',NULL,'àew',NULL,NULL),('b9f1a0fa-02a8-fd8e-f083-639157ebb57a','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','district_customer_live','varchar',NULL,'tb',NULL,NULL),('ba54e7fa-e4a0-67bf-b37b-638458ad7785','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','sale_stage','enum','11','10',NULL,NULL),('c08c9c7e-c5f0-5df7-d586-639157961040','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','career','varchar',NULL,'hs',NULL,NULL),('c1b4e760-c3d2-54b6-8473-63845859a7c0','827b74b9-38f9-f0f0-c26a-63478d536619','2022-11-28 06:41:31','aacec1bd-6737-81e3-7365-631aa18cd430','lead_status','enum','23','1',NULL,NULL),('c2a60c96-5ea7-1836-6d55-63915a97142d','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:30:23','1','real_transaction_amount','decimal','10','100000000',NULL,NULL),('c6276cb5-6720-4084-56bd-639157bd0ad4','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','real_fee','double',NULL,'2',NULL,NULL),('cbb9994e-b584-909c-5fd5-6392e7d6be4a','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 07:43:58','1e53686b-f1aa-8dac-5bcf-63282bc67ade','real_transaction_amount','double','100','1000000000',NULL,NULL),('ccc0389d-c90a-21d9-22ae-6391571f0a01','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:20:29','1e53686b-f1aa-8dac-5bcf-63282bc67ade','real_transaction_amount','decimal',NULL,'10',NULL,NULL),('ce83a6bb-5796-1b2e-f0f8-638585b8c824','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:08:27','1','sale_stage','enum','11','10',NULL,NULL),('d0458266-38dc-71f9-20a2-6392b425cfac','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 04:09:22','1','real_transaction_amount','double','100000000','100',NULL,NULL),('d1f55c95-c6de-94f5-d853-6392e76aa92a','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-09 07:43:58','1e53686b-f1aa-8dac-5bcf-63282bc67ade','lead_status','enum','0','2',NULL,NULL),('d248e57f-1e41-694d-8a56-638468e8b13b','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 07:53:05','1','MKT_day_shared_BU','datetime','2022-11-28 06:58:30','2022-11-28 06:58:00',NULL,NULL),('d3e782e1-994e-e1a8-4e40-63858560f424','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:08:27','1','lead_status','enum','23','1',NULL,NULL),('d750446f-b06c-6bfc-1af9-638468065ebc','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 07:53:05','1','day_shared_RO','datetime','2022-11-28 06:58:30','2022-11-28 06:58:00',NULL,NULL),('d7a56376-400e-03f4-4895-638585c7f7d7','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:08:03','1','day_shared_RO','datetime','2022-11-28 15:13:41','2022-11-28 15:13:00',NULL,NULL),('dce447e6-e45d-d63f-6508-6391550cb3b6','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:09:47','aacec1bd-6737-81e3-7365-631aa18cd430','ro_name','enum',NULL,'RO TB 2',NULL,NULL),('dd7ae4f0-3577-8357-c3a2-638468787f1d','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 07:53:05','1','card_bark_type','enum','2','',NULL,NULL),('dec18a5d-e314-c150-5860-6346a4b0a7ff','c9dca761-da35-71ef-9950-633cf17e200d','2022-10-12 11:26:04','aacec1bd-6737-81e3-7365-631aa18cd430','sale_stage','enum','','10',NULL,NULL),('e369eb9e-cd9b-e012-c8b2-639155aa2a52','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:09:47','aacec1bd-6737-81e3-7365-631aa18cd430','owned_branch','enum',NULL,'3',NULL,NULL),('e384f222-a16a-8a10-0223-6384683ad2a1','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 07:53:05','1','sale_stage','enum','11','10',NULL,NULL),('e6860095-2066-36af-65a6-6392527b0647','2d69653d-48eb-fff5-6c94-63845977f397','2022-12-08 21:11:08','aacec1bd-6737-81e3-7365-631aa18cd430','bank','enum','9','3',NULL,NULL),('e94ffcef-6bdd-f242-fb4c-6346a49eecac','c9dca761-da35-71ef-9950-633cf17e200d','2022-10-12 11:26:04','aacec1bd-6737-81e3-7365-631aa18cd430','lead_status','enum','','1',NULL,NULL),('e9a9cf75-011e-ed7a-c56f-638468d73306','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-28 07:53:05','1','lead_status','enum','23','1',NULL,NULL),('ea61d87f-3321-94f4-a273-6391554c1cc2','3331037a-6b8d-cbe0-22e7-638470e5e320','2022-12-08 03:09:47','aacec1bd-6737-81e3-7365-631aa18cd430','transaction_amount','decimal','50000000000','40000000',NULL,NULL),('f070b465-fb28-6f23-0d4b-63858562a932','2d69653d-48eb-fff5-6c94-63845977f397','2022-11-29 04:08:03','1','sale_stage','enum','11','10',NULL,NULL);
/*!40000 ALTER TABLE `leads_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_cstm`
--

DROP TABLE IF EXISTS `leads_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_cstm`
--

LOCK TABLES `leads_cstm` WRITE;
/*!40000 ALTER TABLE `leads_cstm` DISABLE KEYS */;
INSERT INTO `leads_cstm` VALUES ('190529f8-84aa-ac39-f895-631b0061bab8',0.00000000,0.00000000,NULL,NULL),('2d69653d-48eb-fff5-6c94-63845977f397',0.00000000,0.00000000,'',''),('3331037a-6b8d-cbe0-22e7-638470e5e320',0.00000000,0.00000000,'',''),('361c3c33-bc85-3469-b0a4-633556037f46',0.00000000,0.00000000,NULL,NULL),('3c8ac035-6d67-7e4b-84c1-6322c925278e',0.00000000,0.00000000,'',''),('3f30c5ce-fbde-7b97-fb36-633a64e84edf',0.00000000,0.00000000,NULL,NULL),('632d79d6-a8ef-b71a-af48-63195160f80b',0.00000000,0.00000000,'',''),('673eee13-cfe4-b462-07f0-6336a0424211',0.00000000,0.00000000,'',''),('68432e07-8302-226c-5dc1-6392da67c274',0.00000000,0.00000000,'',''),('6b45a7ed-a57c-3043-1ee9-6322addf34fd',0.00000000,0.00000000,NULL,NULL),('6e9d2ff1-9f10-0b00-904e-631811f8c5c4',0.00000000,0.00000000,NULL,NULL),('759573d3-d4fb-c575-9d79-633cec47f485',0.00000000,0.00000000,'',''),('788aeacf-1335-fbf3-2b11-633568dd010b',0.00000000,0.00000000,NULL,NULL),('7905a97c-d0e8-df63-25a8-631afcda28c8',0.00000000,0.00000000,'',''),('806f2bc8-6cf8-6a82-6e02-63298a01e069',0.00000000,0.00000000,'',''),('827b74b9-38f9-f0f0-c26a-63478d536619',0.00000000,0.00000000,'',''),('a4ab06f9-2f8d-ecc1-4cda-633cef1bee20',0.00000000,0.00000000,NULL,NULL),('a5841486-771d-5d76-716c-632a5e6c73cf',0.00000000,0.00000000,'',''),('a8315652-3feb-7746-ed4d-633a69f338c6',0.00000000,0.00000000,NULL,NULL),('af2a2717-51f9-4821-ce7d-633a6bd6a620',0.00000000,0.00000000,NULL,NULL),('b0633e39-5fe2-fd04-8b07-631cd57fd830',0.00000000,0.00000000,'',''),('bf100f32-8e21-4d9a-07ee-633a6718d59e',0.00000000,0.00000000,NULL,NULL),('c251c73e-7e2b-fcaa-3786-6322cafbef5b',0.00000000,0.00000000,'',''),('c5d50740-922c-eb38-2b7e-633a67fb84fe',0.00000000,0.00000000,NULL,NULL),('c6af6513-1c27-f936-d588-631ed5c6c11d',0.00000000,0.00000000,'',''),('c9dca761-da35-71ef-9950-633cf17e200d',0.00000000,0.00000000,'',''),('d56206dd-8f0f-e94d-5dd0-633cf312bd9e',0.00000000,0.00000000,'',''),('e8185917-455f-542f-0aee-6328901f0d18',0.00000000,0.00000000,'',''),('ee2730da-ef2a-1296-436f-633569e674b0',0.00000000,0.00000000,'',''),('efdc7fb4-bc53-1454-4104-6347140eb24b',0.00000000,0.00000000,NULL,NULL),('f3bf4122-8652-b4d8-fda2-63288bdd07f8',0.00000000,0.00000000,NULL,NULL),('f3f1a998-376a-fd34-e49e-632899c32c96',0.00000000,0.00000000,'','');
/*!40000 ALTER TABLE `leads_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_documents`
--

DROP TABLE IF EXISTS `linked_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_documents`
--

LOCK TABLES `linked_documents` WRITE;
/*!40000 ALTER TABLE `linked_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_contacts`
--

DROP TABLE IF EXISTS `meetings_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_contacts`
--

LOCK TABLES `meetings_contacts` WRITE;
/*!40000 ALTER TABLE `meetings_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_cstm`
--

DROP TABLE IF EXISTS `meetings_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_cstm`
--

LOCK TABLES `meetings_cstm` WRITE;
/*!40000 ALTER TABLE `meetings_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_leads`
--

DROP TABLE IF EXISTS `meetings_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_leads`
--

LOCK TABLES `meetings_leads` WRITE;
/*!40000 ALTER TABLE `meetings_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_users`
--

DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_users`
--

LOCK TABLES `meetings_users` WRITE;
/*!40000 ALTER TABLE `meetings_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2clients`
--

DROP TABLE IF EXISTS `oauth2clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2clients` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `secret` varchar(4000) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `is_confidential` tinyint(1) DEFAULT '1',
  `allowed_grant_type` varchar(255) DEFAULT 'password',
  `duration_value` int(11) DEFAULT NULL,
  `duration_amount` int(11) DEFAULT NULL,
  `duration_unit` varchar(255) DEFAULT 'Duration Unit',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2clients`
--

LOCK TABLES `oauth2clients` WRITE;
/*!40000 ALTER TABLE `oauth2clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2tokens`
--

DROP TABLE IF EXISTS `oauth2tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2tokens` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `token_is_revoked` tinyint(1) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `access_token_expires` datetime DEFAULT NULL,
  `access_token` varchar(4000) DEFAULT NULL,
  `refresh_token` varchar(4000) DEFAULT NULL,
  `refresh_token_expires` datetime DEFAULT NULL,
  `grant_type` varchar(255) DEFAULT NULL,
  `state` varchar(1024) DEFAULT NULL,
  `client` char(36) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2tokens`
--

LOCK TABLES `oauth2tokens` WRITE;
/*!40000 ALTER TABLE `oauth2tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_audit`
--

DROP TABLE IF EXISTS `opportunities_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_audit`
--

LOCK TABLES `opportunities_audit` WRITE;
/*!40000 ALTER TABLE `opportunities_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_contacts`
--

DROP TABLE IF EXISTS `opportunities_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_contacts`
--

LOCK TABLES `opportunities_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_cstm`
--

DROP TABLE IF EXISTS `opportunities_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_cstm`
--

LOCK TABLES `opportunities_cstm` WRITE;
/*!40000 ALTER TABLE `opportunities_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email`
--

DROP TABLE IF EXISTS `outbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `smtp_from_name` varchar(255) DEFAULT NULL,
  `smtp_from_addr` varchar(255) DEFAULT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` varchar(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email`
--

LOCK TABLES `outbound_email` WRITE;
/*!40000 ALTER TABLE `outbound_email` DISABLE KEYS */;
INSERT INTO `outbound_email` VALUES ('e0b1a6aa-9ef9-dd28-15a2-6316dfdf02a6','system','system','1',NULL,NULL,'SMTP','other','',25,'','',1,'0',NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `outbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email_audit`
--

DROP TABLE IF EXISTS `outbound_email_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_outbound_email_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email_audit`
--

LOCK TABLES `outbound_email_audit` WRITE;
/*!40000 ALTER TABLE `outbound_email_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbound_email_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `override_business_hours` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_contacts_1_c`
--

DROP TABLE IF EXISTS `project_contacts_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contacts_1_c`
--

LOCK TABLES `project_contacts_1_c` WRITE;
/*!40000 ALTER TABLE `project_contacts_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_contacts_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_cstm`
--

DROP TABLE IF EXISTS `project_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_cstm`
--

LOCK TABLES `project_cstm` WRITE;
/*!40000 ALTER TABLE `project_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relationship_type` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task_audit`
--

DROP TABLE IF EXISTS `project_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task_audit`
--

LOCK TABLES `project_task_audit` WRITE;
/*!40000 ALTER TABLE `project_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_users_1_c`
--

DROP TABLE IF EXISTS `project_users_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_users_1_c`
--

LOCK TABLES `project_users_1_c` WRITE;
/*!40000 ALTER TABLE `project_users_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_users_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_accounts`
--

DROP TABLE IF EXISTS `projects_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_accounts`
--

LOCK TABLES `projects_accounts` WRITE;
/*!40000 ALTER TABLE `projects_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_bugs`
--

DROP TABLE IF EXISTS `projects_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_bugs`
--

LOCK TABLES `projects_bugs` WRITE;
/*!40000 ALTER TABLE `projects_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_cases`
--

DROP TABLE IF EXISTS `projects_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_cases`
--

LOCK TABLES `projects_cases` WRITE;
/*!40000 ALTER TABLE `projects_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_contacts`
--

DROP TABLE IF EXISTS `projects_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_contacts`
--

LOCK TABLES `projects_contacts` WRITE;
/*!40000 ALTER TABLE `projects_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_opportunities`
--

DROP TABLE IF EXISTS `projects_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_opportunities`
--

LOCK TABLES `projects_opportunities` WRITE;
/*!40000 ALTER TABLE `projects_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_products`
--

DROP TABLE IF EXISTS `projects_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_products`
--

LOCK TABLES `projects_products` WRITE;
/*!40000 ALTER TABLE `projects_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_list_campaigns`
--

DROP TABLE IF EXISTS `prospect_list_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_list_campaigns`
--

LOCK TABLES `prospect_list_campaigns` WRITE;
/*!40000 ALTER TABLE `prospect_list_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_list_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists`
--

DROP TABLE IF EXISTS `prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists`
--

LOCK TABLES `prospect_lists` WRITE;
/*!40000 ALTER TABLE `prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists_prospects`
--

DROP TABLE IF EXISTS `prospect_lists_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists_prospects`
--

LOCK TABLES `prospect_lists_prospects` WRITE;
/*!40000 ALTER TABLE `prospect_lists_prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists_prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS `prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects`
--

LOCK TABLES `prospects` WRITE;
/*!40000 ALTER TABLE `prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects_cstm`
--

DROP TABLE IF EXISTS `prospects_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects_cstm`
--

LOCK TABLES `prospects_cstm` WRITE;
/*!40000 ALTER TABLE `prospects_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_sale_stage_lead_status`
--

DROP TABLE IF EXISTS `relationship_sale_stage_lead_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship_sale_stage_lead_status` (
  `id` varchar(36) NOT NULL,
  `sale_stage_id` varchar(36) DEFAULT NULL,
  `lead_status_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_sale_stage_lead_status`
--

LOCK TABLES `relationship_sale_stage_lead_status` WRITE;
/*!40000 ALTER TABLE `relationship_sale_stage_lead_status` DISABLE KEYS */;
INSERT INTO `relationship_sale_stage_lead_status` VALUES ('1','1','1'),('10','6','10'),('11','6','11'),('12','6','12'),('13','6','13'),('14','6','14'),('15','6','15'),('16','6','16'),('17','7','17'),('18','7','18'),('19','8','19'),('2','2','2'),('20','8','20'),('21','8','21'),('22','9','22'),('23','10','1'),('24','11','23'),('3','3','3'),('4','4','4'),('5','5','5'),('6','5','6'),('7','6','7'),('8','6','8'),('9','6','9');
/*!40000 ALTER TABLE `relationship_sale_stage_lead_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES ('10383a42-90e6-be82-1b7a-6392dfd0f267','securitygroups_created_by','Users','users','id','SecurityGroups','securitygroups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('11f9aa7d-bc6a-66d3-a674-6392df6e9dc3','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('11fc80d1-0bfb-85e4-c92f-6392dff1d7cb','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('12305036-8bd0-1b73-d228-6392df86ad02','surveyquestionresponses_assigned_user','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('12348a07-9a4a-5cfa-39fa-6392df124892','alerts_created_by','Users','users','id','Alerts','alerts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1422d09e-75c4-3294-7c98-6392dfc45fdc','securitygroups_aos_invoices','SecurityGroups','securitygroups','id','AOS_Invoices','aos_invoices','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Invoices',0,0),('1437bfdc-dfce-bb65-aa80-6392dffb1971','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('145e6a12-bacd-791c-0ba4-6392dff50965','favorites_modified_user','Users','users','id','Favorites','favorites','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('161c48cb-f57d-51c3-bd92-6392dffc014e','aow_workflow_aow_actions','AOW_WorkFlow','aow_workflow','id','AOW_Actions','aow_actions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1626e196-c9e7-d292-c2a6-6392dfec8e6d','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('16357350-20d9-ea30-d47e-6392dfb2edbf','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('1707b843-5e02-2edc-46e1-6392df1fd537','aop_case_events_modified_user','Users','users','id','AOP_Case_Events','aop_case_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('17a17b3e-4f92-9701-b045-6392df086477','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1828572a-5a52-1652-3691-6392df502e09','alerts_assigned_user','Users','users','id','Alerts','alerts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('183b10db-f541-2f97-3d9f-6392df03ca11','contact_aos_quotes','Contacts','contacts','id','AOS_Quotes','aos_quotes','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('18504197-a4ba-0d86-0186-6392df4b90ee','securitygroups_surveyquestionresponses','SecurityGroups','securitygroups','id','SurveyQuestionResponses','surveyquestionresponses','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestionResponses',0,0),('1866187e-b077-81c4-ffa2-6392df3eba86','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1a26854b-9bf4-8d5d-74f3-6392df0c8379','favorites_created_by','Users','users','id','Favorites','favorites','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1a54fb9b-2095-879d-1c5a-6392df964e23','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('1ab4121c-d9ef-c4ce-06b6-6392df76e41a','aos_invoices_aos_product_quotes','AOS_Invoices','aos_invoices','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1c1069db-1dbe-f824-e989-6392df810b6e','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('1c117c05-1766-3de1-3e02-6392dfa2acce','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('1c439dc1-8cd6-5857-1261-6392df45ebaf','aop_case_events_created_by','Users','users','id','AOP_Case_Events','aop_case_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1c502c70-052a-5c32-425c-6392df5a7faa','aow_workflow_aow_processed','AOW_WorkFlow','aow_workflow','id','AOW_Processed','aow_processed','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1e2d8943-3edc-d394-e5b4-6392dfa42ce7','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1e38e632-5d2a-9166-d662-6392dfdd8990','contact_aos_invoices','Contacts','contacts','id','AOS_Invoices','aos_invoices','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1e47addf-d965-b898-8da6-6392df8e14ba','securitygroups_notes','SecurityGroups','securitygroups','id','Notes','notes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Notes',0,0),('1e5c0adf-8a2f-8719-fa4e-6392dfdb3693','calls_reschedule_assigned_user','Users','users','id','Calls_Reschedule','calls_reschedule','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1e6b72c2-f388-bb2d-dfe8-6392df259b8a','securitygroups_assigned_user','Users','users','id','SecurityGroups','securitygroups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2048ecc5-5a9c-217e-d605-6392dfb2546d','am_tasktemplates_am_projecttemplates','AM_ProjectTemplates','am_projecttemplates','id','AM_TaskTemplates','am_tasktemplates','id','am_tasktemplates_am_projecttemplates_c','am_tasktemplates_am_projecttemplatesam_projecttemplates_ida','am_tasktemplates_am_projecttemplatesam_tasktemplates_idb','many-to-many',NULL,NULL,0,0),('204efedc-5251-39f9-3242-6392df3809e5','favorites_assigned_user','Users','users','id','Favorites','favorites','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('206110b0-40c8-fd6e-eeff-6392df1332f6','aos_invoices_aos_line_item_groups','AOS_Invoices','aos_invoices','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2064473b-e5a5-5fb1-e02a-6392df74ba88','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('211a2c61-6450-28e1-d447-6392dfbe552e','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('226cea79-9bd8-2d88-60ae-6392df6b474b','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('227246d4-76d7-ea59-c2b1-6392df25611c','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('2282edf1-9392-f982-aa01-6392df65a105','aop_case_events_assigned_user','Users','users','id','AOP_Case_Events','aop_case_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('23267aa2-4393-c160-cf73-6392df0689bc','aow_processed_modified_user','Users','users','id','AOW_Processed','aow_processed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2477a60a-9056-2071-29d5-6392df78d083','contact_aos_contracts','Contacts','contacts','id','AOS_Contracts','aos_contracts','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('247bf80a-03d1-bbd0-d8ef-6392dfe07319','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2498a65a-eed5-cf58-b596-6392df20165c','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('259a9fd4-76cc-58b0-3c15-6392df6d65fd','outbound_email_modified_user','Users','users','id','OutboundEmailAccounts','outbound_email','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('25a40439-cd5e-cae0-7cc8-6392df87565d','aos_invoices_modified_user','Users','users','id','AOS_Invoices','aos_invoices','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('265ace73-7ca7-e6c2-9103-6392dfc4b292','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('26684089-8c5f-b05b-cad6-6392df74e7b6','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('28167fd1-7e46-ff44-a200-6392df121529','aos_pdf_templates_modified_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('284b2958-db70-d52a-63a5-6392df5af1da','cases_created_contact','Contacts','contacts','id','Cases','cases','contact_created_by_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2869d08d-3c8d-f7c9-b68e-6392df9de666','cases_aop_case_events','Cases','cases','id','AOP_Case_Events','aop_case_events','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('28858e7d-33d6-efbc-2e8e-6392dfb70a70','aos_contracts_documents','AOS_Contracts','aos_contracts','id','Documents','documents','id','aos_contracts_documents','aos_contracts_id','documents_id','many-to-many',NULL,NULL,0,0),('2888947d-9d93-2b44-aca5-6392dfc8ab91','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('28d4cf0e-d22f-129d-c285-6392df3919b5','surveyquestions_modified_user','Users','users','id','SurveyQuestions','surveyquestions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a65303e-5025-8818-24b9-6392df58d332','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a67543b-34b5-05ac-7862-6392dfffa47f','contacts_aop_case_updates','Contacts','contacts','id','AOP_Case_Updates','aop_case_updates','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2c98019f-b786-479a-89b2-6392df251c50','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('2ca1d010-9c63-2d8c-c4de-6392df5f5a65','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2ca82b28-9570-8d9f-f74e-6392df07edf2','outbound_email_created_by','Users','users','id','OutboundEmailAccounts','outbound_email','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2d5facbe-8d4f-00c1-8b06-6392df362b8b','aok_knowledge_base_categories_modified_user','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2e9a62c9-90db-0795-85e9-6392dfba20f7','aos_quotes_aos_contracts','AOS_Quotes','aos_quotes','id','AOS_Contracts','aos_contracts','id','aos_quotes_os_contracts_c','aos_quotese81e_quotes_ida','aos_quotes4dc0ntracts_idb','many-to-many',NULL,NULL,0,0),('2e9b3412-df31-bf4b-032b-6392df65f932','securitygroups_projecttask','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('2ea0df49-95b0-d481-6ba6-6392df40eb0a','aos_pdf_templates_created_by','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2ea13864-df37-c7ec-4315-6392df8d648d','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('2ea5375b-ad02-aa23-d604-6392dfdbadc5','aow_processed_created_by','Users','users','id','AOW_Processed','aow_processed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2f9a238d-1018-62d3-8c56-6392dfe6e3df','aop_case_updates_modified_user','Users','users','id','AOP_Case_Updates','aop_case_updates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('307069af-4402-a0da-8e71-6392df5f8531','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3237ca5e-bf24-d23f-6294-6392df35525d','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('32941be6-5979-94e5-892d-6392dfbf06b5','securitygroups_documents','SecurityGroups','securitygroups','id','Documents','documents','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Documents',0,0),('329c0a25-9427-504b-85ba-6392df4667e7','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('32c204dd-465a-b952-5152-6392df37da5b','outbound_email_assigned_user','Users','users','id','OutboundEmailAccounts','outbound_email','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('334a31e9-b366-b979-0ca4-6392dfdb96d1','aok_knowledge_base_categories_created_by','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('337b1899-6e9c-e3ca-7b43-6392df4fc27f','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('347b6382-e88e-acfc-d0d3-6392df9ce1da','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('34a7a671-f9b3-fbac-9036-6392df87d9ec','aop_case_updates_created_by','Users','users','id','AOP_Case_Updates','aop_case_updates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('34bf5942-157f-edf1-9f4e-6392dffb1f56','aos_quotes_aos_invoices','AOS_Quotes','aos_quotes','id','AOS_Invoices','aos_invoices','id','aos_quotes_aos_invoices_c','aos_quotes77d9_quotes_ida','aos_quotes6b83nvoices_idb','many-to-many',NULL,NULL,0,0),('34cb73c0-e83d-1bc0-5003-6392df42ff06','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('34e47d43-9d06-a3f7-887d-6392dff803d9','surveyquestions_created_by','Users','users','id','SurveyQuestions','surveyquestions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('35534d14-d968-bf48-d4d0-6392df815917','aos_pdf_templates_assigned_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('35b397aa-daaf-8691-261b-6392df46f1f5','aow_conditions_modified_user','Users','users','id','AOW_Conditions','aow_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3688921e-1192-2ed1-8dbb-6392dfeb8916','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('38a2029a-dd9e-64b0-ab7e-6392dfe87fc0','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('38b3c88f-ecd6-a9af-0d54-6392dfbdd6df','aok_knowledge_base_categories_assigned_user','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('38d5b8dc-6499-d9b1-abb4-6392df352b00','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('39da8b53-e112-2d09-a7d1-6392dfdde5a3','templatesectionline_modified_user','Users','users','id','TemplateSectionLine','templatesectionline','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3ab60436-bed8-6fd3-e284-6392df57e0bb','securitygroups_prospects','SecurityGroups','securitygroups','id','Prospects','prospects','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Prospects',0,0),('3aca2937-0aac-8876-379c-6392df5eaf95','aop_case_updates_assigned_user','Users','users','id','AOP_Case_Updates','aop_case_updates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3ad3385f-cf9c-e14e-3ccf-6392dff3b305','aos_quotes_project','AOS_Quotes','aos_quotes','id','Project','project','id','aos_quotes_project_c','aos_quotes1112_quotes_ida','aos_quotes7207project_idb','many-to-many',NULL,NULL,0,0),('3adc9e27-5f11-74a5-4bc6-6392df24bfe6','aow_conditions_created_by','Users','users','id','AOW_Conditions','aow_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3adedf66-9ef8-2977-8579-6392df602868','securitygroups_aos_pdf_templates','SecurityGroups','securitygroups','id','AOS_PDF_Templates','aos_pdf_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_PDF_Templates',0,0),('3af8042a-9e62-2304-2d5b-6392df48f144','securitygroups_cases','SecurityGroups','securitygroups','id','Cases','cases','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Cases',0,0),('3bc308dc-c8da-9748-0a79-6392df178893','aod_index_modified_user','Users','users','id','AOD_Index','aod_index','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3be51ebf-660e-f93f-544d-6392df03fa5e','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3d007a2e-1dfe-c5e8-2be8-6392df41c704','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3d0c0305-e6ae-cbd0-d7ac-6392dfd2c6a0','aow_workflow_assigned_user','Users','users','id','AOW_WorkFlow','aow_workflow','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3edb094d-5a35-5514-a729-6392df7cd302','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3ee1825b-126f-0db8-53f7-6392dff0c20d','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3f888ccc-b1e2-a54a-f8fe-6392df42f867','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3fe7a1c4-e4e5-d889-6afd-6392df4686e6','aok_knowledgebase_modified_user','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('40d3929c-f686-9ccc-fb9b-6392df341021','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('40f25ded-12c1-5cad-5754-6392dfe82054','templatesectionline_created_by','Users','users','id','TemplateSectionLine','templatesectionline','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('40f54db5-a8fa-110e-f993-6392dfe3efea','aow_processed_aow_actions','AOW_Processed','aow_processed','id','AOW_Actions','aow_actions','id','aow_processed_aow_actions','aow_processed_id','aow_action_id','many-to-many',NULL,NULL,0,0),('4113990d-474f-4d6f-7327-6392dfab499f','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('413c7ce9-4fe7-b834-75a5-6392df64157c','cases_aop_case_updates','Cases','cases','id','AOP_Case_Updates','aop_case_updates','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('42c64ea5-080e-4325-18a2-6392df0a8983','jjwg_maps_modified_user','Users','users','id','jjwg_Maps','jjwg_maps','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('44d78588-f81b-d00b-68b9-6392df8a7b18','securitygroups_accounts','SecurityGroups','securitygroups','id','Accounts','accounts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Accounts',0,0),('44d9605e-e7bc-0fda-6f01-6392df3c69a9','aok_knowledgebase_created_by','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('45250197-dc4e-54fe-765a-6392df453fd1','aos_product_categories_modified_user','Users','users','id','AOS_Product_Categories','aos_product_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('459a660a-ae14-bf17-bc01-6392df1af478','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('46f6971f-cbd2-5c5e-9966-6392df0926f0','aop_case_updates_notes','AOP_Case_Updates','aop_case_updates','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOP_Case_Updates',0,0),('470c2396-3215-230b-fc28-6392df615450','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('470d606e-285d-3afa-9ec7-6392df908c6c','fp_event_locations_fp_events_1','FP_Event_Locations','fp_event_locations','id','FP_events','fp_events','id','fp_event_locations_fp_events_1_c','fp_event_locations_fp_events_1fp_event_locations_ida','fp_event_locations_fp_events_1fp_events_idb','many-to-many',NULL,NULL,0,0),('489f0c0f-e17b-b694-f76a-6392df0e2ece','am_projecttemplates_contacts_1','AM_ProjectTemplates','am_projecttemplates','id','Contacts','contacts','id','am_projecttemplates_contacts_1_c','am_projecttemplates_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('48a407b8-709c-17c1-1719-6392dfd864c2','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('4929faf7-70c8-2be0-9f26-6392dfea760c','jjwg_maps_created_by','Users','users','id','jjwg_Maps','jjwg_maps','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4a46e7d0-4796-d670-d1a5-6392dfb39570','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('4a692468-3831-1e0c-25f0-6392dfba76d5','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('4b03f2a4-03d6-ce07-7d09-6392df5b123c','aok_knowledgebase_assigned_user','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4b14cf44-51d5-6274-b914-6392df7e39f9','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('4b1f0dff-ab5d-cb18-6d39-6392dfac2e64','aos_product_categories_created_by','Users','users','id','AOS_Product_Categories','aos_product_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4d0ae44f-43f1-48e6-2c1b-6392df93e445','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('4d594787-812e-13a2-e901-6392df0ee27e','fp_events_contacts','FP_events','fp_events','id','Contacts','contacts','id','fp_events_contacts_c','fp_events_contactsfp_events_ida','fp_events_contactscontacts_idb','many-to-many',NULL,NULL,0,0),('4f3422bc-9a68-a6d6-7a87-6392df28adbd','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4f3e232a-d14e-60e9-19e1-6392dfd99237','jjwg_maps_assigned_user','Users','users','id','jjwg_Maps','jjwg_maps','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4f3fb8d4-c334-94b4-c265-6392dfeadeaa','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('4fce039f-87bb-881c-00aa-6392df6eb39e','am_tasktemplates_assigned_user','Users','users','id','AM_TaskTemplates','am_tasktemplates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4fced3c9-0ddd-55ff-1a13-6392dfe41025','aor_reports_modified_user','Users','users','id','AOR_Reports','aor_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('504289aa-c98f-5b31-2d3e-6392df8ab974','oauth2tokens_modified_user','Users','users','id','OAuth2Tokens','oauth2tokens','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5109fceb-fdfd-280a-9f81-6392df6fbfb8','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('510bfd4c-7cb7-ee05-96f3-6392dfba99a7','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('511751b1-4f1f-6a45-5b02-6392df0add6c','securitygroups_aok_knowledgebase','SecurityGroups','securitygroups','id','AOK_KnowledgeBase','aok_knowledgebase','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOK_KnowledgeBase',0,0),('511df9e1-f1ff-ec44-135f-6392dfc6a577','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('512a4060-8dab-6890-2737-6392df537343','aos_product_categories_assigned_user','Users','users','id','AOS_Product_Categories','aos_product_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5343354d-e7ca-669b-ff21-6392df965c1a','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('535fd505-3af0-c4d3-8516-6392dfbe37b2','fp_events_fp_event_locations_1','FP_events','fp_events','id','FP_Event_Locations','fp_event_locations','id','fp_events_fp_event_locations_1_c','fp_events_fp_event_locations_1fp_events_ida','fp_events_fp_event_locations_1fp_event_locations_idb','many-to-many',NULL,NULL,0,0),('550cbdd0-727b-d6e1-55c3-6392dfb70131','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('553a488c-02b9-0421-5fcc-6392dfd7fc08','aor_reports_created_by','Users','users','id','AOR_Reports','aor_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('556d64f1-150a-cc07-bd5b-6392dfad1d01','securitygroups_jjwg_maps','SecurityGroups','securitygroups','id','jjwg_Maps','jjwg_maps','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Maps',0,0),('573e9492-6c35-f8ca-968a-6392df8634a4','securitygroups_aos_product_categories','SecurityGroups','securitygroups','id','AOS_Product_Categories','aos_product_categories','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Product_Categories',0,0),('574b0d79-a350-6188-3d7f-6392df9183fa','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('578877b0-bf1f-884b-1f06-6392df78db8e','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('57c4318b-9b47-cf83-8beb-6392df9286bc','securitygroups_calls','SecurityGroups','securitygroups','id','Calls','calls','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Calls',0,0),('5804d12c-bb36-dc26-236e-6392dfeb6d56','reminders_modified_user','Users','users','id','Reminders','reminders','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('58ca5de4-438d-db6d-11ca-6392df1a35ae','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5941d6c8-fe76-3de6-239a-6392dfeab4a5','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('59918e06-0ce8-1011-ab6e-6392dffda259','fp_events_leads_1','FP_events','fp_events','id','Leads','leads','id','fp_events_leads_1_c','fp_events_leads_1fp_events_ida','fp_events_leads_1leads_idb','many-to-many',NULL,NULL,0,0),('5b4e07b1-b44a-1ac0-1845-6392df0ad074','securitygroups_emailtemplates','SecurityGroups','securitygroups','id','EmailTemplates','email_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','EmailTemplates',0,0),('5b51f1a1-16fe-1510-84cb-6392df49a5ba','aor_reports_assigned_user','Users','users','id','AOR_Reports','aor_reports','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5b6c61fe-9504-72b3-5a64-6392dfecd759','jjwg_Maps_accounts','jjwg_Maps','jjwg_Maps','parent_id','Accounts','accounts','id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('5b797275-bc6a-59d3-3784-6392df4a6d8e','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('5d459665-e286-2ddf-f48a-6392df6614c0','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5d5b9e68-3005-1287-9762-6392dfc1a138','sub_product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Product_Categories','aos_product_categories','parent_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5d654367-3ff1-be12-c1e2-6392dfe1a122','oauth2tokens_created_by','Users','users','id','OAuth2Tokens','oauth2tokens','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5d9d4995-bce8-de21-fd78-6392dff71f74','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','job_queue','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5f7f6056-7072-414b-6277-6392df08c6b5','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('5f8f7fa3-41d3-102e-9c2a-6392df4f8ac9','fp_events_prospects_1','FP_events','fp_events','id','Prospects','prospects','id','fp_events_prospects_1_c','fp_events_prospects_1fp_events_ida','fp_events_prospects_1prospects_idb','many-to-many',NULL,NULL,0,0),('61501b4c-d1a2-fd2e-1c0b-6392dfc800fa','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('615084d4-9101-2244-edbe-6392dfc81067','spots_modified_user','Users','users','id','Spots','spots','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('615f6c79-06d8-4ad3-e398-6392df38fc76','securitygroups_aor_reports','SecurityGroups','securitygroups','id','AOR_Reports','aor_reports','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOR_Reports',0,0),('61a2744e-d2ef-beb6-ae57-6392dfefdef9','jjwg_Maps_contacts','jjwg_Maps','jjwg_Maps','parent_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('636681d6-3a30-ebc8-7140-6392df8ae028','reminders_created_by','Users','users','id','Reminders','reminders','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('63824df5-09c0-0a2c-c80a-6392dfe424eb','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('64d6ea2c-503a-9bfe-678d-6392dfbac409','aos_products_modified_user','Users','users','id','AOS_Products','aos_products','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('656e37c6-9fbc-41c7-e31b-6392df16ba5e','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('65c3a166-fd46-ca1e-2cd8-6392df9e946d','jjwg_maps_jjwg_areas','jjwg_Maps','jjwg_maps','id','jjwg_Areas','jjwg_areas','id','jjwg_maps_jjwg_areas_c','jjwg_maps_5304wg_maps_ida','jjwg_maps_41f2g_areas_idb','many-to-many',NULL,NULL,0,0),('66c26b14-6d08-41ad-b4ff-6392df95278a','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('67120a4a-1e0a-81e2-235d-6392df2bc3d5','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('677b778a-bae8-ff7e-d85d-6392dfcf9336','aor_reports_aor_fields','AOR_Reports','aor_reports','id','AOR_Fields','aor_fields','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('67994be2-384f-9c8b-0ca7-6392df07240e','spots_created_by','Users','users','id','Spots','spots','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('67a8740d-876e-7f53-e3d7-6392dff36377','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('68909233-82a3-206c-7108-6392dfd38b1f','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('69734752-2266-a3ea-b226-6392dfa5a8c1','reminders_assigned_user','Users','users','id','Reminders','reminders','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('697ff52f-9dea-0f5f-14aa-6392dfb781c2','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('6b9083aa-a372-3560-d190-6392df3ba909','aos_products_created_by','Users','users','id','AOS_Products','aos_products','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6ba6e90a-d02b-5a5e-b9d6-6392df77d8ad','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('6ba7e624-8c33-bd0f-4c1e-6392df829bda','oauth2tokens_assigned_user','Users','users','id','OAuth2Tokens','oauth2tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6bb578d6-268b-0302-65a2-6392df86ca15','jjwg_maps_jjwg_markers','jjwg_Maps','jjwg_maps','id','jjwg_Markers','jjwg_markers','id','jjwg_maps_jjwg_markers_c','jjwg_maps_b229wg_maps_ida','jjwg_maps_2e31markers_idb','many-to-many',NULL,NULL,0,0),('6bcddd7a-6639-9bcc-deb7-6392dfb173bd','surveyquestions_assigned_user','Users','users','id','SurveyQuestions','surveyquestions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d7edac1-4917-9862-dfb7-6392df54f83e','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d94bb73-57ff-a475-74b0-6392df3fce7a','spots_assigned_user','Users','users','id','Spots','spots','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d975897-7bcc-d752-ef93-6392df5a45a0','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d9d10e3-e3e3-1dc8-6f85-6392dfe12fae','aor_reports_aor_conditions','AOR_Reports','aor_reports','id','AOR_Conditions','aor_conditions','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6de333b6-82ad-7c94-a6df-6392dfb8b5fc','calls_reschedule','Calls','calls','id','Calls_Reschedule','calls_reschedule','call_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6fc20651-d823-1663-5c6c-6392df577aa5','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('6fd4bbda-0893-37d5-da12-6392dfa14989','jjwg_Maps_leads','jjwg_Maps','jjwg_Maps','parent_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('7067c71f-87ec-dc08-0b26-6392dff1e5d4','reminders_invitees_modified_user','Users','users','id','Reminders_Invitees','reminders_invitees','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('719fc08a-5435-3034-40e2-6392df95889e','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('71ae0820-cc29-a935-30f6-6392dfa1e432','aos_products_assigned_user','Users','users','id','AOS_Products','aos_products','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('71d9db14-bb11-ee6e-84e8-6392dfbf043a','project_contacts_1','Project','project','id','Contacts','contacts','id','project_contacts_1_c','project_contacts_1project_ida','project_contacts_1contacts_idb','many-to-many',NULL,NULL,0,0),('72a30fbf-dee5-5208-29e3-6392df63cf9e','oauth2clients_modified_user','Users','users','id','OAuth2Clients','oauth2clients','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('73b6ebaa-d7df-b861-2b34-6392df42bbd6','aor_scheduled_reports_aor_reports','AOR_Reports','aor_reports','id','AOR_Scheduled_Reports','aor_scheduled_reports','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('73d23d32-a3de-d69a-0bc4-6392dfc0a796','securitygroups_spots','SecurityGroups','securitygroups','id','Spots','spots','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Spots',0,0),('73f7bd38-5a59-2027-b21c-6392dfb1a34b','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7530bf46-a520-394b-796e-6392dfdfffe4','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7555dd4e-eb06-2dc9-3957-6392dfd9af09','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('75a9bdd0-4ab5-f01f-d437-6392df7894ef','reminders_invitees_created_by','Users','users','id','Reminders_Invitees','reminders_invitees','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('75b0f897-3964-26bd-1cd4-6392df4d750c','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('76fa9070-d6de-b1e0-c025-6392dfce117a','securitygroups_bugs','SecurityGroups','securitygroups','id','Bugs','bugs','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Bugs',0,0),('77d5211f-87c8-0e54-8abd-6392df5130d2','securitygroups_aos_products','SecurityGroups','securitygroups','id','AOS_Products','aos_products','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Products',0,0),('77d8e547-0e22-7be2-4b77-6392df469072','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('77ef8963-aca9-78ca-a1d1-6392dfa045e0','project_users_1','Project','project','id','Users','users','id','project_users_1_c','project_users_1project_ida','project_users_1users_idb','many-to-many',NULL,NULL,0,0),('79d4c49c-2d57-dc24-7598-6392df0d817d','securitygroups_contacts','SecurityGroups','securitygroups','id','Contacts','contacts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Contacts',0,0),('79e13736-a46d-a6a8-b283-6392df901b1e','securitygroups_surveyquestions','SecurityGroups','securitygroups','id','SurveyQuestions','surveyquestions','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestions',0,0),('7a8c57d7-e6c2-4315-007a-6392dfdf0191','aobh_businesshours_modified_user','Users','users','id','AOBH_BusinessHours','aobh_businesshours','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ac12915-51a2-a8dc-e590-6392df02840b','aor_fields_modified_user','Users','users','id','AOR_Fields','aor_fields','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7bbc8a5b-e42c-4dfb-ccac-6392df8193e0','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7bec88e1-f42f-05db-100b-6392df805698','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('7c134d13-d0e7-34a8-ae82-6392dff3c57d','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7d25ac82-dd44-362a-6dae-6392df805cc1','reminders_invitees_assigned_user','Users','users','id','Reminders_Invitees','reminders_invitees','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7dd605e0-cbdb-fa8d-7753-6392dfbe50ed','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('7e0bbdd3-a32b-e0ff-7fd9-6392df9aa89d','jjwg_Maps_opportunities','jjwg_Maps','jjwg_Maps','parent_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('7e0bf234-0bbd-8b10-51ae-6392df4967c2','securitygroups_acl_roles','SecurityGroups','securitygroups','id','ACLRoles','acl_roles','id','securitygroups_acl_roles','securitygroup_id','role_id','many-to-many',NULL,NULL,0,0),('7ec3517d-4606-d339-b874-6392df8bc83d','product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Products','aos_products','aos_product_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7f240875-7d43-399c-319b-6392df1d23ba','aos_invoices_created_by','Users','users','id','AOS_Invoices','aos_invoices','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7fe4e7ca-97fc-b96e-b41a-6392dfbd96ad','aor_fields_created_by','Users','users','id','AOR_Fields','aor_fields','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7fed8858-9410-3d6c-23b5-6392dfd49a3e','oauth2clients_created_by','Users','users','id','OAuth2Clients','oauth2clients','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('800097c9-f691-700d-dc2c-6392df30bc50','aobh_businesshours_created_by','Users','users','id','AOBH_BusinessHours','aobh_businesshours','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('801203f9-519f-7fce-877c-6392df7bcdab','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('80277d65-94a5-c7e3-f04e-6392df20a8c6','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('81e139f3-6871-c54b-d3bf-6392df2fe181','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81f280b7-eaca-2254-f13f-6392df32a695','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8217995f-221a-038f-0ea0-6392df2e2913','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('840eea75-224a-c40f-60ea-6392df95f46d','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('841d8632-2dbf-94dc-2565-6392dfd31d6d','jjwg_Maps_cases','jjwg_Maps','jjwg_Maps','parent_id','Cases','cases','id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('85285dfa-bc94-b188-a92b-6392dfc53305','securitygroups_project_task','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('854c911d-807d-7aaa-f5b7-6392df404ac6','aos_products_quotes_modified_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('85e200ad-c125-3c18-81aa-6392df6fb86c','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('8604a671-2de1-a889-5b59-6392df43bf98','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('86176695-bf87-a503-dd0b-6392df4938f4','surveyquestions_surveyquestionoptions','SurveyQuestions','surveyquestions','id','SurveyQuestionOptions','surveyquestionoptions','survey_question_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('86d36d69-ed25-9816-9b03-6392dfa86b0c','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8705f20b-cfd6-9a22-356b-6392dfb24b49','aor_charts_modified_user','Users','users','id','AOR_Charts','aor_charts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('87ef8d33-a4a7-9c46-8b2f-6392df4166b5','securitygroups_campaigns','SecurityGroups','securitygroups','id','Campaigns','campaigns','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Campaigns',0,0),('884857f9-b22c-6758-8a92-6392df747272','securitygroups_emails','SecurityGroups','securitygroups','id','Emails','emails','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Emails',0,0),('8892fa61-59d2-2b9d-be25-6392df2f8048','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('8a054af0-9383-78ad-464d-6392df12b9ae','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('8a396f72-63d8-dfc4-a980-6392dff1efcf','jjwg_Maps_projects','jjwg_Maps','jjwg_Maps','parent_id','Project','project','id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('8ac0870f-a213-7094-fe9c-6392dff00e0c','fp_events_modified_user','Users','users','id','FP_events','fp_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8c1b22bd-2be8-a6ad-17f6-6392dfa74775','aor_charts_created_by','Users','users','id','AOR_Charts','aor_charts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8c2805aa-a4a9-b35b-4266-6392dfcfb146','aos_products_quotes_created_by','Users','users','id','AOS_Products_Quotes','aos_products_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8c393218-822d-889d-7215-6392df697126','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8c47560f-a51f-8848-4848-6392df4a394a','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('8c8199be-fc25-e474-f92b-6392df610496','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e15af97-1efd-eb80-0e35-6392df9716a7','account_aos_quotes','Accounts','accounts','id','AOS_Quotes','aos_quotes','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e22daaf-5287-dcc7-64db-6392dfd7f99d','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e27d675-2615-4651-0249-6392df54191f','oauth2clients_oauth2tokens','OAuth2Clients','oauth2clients','id','OAuth2Tokens','oauth2tokens','client',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e2ac6bc-43ec-b594-68c9-6392dfae4e22','surveyquestionoptions_modified_user','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e4bd8ef-84c0-8602-08d3-6392df6c5e47','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e53b417-c986-17b2-d0ae-6392df57335a','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('90441cdf-b703-f035-a30f-6392df9ff40e','fp_events_created_by','Users','users','id','FP_events','fp_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9045fcb1-f078-a11a-3c42-6392dff40937','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('904a5da7-8eb8-356a-7bbf-6392df397ee5','jjwg_Maps_meetings','jjwg_Maps','jjwg_Maps','parent_id','Meetings','meetings','id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('921f8e70-afa7-a17d-8515-6392df0d39ef','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('92272b7f-ac0a-68f5-351f-6392df0493f2','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('92377c26-5db8-476f-a04e-6392df26edea','aos_products_quotes_assigned_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('923a302d-c2a9-6fd6-bbf6-6392df2b1676','aor_charts_aor_reports','AOR_Reports','aor_reports','id','AOR_Charts','aor_charts','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('927cecff-3770-ae4e-eeff-6392df4026e9','securitygroups_prospect_lists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('92c3470e-c68c-5502-f716-6392df086284','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('942685e0-67f8-38cf-2868-6392df8d64ec','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('944bf0fd-8bb1-383d-28d0-6392df462209','surveyquestionoptions_created_by','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('945509ff-262f-c904-9e98-6392df5b7996','account_aos_invoices','Accounts','accounts','id','AOS_Invoices','aos_invoices','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('94664bc6-54dd-f196-1f99-6392df3bd0f5','oauth2clients_assigned_user','Users','users','id','OAuth2Clients','oauth2clients','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9477d85c-36ae-a9cc-8a07-6392df2a23d2','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('96448461-a67c-5699-5663-6392df2195a3','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('96708b47-54a2-9f56-2688-6392dfd26214','jjwg_Maps_prospects','jjwg_Maps','jjwg_Maps','parent_id','Prospects','prospects','id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('96748194-438d-fdc4-42ca-6392df0260e3','fp_events_assigned_user','Users','users','id','FP_events','fp_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('97be0470-af42-c081-7034-6392df23703f','securitygroups_modified_user','Users','users','id','SecurityGroups','securitygroups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('98557c6e-f529-bb2a-6b86-6392dfa5e4bf','aos_product_quotes_aos_products','AOS_Products','aos_products','id','AOS_Products_Quotes','aos_products_quotes','product_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('987f3177-e1c6-cd63-b0a2-6392df766d61','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('9891e526-9c85-d7d4-f834-6392df79fb2e','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a418abe-32ff-67da-eec9-6392df35636a','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a45ac9a-180d-55a8-f683-6392df6ee2f9','account_aos_contracts','Accounts','accounts','id','AOS_Contracts','aos_contracts','contract_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a4b8526-ab42-d803-50a6-6392df4caa97','aor_conditions_modified_user','Users','users','id','AOR_Conditions','aor_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a5080ca-d119-1b15-5ee6-6392dfd97767','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('9a78196f-f2be-dca3-e941-6392dfd523a3','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9acb9a05-0df3-3d16-75a8-6392df2d0c7c','surveyquestionoptions_assigned_user','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9b20a1f9-8773-3824-ebef-6392df06370a','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c72a963-f2bd-84a0-b32a-6392df5b333c','securitygroups_fp_events','SecurityGroups','securitygroups','id','FP_events','fp_events','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','FP_events',0,0),('9c7c7446-2fd6-0ada-6a33-6392dfc19713','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('9e485cc0-fa87-7626-6649-6392df619d28','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9e8fc09a-e2e4-6e1d-19cb-6392df46ec16','jjwg_markers_modified_user','Users','users','id','jjwg_Markers','jjwg_markers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9f4f01b4-67c5-a031-aaba-6392df1491b7','securitygroups_aow_workflow','SecurityGroups','securitygroups','id','AOW_WorkFlow','aow_workflow','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOW_WorkFlow',0,0),('9f78d92b-e757-7eed-d532-6392df268fbb','aos_line_item_groups_modified_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a01706b7-97d7-827a-2cc4-6392dfb5adba','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('a0342428-33de-d4d0-4260-6392df834dcc','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a0360a19-c8a1-b8a1-d3db-6392df16f11f','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('a059991e-619b-16e2-7a47-6392dfcfa1a5','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a06faf0e-7c4f-4962-082b-6392df313f97','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a0794814-232e-c133-c8fe-6392dfcd28cd','securitygroups_surveyquestionoptions','SecurityGroups','securitygroups','id','SurveyQuestionOptions','surveyquestionoptions','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestionOptions',0,0),('a09faeb1-69fd-2988-cac9-6392dfe809c2','aor_conditions_created_by','Users','users','id','AOR_Conditions','aor_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a0b0fd86-328e-738c-7a7c-6392df018158','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('a0d6a3d5-c2f1-7706-d92a-6392df4e5a92','securitygroups_users','SecurityGroups','securitygroups','id','Users','users','id','securitygroups_users','securitygroup_id','user_id','many-to-many',NULL,NULL,0,0),('a131008a-3c3b-5dd1-d46f-6392dff54d0f','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('a27233ad-8d79-f3cd-2b51-6392dfeb5bea','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('a2e88955-bf2a-53bb-8abe-6392df9b2d15','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a487a159-0729-bdc6-454e-6392dfd2dddf','aos_line_item_groups_created_by','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a4ae7de8-d43f-a627-1acf-6392df1c70c1','jjwg_markers_created_by','Users','users','id','jjwg_Markers','jjwg_markers','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a4b0662d-c31d-16f5-d6f6-6392df09b727','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a5979b43-5415-bc0f-d2ee-6392df82636b','fp_event_locations_modified_user','Users','users','id','FP_Event_Locations','fp_event_locations','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a68b7177-0f20-f0e2-fc1a-6392dfddbdf3','emails_aos_contracts_rel','Emails','emails','id','AOS_Contracts','aos_contracts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','AOS_Contracts',0,0),('a6a8581b-1425-28d1-1c5e-6392df4abfcb','securitygroups_leads','SecurityGroups','securitygroups','id','Leads','leads','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Leads',0,0),('a6a9a28d-5998-c78c-426e-6392dfac2a8d','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a6b92623-0725-57be-f158-6392df184797','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a6ce0e44-4ad7-1210-3c4c-6392df15e232','surveyquestionoptions_surveyquestionresponses','SurveyQuestionOptions','surveyquestionoptions','id','SurveyQuestionResponses','surveyquestionresponses','id','surveyquestionoptions_surveyquestionresponses','surveyq72c7options_ida','surveyq10d4sponses_idb','many-to-many',NULL,NULL,0,0),('a7420cb9-8894-6ccf-81f8-6392dfb607ca','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a784b413-db6d-f128-0064-6392dfe66912','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('a8881747-de34-8e2e-0bd0-6392dfc2271a','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a90000c1-4361-5bbf-01ab-6392df9f2504','aor_scheduled_reports_modified_user','Users','users','id','AOR_Scheduled_Reports','aor_scheduled_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a9950e7d-4f4a-0da3-09cf-6392df9aff6b','aod_index_created_by','Users','users','id','AOD_Index','aod_index','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aaa9cf7f-47e3-b70b-9a2f-6392df49b6e8','aos_line_item_groups_assigned_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aab1a11e-d72c-11c9-3b5d-6392df045f4a','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('aabf81ec-eab2-d4dc-0bc1-6392df665eec','jjwg_markers_assigned_user','Users','users','id','jjwg_Markers','jjwg_markers','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ab32355e-634c-a296-ba74-6392dfb1102e','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ac694766-425a-de16-cd6d-6392df5ff928','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('ac968763-caec-0bf1-de85-6392df6de5f3','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('acbd5a89-13cd-ee26-c5fa-6392dfe6e532','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('ace24fcc-eb69-54e4-c620-6392df5fcbf1','emails_meetings_rel','Emails','emails','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ad5facd3-c1d8-892c-6400-6392df0a8df7','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauth_consumer','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aece9f17-e89f-eb8f-7114-6392df543f93','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aed71084-2c21-1870-a3b4-6392df1ab7ef','aor_scheduled_reports_created_by','Users','users','id','AOR_Scheduled_Reports','aor_scheduled_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b0c3be19-dcd3-a685-8512-6392df5b6c6a','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('b0c92992-dfcd-4c70-cf9d-6392df9f1346','groups_aos_product_quotes','AOS_Line_Item_Groups','aos_line_item_groups','id','AOS_Products_Quotes','aos_products_quotes','group_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b0da2400-4b6b-1479-8a81-6392df653559','securitygroups_jjwg_markers','SecurityGroups','securitygroups','id','jjwg_Markers','jjwg_markers','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Markers',0,0),('b0e77474-d18a-a76b-ff03-6392dfd64639','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('b11256e1-22e9-d594-e8bb-6392dfadb7b4','surveyresponses_modified_user','Users','users','id','SurveyResponses','surveyresponses','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2da51cd-174e-87f3-9f38-6392dfe049bf','oauthkeys_created_by','Users','users','id','OAuthKeys','oauth_consumer','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b2dd9598-dff8-e39d-9193-6392df390b9e','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('b2f040f0-8595-ca50-9a3a-6392df10bdc9','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('b2ff118f-3519-9acd-e965-6392df900596','fp_event_locations_created_by','Users','users','id','FP_Event_Locations','fp_event_locations','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b308b7cf-6a5a-e76b-b952-6392df896b1b','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b4400e43-c1d3-b673-d1e8-6392dfc7aa32','surveyquestionresponses_modified_user','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b4be3a14-6f33-1e4a-2907-6392dfa4b30e','securitygroups_opportunities','SecurityGroups','securitygroups','id','Opportunities','opportunities','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Opportunities',0,0),('b52a52fe-af2b-bcf5-4358-6392df3543a8','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b6b38dda-7aae-6982-c45e-6392df08c5ce','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('b6d30655-1518-14b7-dc4d-6392dfd54d3d','surveyresponses_created_by','Users','users','id','SurveyResponses','surveyresponses','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b7eb0c12-33f4-b533-57df-6392df30bc35','aos_contracts_modified_user','Users','users','id','AOS_Contracts','aos_contracts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b8719f35-06d6-f761-3baf-6392df20e6cf','aos_quotes_modified_user','Users','users','id','AOS_Quotes','aos_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b89cf857-cab5-0b4b-1398-6392dfca376a','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b8bae1c0-613f-4a5a-21db-6392dfd6852a','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b8cb31c9-ae23-b5ea-8ff4-6392dfce750f','jjwg_areas_modified_user','Users','users','id','jjwg_Areas','jjwg_areas','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b8cb7622-9b60-daab-5e46-6392df3e30f2','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauth_consumer','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b8e45506-561d-2aed-c610-6392dfb67c57','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('bb07b637-933b-6b1f-fddd-6392df49028e','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('bb1b3ee2-ee6b-d6ba-72f3-6392df64a8fb','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bd087d12-9536-8186-3b28-6392df1f6f63','aos_contracts_created_by','Users','users','id','AOS_Contracts','aos_contracts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bd0c8e20-5945-49a6-425d-6392df26ec43','surveyresponses_assigned_user','Users','users','id','SurveyResponses','surveyresponses','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bdd109b0-556f-7068-d3a0-6392df4a28a3','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('be061b3a-8a78-3978-aa71-6392dfb741ed','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('befc7cfe-0cd6-c0e5-bbe8-6392df0b8d2d','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('bf070594-9d81-b618-7d89-6392df8bfe26','aos_quotes_created_by','Users','users','id','AOS_Quotes','aos_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bf1232df-a146-9240-025f-6392dfd1ee12','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('bf1281fa-92e8-c756-b68b-6392dfe2ae5f','jjwg_areas_created_by','Users','users','id','jjwg_Areas','jjwg_areas','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bf2106e5-4ce3-c0db-a3d4-6392dfe5bbac','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('bf212f3b-68bd-e363-4cd1-6392df3686f7','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bf5903de-ff89-3c20-3319-6392df924956','am_projecttemplates_users_1','AM_ProjectTemplates','am_projecttemplates','id','Users','users','id','am_projecttemplates_users_1_c','am_projecttemplates_ida','users_idb','many-to-many',NULL,NULL,0,0),('bf8062e8-fc2d-ebbd-77bc-6392dfa25a4a','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c0ec904b-4c70-af22-12e5-6392df590020','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c0f4a65b-4c89-c74e-9cae-6392df4e5706','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('c11a1f00-f548-2d00-79bf-6392df5e0a39','fp_event_locations_assigned_user','Users','users','id','FP_Event_Locations','fp_event_locations','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c28a09ff-f6c0-72ad-fc46-6392df46407b','surveyquestionresponses_created_by','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c2e67fbc-4374-2a47-aa5e-6392df19f065','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c3151cab-8e53-f4f8-9122-6392dfa8829b','securitygroups_surveyresponses','SecurityGroups','securitygroups','id','SurveyResponses','surveyresponses','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyResponses',0,0),('c3313ee6-e4b7-b898-2792-6392df0f750c','aos_contracts_assigned_user','Users','users','id','AOS_Contracts','aos_contracts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c38006ba-b1d2-acd0-5d10-6392dfbfbed1','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('c4d1429a-5fa2-85ee-44d8-6392df26d2b2','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('c4f31934-18e5-52dd-bb3c-6392df8f765a','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c502864e-a4e8-5f0a-81d7-6392df4200f3','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c5129815-a856-9dea-1054-6392dfa1acf0','aos_quotes_assigned_user','Users','users','id','AOS_Quotes','aos_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c518e85c-009d-2a65-fbe1-6392dfbc0602','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('c52db757-4717-a41b-962e-6392dfd999d7','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('c5f804f1-2708-2253-2240-6392dfd2ebf4','alerts_modified_user','Users','users','id','Alerts','alerts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c735f338-8897-55f6-4021-6392df6be05c','jjwg_areas_assigned_user','Users','users','id','jjwg_Areas','jjwg_areas','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c737f739-a92f-d05d-eb08-6392dfbc91ae','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('c7769a65-70ca-3a30-01b8-6392dfa8162a','securitygroups_meetings','SecurityGroups','securitygroups','id','Meetings','meetings','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Meetings',0,0),('c942254a-ffe4-9a42-96db-6392df369d62','surveyresponses_surveyquestionresponses','SurveyResponses','surveyresponses','id','SurveyQuestionResponses','surveyquestionresponses','surveyresponse_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c9432b23-2a84-d8ab-0947-6392df0315e7','securitygroups_aos_contracts','SecurityGroups','securitygroups','id','AOS_Contracts','aos_contracts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Contracts',0,0),('c97e635b-b304-8dcf-0f96-6392df1609a4','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c9f1d1a7-182f-52b5-93cc-6392df96bd2e','securitygroups_fp_event_locations','SecurityGroups','securitygroups','id','FP_Event_Locations','fp_event_locations','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','FP_Event_Locations',0,0),('cb2ca2d4-f7c0-6825-76c9-6392df7515cc','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('cb3156a1-1e98-1c4d-39dc-6392df4a09fc','securitygroups_aos_quotes','SecurityGroups','securitygroups','id','AOS_Quotes','aos_quotes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Quotes',0,0),('cb42b3fe-e63e-4460-9f60-6392df61720c','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('cb54aa02-ee70-050d-af59-6392dfe21860','surveyresponses_campaigns','Campaigns','campaigns','id','SurveyResponses','surveyresponses','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cb5a602a-0818-51ff-9cab-6392dfa44794','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('cc3cae46-ae49-2ebd-efc4-6392df4fc395','am_projecttemplates_modified_user','Users','users','id','AM_ProjectTemplates','am_projecttemplates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cd293d2e-8ac6-465d-bc11-6392dfc5441f','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('cd4de8da-ba48-1183-8cdb-6392dfc853f1','securitygroups_jjwg_areas','SecurityGroups','securitygroups','id','jjwg_Areas','jjwg_areas','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Areas',0,0),('cf1f2bf3-dc78-bed1-2680-6392df58f7b8','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cf463c81-28c4-4ad5-2e9e-6392df07581c','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('cf52f83b-3346-6e43-3a5f-6392df0468a2','aos_contracts_tasks','AOS_Contracts','aos_contracts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('d05459fc-a516-dada-7c87-6392df1351a9','surveys_modified_user','Users','users','id','Surveys','surveys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d10e65ae-90e8-5805-427b-6392df4e8969','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('d13aad69-4372-22dc-5116-6392df3a655a','am_projecttemplates_created_by','Users','users','id','AM_ProjectTemplates','am_projecttemplates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d1593dfd-c6b0-15dc-fd20-6392df944df8','aos_quotes_aos_product_quotes','AOS_Quotes','aos_quotes','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d15bf019-66df-584d-35a7-6392df85b668','optimistic_locking',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('d161a03f-73fa-afa7-9471-6392df2a54b3','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('d20f48d0-b702-92a7-8fc0-6392dffb65f8','prospectlists_assigned_user','Users','users','id','prospectlists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d36a8cae-8fee-fd6a-d021-6392df793b22','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('d4cfc664-2f97-879d-3497-6392df3e4be5','jjwg_address_cache_modified_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d56f53de-f017-2d24-047a-6392df226907','surveys_created_by','Users','users','id','Surveys','surveys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d5953308-187c-b914-2657-6392df51c8bb','aos_contracts_notes','AOS_Contracts','aos_contracts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('d5a505e1-493e-d428-53e9-6392df68b489','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d767fcb1-91e8-71a5-c5a3-6392dfda39ff','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('d7727ded-8dcc-0126-b158-6392df1eb371','aos_quotes_aos_line_item_groups','AOS_Quotes','aos_quotes','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d779b54e-5efd-a589-9609-6392df268300','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('d784b320-b128-fcb8-669e-6392df32301e','am_projecttemplates_assigned_user','Users','users','id','AM_ProjectTemplates','am_projecttemplates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d7871923-7fec-7d06-3f38-6392df580030','securitygroups_prospectlists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('d8924d32-5bd9-1e09-aa17-6392df3ebded','unified_search',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('d8f354b2-6525-e30e-67b3-6392df71a43d','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d95ee54e-370c-9444-4963-6392df1e80c0','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d98ef246-7cdd-a55b-cc8f-6392dfe8c48b','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('db78606e-01bc-1aa7-0a67-6392dfb0512b','surveys_assigned_user','Users','users','id','Surveys','surveys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('db946c5f-66b8-9c0d-11da-6392df7d64d1','jjwg_address_cache_created_by','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('db97e090-4b90-5946-abb5-6392dfcacf6c','aos_contracts_meetings','AOS_Contracts','aos_contracts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('dd5b353a-4da9-4d5c-24d9-6392dfb890eb','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('dd99c2fd-6f34-2081-fc28-6392dfa7c4c2','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('ddeadba4-c7cb-77ab-31af-6392df3d13ef','securitygroups_project','SecurityGroups','securitygroups','id','Project','project','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Project',0,0),('de3c60ee-9b1b-fc0c-39ac-6392df448d42','aow_actions_modified_user','Users','users','id','AOW_Actions','aow_actions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df7b1d36-4262-33b7-7a55-6392df9478b0','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df9b443d-4048-5de2-3674-6392dfe9a693','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df9ec0ab-359c-9c9e-5614-6392df1ca29f','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e0cdf0d0-6755-e855-bcf0-6392df7f4f9f','aod_indexevent_modified_user','Users','users','id','AOD_IndexEvent','aod_indexevent','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e0f604c0-6b61-bcc1-16fa-6392dfbd973e','aos_invoices_assigned_user','Users','users','id','AOS_Invoices','aos_invoices','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e1a7db01-1027-919a-0723-6392df846e5c','securitygroups_surveys','SecurityGroups','securitygroups','id','Surveys','surveys','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Surveys',0,0),('e1af55a3-20ff-f837-31f4-6392df30b951','jjwg_address_cache_assigned_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e1f6c894-af5e-8451-977a-6392df77bd91','aos_contracts_calls','AOS_Contracts','aos_contracts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('e398761a-cef1-e054-15a7-6392df97213a','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('e398a33c-9ddb-d967-b589-6392df6efbf2','aow_actions_created_by','Users','users','id','AOW_Actions','aow_actions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e3a31899-4f2b-010e-8cb7-6392df632af5','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('e3e703d5-6318-ca5b-8595-6392dfc6e0ce','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('e4c5e923-91c7-75ee-1089-6392df46bee8','am_tasktemplates_modified_user','Users','users','id','AM_TaskTemplates','am_tasktemplates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e5932b20-b224-bbc5-5ddd-6392df9b818a','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e596e650-0984-ac6f-119a-6392df2e49cb','aod_indexevent_created_by','Users','users','id','AOD_IndexEvent','aod_indexevent','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e5c8adde-b64a-681b-7167-6392df2ae779','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e5dd0e5e-d687-8ed6-6a86-6392df6fa2fd','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e645556d-142b-ec50-068c-6392df439124','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e7b1a7c7-9cf3-8973-e314-6392dfb94444','surveys_surveyquestions','Surveys','surveys','id','SurveyQuestions','surveyquestions','survey_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e7d187a3-e07e-4a6a-8ba3-6392df57bb26','aos_contracts_aos_products_quotes','AOS_Contracts','aos_contracts','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e8ecc1cf-b523-0bf3-0c9b-6392dfd03d44','calls_reschedule_modified_user','Users','users','id','Calls_Reschedule','calls_reschedule','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e9c2f733-29e6-f550-3df5-6392dfa34169','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('e9d5091a-fbd8-4af0-e067-6392df0608ec','aok_knowledgebase_categories','AOK_KnowledgeBase','aok_knowledgebase','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','id','aok_knowledgebase_categories','aok_knowledgebase_id','aok_knowledge_base_categories_id','many-to-many',NULL,NULL,0,0),('eb0c13ac-1d6e-5b91-31d6-6392df769351','aow_workflow_modified_user','Users','users','id','AOW_WorkFlow','aow_workflow','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eb985a8c-e2e1-a08c-8a5f-6392df616644','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eb9c9f90-b456-0fa0-578f-6392dfb1659f','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ebc3ee6f-dec7-aea9-ac5b-6392df3d245a','securitygroups_tasks','SecurityGroups','securitygroups','id','Tasks','tasks','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Tasks',0,0),('ebcaecee-7e7e-813a-c311-6392df493cc8','aod_indexevent_assigned_user','Users','users','id','AOD_IndexEvent','aod_indexevent','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ebd65b8e-a0ce-a753-fc0d-6392df54e51e','opportunity_aos_quotes','Opportunities','opportunities','id','AOS_Quotes','aos_quotes','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eddb1f34-95c8-b9d1-2081-6392dfbea118','surveys_surveyresponses','Surveys','surveys','id','SurveyResponses','surveyresponses','survey_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('edec202d-3fe9-f882-2ce1-6392df858f16','aos_contracts_aos_line_item_groups','AOS_Contracts','aos_contracts','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('efcf0553-29b9-e289-2160-6392df045a27','am_projecttemplates_project_1','AM_ProjectTemplates','am_projecttemplates','id','Project','project','id','am_projecttemplates_project_1_c','am_projecttemplates_project_1am_projecttemplates_ida','am_projecttemplates_project_1project_idb','many-to-many',NULL,NULL,0,0),('efe92554-6f1f-87c0-f82e-6392df4214d6','calls_reschedule_created_by','Users','users','id','Calls_Reschedule','calls_reschedule','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eff26689-ef55-b3df-f94a-6392df359e69','am_tasktemplates_created_by','Users','users','id','AM_TaskTemplates','am_tasktemplates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eff79461-cdd7-79d9-6245-6392dfe36c6d','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('f027678c-f013-bb17-7873-6392df696b55','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('f1cb8a62-8ea6-6332-5335-6392dfa823e1','opportunity_aos_contracts','Opportunities','opportunities','id','AOS_Contracts','aos_contracts','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f1dbf587-c62e-98c5-9e64-6392df05d7ba','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('f1f46116-8e60-980e-a830-6392dff124f5','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f1ff2b3c-8d39-f19d-d337-6392df6094d3','aow_workflow_created_by','Users','users','id','AOW_WorkFlow','aow_workflow','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f21492f0-abc6-984f-b944-6392dfc16b61','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('fd9506c0-fb17-2f46-ada1-6392dfdc5110','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('fe240719-825e-c531-5295-6392df504206','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('ff550956-7b4c-aec0-01c5-6392dfcb95cf','aod_index_assigned_user','Users','users','id','AOD_Index','aod_index','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('fffd05c7-ac39-fde1-6d9e-6392dfc1d2bf','aow_workflow_aow_conditions','AOW_WorkFlow','aow_workflow','id','AOW_Conditions','aow_conditions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `popup` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timer_popup` varchar(32) DEFAULT NULL,
  `timer_email` varchar(32) DEFAULT NULL,
  `related_event_module` varchar(32) DEFAULT NULL,
  `related_event_module_id` char(36) NOT NULL,
  `date_willexecute` int(60) DEFAULT '-1',
  `popup_viewed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_reminder_name` (`name`),
  KEY `idx_reminder_deleted` (`deleted`),
  KEY `idx_reminder_related_event_module` (`related_event_module`),
  KEY `idx_reminder_related_event_module_id` (`related_event_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders_invitees`
--

DROP TABLE IF EXISTS `reminders_invitees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders_invitees` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reminder_id` char(36) NOT NULL,
  `related_invitee_module` varchar(32) DEFAULT NULL,
  `related_invitee_module_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_invitee_name` (`name`),
  KEY `idx_reminder_invitee_assigned_user_id` (`assigned_user_id`),
  KEY `idx_reminder_invitee_reminder_id` (`reminder_id`),
  KEY `idx_reminder_invitee_related_invitee_module` (`related_invitee_module`),
  KEY `idx_reminder_invitee_related_invitee_module_id` (`related_invitee_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders_invitees`
--

LOCK TABLES `reminders_invitees` WRITE;
/*!40000 ALTER TABLE `reminders_invitees` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders_invitees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ro_least`
--

DROP TABLE IF EXISTS `ro_least`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ro_least` (
  `id` varchar(36) NOT NULL,
  `time` datetime DEFAULT NULL,
  `bu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ro_least`
--

LOCK TABLES `ro_least` WRITE;
/*!40000 ALTER TABLE `ro_least` DISABLE KEYS */;
INSERT INTO `ro_least` VALUES ('1','2022-09-19 08:44:14','3');
/*!40000 ALTER TABLE `ro_least` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_modules`
--

DROP TABLE IF EXISTS `roles_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_modules`
--

LOCK TABLES `roles_modules` WRITE;
/*!40000 ALTER TABLE `roles_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_search`
--

LOCK TABLES `saved_search` WRITE;
/*!40000 ALTER TABLE `saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulers`
--

LOCK TABLES `schedulers` WRITE;
/*!40000 ALTER TABLE `schedulers` DISABLE KEYS */;
INSERT INTO `schedulers` VALUES ('17361157-709a-bbf5-6754-6316df5c63ab',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2015-01-01 07:15:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',0),('252ef3db-cd2d-213a-dbaa-6316df6e5caa',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Clean Jobs Queue','function::cleanJobQueue','2015-01-01 15:45:01',NULL,'0::5::*::*::*',NULL,NULL,NULL,'Active',0),('328eb83d-a9c6-0dfb-3aa8-6316df2f9b3b',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2015-01-01 16:30:01',NULL,'0::3::1::*::*',NULL,NULL,NULL,'Active',0),('4137d5dc-b876-2a90-a030-6316dfea39df',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Prune SuiteCRM Feed Tables','function::trimSugarFeeds','2015-01-01 14:00:01',NULL,'0::2::1::*::*',NULL,NULL,NULL,'Active',1),('5fa9922b-cede-ee2a-5a1b-6316df01c14e',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Process Workflow Tasks','function::processAOW_Workflow','2015-01-01 11:45:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',1),('86e10a6f-40fa-8670-4cf5-6316dfa7a615',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Optimise AOD Index','function::aodOptimiseIndex','2015-01-01 11:45:01',NULL,'0::*/3::*::*::*',NULL,NULL,NULL,'Active',0),('8a86ee82-4011-629c-e4c7-6316dfedd25b',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Run Report Generation Scheduled Tasks','function::aorRunScheduledReports','2015-01-01 09:30:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',1),('a030d9de-64ab-a5a8-fd33-6316df2efb18',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Prune Tracker Tables','function::trimTracker','2015-01-01 12:30:01',NULL,'0::2::1::*::*',NULL,NULL,NULL,'Active',1),('b4ab63a9-9051-da52-91b3-6316df29c9b7',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxesAOP','2015-01-01 19:00:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',0),('c5d889e8-96f9-e5de-3052-6316dfca9bca',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2015-01-01 07:30:01',NULL,'0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('d33650f7-57dc-be81-31f8-6316dfff7680',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2015-01-01 18:15:01',NULL,'0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('df8a42fd-561c-b9d0-0972-6316df933cba',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Prune Database on 1st of Month','function::pruneDatabase','2015-01-01 10:00:01',NULL,'0::4::1::*::*',NULL,NULL,NULL,'Inactive',0),('edddf1b6-1f1b-97e7-7516-6316df7fe5c8',0,'2022-09-06 05:47:31','2022-09-06 05:47:31','1','1','Perform Lucene Index','function::aodIndexUnindexed','2015-01-01 18:30:01',NULL,'0::0::*::*::*',NULL,NULL,NULL,'Active',0);
/*!40000 ALTER TABLE `schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups`
--

DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups`
--

LOCK TABLES `securitygroups` WRITE;
/*!40000 ALTER TABLE `securitygroups` DISABLE KEYS */;
INSERT INTO `securitygroups` VALUES ('10f74cd1-25e7-76ea-e68d-63470f9cade3','Group BU DL TB','2022-10-12 19:03:03','2022-10-12 19:04:12','1','1',NULL,0,'1',0),('1a4a0a4b-5e59-c546-4d71-632184df9cc8','Group BU NTT','2022-09-14 07:35:56','2022-09-14 07:36:18','1','1','This is group BU NTT',0,'1',0),('1ff39cae-999d-91f8-767f-63282bef6813','Group RO NTT','2022-09-19 08:42:45','2022-09-19 08:43:13','1','1',NULL,0,'1',0),('250c2bd2-858b-9667-9b9c-63470f5e44be','Group RO DL TB','2022-10-12 19:04:46','2022-10-12 19:05:12','1','1',NULL,0,'1',0),('264b046f-0cfa-345d-b5eb-63282bd940d5','Group RO TB','2022-09-19 08:43:38','2022-09-19 08:44:42','1','1',NULL,0,'1',0),('52b53235-8a51-4802-205b-633bb79cb519','Group BU TELE','2022-10-04 04:31:06','2022-10-04 04:31:52','1','1',NULL,0,'1',0),('5f17c4f7-2fd0-8550-3614-632073805ac5','Group Super-MKT','2022-09-13 12:10:11','2022-09-13 12:10:49','1','1','This is group Super-MKT',0,'1',0),('6ab7b41d-4d2e-ce1c-8196-632184fd4008','Group BU TB','2022-09-14 07:34:56','2022-09-14 07:35:25','1','1','This is group BU TB',0,'1',0),('79b8321c-fdc7-43f2-fd73-6321828ae207','Group RO Q10','2022-09-14 07:30:04','2022-09-19 08:42:02','1','1',NULL,0,'1',0),('a3d022e0-cfd6-008a-119f-6346992b57ee','GROUP RO TELE','2022-10-12 10:38:18','2022-10-12 10:39:06','1','1',NULL,0,'1',0),('d96364ba-e304-6bc4-3d28-631aa891ee3e','Group BU Q10','2022-09-09 02:43:03','2022-09-14 07:34:15','1','1','Group for BU Q10',0,'1',0),('dfa12131-8e00-2b02-393a-631aa74c9f7b','Group MKT','2022-09-09 02:41:48','2022-09-09 02:42:38','1','1','Group for MKT',0,'1',0);
/*!40000 ALTER TABLE `securitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_acl_roles`
--

DROP TABLE IF EXISTS `securitygroups_acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_acl_roles`
--

LOCK TABLES `securitygroups_acl_roles` WRITE;
/*!40000 ALTER TABLE `securitygroups_acl_roles` DISABLE KEYS */;
INSERT INTO `securitygroups_acl_roles` VALUES ('1b4195e7-cd2f-de19-68ae-63470f74e896','10f74cd1-25e7-76ea-e68d-63470f9cade3','98df1461-26e0-dad1-82e2-63470c4d04b8','2022-10-12 19:03:46',0),('688a1606-0c97-de7f-32df-6321832abbfe','d96364ba-e304-6bc4-3d28-631aa891ee3e','3618d1f7-3eac-2e11-d0a6-631aa46ec64c','2022-09-14 07:34:01',0),('725a7b33-e746-4942-a469-631aa8823557','d96364ba-e304-6bc4-3d28-631aa891ee3e','3618d1f7-3eac-2e11-d0a6-631aa46ec64c','2022-09-14 07:31:51',1),('7532447e-c555-b197-5aec-631aa8cec64f','dfa12131-8e00-2b02-393a-631aa74c9f7b','aaa2bb50-d34a-18a8-20ed-631aa36a8fd9','2022-09-09 02:42:38',0),('79e879cb-f84d-ed74-01d8-6346992cfc22','a3d022e0-cfd6-008a-119f-6346992b57ee','7a0bb7a5-8eb4-6e41-be66-6346976166eb','2022-10-12 10:38:41',0),('ac24b0ac-db0f-82bd-e867-633bb74ddde6','52b53235-8a51-4802-205b-633bb79cb519','ca9a06cc-fa08-23d1-17d5-633b96a297d9','2022-10-04 04:31:52',0),('b338fd1e-21ad-12d8-9c55-632184692db0','6ab7b41d-4d2e-ce1c-8196-632184fd4008','a8a06751-bdc7-6245-a86c-63217f18824e','2022-09-14 07:35:07',0),('bb5a2858-51c1-1fdb-a690-6320736cc93f','5f17c4f7-2fd0-8550-3614-632073805ac5','f0c9f37e-dea4-91f4-1d6c-63207197e5be','2022-09-13 12:10:49',0),('bc629c80-f6e5-3ffb-ac3a-63470f04e662','250c2bd2-858b-9667-9b9c-63470f5e44be','60a56750-f8f5-b323-b710-63470b86bb97','2022-10-12 19:04:58',0),('c84d6280-1f7f-5d88-0d85-63282bc79fdf','1ff39cae-999d-91f8-767f-63282bef6813','b329c6f0-24d9-a2c0-324c-632828771d55','2022-09-19 08:42:54',0),('ccf2f283-699e-9b6b-a204-632183a8832c','79b8321c-fdc7-43f2-fd73-6321828ae207','7e9d9fce-e2e9-dabe-de4b-6321809a28d7','2022-09-19 08:40:44',1),('dfc79d36-87dc-cb41-2abb-632184731ebd','1a4a0a4b-5e59-c546-4d71-632184df9cc8','e953f290-d6b8-5baf-1ecb-63217f15aec0','2022-09-14 07:36:04',0),('e636f75e-fc40-f6aa-0950-63282b3330aa','79b8321c-fdc7-43f2-fd73-6321828ae207','7e9d9fce-e2e9-dabe-de4b-6321809a28d7','2022-09-19 08:40:53',0),('e80ca875-2042-881b-5a75-63282b3e81f0','264b046f-0cfa-345d-b5eb-63282bd940d5','ebe0e79b-131b-d193-5dac-6328292eac56','2022-09-19 08:44:28',0);
/*!40000 ALTER TABLE `securitygroups_acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_audit`
--

DROP TABLE IF EXISTS `securitygroups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_audit`
--

LOCK TABLES `securitygroups_audit` WRITE;
/*!40000 ALTER TABLE `securitygroups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_default`
--

DROP TABLE IF EXISTS `securitygroups_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_default`
--

LOCK TABLES `securitygroups_default` WRITE;
/*!40000 ALTER TABLE `securitygroups_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_records`
--

DROP TABLE IF EXISTS `securitygroups_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_records`
--

LOCK TABLES `securitygroups_records` WRITE;
/*!40000 ALTER TABLE `securitygroups_records` DISABLE KEYS */;
INSERT INTO `securitygroups_records` VALUES ('2120634c-42d5-11ed-add1-782bcbf8c556','dfa12131-8e00-2b02-393a-631aa74c9f7b','bf100f32-8e21-4d9a-07ee-633a6718d59e','Leads','2022-10-03 00:00:00',NULL,NULL,0),('34cf5423-6ef4-11ed-a2dd-00155d407816','dfa12131-8e00-2b02-393a-631aa74c9f7b','3331037a-6b8d-cbe0-22e7-638470e5e320','Leads','2022-11-28 00:00:00',NULL,NULL,0),('491a5568-42d6-11ed-aa3d-782bcbf8c556','dfa12131-8e00-2b02-393a-631aa74c9f7b','a8315652-3feb-7746-ed4d-633a69f338c6','Leads','2022-10-03 00:00:00',NULL,NULL,0),('69f8445c-4a63-11ed-99cb-782bcbf8c556','dfa12131-8e00-2b02-393a-631aa74c9f7b','efdc7fb4-bc53-1454-4104-6347140eb24b','Leads','2022-10-13 00:00:00',NULL,NULL,0),('7c2b8aae-42d7-11ed-aa3d-782bcbf8c556','dfa12131-8e00-2b02-393a-631aa74c9f7b','af2a2717-51f9-4821-ce7d-633a6bd6a620','Leads','2022-10-03 00:00:00',NULL,NULL,0),('a5319077-42d5-11ed-add1-782bcbf8c556','dfa12131-8e00-2b02-393a-631aa74c9f7b','c5d50740-922c-eb38-2b7e-633a67fb84fe','Leads','2022-10-03 00:00:00',NULL,NULL,0),('b1a5794c-4aa9-11ed-a2dd-00155d407816','dfa12131-8e00-2b02-393a-631aa74c9f7b','827b74b9-38f9-f0f0-c26a-63478d536619','Leads','2022-10-13 00:00:00',NULL,NULL,0),('cd2d827a-6ee6-11ed-a2dd-00155d407816','dfa12131-8e00-2b02-393a-631aa74c9f7b','2d69653d-48eb-fff5-6c94-63845977f397','Leads','2022-11-28 00:00:00',NULL,NULL,0),('d1b6aebc-778b-11ed-a2dd-00155d407816','dfa12131-8e00-2b02-393a-631aa74c9f7b','68432e07-8302-226c-5dc1-6392da67c274','Leads','2022-12-09 00:00:00',NULL,NULL,0);
/*!40000 ALTER TABLE `securitygroups_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_users`
--

DROP TABLE IF EXISTS `securitygroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `securitygroups_users_idxa` (`securitygroup_id`),
  KEY `securitygroups_users_idxb` (`user_id`),
  KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_users`
--

LOCK TABLES `securitygroups_users` WRITE;
/*!40000 ALTER TABLE `securitygroups_users` DISABLE KEYS */;
INSERT INTO `securitygroups_users` VALUES ('2240cfa0-2f81-4ec3-c758-631aa88c6e3d','2022-09-09 02:42:19',0,'dfa12131-8e00-2b02-393a-631aa74c9f7b','130e2309-2bc1-b543-ba7c-631aa20981aa',NULL,0),('22aecda8-903d-bd48-5a10-632073c8ecdb','2022-09-13 12:10:36',0,'5f17c4f7-2fd0-8550-3614-632073805ac5','aea7576b-420a-eaf1-8062-6320718d714a',NULL,0),('2ce968e0-6c09-16e1-7cbf-6321835b937e','2022-09-19 08:41:13',1,'79b8321c-fdc7-43f2-fd73-6321828ae207','df55b3c8-1764-6ebf-01dd-63218270e96b',NULL,0),('318d2990-75bb-fd28-4dfd-633bb774ea1f','2022-10-04 04:33:57',0,'52b53235-8a51-4802-205b-633bb79cb519','93ae40f9-a2fe-b851-43ef-633bb75ad0a9',NULL,0),('3cdc2897-10b8-6b79-8a02-63218340aa07','2022-09-19 08:39:03',1,'79b8321c-fdc7-43f2-fd73-6321828ae207','20e484bd-e9a4-72a4-ccd9-631aa25c91b9',NULL,0),('433e6032-1332-b8fa-858e-63218470bedd','2022-09-14 07:36:18',0,'1a4a0a4b-5e59-c546-4d71-632184df9cc8','bf510836-90a2-69d4-7db8-631aa285d1e7',NULL,0),('49fbf390-25bb-7c8f-06ba-631aa8bc5bff','2022-09-14 07:28:30',1,'d96364ba-e304-6bc4-3d28-631aa891ee3e','20e484bd-e9a4-72a4-ccd9-631aa25c91b9',NULL,0),('4a590762-ceb7-0f9a-d358-631aa83e9f5e','2022-09-09 02:42:19',0,'dfa12131-8e00-2b02-393a-631aa74c9f7b','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0),('57a60e9a-957f-fb29-a074-63282b069529','2022-09-19 08:43:13',0,'1ff39cae-999d-91f8-767f-63282bef6813','df55b3c8-1764-6ebf-01dd-63218270e96b',NULL,0),('7344fe96-73e4-f128-1a13-63470fdde1f2','2022-10-12 19:05:12',0,'250c2bd2-858b-9667-9b9c-63470f5e44be','ce9806a2-8b0a-bc73-1b6d-63469814cb69',NULL,0),('747e103d-933b-f832-e4db-63282b43418e','2022-09-19 08:42:02',0,'79b8321c-fdc7-43f2-fd73-6321828ae207','2ca94880-44b1-f16a-d2df-63282b8f2314',NULL,0),('8053b14b-b1ff-0c1a-d484-63282badc46e','2022-09-19 08:42:02',0,'79b8321c-fdc7-43f2-fd73-6321828ae207','62213397-e5c8-5e5d-d4be-63282ab9f739',NULL,0),('87160a08-07d6-716e-3223-631aa88e03b5','2022-09-14 07:28:41',1,'d96364ba-e304-6bc4-3d28-631aa891ee3e','bf510836-90a2-69d4-7db8-631aa285d1e7',NULL,0),('948c43e6-ed11-f6b0-ebbd-634699bf4352','2022-10-12 10:39:06',0,'a3d022e0-cfd6-008a-119f-6346992b57ee','88c77436-5bc0-36f5-58c5-634698297705',NULL,0),('9526ca1e-0713-9403-ad30-631aa8c6f64c','2022-09-14 07:27:04',1,'d96364ba-e304-6bc4-3d28-631aa891ee3e','782a0c20-7f54-0fb0-125c-631aa22dc4e6',NULL,0),('9d9c9dff-9336-cfae-2993-6321843c3008','2022-09-14 07:35:25',0,'6ab7b41d-4d2e-ce1c-8196-632184fd4008','782a0c20-7f54-0fb0-125c-631aa22dc4e6',NULL,0),('9f3789cb-26b5-90a1-0cc0-631aa8d9b379','2022-09-14 07:28:49',1,'d96364ba-e304-6bc4-3d28-631aa891ee3e','78e20ef0-7018-d656-107b-631aa2369613',NULL,0),('ba8db0a3-1519-1bfe-1851-634699129412','2022-10-12 10:39:06',0,'a3d022e0-cfd6-008a-119f-6346992b57ee','194493f9-5af3-a81b-bca8-6346986f2e4b',NULL,0),('bc70eb94-7b50-6a05-bad0-63470f46cf9b','2022-10-12 19:04:12',0,'10f74cd1-25e7-76ea-e68d-63470f9cade3','29cbc651-ca2e-ff42-0ba8-634698d9fce9',0,0),('bfb7154e-c699-2dfc-4cdc-63282b705185','2022-09-19 08:44:42',0,'264b046f-0cfa-345d-b5eb-63282bd940d5','c1abb968-9c8d-474e-c297-63282bf888ad',NULL,0),('c6b00461-9b5c-3dd1-6308-63282b96abe7','2022-09-19 08:44:42',0,'264b046f-0cfa-345d-b5eb-63282bd940d5','1e53686b-f1aa-8dac-5bcf-63282bc67ade',NULL,0),('dc83acb6-f088-f2e7-47a6-63470f78b43c','2022-10-12 19:05:12',0,'250c2bd2-858b-9667-9b9c-63470f5e44be','ddee979a-ef5a-e49b-3ce1-634698e24c4a',NULL,0),('e136c231-4174-6da9-077d-6321831cd41a','2022-09-14 07:34:15',0,'d96364ba-e304-6bc4-3d28-631aa891ee3e','78e20ef0-7018-d656-107b-631aa2369613',NULL,0),('ee4e32cd-b4ff-05c5-2b96-63282b3bc700','2022-09-19 08:43:13',0,'1ff39cae-999d-91f8-767f-63282bef6813','20e484bd-e9a4-72a4-ccd9-631aa25c91b9',NULL,0),('f64c085d-2569-69f2-bbfb-63207385c51d','2022-09-13 12:10:36',0,'5f17c4f7-2fd0-8550-3614-632073805ac5','7eabb5c9-0e8a-f1d2-f1a9-632071c4140d',NULL,0);
/*!40000 ALTER TABLE `securitygroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spots`
--

DROP TABLE IF EXISTS `spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spots` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `config` longtext,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spots`
--

LOCK TABLES `spots` WRITE;
/*!40000 ALTER TABLE `spots` DISABLE KEYS */;
/*!40000 ALTER TABLE `spots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugarfeed`
--

DROP TABLE IF EXISTS `sugarfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugarfeed`
--

LOCK TABLES `sugarfeed` WRITE;
/*!40000 ALTER TABLE `sugarfeed` DISABLE KEYS */;
INSERT INTO `sugarfeed` VALUES ('1262bedb-153b-069e-2261-63845963a95c','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:2d69653d-48eb-fff5-6c94-63845977f397: ]','2022-11-28 06:48:42','2022-11-28 06:48:42','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','2d69653d-48eb-fff5-6c94-63845977f397',NULL,NULL),('1c387110-c0c8-f582-fbdf-633a69921dbb','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:a8315652-3feb-7746-ed4d-633a69f338c6: ]','2022-10-03 04:46:01','2022-10-03 04:46:01','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','a8315652-3feb-7746-ed4d-633a69f338c6',NULL,NULL),('1e92d49e-fa90-097e-9d51-632899d157a0','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:f3f1a998-376a-fd34-e49e-632899c32c96: ]','2022-09-19 16:33:33','2022-09-19 16:33:33','1','1',NULL,0,NULL,'Leads','f3f1a998-376a-fd34-e49e-632899c32c96',NULL,NULL),('206c6c81-ef39-5c5e-1d3d-63356905f2bf','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:ee2730da-ef2a-1296-436f-633569e674b0: ]','2022-09-29 09:44:40','2022-09-29 09:44:40','1','1',NULL,0,NULL,'Leads','ee2730da-ef2a-1296-436f-633569e674b0',NULL,NULL),('247950d8-2949-a19a-8973-6328900d83eb','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:e8185917-455f-542f-0aee-6328901f0d18: ]','2022-09-19 15:53:40','2022-09-19 15:53:40','1','1',NULL,0,NULL,'Leads','e8185917-455f-542f-0aee-6328901f0d18',NULL,NULL),('26438d4b-4784-01a7-044f-6335696a89a6','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:ee2730da-ef2a-1296-436f-633569e674b0: ]','2022-09-29 09:44:40','2022-09-29 09:44:40','1','1',NULL,0,NULL,'Leads','ee2730da-ef2a-1296-436f-633569e674b0',NULL,NULL),('26d10400-6533-ab20-dbc4-63471486892b','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:efdc7fb4-bc53-1454-4104-6347140eb24b: ]','2022-10-12 19:23:54','2022-10-12 19:23:54','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','efdc7fb4-bc53-1454-4104-6347140eb24b',NULL,NULL),('28999d40-dd4a-43cf-bf14-6318110beb6e','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:6e9d2ff1-9f10-0b00-904e-631811f8c5c4: ]','2022-09-07 03:33:41','2022-09-07 03:33:41','1','1',NULL,0,NULL,'Leads','6e9d2ff1-9f10-0b00-904e-631811f8c5c4',NULL,NULL),('320aa43f-2e7d-2c5e-6a48-633a67b0757a','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:bf100f32-8e21-4d9a-07ee-633a6718d59e: ]','2022-10-03 04:37:43','2022-10-03 04:37:43','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','bf100f32-8e21-4d9a-07ee-633a6718d59e',NULL,NULL),('329c95eb-0e0c-0ce2-3d4b-633a67368cc3','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:c5d50740-922c-eb38-2b7e-633a67fb84fe: ]','2022-10-03 04:41:26','2022-10-03 04:41:26','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','c5d50740-922c-eb38-2b7e-633a67fb84fe',NULL,NULL),('4806d088-9cb7-ebc2-4ef0-63288b2a36ac','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:f3bf4122-8652-b4d8-fda2-63288bdd07f8: ]','2022-09-19 15:33:56','2022-09-19 15:33:56','1','1',NULL,0,NULL,'Leads','f3bf4122-8652-b4d8-fda2-63288bdd07f8',NULL,NULL),('4a856393-0ec8-90a0-9d80-6322c9e5dfb1','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:3c8ac035-6d67-7e4b-84c1-6322c925278e: ]','2022-09-15 06:44:44','2022-09-15 06:44:44','1','1',NULL,0,NULL,'Leads','3c8ac035-6d67-7e4b-84c1-6322c925278e',NULL,NULL),('4f1f8813-7396-dc9a-f72b-6384707452a1','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:3331037a-6b8d-cbe0-22e7-638470e5e320: ]','2022-11-28 08:24:39','2022-11-28 08:24:39','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','3331037a-6b8d-cbe0-22e7-638470e5e320',NULL,NULL),('4f393a43-d238-ca3d-4e0e-633568c2953f','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:788aeacf-1335-fbf3-2b11-633568dd010b: ]','2022-09-29 09:41:14','2022-09-29 09:41:14','1','1',NULL,0,NULL,'Leads','788aeacf-1335-fbf3-2b11-633568dd010b',NULL,NULL),('5e662508-6395-3dc5-4b6b-631b004fde8a','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:190529f8-84aa-ac39-f895-631b0061bab8: ]','2022-09-09 08:58:16','2022-09-09 08:58:16','1','1',NULL,0,NULL,'Leads','190529f8-84aa-ac39-f895-631b0061bab8',NULL,NULL),('714a34b8-b092-e31a-338a-631cd5f2a05f','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:b0633e39-5fe2-fd04-8b07-631cd57fd830: ]','2022-09-10 18:21:08','2022-09-10 18:21:08','1','1',NULL,0,NULL,'Leads','b0633e39-5fe2-fd04-8b07-631cd57fd830',NULL,NULL),('78251c97-2e36-adfd-deab-633a6416964a','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:3f30c5ce-fbde-7b97-fb36-633a64e84edf: ]','2022-10-03 04:27:04','2022-10-03 04:27:04','1','1',NULL,0,NULL,'Leads','3f30c5ce-fbde-7b97-fb36-633a64e84edf',NULL,NULL),('85da7e45-da5e-cf33-5e2d-6392dbba3ef5','<b>{this.CREATED_BY}</b> nguyễn hoàng tiến','2022-12-09 06:52:21','2022-12-09 06:52:21','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,'aacec1bd-6737-81e3-7365-631aa18cd430','UserFeed','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,NULL),('97101e82-bc37-84bd-9a56-631afc8a7966','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:7905a97c-d0e8-df63-25a8-631afcda28c8: ]','2022-09-09 08:44:29','2022-09-09 08:44:29','1','1',NULL,0,NULL,'Leads','7905a97c-d0e8-df63-25a8-631afcda28c8',NULL,NULL),('98e622d7-5a5a-b346-02a2-633a6b2202ba','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:af2a2717-51f9-4821-ce7d-633a6bd6a620: ]','2022-10-03 04:54:37','2022-10-03 04:54:37','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','af2a2717-51f9-4821-ce7d-633a6bd6a620',NULL,NULL),('9e83493d-e05a-c067-7ed6-6322ad68fdcb','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:6b45a7ed-a57c-3043-1ee9-6322addf34fd: ]','2022-09-15 04:41:38','2022-09-15 04:41:38','1','1',NULL,0,NULL,'Leads','6b45a7ed-a57c-3043-1ee9-6322addf34fd',NULL,NULL),('a200984d-e775-b482-f3b4-6336a0cb5732','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:673eee13-cfe4-b462-07f0-6336a0424211: ]','2022-09-30 07:55:41','2022-09-30 07:55:41','1','1',NULL,0,NULL,'Leads','673eee13-cfe4-b462-07f0-6336a0424211',NULL,NULL),('a3a1c759-14ba-fbba-7397-6335564d09a8','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:361c3c33-bc85-3469-b0a4-633556037f46: ]','2022-09-29 08:24:41','2022-09-29 08:24:41','1','1',NULL,0,NULL,'Leads','361c3c33-bc85-3469-b0a4-633556037f46',NULL,NULL),('a6392ff8-1bf8-498e-e00a-63478dbcf896','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:827b74b9-38f9-f0f0-c26a-63478d536619: ]','2022-10-13 04:00:34','2022-10-13 04:00:34','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','827b74b9-38f9-f0f0-c26a-63478d536619',NULL,NULL),('a6fbddea-f3f8-c7e1-5338-633a69f0f5dd','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:a8315652-3feb-7746-ed4d-633a69f338c6: ]','2022-10-03 04:46:01','2022-10-03 04:46:01','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','a8315652-3feb-7746-ed4d-633a69f338c6',NULL,NULL),('aa8a8620-2f4a-a65d-4ec4-631ed58e8f29','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:c6af6513-1c27-f936-d588-631ed5c6c11d: ]','2022-09-12 06:45:44','2022-09-12 06:45:44','1','1',NULL,0,NULL,'Leads','c6af6513-1c27-f936-d588-631ed5c6c11d',NULL,NULL),('ae19e90f-5925-5296-5b17-6322ca2c1f62','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:c251c73e-7e2b-fcaa-3786-6322cafbef5b: ]','2022-09-15 06:45:45','2022-09-15 06:45:45','1','1',NULL,0,NULL,'Leads','c251c73e-7e2b-fcaa-3786-6322cafbef5b',NULL,NULL),('b5f8cedf-b35b-3c7b-0118-633cf37f9af6','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:d56206dd-8f0f-e94d-5dd0-633cf312bd9e: ]','2022-10-05 03:00:53','2022-10-05 03:00:53','1','1',NULL,0,NULL,'Leads','d56206dd-8f0f-e94d-5dd0-633cf312bd9e',NULL,NULL),('bbe0d4c2-ded8-66d5-b569-633a67046d81','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:c5d50740-922c-eb38-2b7e-633a67fb84fe: ]','2022-10-03 04:41:26','2022-10-03 04:41:26','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','c5d50740-922c-eb38-2b7e-633a67fb84fe',NULL,NULL),('bc732d48-989d-cab0-69bc-631ed5d0039c','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:c6af6513-1c27-f936-d588-631ed5c6c11d: ]','2022-09-12 06:45:49','2022-09-12 06:45:49','1','1',NULL,0,NULL,'Leads','c6af6513-1c27-f936-d588-631ed5c6c11d',NULL,NULL),('c6400a76-1e21-7781-7c20-63298bad062c','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:806f2bc8-6cf8-6a82-6e02-63298a01e069: ]','2022-09-20 09:42:23','2022-09-20 09:42:23','1','1',NULL,0,NULL,'Leads','806f2bc8-6cf8-6a82-6e02-63298a01e069',NULL,NULL),('c8596ed3-20be-b1e8-2ed8-633cefff65e2','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:a4ab06f9-2f8d-ecc1-4cda-633cef1bee20: ]','2022-10-05 02:43:34','2022-10-05 02:43:34','1','1',NULL,0,NULL,'Leads','a4ab06f9-2f8d-ecc1-4cda-633cef1bee20',NULL,NULL),('ca866fad-bfa0-6f08-dc81-63356828e8e1','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:788aeacf-1335-fbf3-2b11-633568dd010b: ]','2022-09-29 09:41:14','2022-09-29 09:41:14','1','1',NULL,0,NULL,'Leads','788aeacf-1335-fbf3-2b11-633568dd010b',NULL,NULL),('cc01899d-f1f5-bd9c-7a11-631951fff5b7','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:632d79d6-a8ef-b71a-af48-63195160f80b: ]','2022-09-08 02:20:32','2022-09-08 02:20:32','1','1',NULL,0,NULL,'Leads','632d79d6-a8ef-b71a-af48-63195160f80b',NULL,NULL),('cc821386-6231-5faf-bd44-633568b3d4f3','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:788aeacf-1335-fbf3-2b11-633568dd010b: ]','2022-09-29 09:42:44','2022-09-29 09:42:44','1','1',NULL,0,NULL,'Leads','788aeacf-1335-fbf3-2b11-633568dd010b',NULL,NULL),('d040d25b-53c2-3611-7e13-632a5e7dd2d8','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:a5841486-771d-5d76-716c-632a5e6c73cf: ]','2022-09-21 00:46:10','2022-09-21 00:46:10','1','1',NULL,0,NULL,'Leads','a5841486-771d-5d76-716c-632a5e6c73cf',NULL,NULL),('e910034a-bb16-e06b-5a11-633cf1d20b4b','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:c9dca761-da35-71ef-9950-633cf17e200d: ]','2022-10-05 02:53:39','2022-10-05 02:53:39','1','1',NULL,0,NULL,'Leads','c9dca761-da35-71ef-9950-633cf17e200d',NULL,NULL),('eb155b7c-ece2-c211-79e2-633cecf2fdff','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:759573d3-d4fb-c575-9d79-633cec47f485: ]','2022-10-05 02:30:25','2022-10-05 02:30:25','1','1',NULL,0,NULL,'Leads','759573d3-d4fb-c575-9d79-633cec47f485',NULL,NULL),('f381d087-433b-f84a-f12e-6392da18c306','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:68432e07-8302-226c-5dc1-6392da67c274: ]','2022-12-09 06:50:05','2022-12-09 06:50:05','aacec1bd-6737-81e3-7365-631aa18cd430','aacec1bd-6737-81e3-7365-631aa18cd430',NULL,0,NULL,'Leads','68432e07-8302-226c-5dc1-6392da67c274',NULL,NULL);
/*!40000 ALTER TABLE `sugarfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions`
--

DROP TABLE IF EXISTS `surveyquestionoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionoptions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `survey_question_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions`
--

LOCK TABLES `surveyquestionoptions` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions_audit`
--

DROP TABLE IF EXISTS `surveyquestionoptions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionoptions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestionoptions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions_audit`
--

LOCK TABLES `surveyquestionoptions_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions_surveyquestionresponses`
--

DROP TABLE IF EXISTS `surveyquestionoptions_surveyquestionresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionoptions_surveyquestionresponses` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `surveyq72c7options_ida` varchar(36) DEFAULT NULL,
  `surveyq10d4sponses_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveyquestionoptions_surveyquestionresponses_alt` (`surveyq72c7options_ida`,`surveyq10d4sponses_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions_surveyquestionresponses`
--

LOCK TABLES `surveyquestionoptions_surveyquestionresponses` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions_surveyquestionresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions_surveyquestionresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionresponses`
--

DROP TABLE IF EXISTS `surveyquestionresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `answer` text,
  `answer_bool` tinyint(1) DEFAULT NULL,
  `answer_datetime` datetime DEFAULT NULL,
  `surveyquestion_id` char(36) DEFAULT NULL,
  `surveyresponse_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionresponses`
--

LOCK TABLES `surveyquestionresponses` WRITE;
/*!40000 ALTER TABLE `surveyquestionresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionresponses_audit`
--

DROP TABLE IF EXISTS `surveyquestionresponses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestionresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestionresponses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionresponses_audit`
--

LOCK TABLES `surveyquestionresponses_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestionresponses_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionresponses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestions`
--

DROP TABLE IF EXISTS `surveyquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `happiness_question` tinyint(1) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestions`
--

LOCK TABLES `surveyquestions` WRITE;
/*!40000 ALTER TABLE `surveyquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestions_audit`
--

DROP TABLE IF EXISTS `surveyquestions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyquestions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestions_audit`
--

LOCK TABLES `surveyquestions_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestions_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyresponses`
--

DROP TABLE IF EXISTS `surveyresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `happiness` int(11) DEFAULT NULL,
  `email_response_sent` tinyint(1) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyresponses`
--

LOCK TABLES `surveyresponses` WRITE;
/*!40000 ALTER TABLE `surveyresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyresponses_audit`
--

DROP TABLE IF EXISTS `surveyresponses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_surveyresponses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyresponses_audit`
--

LOCK TABLES `surveyresponses_audit` WRITE;
/*!40000 ALTER TABLE `surveyresponses_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyresponses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `submit_text` varchar(255) DEFAULT 'Submit',
  `satisfied_text` varchar(255) DEFAULT 'Satisfied',
  `neither_text` varchar(255) DEFAULT 'Neither Satisfied nor Dissatisfied',
  `dissatisfied_text` varchar(255) DEFAULT 'Dissatisfied',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys_audit`
--

DROP TABLE IF EXISTS `surveys_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_surveys_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys_audit`
--

LOCK TABLES `surveys_audit` WRITE;
/*!40000 ALTER TABLE `surveys_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveys_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatesectionline`
--

DROP TABLE IF EXISTS `templatesectionline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatesectionline` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `grp` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatesectionline`
--

LOCK TABLES `templatesectionline` WRITE;
/*!40000 ALTER TABLE `templatesectionline` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatesectionline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=987 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
INSERT INTO `tracker` VALUES (65,'de7f4a1c-a439-b1cc-8254-63187baac897','1','Leads','6e9d2ff1-9f10-0b00-904e-631811f8c5c4',' ','2022-09-07 11:09:27','editview','eks2jbufpd0u8qhcbnptb7hka2',1,0),(89,'ada2e51a-a47c-7df3-3136-631a9e5ee4e5','1','Leads','632d79d6-a8ef-b71a-af48-63195160f80b',' ','2022-09-09 01:59:55','editview','v737amdfltsog0ehofaft3eu97',1,0),(90,'4c8d6f8c-08f2-f893-7930-631aa1ba31ac','1','Users','aacec1bd-6737-81e3-7365-631aa18cd430','MKT 1','2022-09-09 02:14:29','detailview','v737amdfltsog0ehofaft3eu97',1,0),(93,'89976421-ca2e-3645-4a77-631aa2a387ee','1','Users','130e2309-2bc1-b543-ba7c-631aa20981aa','MKT 2','2022-09-09 02:19:49','detailview','v737amdfltsog0ehofaft3eu97',1,0),(101,'360a50b8-f738-8cd9-798e-631aa82d1ada','1','SecurityGroups','dfa12131-8e00-2b02-393a-631aa74c9f7b','Group MKT','2022-09-09 02:42:39','detailview','v737amdfltsog0ehofaft3eu97',1,0),(109,'dfbc9bbe-be36-701e-76b9-631ac4e0e57d','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','632d79d6-a8ef-b71a-af48-63195160f80b',' ','2022-09-09 04:45:26','editview','7neg7ar7qeulrf35svp1m8hdd1',1,0),(127,'ef869efc-5ce2-8e88-e7af-631cc0ee4f94','1','ACLActions','de014649-f9cc-1fcc-5201-631cc0e83e34','Base Implementation.  Should be overridden.','2022-09-10 16:49:47','save','0dcllm7gg47ddvok4vdod0mbot',1,0),(130,'16f130b5-b33c-03ba-54d1-631cc1fc8965','1','ACLRoles','7f18f530-1593-32ca-2711-631cc1b64de0','test','2022-09-10 16:56:54','detailview','0dcllm7gg47ddvok4vdod0mbot',0,0),(133,'51187323-fd44-cae5-a3ce-631cc4a0f67e','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','190529f8-84aa-ac39-f895-631b0061bab8',' ','2022-09-10 17:08:51','editview','q1kas37db3se2s1p7j57klu6t0',1,0),(143,'97f2d8a2-d5b8-85f5-e7ee-631ccf42651e','1','ACLActions','7437f8a8-2f91-5cfd-ee44-631ccf247b41','Base Implementation.  Should be overridden.','2022-09-10 17:53:31','save','bgooj38lodo4uf9qdpj2k309sl',1,0),(151,'da561a2d-5c30-dc55-dfe2-631cd1882b3a','1','ACLRoles','aaa2bb50-d34a-18a8-20ed-631aa36a8fd9','Role MKT','2022-09-10 18:03:48','detailview','bgooj38lodo4uf9qdpj2k309sl',1,0),(169,'573424eb-82f0-52df-f71f-6320058a95fd','78e20ef0-7018-d656-107b-631aa2369613','Leads','b0633e39-5fe2-fd04-8b07-631cd57fd830',' ','2022-09-13 04:24:22','editview','24u7bm5oilh8klbphkegk3c6fa',1,0),(176,'bafe56d6-fe55-5ba1-01d0-632041c9d79d','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','b0633e39-5fe2-fd04-8b07-631cd57fd830',' ','2022-09-13 08:36:59','editview','b3kkjjv6kmga52pn0600l3hh4a',1,0),(192,'88505b35-2c4b-11fe-8d8b-63204ee3c9fc','1','Leads','190529f8-84aa-ac39-f895-631b0061bab8',' ','2022-09-13 09:33:30','editview','pjmgd80ta7q77ecflfk88qgv89',1,0),(202,'374a374e-840f-3d18-6c3c-6320718b8cf6','1','Users','aea7576b-420a-eaf1-8062-6320718d714a','super-mkt 1','2022-09-13 12:03:23','detailview','e01r3crcqt33jc5fap84hfnd10',1,0),(203,'6c4718b4-287f-2718-b06b-6320710715ee','1','Users','7eabb5c9-0e8a-f1d2-f1a9-632071c4140d','2 super-mkt','2022-09-13 12:03:56','detailview','e01r3crcqt33jc5fap84hfnd10',1,0),(208,'75a422c9-a26a-ef8d-a870-632072e73f7c','1','ACLRoles','f0c9f37e-dea4-91f4-1d6c-63207197e5be','Role Super-MKT','2022-09-13 12:07:56','detailview','e01r3crcqt33jc5fap84hfnd10',1,0),(222,'807a9434-82ce-2ca9-9834-6320bcffdbe5','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','c6af6513-1c27-f936-d588-631ed5c6c11d',' ','2022-09-13 17:22:42','detailview','dem1qildpjp4mag87o5t2l9qck',1,0),(223,'58b373ee-f675-493c-f790-6320bc9ebc8f','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','7905a97c-d0e8-df63-25a8-631afcda28c8',' ','2022-09-13 17:24:07','detailview','naovjrg1lvk1lqamb0jhm9gvg5',1,0),(227,'b2002ebe-cf8b-cd2f-501a-6320c452519f','aea7576b-420a-eaf1-8062-6320718d714a','Leads','c6af6513-1c27-f936-d588-631ed5c6c11d',' ','2022-09-13 17:56:26','detailview','m9qhfudjcmodt31jrc8qi9ai2h',1,0),(228,'e5d7c023-8568-e13e-c24f-63215ebb48e1','1','ACLActions','ba938611-3de5-1fdd-cc14-63215e3ed4b6','Base Implementation.  Should be overridden.','2022-09-14 04:55:13','save','7iaa9afmebo7c53tjt6sp959dh',1,0),(232,'589f2e12-159c-0f20-dafd-632162567f99','1','ACLActions','b4aeb968-cc2d-ec02-e952-6321626d70c6','Base Implementation.  Should be overridden.','2022-09-14 05:10:11','save','51j48nheqpgh4lirnmv6219lbu',1,0),(240,'6938e8f4-026b-263b-93e8-63217f260f3f','1','ACLRoles','a8a06751-bdc7-6245-a86c-63217f18824e','Role BU_TB','2022-09-14 07:13:41','detailview','deiu0kocrioe76rahj2en6q692',1,0),(249,'82dedcd6-33d2-0ac5-4acf-6321820228ca','1','Users','782a0c20-7f54-0fb0-125c-631aa22dc4e6','BU_TB','2022-09-14 07:27:04','detailview','deiu0kocrioe76rahj2en6q692',1,0),(256,'a3fa408e-b65f-a442-9f03-632182672f74','1','Users','bf510836-90a2-69d4-7db8-631aa285d1e7','BU_NTT','2022-09-14 07:28:41','detailview','deiu0kocrioe76rahj2en6q692',1,0),(257,'b7269f45-9a59-5a25-5ede-63218249bf26','1','Users','78e20ef0-7018-d656-107b-631aa2369613','BU_Q10','2022-09-14 07:28:49','detailview','deiu0kocrioe76rahj2en6q692',1,0),(261,'4034c455-8074-c5fa-cdc1-6321833d2a16','1','SecurityGroups','5f17c4f7-2fd0-8550-3614-632073805ac5','Group Super-MKT','2022-09-14 07:30:46','detailview','deiu0kocrioe76rahj2en6q692',1,0),(271,'1c2494dd-3a65-c7d8-1209-632184423735','1','SecurityGroups','6ab7b41d-4d2e-ce1c-8196-632184fd4008','Group BU TB','2022-09-14 07:35:09','detailview','deiu0kocrioe76rahj2en6q692',1,0),(282,'dc2d4d2a-0f08-aa28-64ab-6321994f8736','130e2309-2bc1-b543-ba7c-631aa20981aa','Leads','b0633e39-5fe2-fd04-8b07-631cd57fd830',' ','2022-09-14 09:07:35','editview','kn8dq55f6dkl8mbm2vb3bpjclf',1,0),(283,'85a1dc4e-f8b7-a513-1cfb-63219a8a995f','78e20ef0-7018-d656-107b-631aa2369613','Leads','190529f8-84aa-ac39-f895-631b0061bab8',' ','2022-09-14 09:08:59','editview','i7oqt3r9mma44uaj3aqsbbdc1p',1,0),(288,'34599a37-3f38-514e-9575-6321a029aa4a','1','Leads','7905a97c-d0e8-df63-25a8-631afcda28c8',' ','2022-09-14 09:36:45','editview','dtb0cmhbaofralabet8vdqtc7v',1,0),(292,'e60a175f-ac23-6ef1-1e3f-6321a3177ab5','1','Leads','b0633e39-5fe2-fd04-8b07-631cd57fd830',' ','2022-09-14 09:48:06','editview','dtb0cmhbaofralabet8vdqtc7v',1,0),(293,'cb763ea7-5ce5-a865-92a6-632223baf662','1','Leads','c6af6513-1c27-f936-d588-631ed5c6c11d',' ','2022-09-14 18:57:01','editview','v32kks3qathhj945n8ifvn2prt',1,0),(306,'99d05c74-74da-d3eb-7ed7-6322b1c97b35','1','Leads','6b45a7ed-a57c-3043-1ee9-6322addf34fd',' ','2022-09-15 04:59:47','editview','dr3j3orufr36rhdpq5af3oo5a0',1,0),(373,'661b4acb-088b-ad46-470c-632480793902','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','3c8ac035-6d67-7e4b-84c1-6322c925278e',' ','2022-09-16 13:57:38','detailview','afqrlpnvqg5h6oc8c0rf601g91',1,0),(401,'7d7d57dd-244e-d9ed-269d-63248925c6ef','df55b3c8-1764-6ebf-01dd-63218270e96b','Leads','c251c73e-7e2b-fcaa-3786-6322cafbef5b',' ','2022-09-16 14:34:56','detailview','f7h0u8purq1ojn66kre28hc6r5',1,0),(407,'e6188017-e869-9e74-c106-6325ce62723d','78e20ef0-7018-d656-107b-631aa2369613','Leads','3c8ac035-6d67-7e4b-84c1-6322c925278e',' ','2022-09-17 13:41:17','editview','bahrifr7grmg1fbejjr779qe7v',1,0),(410,'b66d4885-8a80-380a-7770-63269bff3b91','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','c251c73e-7e2b-fcaa-3786-6322cafbef5b',' ','2022-09-18 04:16:31','editview','eb3osum6fnadu16vl6eenvvj8s',1,0),(413,'af79c876-6354-6a3b-dc3c-63269ce2867f','aea7576b-420a-eaf1-8062-6320718d714a','Leads','3c8ac035-6d67-7e4b-84c1-6322c925278e',' ','2022-09-18 04:21:01','editview','2bi0d7vs41r190tobjbbv16vef',1,0),(415,'66b51ceb-e321-c187-48d0-63269d50451b','df55b3c8-1764-6ebf-01dd-63218270e96b','Leads','3c8ac035-6d67-7e4b-84c1-6322c925278e',' ','2022-09-18 04:23:06','editview','4sd3kp71jlpm2mcs5at1qlfi0p',1,0),(425,'8c5cac96-77e6-ac4f-6a83-6327d2deadb5','bf510836-90a2-69d4-7db8-631aa285d1e7','Leads','3c8ac035-6d67-7e4b-84c1-6322c925278e',' ','2022-09-19 02:22:46','editview','47q9e4jtm1p9ins2lt815ttbaq',1,0),(452,'a34b361e-c9c2-78ad-cee9-6327e53efda3','1','Leads','3c8ac035-6d67-7e4b-84c1-6322c925278e',' ','2022-09-19 03:42:08','editview','8q44qi072r82d838p3sgkssqtc',1,0),(457,'60604256-faca-7223-ea2c-6327e621b693','1','Leads','c251c73e-7e2b-fcaa-3786-6322cafbef5b',' ','2022-09-19 03:48:40','detailview','8q44qi072r82d838p3sgkssqtc',1,0),(458,'a9e03c37-f5f7-1b97-5445-632827258365','1','ACLActions','8b1212f2-2854-6281-1cd6-632827b335b7','Base Implementation.  Should be overridden.','2022-09-19 08:23:54','save','ub65q5d75q1tr0ns8p3sqin0c6',1,0),(470,'610c0db4-d06b-5d3b-971e-63282aff9519','1','Users','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','RO NTT 1','2022-09-19 08:39:03','detailview','ub65q5d75q1tr0ns8p3sqin0c6',1,0),(471,'2023c94a-bb34-fd70-d160-63282a98ad36','1','Users','df55b3c8-1764-6ebf-01dd-63218270e96b','RO NTT 2','2022-09-19 08:39:34','detailview','ub65q5d75q1tr0ns8p3sqin0c6',1,0),(472,'6648dd53-154f-51c4-2d99-63282aeb61fb','1','Users','62213397-e5c8-5e5d-d4be-63282ab9f739','RO Q10 1','2022-09-19 08:39:54','detailview','ub65q5d75q1tr0ns8p3sqin0c6',1,0),(479,'59592705-a3f9-77fd-9f81-63282bbc640c','1','Users','2ca94880-44b1-f16a-d2df-63282b8f2314','RO Q10 2','2022-09-19 08:41:39','detailview','ub65q5d75q1tr0ns8p3sqin0c6',1,0),(482,'b738cf99-ff09-3929-e40b-63282b8ef751','1','SecurityGroups','1ff39cae-999d-91f8-767f-63282bef6813','Group RO NTT','2022-09-19 08:42:55','detailview','ub65q5d75q1tr0ns8p3sqin0c6',1,0),(484,'31e47483-5cf0-6e5b-5afa-63282be2b1df','1','Users','c1abb968-9c8d-474e-c297-63282bf888ad','RO TB 1','2022-09-19 08:43:59','detailview','ub65q5d75q1tr0ns8p3sqin0c6',1,0),(489,'c7fb3286-a2e8-6139-dbf2-63283ce3d083','aea7576b-420a-eaf1-8062-6320718d714a','Leads','c251c73e-7e2b-fcaa-3786-6322cafbef5b',' ','2022-09-19 09:55:29','detailview','0taq3md1gplsdfogn7eb6qmku5',1,0),(492,'20bb4ae5-9184-a9f9-f87e-63288c1caea5','1','Leads','f3bf4122-8652-b4d8-fda2-63288bdd07f8',' ','2022-09-19 15:36:19','editview','52ukei7f7q6qq30cd2do3mhgjg',1,0),(500,'9e76c2c0-d1da-0997-25ff-632894a9c32e','1','ACLRoles','7e9d9fce-e2e9-dabe-de4b-6321809a28d7','Role RO Q10','2022-09-19 16:08:41','detailview','ehbesi366c09vg11hhc9qn5pv2',1,0),(504,'735c9987-12f3-786f-dca1-6328944013e3','1','SecurityGroups','79b8321c-fdc7-43f2-fd73-6321828ae207','Group RO Q10','2022-09-19 16:09:13','detailview','ehbesi366c09vg11hhc9qn5pv2',1,0),(505,'67db1716-04bc-aa00-3bea-632894768bf4','1','SecurityGroups','d96364ba-e304-6bc4-3d28-631aa891ee3e','Group BU Q10','2022-09-19 16:09:22','detailview','ehbesi366c09vg11hhc9qn5pv2',1,0),(506,'ac1940d9-323c-ea0a-21e0-6328956d1fe0','1','ACLRoles','e953f290-d6b8-5baf-1ecb-63217f15aec0','Role BU_NTT','2022-09-19 16:13:06','detailview','ehbesi366c09vg11hhc9qn5pv2',1,0),(507,'1769ff03-926c-eaaa-ee28-63289566bbe3','1','ACLRoles','3618d1f7-3eac-2e11-d0a6-631aa46ec64c','Role BU_Q10','2022-09-19 16:15:13','detailview','ehbesi366c09vg11hhc9qn5pv2',1,0),(509,'a59b22f5-de8b-05d4-91f6-6328961692b3','bf510836-90a2-69d4-7db8-631aa285d1e7','Leads','e8185917-455f-542f-0aee-6328901f0d18',' ','2022-09-19 16:17:27','editview','mov115noph16m7p4f987k5uv1k',1,0),(513,'e8f4bdc1-4d8b-13a6-db41-63289746f3f6','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','Leads','e8185917-455f-542f-0aee-6328901f0d18',' ','2022-09-19 16:25:00','detailview','0jsg9rj9peklca8dg21dddajan',1,0),(516,'5d13cbae-43af-e8c0-5dea-6328983a295a','1','Leads','e8185917-455f-542f-0aee-6328901f0d18',' ','2022-09-19 16:29:31','editview','jomvddmqep1ucgon7ii74bfkqc',1,0),(522,'9e9b3f97-c3d9-17d6-27f2-63289becb068','78e20ef0-7018-d656-107b-631aa2369613','Leads','f3f1a998-376a-fd34-e49e-632899c32c96',' ','2022-09-19 16:39:45','detailview','pele6qc2nt5g96eddld01i8uf7',1,0),(526,'783c439a-96a6-bc9b-aef3-63289c3bc419','62213397-e5c8-5e5d-d4be-63282ab9f739','Leads','f3f1a998-376a-fd34-e49e-632899c32c96',' ','2022-09-19 16:44:20','detailview','e1n4pofesopifgvqe067257h0k',1,0),(541,'18556856-137f-764e-0f5f-632988151f2b','1','Leads','f3f1a998-376a-fd34-e49e-632899c32c96',' ','2022-09-20 09:32:04','editview','a3jqn2rn2m2fjlh5qb7jcjbsad',1,0),(549,'784b2781-11e7-c6a6-63ac-632a60cf348b','2ca94880-44b1-f16a-d2df-63282b8f2314','Leads','a5841486-771d-5d76-716c-632a5e6c73cf',' ','2022-09-21 00:52:19','detailview','s1e2rpt3k3hiv1ffepk7oejq8k',1,0),(557,'71d0297f-3fa7-5019-b300-632a63373fe6','2ca94880-44b1-f16a-d2df-63282b8f2314','Leads','806f2bc8-6cf8-6a82-6e02-63298a01e069',' ','2022-09-21 01:05:58','editview','3l4ge5s1udjcn45328320tnmhh',1,0),(610,'eda6a8cd-6a92-7dca-e11c-632d5cb4ffb1','1','Leads','806f2bc8-6cf8-6a82-6e02-63298a01e069',' ','2022-09-23 07:12:02','editview','42nvrvpmhjvfbknd8c41n36e1u',1,0),(627,'f38785aa-40a8-3bd8-5040-6333b3f523c4','78e20ef0-7018-d656-107b-631aa2369613','Leads','a5841486-771d-5d76-716c-632a5e6c73cf',' ','2022-09-28 02:36:24','editview','brhibd509nsmbvm8mt5s7cm2tm',1,0),(648,'77344d48-f030-ee5a-4ab0-6333fa1e5bec','782a0c20-7f54-0fb0-125c-631aa22dc4e6','Leads','806f2bc8-6cf8-6a82-6e02-63298a01e069',' ','2022-09-28 07:42:37','editview','bsarhds1b1irgpk2oli1ohj8du',1,0),(663,'cbfd088d-fbd6-cce6-9903-6334f6fcb978','782a0c20-7f54-0fb0-125c-631aa22dc4e6','Leads','a5841486-771d-5d76-716c-632a5e6c73cf',' ','2022-09-29 01:37:03','editview','g1oh65t8rvp5ir8o8t0brqe6qp',1,0),(665,'48d2e48c-a51c-00f7-ec91-6334f7ca90a8','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','806f2bc8-6cf8-6a82-6e02-63298a01e069',' ','2022-09-29 01:38:45','detailview','qpr60gf648m6j4dasku5h1dqcs',1,0),(666,'5775d939-b758-bf6e-faf2-6334f708d7f8','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','a5841486-771d-5d76-716c-632a5e6c73cf',' ','2022-09-29 01:40:04','editview','qpr60gf648m6j4dasku5h1dqcs',1,0),(669,'947ed4eb-8ea4-2c04-7b7c-6334f8eeb85b','bf510836-90a2-69d4-7db8-631aa285d1e7','Leads','a5841486-771d-5d76-716c-632a5e6c73cf',' ','2022-09-29 01:42:39','editview','io65mglup8g79bvtcc6o2eticr',1,0),(675,'e60c2e84-0d26-1c6b-f82c-6334f99e423e','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','f3f1a998-376a-fd34-e49e-632899c32c96',' ','2022-09-29 01:49:45','editview','qpr60gf648m6j4dasku5h1dqcs',1,0),(689,'c4c8b815-b9bc-350a-89fb-6335648f959f','1','Leads','a5841486-771d-5d76-716c-632a5e6c73cf',' ','2022-09-29 09:26:16','editview','9ri459r4tml7tuhjt1q44dtnqa',1,0),(705,'5aa62bc9-40fe-75dc-33fb-633a631d18e1','1','Leads','673eee13-cfe4-b462-07f0-6336a0424211',' ','2022-10-03 04:22:32','editview','ikb4g1mn07aoqil8vqph3fq4mc',1,0),(706,'becb070d-a885-73b9-24ae-633a633c59fa','1','Leads','ee2730da-ef2a-1296-436f-633569e674b0',' ','2022-10-03 04:22:54','editview','ikb4g1mn07aoqil8vqph3fq4mc',1,0),(707,'64f8fa17-fdfe-5940-bc32-633a634e4355','1','Leads','361c3c33-bc85-3469-b0a4-633556037f46',' ','2022-10-03 04:23:03','editview','ikb4g1mn07aoqil8vqph3fq4mc',1,0),(708,'a8d1ac60-4b4b-9b7e-dbb3-633a6408efc3','1','Leads','3f30c5ce-fbde-7b97-fb36-633a64e84edf',' ','2022-10-03 04:27:06','detailview','ikb4g1mn07aoqil8vqph3fq4mc',1,0),(709,'aa7fd11a-66b3-04e4-81dc-633a66b5128d','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','3f30c5ce-fbde-7b97-fb36-633a64e84edf',' ','2022-10-03 04:36:48','editview','cspb3qeb27ua1vgfkiu89j2v05',1,0),(710,'5f7c65b5-ccdf-77e3-c760-633a678178bf','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','bf100f32-8e21-4d9a-07ee-633a6718d59e',' ','2022-10-03 04:37:47','detailview','cspb3qeb27ua1vgfkiu89j2v05',1,0),(711,'3765265d-b7a7-0cac-1f04-633a6b996cc0','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','af2a2717-51f9-4821-ce7d-633a6bd6a620',' ','2022-10-03 04:54:39','detailview','cspb3qeb27ua1vgfkiu89j2v05',1,0),(719,'20622925-d37f-1f3d-6c25-633bb7a0e125','1','SecurityGroups','52b53235-8a51-4802-205b-633bb79cb519','Group BU TELE','2022-10-04 04:32:12','detailview','omuu172f093k8g1la2k3ub0qnr',1,0),(721,'e771b21b-9351-112f-01ef-633bb7810564','1','Users','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','BU_TELE','2022-10-04 04:33:58','detailview','omuu172f093k8g1la2k3ub0qnr',1,0),(725,'c85716b5-16ce-45a7-0dbf-633c0481f77d','1','Leads','af2a2717-51f9-4821-ce7d-633a6bd6a620',' ','2022-10-04 10:02:37','editview','0d7j1075ce72rg7547e2o41g53',1,0),(728,'c009c567-3b55-0e3d-e8ba-633cede5534e','1','Leads','759573d3-d4fb-c575-9d79-633cec47f485',' ','2022-10-05 02:36:08','detailview','t4vfsa4bmgd0pnebice6j4omro',1,0),(729,'4dd13bf7-77d3-1adb-63c4-633cefb5cbc6','1','Leads','a4ab06f9-2f8d-ecc1-4cda-633cef1bee20',' ','2022-10-05 02:43:35','detailview','t4vfsa4bmgd0pnebice6j4omro',1,0),(734,'adc9bac3-d76d-3c86-ca7d-633cf3cf89ef','78e20ef0-7018-d656-107b-631aa2369613','Leads','c9dca761-da35-71ef-9950-633cf17e200d',' ','2022-10-05 03:03:27','detailview','giulbnlrb89tpckkl5dj089hmt',1,0),(736,'d31d6699-b74b-63ac-d429-633d40a22380','62213397-e5c8-5e5d-d4be-63282ab9f739','Leads','c9dca761-da35-71ef-9950-633cf17e200d',' ','2022-10-05 08:29:23','editview','gdd4ae0iikcel167e12onrk03t',1,0),(741,'efd1c3f2-2998-a22b-b8f1-633e5b846166','1','Leads','c9dca761-da35-71ef-9950-633cf17e200d',' ','2022-10-06 04:36:55','editview','p649kh6gji4kliv7u60a0nk7qp',1,0),(744,'41e13a12-20ca-c817-3cd2-63469862fbd2','1','Users','194493f9-5af3-a81b-bca8-6346986f2e4b','RO TELE 1','2022-10-12 10:35:20','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(745,'edaf1eaa-9eb3-e888-1767-634698a1ecd3','1','Users','88c77436-5bc0-36f5-58c5-634698297705','RO TELE 2','2022-10-12 10:35:56','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(746,'27d8dee1-7684-a7ca-ff35-634698c0849f','1','Users','ce9806a2-8b0a-bc73-1b6d-63469814cb69','RO DL TB 1','2022-10-12 10:36:33','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(747,'c1dcb17f-ead4-c21e-3c5f-634698de046e','1','Users','ddee979a-ef5a-e49b-3ce1-634698e24c4a','RO DL TB 2','2022-10-12 10:36:49','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(748,'1de8d8ef-05d0-84aa-3273-634698e497d8','1','Users','29cbc651-ca2e-ff42-0ba8-634698d9fce9','BU DL TB','2022-10-12 10:37:14','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(750,'b94b051d-92ac-80ff-ec52-634699cc5588','1','SecurityGroups','a3d022e0-cfd6-008a-119f-6346992b57ee','GROUP RO TELE','2022-10-12 10:38:43','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(754,'b99b15b5-d31f-f3a5-a85a-63469c5f2e5b','1','Users','1e53686b-f1aa-8dac-5bcf-63282bc67ade','RO TB 2','2022-10-12 10:53:08','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(761,'23758200-e67a-2e9d-5a53-63469e19b8ea','1','ACLRoles','b329c6f0-24d9-a2c0-324c-632828771d55','Role RO NTT','2022-10-12 11:03:05','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(762,'afa4564a-7ebb-c8b0-8cec-63469f00675a','1','ACLRoles','a8a06751-bdc7-6245-a86c-63217f18824e','Role BU_TB','2022-10-12 11:03:34','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(764,'1effc134-3792-ea15-bee5-63469fb435f2','1','ACLRoles','ebe0e79b-131b-d193-5dac-6328292eac56','Role RO TB','2022-10-12 11:04:08','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(765,'c663a870-5efa-3202-5d59-63469fa13714','1','SecurityGroups','264b046f-0cfa-345d-b5eb-63282bd940d5','Group RO TB','2022-10-12 11:04:10','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(766,'e6bb06b6-3d86-69b6-181b-63469f68028a','1','SecurityGroups','1a4a0a4b-5e59-c546-4d71-632184df9cc8','Group BU NTT','2022-10-12 11:06:12','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(779,'4e9f02c1-2b9c-be5d-872f-63470e21c479','1','ACLRoles','7a0bb7a5-8eb4-6e41-be66-6346976166eb','Role RO TELE','2022-10-12 18:58:18','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(781,'766db325-5f0d-148f-6191-63470f1ce529','1','ACLRoles','60a56750-f8f5-b323-b710-63470b86bb97','Role RO DL TB','2022-10-12 19:02:14','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(782,'c94079dc-1e23-a1ef-a274-63470f916fd8','1','ACLRoles','98df1461-26e0-dad1-82e2-63470c4d04b8','Role BU_DL_TB','2022-10-12 19:02:25','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(783,'5e37cd80-f247-3659-6c98-63470ffe56c2','1','ACLRoles','ca9a06cc-fa08-23d1-17d5-633b96a297d9','Role BU_TELE','2022-10-12 19:02:28','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(786,'2791b720-c087-95b0-6f55-63470f0f15f1','1','SecurityGroups','10f74cd1-25e7-76ea-e68d-63470f9cade3','Group BU DL TB','2022-10-12 19:03:49','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(788,'d34deaa3-4cd1-2418-3d58-63470f6a6bd7','1','SecurityGroups','250c2bd2-858b-9667-9b9c-63470f5e44be','Group RO DL TB','2022-10-12 19:05:00','detailview','trovtidp2ueitpt9g8q6uo8ddb',1,0),(809,'940131d5-7d98-853d-57f1-634798e111f3','29cbc651-ca2e-ff42-0ba8-634698d9fce9','Leads','827b74b9-38f9-f0f0-c26a-63478d536619',' ','2022-10-13 04:46:27','detailview','ilni550qcrnggfhu8s82tp8knc',1,0),(813,'bebb08b9-de36-90f1-56ad-634799b0ac3f','ce9806a2-8b0a-bc73-1b6d-63469814cb69','Leads','827b74b9-38f9-f0f0-c26a-63478d536619',' ','2022-10-13 04:52:59','editview','pp6jagsvstd5pf4dp2fka4rria',1,0),(817,'8a2230e3-59c0-75a4-1ddf-6347badd7e1f','aea7576b-420a-eaf1-8062-6320718d714a','Leads','d56206dd-8f0f-e94d-5dd0-633cf312bd9e',' ','2022-10-13 07:13:54','detailview','q2nvndt7lqebla37e8n5nvlq8l',1,0),(826,'45ee9058-1a4b-7e75-a91b-634a43bedbda','1','Leads','d56206dd-8f0f-e94d-5dd0-633cf312bd9e',' ','2022-10-15 05:21:14','editview','stf4rkb1uba8sf368fbtmr5p64',1,0),(832,'e55af4a1-21a8-c769-bc53-63845b31419c','62213397-e5c8-5e5d-d4be-63282ab9f739','Leads','2d69653d-48eb-fff5-6c94-63845977f397',' ','2022-11-28 06:56:56','detailview','tqt9ns5amim9ufiuh17ft560im',1,0),(843,'f2b1a7ee-cc4e-cf90-e834-6384641ffb90','1','Leads','efdc7fb4-bc53-1454-4104-6347140eb24b',' ','2022-11-28 07:36:02','editview','8h1con2k6leoakuid21k7bm7h7',1,0),(853,'da4f0620-d60e-5579-9d89-63846e8f03a3','782a0c20-7f54-0fb0-125c-631aa22dc4e6','Leads','2d69653d-48eb-fff5-6c94-63845977f397',' ','2022-11-28 08:18:22','detailview','jnn0sjqaphk5nij9l1o7jdg93l',1,0),(858,'944e1126-09a4-0c5b-bf4b-6384709a2cf4','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','c9dca761-da35-71ef-9950-633cf17e200d',' ','2022-11-28 08:25:57','detailview','ead0tg6jgva5nker448i6tj3n4',1,0),(861,'94ecbbc0-a218-760d-8183-6384704d1548','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','efdc7fb4-bc53-1454-4104-6347140eb24b',' ','2022-11-28 08:26:20','editview','ead0tg6jgva5nker448i6tj3n4',1,0),(862,'8f5b8f0b-6307-b3fc-cfb4-638470add5de','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','827b74b9-38f9-f0f0-c26a-63478d536619',' ','2022-11-28 08:26:30','editview','ead0tg6jgva5nker448i6tj3n4',1,0),(865,'305de49c-8df4-4130-fc5f-638470c70fff','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','d56206dd-8f0f-e94d-5dd0-633cf312bd9e',' ','2022-11-28 08:27:03','editview','ead0tg6jgva5nker448i6tj3n4',1,0),(918,'6fdff013-6726-7f93-ea58-638f0edacde4','1','Leads','2d69653d-48eb-fff5-6c94-63845977f397',' ','2022-12-06 09:42:53','editview','uac226nk6loqhl0t0mblf4trh2',1,0),(919,'7bf53b11-4427-66c6-1624-638f0f5f9f1e','1','Leads','827b74b9-38f9-f0f0-c26a-63478d536619',' ','2022-12-06 09:44:52','editview','uac226nk6loqhl0t0mblf4trh2',1,0),(922,'8bba43ae-b2a9-c989-33cc-639150aadd53','1','Users','1','Administrator','2022-12-08 02:47:34','editview','q8agie8l5bvk9j27n81mgh6odo',1,0),(942,'1d22190e-e13e-5543-6085-639252a5d544','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','2d69653d-48eb-fff5-6c94-63845977f397',' ','2022-12-08 21:11:09','detailview','1hidm69r6tedmn8im8g9nj4b5i',1,0),(943,'53e169b0-2ea5-841f-6ec3-6392528eca3a','aacec1bd-6737-81e3-7365-631aa18cd430','Users','aacec1bd-6737-81e3-7365-631aa18cd430','MKT 1','2022-12-08 21:11:27','editview','1hidm69r6tedmn8im8g9nj4b5i',1,0),(944,'1be29d82-5aa2-1882-ff59-6392532ad965','1e53686b-f1aa-8dac-5bcf-63282bc67ade','Users','1e53686b-f1aa-8dac-5bcf-63282bc67ade','RO TB 2','2022-12-08 21:14:44','editview','a9a2t5oob22lgp8v14bmh49vs7',1,0),(948,'45331c83-63c4-7c6d-28a9-6392b437c129','1','Leads','3331037a-6b8d-cbe0-22e7-638470e5e320','LÊ VĂN HAN','2022-12-09 04:09:28','editview','1nqagosshbj56f5tr19us0q0sg',1,0),(958,'81be8c9e-9e93-455e-66f4-6392dd2fb69e','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','68432e07-8302-226c-5dc1-6392da67c274','NGUYỄN HOÀNG TIẾN','2022-12-09 07:00:17','detailview','g1t47so6cii45n4b0ar32p3ga0',1,0),(971,'33b72f5a-8a31-2315-a30a-6392df254587','1','Leads','68432e07-8302-226c-5dc1-6392da67c274','NGUYỄN HOÀNG TIẾN','2022-12-09 07:11:10','editview','74qc25vlu928k7m0a8l9m47kvc',1,0),(976,'b5895e63-614d-402b-79ba-6392e232bdaf','aacec1bd-6737-81e3-7365-631aa18cd430','Leads','3331037a-6b8d-cbe0-22e7-638470e5e320','LÊ VĂN HAN','2022-12-09 07:25:39','editview','g1t47so6cii45n4b0ar32p3ga0',1,0),(979,'b3b00d07-346e-7223-0113-6392e600430f','1e53686b-f1aa-8dac-5bcf-63282bc67ade','Leads','68432e07-8302-226c-5dc1-6392da67c274','NGUYỄN HOÀNG TIẾN','2022-12-09 07:38:46','editview','rkqvchvnonr9to8qnn6ko71a82',1,0),(986,'8fd5fd81-2067-4017-5d0c-6392e70efe63','1e53686b-f1aa-8dac-5bcf-63282bc67ade','Leads','3331037a-6b8d-cbe0-22e7-638470e5e320','LÊ VĂN HAN','2022-12-09 07:45:38','editview','bgcj3ur9mss98to4gpr3b96sli',1,0);
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_history`
--

DROP TABLE IF EXISTS `upgrade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_history`
--

LOCK TABLES `upgrade_history` WRITE;
/*!40000 ALTER TABLE `upgrade_history` DISABLE KEYS */;
INSERT INTO `upgrade_history` VALUES ('59b25fa1-8f40-acf3-cf8c-632035bbdfc1','upload/upgrades/langpack/vi.zip','5e4e19c7b060f36468479ee7a3ae0caa','langpack','installed','7.10.7.10','Vietnamese (Viet Nam)','Translation: www.crowdin.com/project/suitecrmtranslations','vi_VN','YTozOntzOjg6Im1hbmlmZXN0IjthOjk6e3M6NDoibmFtZSI7czoyMToiVmlldG5hbWVzZSAoVmlldCBOYW0pIjtzOjExOiJkZXNjcmlwdGlvbiI7czo1NzoiVHJhbnNsYXRpb246IHd3dy5jcm93ZGluLmNvbS9wcm9qZWN0L3N1aXRlY3JtdHJhbnNsYXRpb25zIjtzOjQ6InR5cGUiO3M6ODoibGFuZ3BhY2siO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO3M6MzoiWWVzIjtzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjA6e31zOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6MTp7aTowO3M6MjoiQ0UiO31zOjY6ImF1dGhvciI7czoyMzoiQ+G7mW5nIMSR4buTbmcgU3VpdGVDUk0iO3M6NzoidmVyc2lvbiI7czo5OiI3LjEwLjcuMTAiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjEwOiIyMDE5LTAxLTI4Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6Mzp7czoyOiJpZCI7czo1OiJ2aV9WTiI7czo5OiJpbWFnZV9kaXIiO3M6MTc6IjxiYXNlcGF0aD4vaW1hZ2VzIjtzOjQ6ImNvcHkiO2E6Mzp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjE4OiI8YmFzZXBhdGg+L2luY2x1ZGUiO3M6MjoidG8iO3M6NzoiaW5jbHVkZSI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czoxODoiPGJhc2VwYXRoPi9tb2R1bGVzIjtzOjI6InRvIjtzOjc6Im1vZHVsZXMiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6MTg6IjxiYXNlcGF0aD4vaW5zdGFsbCI7czoyOiJ0byI7czo3OiJpbnN0YWxsIjt9fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==','2022-09-13 07:45:31',1);
/*!40000 ALTER TABLE `upgrade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('100e1c1c-eadc-0eb6-2741-63218d7aa915','Home2_ACCOUNT',0,'2022-09-14 08:14:19','2022-09-14 08:14:19','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('10e23cb5-e323-2acb-0454-633bcb77e2cb','Home2_SUGARFEED',0,'2022-10-04 05:59:48','2022-10-04 05:59:48','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('113d0035-252a-4469-490b-633bcb9af680','Home2_LEAD_b03a74d0-15e2-743b-5ab3-633bcbeafc24',0,'2022-10-04 06:00:01','2022-10-04 06:00:01','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('11920ce4-16de-81fe-c3a2-639252198e28','Home',0,'2022-12-08 21:10:41','2022-12-08 21:10:41','194493f9-5af3-a81b-bca8-6346986f2e4b','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImU1ZWY2YjRhLTUxMTctNTZkZC0zNTRjLTYzOTI1MjI2ODNmOCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImU1ZmYxMGYxLTIxMzktYjJmYi1hMDg3LTYzOTI1MjA3NmVmZCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImU2MGU3MjQ1LTU5ODAtY2YwOC01ZTIyLTYzOTI1MmQ3NTVhMyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImU2MWJkM2Y3LTFkMzQtOGI0ZC1iMjM2LTYzOTI1MjU3MGQ4MyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZTYzMWYyM2UtNmE4OC0yOGQwLWVlMTYtNjM5MjUyNTgxMzQwIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZTY0MmM0NjAtNmY0Ny00OWRlLTcyMWUtNjM5MjUyYzc4ZDEwIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiJlNWZmMTBmMS0yMTM5LWIyZmItYTA4Ny02MzkyNTIwNzZlZmQiO2k6MTtzOjM2OiJlNjBlNzI0NS01OTgwLWNmMDgtNWUyMi02MzkyNTJkNzU1YTMiO2k6MjtzOjM2OiJlNjFiZDNmNy0xZDM0LThiNGQtYjIzNi02MzkyNTI1NzBkODMiO2k6MztzOjM2OiJlNjMxZjIzZS02YTg4LTI4ZDAtZWUxNi02MzkyNTI1ODEzNDAiO2k6NDtzOjM2OiJlNjQyYzQ2MC02ZjQ3LTQ5ZGUtNzIxZS02MzkyNTJjNzhkMTAiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImU1ZWY2YjRhLTUxMTctNTZkZC0zNTRjLTYzOTI1MjI2ODNmOCI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('1416f6c4-41c3-cd6f-baf2-631ed53989c8','ETag',0,'2022-09-12 06:47:20','2022-09-12 06:47:20','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('158657db-c613-7b55-2001-631ac38b9894','ETag',0,'2022-09-09 04:39:16','2022-09-09 04:39:16','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('16528d40-59c2-c077-fbfd-63469d5c2afc','Home2_CALL',0,'2022-10-12 10:55:49','2022-10-12 10:55:49','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1697fbc1-d9b9-6a7a-cb82-632071c6af36','global',0,'2022-09-13 12:03:55','2022-09-13 12:03:55','7eabb5c9-0e8a-f1d2-f1a9-632071c4140d','YTozODp7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoyMDoic29ydF9tb2R1bGVzX2J5X25hbWUiO3M6MDoiIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjI6Im9uIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO3M6MjoiNjAiO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO3M6MjoiNjAiO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7czoxOiIwIjtzOjg6InRpbWV6b25lIjtzOjEzOiJFdXJvcGUvQmVybGluIjtzOjI6InV0IjtzOjE6IjAiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo0OiJmZG93IjtzOjE6IjAiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjg6InN1YnRoZW1lIjtzOjQ6IkRhd24iO3M6MTU6ImxvZ2luZXhwaXJhdGlvbiI7czoxOiIwIjtzOjc6ImxvY2tvdXQiO3M6MDoiIjtzOjExOiJsb2dpbmZhaWxlZCI7czoxOiIwIjt9'),('17c7beff-46f5-810b-b00e-63219a0d05ca','Home2_ACCOUNT',0,'2022-09-14 09:09:58','2022-09-14 09:09:58','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('18de5601-03d7-c653-4280-631ed6c6bd3c','Home2_LEAD',0,'2022-09-12 06:47:25','2022-09-12 06:47:25','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('195412ae-9eb6-8d1c-3482-631aa3671d3a','ACLRoles2_ACLROLE',0,'2022-09-09 02:21:14','2022-09-09 02:21:14','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('198633b1-c417-86b3-ae0e-631cc504994d','Home2_MEETING',0,'2022-09-10 17:14:30','2022-09-10 17:14:30','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1c429537-bcc0-445f-031e-63218253e965','Emails',0,'2022-09-14 07:27:48','2022-09-19 08:37:53','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YTowOnt9'),('1c4db9db-0cb0-bce4-975a-632182977ece','global',0,'2022-09-14 07:29:33','2022-11-28 06:55:56','df55b3c8-1764-6ebf-01dd-63218270e96b','YTo0Mzp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO3M6NDoiMTgwMCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czo0OiIzNjAwIjtzOjE2OiJyZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6MjI6ImVtYWlsX3JlbWluZGVyX2NoZWNrZWQiO3M6MToiMCI7czo4OiJ0aW1lem9uZSI7czoxMzoiRXVyb3BlL0JlcmxpbiI7czoyOiJ1dCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6Ii05OSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NDoiZmRvdyI7czoxOiIwIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE2OiJleHBvcnRfZGVsaW1pdGVyIjtzOjE6IiwiO3M6MjI6ImRlZmF1bHRfZXhwb3J0X2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjI6Im9uIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czowOiIiO3M6MTI6Im1haWxfc210cHNzbCI7aTowO3M6MTU6ImVtYWlsX2xpbmtfdHlwZSI7czo1OiJzdWdhciI7czoxMToiZWRpdG9yX3R5cGUiO3M6NjoibW96YWlrIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjA6IiI7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MTA6IlThuqV0IGPhuqMiO3M6NjoiTGVhZHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fXM6MTA6IkNhbXBhaWduc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czoxMDoiUHJvc3BlY3RzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO319'),('1c92a077-0b71-87bf-be48-63218d5fcc03','Home2_LEAD',0,'2022-09-14 08:14:19','2022-09-14 08:14:19','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1cfa0d41-2e93-74a9-555e-633bcb9f04dc','Home2_LEAD',0,'2022-10-04 05:59:48','2022-10-04 05:59:48','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1d801349-c778-2fcb-31cf-6347911105a3','Home',0,'2022-10-13 04:19:51','2022-10-13 04:19:51','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImUyYjQwYmZmLTE3NjUtYTQ3Yy1hOTM5LTYzNDc5MTVkMDE0MiI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImUzYmUwODVjLTZhNzktNTZkZi1kMTNjLTYzNDc5MWFmNTZkOSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImU0YTkwNTM0LWE1ZmItYTE1ZC0zOTQzLTYzNDc5MTkwMDY4MyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImU1N2QwMTg0LTE2MWMtODJmMi01ZWIxLTYzNDc5MTNlMTMyMyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZTY4ODAxMTgtYTgyNC05ZTExLTY2MDktNjM0NzkxMzZlMDg3IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZTc4YjAyMjUtZWRiOC1hOWUxLWQ5YTItNjM0NzkxOGUwY2Y0IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiJlM2JlMDg1Yy02YTc5LTU2ZGYtZDEzYy02MzQ3OTFhZjU2ZDkiO2k6MTtzOjM2OiJlNGE5MDUzNC1hNWZiLWExNWQtMzk0My02MzQ3OTE5MDA2ODMiO2k6MjtzOjM2OiJlNTdkMDE4NC0xNjFjLTgyZjItNWViMS02MzQ3OTEzZTEzMjMiO2k6MztzOjM2OiJlNjg4MDExOC1hODI0LTllMTEtNjYwOS02MzQ3OTEzNmUwODciO2k6NDtzOjM2OiJlNzhiMDIyNS1lZGI4LWE5ZTEtZDlhMi02MzQ3OTE4ZTBjZjQiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImUyYjQwYmZmLTE3NjUtYTQ3Yy1hOTM5LTYzNDc5MTVkMDE0MiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('1e2537e2-c0d2-0621-e12d-63925211717a','Home2_CALL',0,'2022-12-08 21:10:41','2022-12-08 21:10:41','194493f9-5af3-a81b-bca8-6346986f2e4b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1ef1b10d-d037-f7de-b8a3-631991be8d2f','Users2_USER',0,'2022-09-08 06:55:17','2022-09-08 06:55:17','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('207a39fa-bd8e-b5c0-125a-631cc55930fd','ETag',0,'2022-09-10 17:14:27','2022-09-10 17:14:27','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('20b279a5-6da4-6485-bcb4-6320c06f36a2','Home2_MEETING',0,'2022-09-13 17:38:38','2022-09-13 17:38:38','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('20d63d99-5556-fabf-b21d-631ab0804de2','ETag',0,'2022-09-09 03:20:11','2022-12-08 21:11:30','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('21f336ca-58c4-0f0e-4a88-63469dfb44c5','Home2_MEETING',0,'2022-10-12 10:55:49','2022-10-12 10:55:49','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('22028508-95d7-6765-0a2d-63219aa4b3b3','Home2_LEAD',0,'2022-09-14 09:09:58','2022-09-14 09:09:58','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('230a40ff-4e06-596a-f547-63925399c1e1','Emails',0,'2022-12-08 21:14:45','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YTowOnt9'),('23b4f0c1-f17b-de45-0aa4-632a5fe0951e','Home2_LEAD_a88f9bd9-6aa0-a835-7c61-632a5ffa4ae5',0,'2022-09-21 00:49:25','2022-09-21 00:49:25','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('24dcf576-853e-c61a-b569-633bcb46ad90','Home',0,'2022-10-04 05:59:48','2022-10-04 05:59:48','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImFiYjllYzkxLWIzODMtYjM2Zi0yNjViLTYzM2JjYjhjZTYzNiI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImFjOWFlMGI5LTBmMTQtY2IwNC1mZWY1LTYzM2JjYjQ0NWM2ZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImFkOGExZGE4LWU0ZDYtOGI0Ni1mOTI1LTYzM2JjYmU1MmEzYSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImFlM2FkM2NiLThjNWMtZDNmZS00ZGY5LTYzM2JjYmJkMTVmNSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYWYzY2Q1ZTYtNjQ1Ny00YWJiLTE3ODYtNjMzYmNiMjU2N2U1IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYjAzYTc0ZDAtMTVlMi03NDNiLTVhYjMtNjMzYmNiZWFmYzI0IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiJhYzlhZTBiOS0wZjE0LWNiMDQtZmVmNS02MzNiY2I0NDVjNmUiO2k6MTtzOjM2OiJhZDhhMWRhOC1lNGQ2LThiNDYtZjkyNS02MzNiY2JlNTJhM2EiO2k6MjtzOjM2OiJhZTNhZDNjYi04YzVjLWQzZmUtNGRmOS02MzNiY2JiZDE1ZjUiO2k6MztzOjM2OiJhZjNjZDVlNi02NDU3LTRhYmItMTc4Ni02MzNiY2IyNTY3ZTUiO2k6NDtzOjM2OiJiMDNhNzRkMC0xNWUyLTc0M2ItNWFiMy02MzNiY2JlYWZjMjQiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImFiYjllYzkxLWIzODMtYjM2Zi0yNjViLTYzM2JjYjhjZTYzNiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('25044d56-124e-8eb8-601e-631ed578a896','Home',0,'2022-09-12 06:47:25','2022-09-12 06:47:25','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjNmOWVmZTk1LWIwMGYtZjg5ZS1jNDljLTYzMWVkNWY2MTNlNSI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjQxMDEyMzU2LTJkYTQtNGNiMS1jZmM0LTYzMWVkNTdkY2RlZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjQyYTJlMWYxLTcxMjktYzg3NC1jNzg1LTYzMWVkNWQ4NTZhMyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjQ0NDYyMzdkLTY3M2EtYjFiMC1hZTlhLTYzMWVkNWQ0ZDZkYyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNDVjMjBhMmMtMTIyNy0zYjg4LTZkZWYtNjMxZWQ1ZmUwMzk4IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNDZmYmYxMDItOTE3OS03ODcyLWRlOTgtNjMxZWQ1MzYyNDAyIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI0MTAxMjM1Ni0yZGE0LTRjYjEtY2ZjNC02MzFlZDU3ZGNkZWUiO2k6MTtzOjM2OiI0MmEyZTFmMS03MTI5LWM4NzQtYzc4NS02MzFlZDVkODU2YTMiO2k6MjtzOjM2OiI0NDQ2MjM3ZC02NzNhLWIxYjAtYWU5YS02MzFlZDVkNGQ2ZGMiO2k6MztzOjM2OiI0NWMyMGEyYy0xMjI3LTNiODgtNmRlZi02MzFlZDVmZTAzOTgiO2k6NDtzOjM2OiI0NmZiZjEwMi05MTc5LTc4NzItZGU5OC02MzFlZDUzNjI0MDIiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjNmOWVmZTk1LWIwMGYtZjg5ZS1jNDljLTYzMWVkNWY2MTNlNSI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('2578827d-e7a8-f26f-5b7a-63199f9d14c9','Campaigns2_CAMPAIGN',0,'2022-09-08 07:53:39','2022-09-08 07:53:39','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('27161bb1-1f22-1190-f489-63479134e5e0','Home2_CALL',0,'2022-10-13 04:19:51','2022-10-13 04:19:51','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('27949eac-3e43-7dd9-543e-6347918844a8','Home2_LEAD_e78b0225-edb8-a9e1-d9a2-6347918e0cf4',0,'2022-10-13 04:19:52','2022-10-13 04:19:52','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2829e8b9-0795-1816-1b6e-63218dca3b10','ETag',0,'2022-09-14 08:14:18','2022-09-14 08:14:18','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('29368f64-fda1-81bf-43ea-6392521dc4a6','Home2_MEETING',0,'2022-12-08 21:10:41','2022-12-08 21:10:41','194493f9-5af3-a81b-bca8-6346986f2e4b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('293e8a78-560e-9d68-52f1-6320c05e491a','ETag',0,'2022-09-13 17:38:36','2022-09-13 17:38:36','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('29815ccc-8f2d-1a3d-ff68-631ab0225894','Home2_MEETING',0,'2022-09-09 03:20:14','2022-09-09 03:20:14','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('29f15e5c-3acf-1524-98bd-633a5dff8cd9','Home2_OPPORTUNITY',0,'2022-10-03 03:57:40','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2b8f200c-7c96-3813-29d4-63219aab03f4','Home2_SUGARFEED',0,'2022-09-14 09:09:58','2022-09-14 09:09:58','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2bba03bc-55b5-f947-2e6c-63846716b32e','Employees2_EMPLOYEE',0,'2022-11-28 07:49:13','2022-11-28 07:49:21','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2bcea9aa-e9ea-294f-9846-63218daa3963','Home2_SUGARFEED',0,'2022-09-14 08:14:19','2022-09-14 08:14:19','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2c2c053d-74be-f916-9a04-631cc5fa3f11','Home2_CALL',0,'2022-09-10 17:14:30','2022-09-10 17:14:30','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2d75c9ec-641f-3679-09fb-631ed66a1e32','Home2_SUGARFEED',0,'2022-09-12 06:47:25','2022-09-12 06:47:25','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2dc99ebd-3ce9-bdd5-f2c6-63469d7b8088','Home2_OPPORTUNITY',0,'2022-10-12 10:55:49','2022-10-12 10:55:49','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2fb7e3b6-ee14-0af5-34ae-634791e8fd38','Home2_MEETING',0,'2022-10-13 04:19:51','2022-10-13 04:19:51','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3032ce92-d930-8ef8-0f33-631aa28be65d','global',0,'2022-09-09 02:17:31','2022-11-28 08:11:58','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YTo0MTp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO3M6NDoiMTgwMCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czo0OiIzNjAwIjtzOjE2OiJyZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6MjI6ImVtYWlsX3JlbWluZGVyX2NoZWNrZWQiO3M6MToiMCI7czo4OiJ0aW1lem9uZSI7czoxMzoiRXVyb3BlL0JlcmxpbiI7czoyOiJ1dCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6Ii05OSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NDoiZmRvdyI7czoxOiIwIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE2OiJleHBvcnRfZGVsaW1pdGVyIjtzOjE6IiwiO3M6MjI6ImRlZmF1bHRfZXhwb3J0X2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjI6Im9uIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czowOiIiO3M6MTI6Im1haWxfc210cHNzbCI7aTowO3M6MTU6ImVtYWlsX2xpbmtfdHlwZSI7czo1OiJzdWdhciI7czoxMToiZWRpdG9yX3R5cGUiO3M6NjoibW96YWlrIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjA6IiI7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjtzOjY6IkxlYWRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO319'),('30ee9aa4-1f9c-ce5f-c063-6321803f4f82','Emails',0,'2022-09-14 07:20:40','2022-09-14 07:20:46','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YTowOnt9'),('31adf005-240f-a705-31ca-6346987692d5','global',0,'2022-10-12 10:36:48','2022-10-12 10:36:48','ddee979a-ef5a-e49b-3ce1-634698e24c4a','YTozODp7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoyMDoic29ydF9tb2R1bGVzX2J5X25hbWUiO3M6MDoiIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjI6Im9uIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO3M6MjoiNjAiO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO3M6MjoiNjAiO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7czoxOiIwIjtzOjg6InRpbWV6b25lIjtzOjEzOiJFdXJvcGUvQmVybGluIjtzOjI6InV0IjtzOjE6IjAiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo0OiJmZG93IjtzOjE6IjAiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjg6InN1YnRoZW1lIjtzOjQ6IkRhd24iO3M6MTU6ImxvZ2luZXhwaXJhdGlvbiI7czoxOiIwIjtzOjc6ImxvY2tvdXQiO3M6MDoiIjtzOjExOiJsb2dpbmZhaWxlZCI7czoxOiIwIjt9'),('33ed0393-5ed7-4b3b-5dcb-6327c9c57051','Prospects2_PROSPECT',0,'2022-09-19 01:45:15','2022-09-19 01:45:15','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('33ed49c8-9fc8-00ad-bea0-639252a25d9a','Home2_OPPORTUNITY',0,'2022-12-08 21:10:41','2022-12-08 21:10:41','194493f9-5af3-a81b-bca8-6346986f2e4b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('34a60a62-caf6-4599-4cde-633a5db39f1c','Home2_ACCOUNT',0,'2022-10-03 03:57:40','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('35360bb9-452a-944a-1168-6320c005e630','Home2_CALL',0,'2022-09-13 17:38:38','2022-09-13 17:38:38','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('365197b6-4856-4361-a6b9-631ab0eae185','Home2_OPPORTUNITY',0,'2022-09-09 03:20:14','2022-09-09 03:20:14','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('38262dfe-cf2b-3f79-dff8-63469db20ccd','Home2_ACCOUNT',0,'2022-10-12 10:55:49','2022-10-12 10:55:49','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('38386d58-e096-8ddb-52f6-632a5f2c7db0','Leads2_LEAD',0,'2022-09-21 00:49:28','2022-09-21 00:49:28','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('387db9d0-09c2-3a47-c1db-63219aa295e9','Leads2_LEAD',0,'2022-09-14 09:09:35','2022-09-14 09:09:35','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('391fc0e3-79c8-2fb4-c5ea-631aa2258b71','global',0,'2022-09-09 02:20:10','2022-10-13 04:16:56','bf510836-90a2-69d4-7db8-631aa285d1e7','YTo0Mjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO3M6NDoiMTgwMCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czo0OiIzNjAwIjtzOjE2OiJyZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6MjI6ImVtYWlsX3JlbWluZGVyX2NoZWNrZWQiO3M6MToiMCI7czo4OiJ0aW1lem9uZSI7czoxMzoiRXVyb3BlL0JlcmxpbiI7czoyOiJ1dCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6Ii05OSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NDoiZmRvdyI7czoxOiIwIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE2OiJleHBvcnRfZGVsaW1pdGVyIjtzOjE6IiwiO3M6MjI6ImRlZmF1bHRfZXhwb3J0X2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjI6Im9uIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czowOiIiO3M6MTI6Im1haWxfc210cHNzbCI7aTowO3M6MTU6ImVtYWlsX2xpbmtfdHlwZSI7czo1OiJzdWdhciI7czoxMToiZWRpdG9yX3R5cGUiO3M6NjoibW96YWlrIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjA6IiI7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MTA6IlThuqV0IGPhuqMiO3M6NjoiTGVhZHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fXM6OToiQWNjb3VudHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fX0='),('3944c37d-ff40-a5c4-eb68-634791214ae4','Home2_OPPORTUNITY',0,'2022-10-13 04:19:51','2022-10-13 04:19:51','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3a595590-501c-6d84-9a26-6320c0959e1a','Home2_OPPORTUNITY',0,'2022-09-13 17:38:38','2022-09-13 17:38:38','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3a8b534b-3d21-e382-7c58-633e5775db55','Dashboard',0,'2022-10-06 04:19:46','2022-12-08 02:47:38','1','YTowOnt9'),('3d0ef6aa-0cc0-f329-da23-6392523448fb','Home2_ACCOUNT',0,'2022-12-08 21:10:41','2022-12-08 21:10:41','194493f9-5af3-a81b-bca8-6346986f2e4b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3ed5f059-5838-b966-90c1-631aa2bf6db4','global',0,'2022-09-09 02:19:49','2022-09-14 08:14:23','130e2309-2bc1-b543-ba7c-631aa20981aa','YTo0MTp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTM6IkV1cm9wZS9CZXJsaW4iO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjM6IkFsbCI7czo2OiJMZWFkc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9fQ=='),('3edc12b3-5cd9-9c84-d1d5-6316df3051fa','Home2_LEAD_570fae14-9b3d-6956-68a1-6316df36eae9',0,'2022-09-06 05:51:46','2022-12-08 02:47:38','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3fac7025-f648-990f-caf3-632a5f8487be','ETag',0,'2022-09-21 00:49:18','2022-09-21 00:49:18','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('403d478a-bb7c-fcfc-5250-633a5d1114fc','Home2_LEAD',0,'2022-10-03 03:57:40','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('417c9cb4-f5ba-c9c0-eb0f-631cc540ef62','Home2_OPPORTUNITY',0,'2022-09-10 17:14:30','2022-09-10 17:14:30','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('41edce6e-54f8-6371-be87-6347915878af','Home2_ACCOUNT',0,'2022-10-13 04:19:51','2022-10-13 04:19:51','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4437e56d-563a-d39b-6b9a-63469deef57d','Home2_LEAD',0,'2022-10-12 10:55:49','2022-10-12 10:55:49','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('45be1c1c-b83a-7452-2fad-631ab031d82f','Home2_ACCOUNT',0,'2022-09-09 03:20:14','2022-09-09 03:20:14','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('45de2b84-49da-fb70-36a5-63925220c67f','Home2_LEAD',0,'2022-12-08 21:10:41','2022-12-08 21:10:41','194493f9-5af3-a81b-bca8-6346986f2e4b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('46d20ff0-25fa-420e-da5c-631cc6a408ce','Leads2_LEAD',0,'2022-09-10 17:14:45','2022-09-10 17:14:45','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4b7b8da6-46d3-9e49-dc81-634791bb9333','Home2_LEAD',0,'2022-10-13 04:19:51','2022-10-13 04:19:51','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4b894ff1-4879-6475-c1d9-6320c0e6dfbb','Home2_ACCOUNT',0,'2022-09-13 17:38:38','2022-09-13 17:38:38','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4c17b21c-9929-7010-e906-633a5d7f4eff','Home2_SUGARFEED',0,'2022-10-03 03:57:40','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4ccd0eee-9916-a413-de3d-631ab07f9669','Home',0,'2022-09-09 03:20:14','2022-12-09 06:52:49','aacec1bd-6737-81e3-7365-631aa18cd430','YToyOntzOjg6ImRhc2hsZXRzIjthOjM6e3M6MzY6IjFhZjg2ODdjLTdhZTQtN2ZhNi0zMDNmLTYzMWFiMGU5NjA1OCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjFiZGM3NWM2LTUwMTAtZDZlMC0wNDA5LTYzMWFiMDdmODU2YyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjFmZTBhZGI1LWIxNzUtMmYzYy1lYzNjLTYzMWFiMGNiZGM1OCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlMZWFkc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkxlYWRzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9MZWFkcy9EYXNobGV0cy9NeUxlYWRzRGFzaGxldC9NeUxlYWRzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fX1zOjU6InBhZ2VzIjthOjI6e2k6MDthOjM6e3M6NzoiY29sdW1ucyI7YToyOntpOjA7YToyOntzOjU6IndpZHRoIjtzOjM6IjYwJSI7czo4OiJkYXNobGV0cyI7YToyOntpOjA7czozNjoiMWJkYzc1YzYtNTAxMC1kNmUwLTA0MDktNjMxYWIwN2Y4NTZjIjtpOjQ7czozNjoiMWZlMGFkYjUtYjE3NS0yZjNjLWVjM2MtNjMxYWIwY2JkYzU4Ijt9fWk6MTthOjI6e3M6NToid2lkdGgiO3M6MzoiNDAlIjtzOjg6ImRhc2hsZXRzIjthOjE6e2k6MDtzOjM2OiIxYWY4Njg3Yy03YWU0LTdmYTYtMzAzZi02MzFhYjBlOTYwNTgiO319fXM6MTA6Im51bUNvbHVtbnMiO3M6MToiMyI7czoxNDoicGFnZVRpdGxlTGFiZWwiO3M6MjA6IkxCTF9IT01FX1BBR0VfMV9OQU1FIjt9aToxO2E6Mzp7czo3OiJjb2x1bW5zIjthOjE6e2k6MDthOjI6e3M6ODoiZGFzaGxldHMiO2E6MDp7fXM6NToid2lkdGgiO3M6NDoiMTAwJSI7fX1zOjk6InBhZ2VUaXRsZSI7czoyMjoibmd1eeG7hW4gaG/DoG5nIHRp4bq/biI7czoxMDoibnVtQ29sdW1ucyI7czoxOiIxIjt9fX0='),('4dba854b-62e2-46bb-42d2-631cc5842704','Home2_ACCOUNT',0,'2022-09-10 17:14:30','2022-09-10 17:14:30','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4e46c1c0-3acc-01f8-b824-6320c07bc548','Leads2_LEAD',0,'2022-09-13 17:38:45','2022-09-13 17:38:45','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4f248b29-14a5-d4fe-e5c0-63925296c8f0','Home2_SUGARFEED',0,'2022-12-08 21:10:41','2022-12-08 21:10:41','194493f9-5af3-a81b-bca8-6346986f2e4b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4f7302b5-9fe4-97d8-e480-63282a745342','Emails',0,'2022-09-19 08:37:43','2022-09-19 08:37:45','df55b3c8-1764-6ebf-01dd-63218270e96b','YTowOnt9'),('508c40b8-5477-9f0d-3312-63469deb8b9d','Home2_SUGARFEED',0,'2022-10-12 10:55:49','2022-10-12 10:55:49','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('51193e91-e44d-1ea1-ca95-63218cce8069','ETag',0,'2022-09-14 08:12:19','2022-09-14 08:12:19','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('5156339b-0c22-f75d-12ce-634698a850d9','global',0,'2022-10-12 10:35:18','2022-12-08 21:10:41','194493f9-5af3-a81b-bca8-6346986f2e4b','YTo0MDp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6Mjoib24iO3M6MjU6ImNvdW50X2NvbGxhcHNlZF9zdWJwYW5lbHMiO3M6MDoiIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjExOiJyZW1vdmVfdGFicyI7YTowOnt9czo3OiJub19vcHBzIjtzOjM6Im9mZiI7czoxMzoicmVtaW5kZXJfdGltZSI7aToxODAwO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO2k6MzYwMDtzOjE2OiJyZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6MjI6ImVtYWlsX3JlbWluZGVyX2NoZWNrZWQiO3M6MToiMCI7czo4OiJ0aW1lem9uZSI7czoxNjoiQXNpYS9Ib19DaGlfTWluaCI7czoyOiJ1dCI7aToxO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo0OiJmZG93IjtzOjE6IjAiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjg6InN1YnRoZW1lIjtzOjQ6IkRhd24iO3M6MTU6ImxvZ2luZXhwaXJhdGlvbiI7czoxOiIwIjtzOjc6ImxvY2tvdXQiO3M6MDoiIjtzOjExOiJsb2dpbmZhaWxlZCI7czoxOiIwIjtzOjEwOiJ1c2VyX3RoZW1lIjtzOjY6IlN1aXRlUCI7czoxOToidGhlbWVfY3VycmVudF9ncm91cCI7czozOiJBbGwiO30='),('5157da29-5ce0-d025-4fbc-631ab010079c','Home2_LEAD',0,'2022-09-09 03:20:14','2022-12-08 21:11:30','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('52ef7289-f6d0-6079-7492-63219ab316f1','Home2_LEAD_200aa685-8397-ec7d-55ab-63219a0a4487',0,'2022-09-14 09:10:02','2022-09-14 09:10:02','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('52f81d4e-593b-da21-0425-631aa28f168a','global',0,'2022-09-09 02:20:30','2022-09-19 08:38:04','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YTo0MTp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO3M6NDoiMTgwMCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czo0OiIzNjAwIjtzOjE2OiJyZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6MjI6ImVtYWlsX3JlbWluZGVyX2NoZWNrZWQiO3M6MToiMCI7czo4OiJ0aW1lem9uZSI7czoxMzoiRXVyb3BlL0JlcmxpbiI7czoyOiJ1dCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6Ii05OSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NDoiZmRvdyI7czoxOiIwIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE2OiJleHBvcnRfZGVsaW1pdGVyIjtzOjE6IiwiO3M6MjI6ImRlZmF1bHRfZXhwb3J0X2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjI6Im9uIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czowOiIiO3M6MTI6Im1haWxfc210cHNzbCI7aTowO3M6MTU6ImVtYWlsX2xpbmtfdHlwZSI7czo1OiJzdWdhciI7czoxMToiZWRpdG9yX3R5cGUiO3M6NjoibW96YWlrIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjA6IiI7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjtzOjY6IkxlYWRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO319'),('53c8a828-6203-bd69-a2e2-63219a650bef','Home',0,'2022-09-14 09:09:58','2022-09-14 09:09:58','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjFjNmQ3MmI0LTFjMWYtYmIwNi05N2FiLTYzMjE5YTZmMWQ4MiI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjFkNDBhMWI0LWU2ZTMtOTUyYy04Yjk4LTYzMjE5YTM0ZTk1YiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjFlMTM4YjRiLTIyNWYtNTVmYi1hNjk1LTYzMjE5YTM4YWM2YyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjFlYjYzODBmLWVmMzMtMTkwMS0wZjU2LTYzMjE5YTUyN2JhMyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMWY0ZTgwM2UtOTg2MS04YTJkLTY2YjEtNjMyMTlhMjU3ODI1IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMjAwYWE2ODUtODM5Ny1lYzdkLTU1YWItNjMyMTlhMGE0NDg3IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiIxZDQwYTFiNC1lNmUzLTk1MmMtOGI5OC02MzIxOWEzNGU5NWIiO2k6MTtzOjM2OiIxZTEzOGI0Yi0yMjVmLTU1ZmItYTY5NS02MzIxOWEzOGFjNmMiO2k6MjtzOjM2OiIxZWI2MzgwZi1lZjMzLTE5MDEtMGY1Ni02MzIxOWE1MjdiYTMiO2k6MztzOjM2OiIxZjRlODAzZS05ODYxLThhMmQtNjZiMS02MzIxOWEyNTc4MjUiO2k6NDtzOjM2OiIyMDBhYTY4NS04Mzk3LWVjN2QtNTVhYi02MzIxOWEwYTQ0ODciO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjFjNmQ3MmI0LTFjMWYtYmIwNi05N2FiLTYzMjE5YTZmMWQ4MiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('551bdbcb-d305-a14a-0943-63289b6ff82e','Home',0,'2022-09-19 16:40:48','2022-09-19 16:40:48','62213397-e5c8-5e5d-d4be-63282ab9f739','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImViMzFkZDIxLWVhYmItMjczYi03MWQyLTYzMjg5YjE0ZjNjOCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImVjMWI0OWUyLTI4MDUtNzFiMy1kYjAxLTYzMjg5YmE1MDE5OSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImVkMjU4ZDJmLWFmYTctNjc4NS1kY2MwLTYzMjg5YjM3Y2Q4OSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImVkZGE2ZTQwLTM3NjQtN2MyYi04OGRhLTYzMjg5YmEzODViMiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZWVlODIxMTYtNTRjOC1kNGE5LTc0MzgtNjMyODliMGIyYjI5IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZjAwMzBmZTktZGJkZS0xMGY1LWU1MTEtNjMyODliMjRiNDNmIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiJlYzFiNDllMi0yODA1LTcxYjMtZGIwMS02MzI4OWJhNTAxOTkiO2k6MTtzOjM2OiJlZDI1OGQyZi1hZmE3LTY3ODUtZGNjMC02MzI4OWIzN2NkODkiO2k6MjtzOjM2OiJlZGRhNmU0MC0zNzY0LTdjMmItODhkYS02MzI4OWJhMzg1YjIiO2k6MztzOjM2OiJlZWU4MjExNi01NGM4LWQ0YTktNzQzOC02MzI4OWIwYjJiMjkiO2k6NDtzOjM2OiJmMDAzMGZlOS1kYmRlLTEwZjUtZTUxMS02MzI4OWIyNGI0M2YiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImViMzFkZDIxLWVhYmItMjczYi03MWQyLTYzMjg5YjE0ZjNjOCI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('56f30f0b-6e2f-af34-9e96-631aa178653f','global',0,'2022-09-09 02:14:28','2022-12-09 07:01:58','aacec1bd-6737-81e3-7365-631aa18cd430','YTo0Mjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTM6IkV1cm9wZS9CZXJsaW4iO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjEwOiJU4bqldCBj4bqjIjtzOjY6IkxlYWRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO31zOjk6Ik1lZXRpbmdzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO319'),('585c6c4b-fc6c-13f6-9154-634791449a14','Home2_SUGARFEED',0,'2022-10-13 04:19:51','2022-10-13 04:19:51','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('5a01f796-bc3d-0ac6-5cf7-631cc5c8e007','Home2_LEAD',0,'2022-09-10 17:14:30','2022-09-10 17:14:30','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('5ac36616-3ca3-d14d-87d6-63218c9e763b','Home2_CALL',0,'2022-09-14 08:12:22','2022-09-14 08:12:22','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('5b6a5ce3-6999-e683-cdbd-633bb76b28a4','global',0,'2022-10-04 04:33:16','2022-10-04 05:59:44','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YTo0MDp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTM6IkV1cm9wZS9CZXJsaW4iO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjM6IkFsbCI7fQ=='),('5c293c5c-0c59-cd5f-dc26-6392db3775fb','search',0,'2022-12-09 06:55:40','2022-12-09 06:55:40','1','YToxOntzOjEyOiJnbG9iYWxTZWFyY2giO2E6MTp7czo1OiJMZWFkcyI7czo0OiJMZWFkIjt9fQ=='),('5e48eb2d-a38c-13e6-4dd8-631ab0bff33f','Home2_SUGARFEED',0,'2022-09-09 03:20:14','2022-12-08 21:11:30','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('5f1f2e87-5b37-90c1-3a80-6320c02ddaaf','Home2_LEAD',0,'2022-09-13 17:38:38','2022-09-13 17:38:38','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('62aadba8-55bc-086a-ce38-631ab0a8f29c','Home2_LEAD_1fe0adb5-b175-2f3c-ec3c-631ab0cbdc58',0,'2022-09-09 03:20:23','2022-12-08 21:11:30','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('63e418c8-d428-e632-7037-63289b8c0ac5','Home2_CALL',0,'2022-09-19 16:40:48','2022-09-19 16:40:48','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('643848ea-5bfc-1667-5032-631ac3e0bee6','Home',0,'2022-09-09 04:39:17','2022-09-09 04:39:17','78e20ef0-7018-d656-107b-631aa2369613','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImNlZWU0MTY2LWZkOTQtNzAzNi05YTRhLTYzMWFjM2Y5ZmEyMCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImNmZWRhZmJhLTg5MWEtNWU5My1lYjI1LTYzMWFjMzUyZTFhNCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImQwY2NiNWE1LTFiM2UtZjUzZC03ZGExLTYzMWFjM2M2Y2RlNiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImQxNmIyOGQwLTljNGYtMzM3Yi0zNGRiLTYzMWFjM2E0MGE5ZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZDIzNzcxZmYtYmFiNS03ZWY1LWUxNjAtNjMxYWMzNjA2ZWM1IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZDMwZjdhYjEtMTdlMC0zMjk4LTkxZmQtNjMxYWMzNTY2YTgwIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiJjZmVkYWZiYS04OTFhLTVlOTMtZWIyNS02MzFhYzM1MmUxYTQiO2k6MTtzOjM2OiJkMGNjYjVhNS0xYjNlLWY1M2QtN2RhMS02MzFhYzNjNmNkZTYiO2k6MjtzOjM2OiJkMTZiMjhkMC05YzRmLTMzN2ItMzRkYi02MzFhYzNhNDBhOWUiO2k6MztzOjM2OiJkMjM3NzFmZi1iYWI1LTdlZjUtZTE2MC02MzFhYzM2MDZlYzUiO2k6NDtzOjM2OiJkMzBmN2FiMS0xN2UwLTMyOTgtOTFmZC02MzFhYzM1NjZhODAiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImNlZWU0MTY2LWZkOTQtNzAzNi05YTRhLTYzMWFjM2Y5ZmEyMCI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('654a58ac-7114-8f2b-832c-63479151a24f','Home',0,'2022-10-13 04:16:37','2022-10-13 04:16:37','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjQ0ZTFlMDNjLWVmOGQtMTJjZC03M2VmLTYzNDc5MTZiZmU3YiI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjQ0ZjZiMzQyLTFkZGMtZmUwNy05N2UxLTYzNDc5MWUyMGMxNCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjQ1MGI3ZWNjLTYyYmQtNWM3NC0yYjQ3LTYzNDc5MTliMjNlNiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjQ1MTk5N2M0LTgyZmMtODhmOS1hMjAzLTYzNDc5MTA3ZjQ0YiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNDUyZTlmYTMtNTMyMy03YTUwLTJhMzMtNjM0NzkxMGE2YTlmIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNDU0MWUyYzctNjU5YS1kMzM4LWMxMGYtNjM0NzkxNTJkYmE3IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI0NGY2YjM0Mi0xZGRjLWZlMDctOTdlMS02MzQ3OTFlMjBjMTQiO2k6MTtzOjM2OiI0NTBiN2VjYy02MmJkLTVjNzQtMmI0Ny02MzQ3OTE5YjIzZTYiO2k6MjtzOjM2OiI0NTE5OTdjNC04MmZjLTg4ZjktYTIwMy02MzQ3OTEwN2Y0NGIiO2k6MztzOjM2OiI0NTJlOWZhMy01MzIzLTdhNTAtMmEzMy02MzQ3OTEwYTZhOWYiO2k6NDtzOjM2OiI0NTQxZTJjNy02NTlhLWQzMzgtYzEwZi02MzQ3OTE1MmRiYTciO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjQ0ZTFlMDNjLWVmOGQtMTJjZC03M2VmLTYzNDc5MTZiZmU3YiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('65f9bea3-102d-c802-884f-631cc6686c3d','Home2_LEAD_9ff40e63-d38e-823e-d69a-631cc5464f8e',0,'2022-09-10 17:14:39','2022-09-10 17:14:39','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('663915a0-8b36-1230-4939-631cc5461db8','Home2_SUGARFEED',0,'2022-09-10 17:14:30','2022-09-10 17:14:30','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('668dcf29-cc19-0bf7-f49d-63218c1a026a','Home2_MEETING',0,'2022-09-14 08:12:22','2022-09-14 08:12:22','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('66f265e9-a8d4-9946-e447-631ac3c254eb','Leads2_LEAD',0,'2022-09-09 04:39:21','2022-09-09 04:39:21','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('6766ed8f-809b-6f7f-a92d-6321826c153d','Emails',0,'2022-09-14 07:27:50','2022-09-14 07:27:52','bf510836-90a2-69d4-7db8-631aa285d1e7','YTowOnt9'),('677948ab-b1b0-52f2-1892-6347919446e2','Leads2_LEAD',0,'2022-10-13 04:20:07','2022-10-13 04:20:07','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('6805515c-9cd2-25ab-c5e7-6316df255fe9','Home',0,'2022-09-06 05:51:30','2022-12-08 02:47:38','1','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjU0MjU1YzgzLTI3MjYtZmVjMC05M2RiLTYzMTZkZjU4YTY2NyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjU0ZGU0ZGIyLTQ0OTgtYjI0OS02YjQxLTYzMTZkZjQ2MDVkYyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjU1YWEzMjViLTJlNzgtMWM2My1lMWMxLTYzMTZkZjU5ZThiNCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjU2MDUyMjJhLWJhN2MtZjlmMy0zYWRkLTYzMTZkZjZhN2VhYyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNTY5NDY3NDctZDA2My0yZGZjLTRhMTQtNjMxNmRmZjZlYzY2IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNTcwZmFlMTQtOWIzZC02OTU2LTY4YTEtNjMxNmRmMzZlYWU5IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI1NGRlNGRiMi00NDk4LWIyNDktNmI0MS02MzE2ZGY0NjA1ZGMiO2k6MTtzOjM2OiI1NWFhMzI1Yi0yZTc4LTFjNjMtZTFjMS02MzE2ZGY1OWU4YjQiO2k6MjtzOjM2OiI1NjA1MjIyYS1iYTdjLWY5ZjMtM2FkZC02MzE2ZGY2YTdlYWMiO2k6MztzOjM2OiI1Njk0Njc0Ny1kMDYzLTJkZmMtNGExNC02MzE2ZGZmNmVjNjYiO2k6NDtzOjM2OiI1NzBmYWUxNC05YjNkLTY5NTYtNjhhMS02MzE2ZGYzNmVhZTkiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjU0MjU1YzgzLTI3MjYtZmVjMC05M2RiLTYzMTZkZjU4YTY2NyI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('68adf086-1b2d-3d5b-bf5c-63282baa90ee','global',0,'2022-09-19 08:44:14','2022-12-09 07:43:27','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YTo0Mjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTM6IkV1cm9wZS9CZXJsaW4iO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjEwOiJU4bqldCBj4bqjIjtzOjY6IkxlYWRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjEwOiJFbXBsb3llZXNRIjthOjQ6e3M6NjoibW9kdWxlIjtzOjk6IkVtcGxveWVlcyI7czo2OiJhY3Rpb24iO3M6NToiaW5kZXgiO3M6NToicXVlcnkiO3M6NDoidHJ1ZSI7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9fQ=='),('68f4f72e-fb63-d96d-daf5-6320c0baf55e','Home2_SUGARFEED',0,'2022-09-13 17:38:38','2022-09-13 17:38:38','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('6f221faf-9d99-a2e1-3f1a-63289b6caa33','ETag',0,'2022-09-19 16:40:47','2022-09-19 16:40:47','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('70224630-b729-981f-7aaf-6320c087e4ea','Home2_LEAD_83dda860-480f-79e0-39d2-6320c0573a2b',0,'2022-09-13 17:38:41','2022-09-13 17:38:41','aea7576b-420a-eaf1-8062-6320718d714a','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('703f0cd8-b227-a57f-ef2a-631ed643f46e','Leads2_LEAD',0,'2022-09-12 06:47:37','2022-09-12 06:47:37','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('704c4e91-c4fd-c3b5-84fc-63218d08fb89','Home2_LEAD_820516ab-025d-1dfe-e227-63218d719e03',0,'2022-09-14 08:14:21','2022-09-14 08:14:21','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('71738adc-300d-e2dc-aca5-63218cd34d61','Home2_OPPORTUNITY',0,'2022-09-14 08:12:22','2022-09-14 08:12:22','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('71ae4230-d8b8-e3c1-cd2c-639253f49420','Employees2_EMPLOYEE',0,'2022-12-08 21:14:40','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('71d5cca1-b394-83f2-b267-634791c9a689','Home2_CALL',0,'2022-10-13 04:16:37','2022-10-13 04:16:37','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('73be7605-2e44-bcda-0662-631ac355b850','Home2_CALL',0,'2022-09-09 04:39:17','2022-09-09 04:39:17','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('750c3d70-b430-57b8-c713-631ed6b14e57','Home2_LEAD_46fbf102-9179-7872-de98-631ed5362402',0,'2022-09-12 06:47:30','2022-09-12 06:47:30','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('75de5e27-a0a9-6a4f-4784-6327d06050bd','Accounts2_ACCOUNT',0,'2022-09-19 02:16:18','2022-09-19 02:16:18','bf510836-90a2-69d4-7db8-631aa285d1e7','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('7b94e9db-c391-af39-4a57-631ac3da3360','Home2_MEETING',0,'2022-09-09 04:39:17','2022-09-09 04:39:17','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('7ba133fd-af2f-6a69-9203-6392dfa14541','Leads',0,'2022-12-09 07:10:23','2022-12-09 07:10:23','1','YToxOntzOjIyOiJMaXN0Vmlld0Rpc3BsYXlDb2x1bW5zIjthOjA6e319'),('7c980e91-bf4c-5fdc-5d6b-63469da9ab61','Home',0,'2022-10-12 10:55:49','2022-10-12 10:55:49','c1abb968-9c8d-474e-c297-63282bf888ad','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjE2ZDhkZjNiLTgyMDctNWZlNi1jMGJmLTYzNDY5ZGMwMjFlZiI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjE4MWM0Y2RjLTAyZGQtZmJmZi1iNzQyLTYzNDY5ZGViZjE5MiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjE5NzNmODIyLTAxMTctYjBiOC0wYTdmLTYzNDY5ZDUwMGIxNiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjFhM2JhNzE2LTRiNjctOTAwZC0xOGU1LTYzNDY5ZGM5NjRjNyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMWI5MWIzMjktNzMzYS0zZmFkLWE5MzUtNjM0NjlkZTFkMWJlIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMWRhZmYzNmYtMTdkYS00NmE4LTgzM2EtNjM0NjlkODljYTc5IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiIxODFjNGNkYy0wMmRkLWZiZmYtYjc0Mi02MzQ2OWRlYmYxOTIiO2k6MTtzOjM2OiIxOTczZjgyMi0wMTE3LWIwYjgtMGE3Zi02MzQ2OWQ1MDBiMTYiO2k6MjtzOjM2OiIxYTNiYTcxNi00YjY3LTkwMGQtMThlNS02MzQ2OWRjOTY0YzciO2k6MztzOjM2OiIxYjkxYjMyOS03MzNhLTNmYWQtYTkzNS02MzQ2OWRlMWQxYmUiO2k6NDtzOjM2OiIxZGFmZjM2Zi0xN2RhLTQ2YTgtODMzYS02MzQ2OWQ4OWNhNzkiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjE2ZDhkZjNiLTgyMDctNWZlNi1jMGJmLTYzNDY5ZGMwMjFlZiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('85e4dda7-9eea-d03f-f4b6-63289b3e0c39','Home2_MEETING',0,'2022-09-19 16:40:48','2022-09-19 16:40:48','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('88203eaa-676a-3425-04bf-631ac3fce9ff','Home2_OPPORTUNITY',0,'2022-09-09 04:39:17','2022-09-09 04:39:17','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('8839651b-1706-4790-d3bf-63289b2a38d1','Home2_LEAD_f0030fe9-dbde-10f5-e511-63289b24b43f',0,'2022-09-19 16:40:51','2022-09-19 16:40:51','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('886ae5b7-af8c-ecb4-3b39-6316df1336f5','Home2_CALL',0,'2022-09-06 05:51:30','2022-12-08 02:47:38','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('8cfd4116-7238-8265-79e1-63469d45dffc','ETag',0,'2022-10-12 10:55:48','2022-10-12 10:55:48','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('8e079fd8-1a88-d1e6-c6e5-63218ca6a4ad','Home2_ACCOUNT',0,'2022-09-14 08:12:22','2022-09-14 08:12:22','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('8e30d518-5254-2e66-0a8c-634791f6ef89','Home2_MEETING',0,'2022-10-13 04:16:37','2022-10-13 04:16:37','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('8f9d7fbc-e10f-5180-fa03-63469b2d2a18','Leads2_LEAD',0,'2022-10-12 10:49:26','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('90eacf82-42ab-0c2d-8d40-63289b2b4090','Home2_OPPORTUNITY',0,'2022-09-19 16:40:48','2022-09-19 16:40:48','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('916b07ac-c01a-d8bb-c5ec-633a5dbc9985','Home2_MEETING',0,'2022-10-03 03:57:40','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('92a6ba07-c35d-6421-b4f8-631ac380e09b','Home2_ACCOUNT',0,'2022-09-09 04:39:17','2022-09-09 04:39:17','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('93069bc5-3337-ed29-a80b-634698f89bb9','global',0,'2022-10-12 10:35:55','2022-10-12 10:35:55','88c77436-5bc0-36f5-58c5-634698297705','YTozODp7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoyMDoic29ydF9tb2R1bGVzX2J5X25hbWUiO3M6MDoiIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjI6Im9uIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO3M6MjoiNjAiO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO3M6MjoiNjAiO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7czoxOiIwIjtzOjg6InRpbWV6b25lIjtzOjEzOiJFdXJvcGUvQmVybGluIjtzOjI6InV0IjtzOjE6IjAiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo0OiJmZG93IjtzOjE6IjAiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjg6InN1YnRoZW1lIjtzOjQ6IkRhd24iO3M6MTU6ImxvZ2luZXhwaXJhdGlvbiI7czoxOiIwIjtzOjc6ImxvY2tvdXQiO3M6MDoiIjtzOjExOiJsb2dpbmZhaWxlZCI7czoxOiIwIjt9'),('9443853f-610f-ec2b-7e46-6392523d626e','Home2_LEAD_e642c460-6f47-49de-721e-639252c78d10',0,'2022-12-08 21:10:43','2022-12-08 21:10:43','194493f9-5af3-a81b-bca8-6346986f2e4b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('95b9a954-fa44-9951-a2c2-6327c96b2772','Campaigns2_CAMPAIGN',0,'2022-09-19 01:45:10','2022-09-19 01:45:10','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('97aca9fb-2a14-3f65-f6f0-63479103776c','Home2_LEAD_4541e2c7-659a-d338-c10f-63479152dba7',0,'2022-10-13 04:16:38','2022-10-13 04:16:38','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('97e35110-1b2c-329c-0d96-63218c035556','Home2_LEAD',0,'2022-09-14 08:12:22','2022-09-14 08:12:22','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('982a067d-f3b3-6cbe-a31c-633a5d2154e2','Home2_LEAD_8cf9631f-26e3-3ffc-f88d-633a5d1246c1',0,'2022-10-03 03:57:48','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('9a2ef2d8-ea0d-040f-68b6-632a5f4c6c13','Home',0,'2022-09-21 00:49:21','2022-09-21 00:49:21','2ca94880-44b1-f16a-d2df-63282b8f2314','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImE0ZGMzNmZlLWY3OWYtNTk5Zi1lNzAwLTYzMmE1ZmIwNzA2MyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImE1YTFkNjU4LWMxNGEtNzg4NC01NDY5LTYzMmE1ZjlhYzUxNyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImE2NzlmOTI3LWQzMDMtYWM3Zi1jMmNlLTYzMmE1ZjI1NzY1YyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImE3MDMzNWZjLTU2NzktOTgxZi1kNjRmLTYzMmE1ZjA3YjcyNiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYTdiMWE1YzYtZTU4MC01ZDdmLTBkYTItNjMyYTVmNzc2MjY3IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYTg4ZjliZDktNmFhMC1hODM1LTdjNjEtNjMyYTVmZmE0YWU1IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiJhNWExZDY1OC1jMTRhLTc4ODQtNTQ2OS02MzJhNWY5YWM1MTciO2k6MTtzOjM2OiJhNjc5ZjkyNy1kMzAzLWFjN2YtYzJjZS02MzJhNWYyNTc2NWMiO2k6MjtzOjM2OiJhNzAzMzVmYy01Njc5LTk4MWYtZDY0Zi02MzJhNWYwN2I3MjYiO2k6MztzOjM2OiJhN2IxYTVjNi1lNTgwLTVkN2YtMGRhMi02MzJhNWY3NzYyNjciO2k6NDtzOjM2OiJhODhmOWJkOS02YWEwLWE4MzUtN2M2MS02MzJhNWZmYTRhZTUiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImE0ZGMzNmZlLWY3OWYtNTk5Zi1lNzAwLTYzMmE1ZmIwNzA2MyI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('9a5d8e92-ae54-2bf6-4903-634791c517d3','Home2_OPPORTUNITY',0,'2022-10-13 04:16:37','2022-10-13 04:16:37','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('9bf1f692-fda4-e846-11b6-63289bae95a1','Home2_ACCOUNT',0,'2022-09-19 16:40:48','2022-09-19 16:40:48','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('9c84442d-0db5-0888-dbb0-631ac3e30456','Home2_LEAD',0,'2022-09-09 04:39:17','2022-09-09 04:39:17','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a20a4673-74f5-5020-0234-633e57ab758f','Emails',0,'2022-10-06 04:19:46','2022-12-08 02:47:38','1','YTowOnt9'),('a3489089-ef23-ed2f-a0f0-639253c8019d','Dashboard',0,'2022-12-08 21:11:29','2022-12-08 21:11:30','aacec1bd-6737-81e3-7365-631aa18cd430','YTowOnt9'),('a443727e-fe2d-a208-c9a7-631ed68a5c3b','Home2_CALL',0,'2022-09-12 06:47:25','2022-09-12 06:47:25','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a513442c-e7bf-c471-3dad-63218c25f77f','Home2_SUGARFEED',0,'2022-09-14 08:12:22','2022-09-14 08:12:22','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a68d683f-4475-2c70-d5ea-631ac3d2169c','Home2_SUGARFEED',0,'2022-09-09 04:39:17','2022-09-09 04:39:17','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a6c304c2-94e3-09bb-225d-631aa2893c74','global',0,'2022-09-09 02:17:05','2022-11-28 06:45:53','78e20ef0-7018-d656-107b-631aa2369613','YTo0MTp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO3M6NDoiMTgwMCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czo0OiIzNjAwIjtzOjE2OiJyZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6MjI6ImVtYWlsX3JlbWluZGVyX2NoZWNrZWQiO3M6MToiMCI7czo4OiJ0aW1lem9uZSI7czoxMzoiRXVyb3BlL0JlcmxpbiI7czoyOiJ1dCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6Ii05OSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NDoiZmRvdyI7czoxOiIwIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE2OiJleHBvcnRfZGVsaW1pdGVyIjtzOjE6IiwiO3M6MjI6ImRlZmF1bHRfZXhwb3J0X2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjI6Im9uIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czowOiIiO3M6MTI6Im1haWxfc210cHNzbCI7aTowO3M6MTU6ImVtYWlsX2xpbmtfdHlwZSI7czo1OiJzdWdhciI7czoxMToiZWRpdG9yX3R5cGUiO3M6NjoibW96YWlrIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjA6IiI7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MTA6IlThuqV0IGPhuqMiO3M6NjoiTGVhZHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fX0='),('a887d185-e6f7-15fd-68d1-6347918bc549','Home2_ACCOUNT',0,'2022-10-13 04:16:37','2022-10-13 04:16:37','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a8ee006e-9a93-dc14-758f-631ab04c2ce4','Home2_CALL',0,'2022-09-09 03:20:14','2022-12-08 21:11:30','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('aa47a260-8ad6-f474-2f58-63219ad90379','ETag',0,'2022-09-14 09:09:58','2022-09-14 09:09:58','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('ac45b232-98a4-cd65-4a30-63845995ee9b','Leads2_LEAD',0,'2022-11-28 06:46:38','2022-11-28 06:46:38','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('ae2b1f8d-8703-9b0f-1333-6316e0494811','Leads2_LEAD',0,'2022-09-06 05:52:17','2022-12-09 07:10:23','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoyMToiZmFjZWJvb2tfb3JfemFsb19uYW1lIjtzOjk6InNvcnRPcmRlciI7czozOiJBU0MiO319'),('b095ea3c-8aaf-5746-ed9f-63289b9a63d3','Home2_LEAD',0,'2022-09-19 16:40:48','2022-09-19 16:40:48','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('b35323b7-1978-c8df-a3e3-631ed68df4f0','Home2_MEETING',0,'2022-09-12 06:47:25','2022-09-12 06:47:25','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('b35b850a-24ad-6033-e7a2-6347919c5ca2','Home2_LEAD',0,'2022-10-13 04:16:37','2022-10-13 04:16:37','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('b4900ed6-1109-9cb6-cd2e-632a5fc4d94c','Home2_CALL',0,'2022-09-21 00:49:21','2022-09-21 00:49:21','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('b70b1844-f404-0c89-1643-6316df204105','Home2_MEETING',0,'2022-09-06 05:51:30','2022-12-08 02:47:38','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('bb0404ca-5c56-b363-135e-63219a8697c5','Home2_OPPORTUNITY',0,'2022-09-14 09:09:58','2022-09-14 09:09:58','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('bba6123d-9fc0-ba53-d078-633bcbc68421','Home2_CALL',0,'2022-10-04 05:59:48','2022-10-04 05:59:48','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('bbb1ee33-d88a-e4a9-dee5-63218db028dc','Home',0,'2022-09-14 08:14:19','2022-09-14 08:14:19','130e2309-2bc1-b543-ba7c-631aa20981aa','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjdkZDczZWFkLTEzNTMtZjNlOS04NzM0LTYzMjE4ZGNmNTY4OCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjdlYmQ3M2YzLTY5OGMtYTc4MS1hMGFjLTYzMjE4ZDA0Mzg1YiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjdmYTc5OGY5LWY1NDEtMTZmNS1iNTY4LTYzMjE4ZDZlNzM1MCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjgwMzkxMDY3LTJlNTMtNzIwNy1kZGFmLTYzMjE4ZDQwOTNhOCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiODEwN2NhMzUtNDUxNy0yYjE1LTk4NTMtNjMyMThkNTU4MzhiIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiODIwNTE2YWItMDI1ZC0xZGZlLWUyMjctNjMyMThkNzE5ZTAzIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI3ZWJkNzNmMy02OThjLWE3ODEtYTBhYy02MzIxOGQwNDM4NWIiO2k6MTtzOjM2OiI3ZmE3OThmOS1mNTQxLTE2ZjUtYjU2OC02MzIxOGQ2ZTczNTAiO2k6MjtzOjM2OiI4MDM5MTA2Ny0yZTUzLTcyMDctZGRhZi02MzIxOGQ0MDkzYTgiO2k6MztzOjM2OiI4MTA3Y2EzNS00NTE3LTJiMTUtOTg1My02MzIxOGQ1NTgzOGIiO2k6NDtzOjM2OiI4MjA1MTZhYi0wMjVkLTFkZmUtZTIyNy02MzIxOGQ3MTllMDMiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjdkZDczZWFkLTEzNTMtZjNlOS04NzM0LTYzMjE4ZGNmNTY4OCI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('bc6ae78e-d0f5-1dd3-5c1d-6320c056e499','Home',0,'2022-09-13 17:38:38','2022-09-13 17:38:38','aea7576b-420a-eaf1-8062-6320718d714a','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjdmZDNiMGQwLTU4YmYtMzNhNy1jZWUwLTYzMjBjMGExN2RmYyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjgwOTViM2JlLWM5MTUtODhjMS03MGEzLTYzMjBjMDJiMjA1MyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjgxNjcxN2IwLTk0OGItNGY3Yy03NjhiLTYzMjBjMDE3Y2FlMCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjgyMDAxMTAxLWI1YWItOWRiYS04NzA0LTYzMjBjMDQwZGI5OSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiODMxZDJmZmUtNWI3My0wNTcyLTUwZDMtNjMyMGMwZGE4YjRhIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiODNkZGE4NjAtNDgwZi03OWUwLTM5ZDItNjMyMGMwNTczYTJiIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI4MDk1YjNiZS1jOTE1LTg4YzEtNzBhMy02MzIwYzAyYjIwNTMiO2k6MTtzOjM2OiI4MTY3MTdiMC05NDhiLTRmN2MtNzY4Yi02MzIwYzAxN2NhZTAiO2k6MjtzOjM2OiI4MjAwMTEwMS1iNWFiLTlkYmEtODcwNC02MzIwYzA0MGRiOTkiO2k6MztzOjM2OiI4MzFkMmZmZS01YjczLTA1NzItNTBkMy02MzIwYzBkYThiNGEiO2k6NDtzOjM2OiI4M2RkYTg2MC00ODBmLTc5ZTAtMzlkMi02MzIwYzA1NzNhMmIiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjdmZDNiMGQwLTU4YmYtMzNhNy1jZWUwLTYzMjBjMGExN2RmYyI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('bcdc46c4-d083-1e2d-d6c8-632182c42ba1','Emails',0,'2022-09-14 07:26:28','2022-09-14 07:26:37','78e20ef0-7018-d656-107b-631aa2369613','YTowOnt9'),('bcdf384d-a89f-0613-389f-632a5f835284','Home2_MEETING',0,'2022-09-21 00:49:21','2022-09-21 00:49:21','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('bd6ced15-1293-ea88-5452-63219a683f9f','Home2_CALL',0,'2022-09-14 09:09:58','2022-09-14 09:09:58','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('be860122-0897-4336-7ce8-63218cab2eaf','Home',0,'2022-09-14 08:12:22','2022-09-14 08:12:22','df55b3c8-1764-6ebf-01dd-63218270e96b','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjgwMmE3ZDZlLWUxMzAtNGFlOC03YTE2LTYzMjE4YzE2ZGY4MyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjgxNzk4NGI4LTRjYTctYTYyZi1kNzJhLTYzMjE4Y2ZlMTc1OCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjgzMzIzNDYwLTJmOGMtMWMyMy1mMDM3LTYzMjE4YzU4MmU2ZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6Ijg0NTE1YTI3LTU4NGQtOWE5NC0yMWYyLTYzMjE4YzYxMDJkOSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiODVkNjQ3YjQtNDBlOS00YmRiLTY0MDAtNjMyMThjNDZmNjljIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiODZlNDY5ZDYtMmVlNy1lZDU2LTIwNzYtNjMyMThjMjQzM2QzIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI4MTc5ODRiOC00Y2E3LWE2MmYtZDcyYS02MzIxOGNmZTE3NTgiO2k6MTtzOjM2OiI4MzMyMzQ2MC0yZjhjLTFjMjMtZjAzNy02MzIxOGM1ODJlNmUiO2k6MjtzOjM2OiI4NDUxNWEyNy01ODRkLTlhOTQtMjFmMi02MzIxOGM2MTAyZDkiO2k6MztzOjM2OiI4NWQ2NDdiNC00MGU5LTRiZGItNjQwMC02MzIxOGM0NmY2OWMiO2k6NDtzOjM2OiI4NmU0NjlkNi0yZWU3LWVkNTYtMjA3Ni02MzIxOGMyNDMzZDMiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjgwMmE3ZDZlLWUxMzAtNGFlOC03YTE2LTYzMjE4YzE2ZGY4MyI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('bebdfac0-429d-ee17-ed7f-634791decf4c','Home2_SUGARFEED',0,'2022-10-13 04:16:37','2022-10-13 04:16:37','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c052f6d9-495a-9577-1478-63289ba9caa5','Home2_SUGARFEED',0,'2022-09-19 16:40:48','2022-09-19 16:40:48','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c0e7768f-d319-28d5-bcec-631ed660dc45','Home2_OPPORTUNITY',0,'2022-09-12 06:47:25','2022-09-12 06:47:25','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c148ee2e-7671-ab8e-3085-6316df4c33b7','global',0,'2022-09-06 05:47:31','2022-12-09 07:37:37','1','YTo1MDp7czo4OiJ0aW1lem9uZSI7czoxNjoiQXNpYS9Ib19DaGlfTWluaCI7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjEzOiJyZW1pbmRlcl90aW1lIjtzOjQ6IjE4MDAiO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO3M6NDoiMzYwMCI7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjI6InV0IjtzOjE6IjEiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6MTU6Im1haWxfc210cHNlcnZlciI7czowOiIiO3M6MTM6Im1haWxfc210cHBvcnQiO3M6MjoiMjUiO3M6MTM6Im1haWxfc210cHVzZXIiO3M6MDoiIjtzOjEzOiJtYWlsX3NtdHBwYXNzIjtzOjA6IiI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIxOiJkZWZhdWx0X2VtYWlsX2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MTA6IlThuqV0IGPhuqMiO3M6NjoiTGVhZHNRIjthOjI6e3M6MTQ6ImRpc3BsYXlDb2x1bW5zIjtzOjgyOiJGQUNFQk9PS19PUl9aQUxPX05BTUV8RlVMTE5BTUV8QUNDT1VOVF9OQU1FfEVNQUlMMXxBU1NJR05FRF9VU0VSX05BTUV8REFURV9FTlRFUkVEIjtzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO31zOjY6IlVzZXJzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO31zOjEwOiJDYW1wYWlnbnNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fXM6OToiQUNMUm9sZXNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTU6ImFkdmFuY2VkX3NlYXJjaCI7fXM6MTU6IlNlY3VyaXR5R3JvdXBzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO31zOjExOiJsb2dpbmZhaWxlZCI7czoxOiIwIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MjI6ImVtYWlsX3JlbWluZGVyX2NoZWNrZWQiO3M6MToiMCI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJ0aW1lZiI7czozOiJIOmkiO3M6MTU6ImVtYWlsX2xpbmtfdHlwZSI7czo1OiJzdWdhciI7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjg6InN1YnRoZW1lIjtzOjQ6IkRhd24iO3M6MTA6IkVtcGxveWVlc1EiO2E6NDp7czo2OiJtb2R1bGUiO3M6OToiRW1wbG95ZWVzIjtzOjY6ImFjdGlvbiI7czo1OiJpbmRleCI7czo1OiJxdWVyeSI7czo0OiJ0cnVlIjtzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjEyOiJnbG9iYWxTZWFyY2giO2E6MTp7czo1OiJMZWFkcyI7czo0OiJMZWFkIjt9fQ=='),('c2f0db70-d92f-9268-bea3-6346984e96ea','global',0,'2022-10-12 10:37:13','2022-10-13 04:46:53','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YTo0Mjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTY6IkFzaWEvSG9fQ2hpX01pbmgiO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjEwOiJU4bqldCBj4bqjIjtzOjY6IkxlYWRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjk6Ik1lZXRpbmdzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO319'),('c4d0cadc-3651-1417-4e7c-63218c7d941a','Home2_LEAD_86e469d6-2ee7-ed56-2076-63218c2433d3',0,'2022-09-14 08:12:30','2022-09-14 08:12:30','df55b3c8-1764-6ebf-01dd-63218270e96b','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c59b616b-93e5-2c9f-c5d6-6392536b4ecf','Emails',0,'2022-12-08 21:11:29','2022-12-08 21:11:30','aacec1bd-6737-81e3-7365-631aa18cd430','YTowOnt9'),('c5c86b07-afa8-3e16-60e2-634698e74f25','global',0,'2022-10-12 10:36:31','2022-10-13 04:48:07','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YTo0Mjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTY6IkFzaWEvSG9fQ2hpX01pbmgiO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjEwOiJU4bqldCBj4bqjIjtzOjY6IkxlYWRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjk6Ik1lZXRpbmdzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO319'),('c758b35f-df5f-b925-f5c7-6316dfbea06c','Home2_OPPORTUNITY',0,'2022-09-06 05:51:30','2022-12-08 02:47:38','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c77f8ea7-0a3d-0da0-71d8-632a5f781c41','Home2_OPPORTUNITY',0,'2022-09-21 00:49:21','2022-09-21 00:49:21','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c844b061-b859-6393-7b63-6320716c12ad','global',0,'2022-09-13 12:03:21','2022-10-13 07:13:54','aea7576b-420a-eaf1-8062-6320718d714a','YTo0Mjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTM6IkV1cm9wZS9CZXJsaW4iO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjM6IkFsbCI7czo2OiJMZWFkc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czo5OiJNZWV0aW5nc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9fQ=='),('cbbf129d-0b81-81a5-7048-631aa7c7b31d','SecurityGroups2_SECURITYGROUP',0,'2022-09-09 02:41:19','2022-09-09 02:41:19','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('cbce5db1-5ade-d9cc-7456-63469d217193','Home2_LEAD_1daff36f-17da-46a8-833a-63469d89ca79',0,'2022-10-12 10:55:54','2022-10-12 10:55:54','c1abb968-9c8d-474e-c297-63282bf888ad','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('cc09a5d1-cf15-930c-fa4b-63282a9a2dde','global',0,'2022-09-19 08:39:52','2022-11-28 06:56:56','62213397-e5c8-5e5d-d4be-63282ab9f739','YTo0Mjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTQ6IkFzaWEvVmllbnRpYW5lIjtzOjI6InV0IjtzOjE6IjEiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo0OiJmZG93IjtzOjE6IjAiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjg6InN1YnRoZW1lIjtzOjQ6IkRhd24iO3M6MTU6ImxvZ2luZXhwaXJhdGlvbiI7czoxOiIwIjtzOjc6ImxvY2tvdXQiO3M6MDoiIjtzOjExOiJsb2dpbmZhaWxlZCI7czoxOiIwIjtzOjEwOiJ1c2VyX3RoZW1lIjtzOjY6IlN1aXRlUCI7czoxOToidGhlbWVfY3VycmVudF9ncm91cCI7czoxMDoiVOG6pXQgY+G6oyI7czo2OiJMZWFkc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czo5OiJNZWV0aW5nc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9fQ=='),('cead2b43-1d33-c6f3-44de-6316df0b5645','Home2_ACCOUNT',0,'2022-09-06 05:51:30','2022-12-08 02:47:38','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d170ca0e-9ec8-afbd-89d5-632a5f18ec66','Home2_ACCOUNT',0,'2022-09-21 00:49:21','2022-09-21 00:49:21','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d2dc978f-06aa-c783-9da4-63218d6650c7','Leads2_LEAD',0,'2022-09-14 08:14:23','2022-09-14 08:14:23','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d3eb233b-0261-b9e6-8050-63218d16d5b2','Home2_CALL',0,'2022-09-14 08:14:19','2022-09-14 08:14:19','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d3ecc732-a627-e1ca-a210-633bcbe32320','ETag',0,'2022-10-04 05:59:44','2022-10-04 05:59:44','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('d44890cd-65f3-b8bc-fa98-633a5deeb250','Home',0,'2022-10-03 03:57:40','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6Ijg3ZTdjMzQ0LTc5NWYtOTIzMC1lYzI0LTYzM2E1ZDdkYzM2YyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6Ijg4ZDg2ODU2LTYzNmUtMzZmNS05OTU4LTYzM2E1ZDRjMzk2MiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6Ijg5ZDZjY2U0LWZkMWYtNWY5Zi1lNzNlLTYzM2E1ZDZmMDE0NSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjhhODU3ZjFhLTRmYWMtMWQ2ZS1mMWI2LTYzM2E1ZGY0ZWU0ZCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiOGI4YzVjODItNTVlNS05YjExLWYzZTgtNjMzYTVkZGU5ZDNjIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiOGNmOTYzMWYtMjZlMy0zZmZjLWY4OGQtNjMzYTVkMTI0NmMxIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI4OGQ4Njg1Ni02MzZlLTM2ZjUtOTk1OC02MzNhNWQ0YzM5NjIiO2k6MTtzOjM2OiI4OWQ2Y2NlNC1mZDFmLTVmOWYtZTczZS02MzNhNWQ2ZjAxNDUiO2k6MjtzOjM2OiI4YTg1N2YxYS00ZmFjLTFkNmUtZjFiNi02MzNhNWRmNGVlNGQiO2k6MztzOjM2OiI4YjhjNWM4Mi01NWU1LTliMTEtZjNlOC02MzNhNWRkZTlkM2MiO2k6NDtzOjM2OiI4Y2Y5NjMxZi0yNmUzLTNmZmMtZjg4ZC02MzNhNWQxMjQ2YzEiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6Ijg3ZTdjMzQ0LTc5NWYtOTIzMC1lYzI0LTYzM2E1ZDdkYzM2YyI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('d6d6e6d3-f783-7642-1549-63289b2dc1bb','Leads2_LEAD',0,'2022-09-19 16:40:53','2022-09-19 16:40:53','62213397-e5c8-5e5d-d4be-63282ab9f739','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d72b2289-57af-802b-4f82-63282be5cc28','global',0,'2022-09-19 08:43:57','2022-12-09 07:37:50','c1abb968-9c8d-474e-c297-63282bf888ad','YTo0MTp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTM6IkV1cm9wZS9CZXJsaW4iO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjM6IkFsbCI7czo2OiJMZWFkc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9fQ=='),('d821092f-5e79-0b31-2ef1-631cc59ffbc4','Home',0,'2022-09-10 17:14:30','2022-09-10 17:14:30','bf510836-90a2-69d4-7db8-631aa285d1e7','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjliMjFiMDJjLTQzY2EtNjI5MC0wOWNlLTYzMWNjNTk2NjQwMSI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjliZjAzZTczLWFiZTMtYmQ4Yy03NTIxLTYzMWNjNTA0NDU5ZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjlkMjUyYjE3LWNkYzYtNDJhYS0wYTgzLTYzMWNjNTlmOGJkYiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjllMGNhNmZiLTIzZWYtNGNiMi05NmQ3LTYzMWNjNTdkMDE0ZCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiOWVmZDBhNDQtYmNjZC03NmIwLTZjZjUtNjMxY2M1ZmM2YzM5IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiOWZmNDBlNjMtZDM4ZS04MjNlLWQ2OWEtNjMxY2M1NDY0ZjhlIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI5YmYwM2U3My1hYmUzLWJkOGMtNzUyMS02MzFjYzUwNDQ1OWUiO2k6MTtzOjM2OiI5ZDI1MmIxNy1jZGM2LTQyYWEtMGE4My02MzFjYzU5ZjhiZGIiO2k6MjtzOjM2OiI5ZTBjYTZmYi0yM2VmLTRjYjItOTZkNy02MzFjYzU3ZDAxNGQiO2k6MztzOjM2OiI5ZWZkMGE0NC1iY2NkLTc2YjAtNmNmNS02MzFjYzVmYzZjMzkiO2k6NDtzOjM2OiI5ZmY0MGU2My1kMzhlLTgyM2UtZDY5YS02MzFjYzU0NjRmOGUiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjliMjFiMDJjLTQzY2EtNjI5MC0wOWNlLTYzMWNjNTk2NjQwMSI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('d83c99c4-472f-62e9-0e98-63219a84df38','Home2_MEETING',0,'2022-09-14 09:09:58','2022-09-14 09:09:58','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d8dcfd6c-708f-9735-f9f9-633bcb697399','Home2_MEETING',0,'2022-10-04 05:59:48','2022-10-04 05:59:48','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d9507a81-9952-58f9-06c6-6316df58ad31','Home2_LEAD',0,'2022-09-06 05:51:30','2022-12-08 02:47:38','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d9b518b8-49f4-8f12-0994-6316df1f78cd','ETag',0,'2022-09-06 05:47:31','2022-12-06 09:46:52','1','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mjt9'),('db9ec8d9-18cf-3a6e-f6c0-632a5f9c16e5','Home2_LEAD',0,'2022-09-21 00:49:21','2022-09-21 00:49:21','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('dc258334-11cc-f7ec-92bd-631abf3dafbb','Leads2_LEAD',0,'2022-09-09 04:20:21','2022-12-09 07:07:55','aacec1bd-6737-81e3-7365-631aa18cd430','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('dde40fcb-1e83-36dd-ca20-631ac3856e0b','Home2_LEAD_d30f7ab1-17e0-3298-91fd-631ac3566a80',0,'2022-09-09 04:39:19','2022-09-09 04:39:19','78e20ef0-7018-d656-107b-631aa2369613','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('dfe6fbd5-e3c6-1b39-2d24-634791aa6c34','Leads2_LEAD',0,'2022-10-13 04:19:06','2022-10-13 04:19:06','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('dffd4e79-8dc6-247f-7183-63218d7173c9','Home2_MEETING',0,'2022-09-14 08:14:19','2022-09-14 08:14:19','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e168b600-9bcb-7826-735e-633bcbedbe0f','Home2_OPPORTUNITY',0,'2022-10-04 05:59:48','2022-10-04 05:59:48','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e303a131-9ee2-5fa3-3c0e-6316df2a4667','Home2_SUGARFEED',0,'2022-09-06 05:51:30','2022-12-08 02:47:38','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e4579ff7-4fb9-4822-d520-634791c0b38c','ETag',0,'2022-10-13 04:16:36','2022-10-13 04:16:36','29cbc651-ca2e-ff42-0ba8-634698d9fce9','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mjt9'),('e92b8fae-9b8f-1cf3-5562-6347914b1a0c','ETag',0,'2022-10-13 04:19:50','2022-10-13 04:19:50','ce9806a2-8b0a-bc73-1b6d-63469814cb69','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('e9350350-c7d5-926b-143c-63282b69d38a','global',0,'2022-09-19 08:41:38','2022-09-21 00:49:28','2ca94880-44b1-f16a-d2df-63282b8f2314','YTo0MTp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjEiO3M6ODoidGltZXpvbmUiO3M6MTY6IkFzaWEvSG9fQ2hpX01pbmgiO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czozOiJIOmkiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE2OiJleHBvcnRfZGVsaW1pdGVyIjtzOjE6IiwiO3M6MjI6ImRlZmF1bHRfZXhwb3J0X2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjI6Im9uIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czowOiIiO3M6MTI6Im1haWxfc210cHNzbCI7aTowO3M6MTU6ImVtYWlsX2xpbmtfdHlwZSI7czo1OiJzdWdhciI7czoxMToiZWRpdG9yX3R5cGUiO3M6NjoibW96YWlrIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjA6IiI7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjtzOjY6IkxlYWRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO319'),('e9566e97-edc1-5905-b6bb-631ed6131b4b','Home2_ACCOUNT',0,'2022-09-12 06:47:25','2022-09-12 06:47:25','782a0c20-7f54-0fb0-125c-631aa22dc4e6','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e9b14146-490c-b30e-efa9-633a5dbc3b08','Home2_CALL',0,'2022-10-03 03:57:40','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e9b5590f-12e8-0ee3-f5a7-6392535e59fa','Dashboard',0,'2022-12-08 21:14:45','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YTowOnt9'),('eb2ce4bd-50ff-b192-8dc9-633a5dfc84a1','ETag',0,'2022-10-03 03:57:37','2022-12-08 21:14:47','1e53686b-f1aa-8dac-5bcf-63282bc67ade','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('ec8a6560-366c-eb9f-7b03-633bcb43f971','Home2_ACCOUNT',0,'2022-10-04 05:59:48','2022-10-04 05:59:48','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('ede0a625-b2cf-b332-ea79-632a5f1a7d86','Home2_SUGARFEED',0,'2022-09-21 00:49:21','2022-09-21 00:49:21','2ca94880-44b1-f16a-d2df-63282b8f2314','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('f188cd3c-b7d4-0524-bac9-63218dd2b96b','Home2_OPPORTUNITY',0,'2022-09-14 08:14:19','2022-09-14 08:14:19','130e2309-2bc1-b543-ba7c-631aa20981aa','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('f33895c4-b04d-d44b-0c1b-639253deb76a','Leads',0,'2022-12-08 21:11:29','2022-12-08 21:11:30','aacec1bd-6737-81e3-7365-631aa18cd430','YTowOnt9'),('f3f00a44-b80f-e605-b0a6-63219a63bbaa','Leads2_LEAD',0,'2022-09-14 09:10:04','2022-09-14 09:10:04','20e484bd-e9a4-72a4-ccd9-631aa25c91b9','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  `factor_auth` tinyint(1) DEFAULT NULL,
  `factor_auth_interface` varchar(255) DEFAULT NULL,
  `sip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','admin','$1$V9LRpbRb$InJ7fvM/AViMtIsomWQok/',0,NULL,NULL,1,NULL,'Administrator',1,0,1,NULL,'2022-09-06 05:47:31','2022-10-06 04:20:34','1','','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('130e2309-2bc1-b543-ba7c-631aa20981aa','MKT 2','$1$KDPHQO16$vjOBO4PISXHmaz2rJ7EfJ1',0,'2022-09-09 02:19:00',NULL,1,NULL,'MKT 2',0,0,1,NULL,'2022-09-09 02:19:49','2022-09-14 08:14:18','130e2309-2bc1-b543-ba7c-631aa20981aa','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('194493f9-5af3-a81b-bca8-6346986f2e4b','RO TELE 1','$1$lbv7k0FE$gdsE53cmIkSFDQ7937.UW1',0,'2022-10-12 10:35:18',NULL,1,'','RO TELE 1',0,0,1,'','2022-10-12 10:35:18','2022-10-12 10:35:18','1','1','',NULL,'','','','','','','Active','','','','','',0,0,1,'Active','','','',0,0,NULL,NULL),('1e53686b-f1aa-8dac-5bcf-63282bc67ade','RO TB 2','$1$Igd4WkAM$uVnRgWYOLsQOz4oQnaE4C.',0,'2022-09-19 08:44:00',NULL,1,NULL,'RO TB 2',0,0,1,NULL,'2022-09-19 08:44:14','2022-10-03 03:57:37','1e53686b-f1aa-8dac-5bcf-63282bc67ade','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('20e484bd-e9a4-72a4-ccd9-631aa25c91b9','RO NTT 1','$1$ignNosS6$lKfkQNFLBr12RDDdvsj32/',0,'2022-09-19 08:38:04',NULL,1,NULL,'RO NTT 1',0,0,1,NULL,'2022-09-09 02:20:30','2022-09-19 08:38:04','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('29cbc651-ca2e-ff42-0ba8-634698d9fce9','BU DL TB','$1$XTQiUM.n$JG7Pv3J5QFVyAhYcZlvyy1',0,'2022-10-12 10:37:00',NULL,1,NULL,'BU DL TB',0,0,1,NULL,'2022-10-12 10:37:13','2022-10-13 04:16:36','29cbc651-ca2e-ff42-0ba8-634698d9fce9','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('2ca94880-44b1-f16a-d2df-63282b8f2314','RO Q10 2','$1$MAs9A1Wr$yFw4/YxIgZnvN58G9A667/',0,'2022-09-19 08:41:00',NULL,1,NULL,'RO Q10 2',0,0,1,NULL,'2022-09-19 08:41:38','2022-09-21 00:49:18','2ca94880-44b1-f16a-d2df-63282b8f2314','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('62213397-e5c8-5e5d-d4be-63282ab9f739','RO Q10 1','$1$MG43TZVF$LF60Ub94EZqMUT87sqdXl1',0,'2022-09-19 08:39:00',NULL,1,NULL,'RO Q10 1',0,0,1,NULL,'2022-09-19 08:39:52','2022-09-19 16:40:47','62213397-e5c8-5e5d-d4be-63282ab9f739','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('782a0c20-7f54-0fb0-125c-631aa22dc4e6','BU_TB','$1$F2IEZhpi$pxeLIRUOR5fRVib.pU8lL0',0,'2022-09-14 07:26:16',NULL,1,NULL,'BU_TB',0,0,1,NULL,'2022-09-09 02:17:31','2022-09-14 07:26:16','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('78e20ef0-7018-d656-107b-631aa2369613','BU_Q10','$1$VpHQwxdv$PXg7cYWjgDR40yjLs.7nq/',0,'2022-09-14 07:26:49',NULL,1,NULL,'BU_Q10',0,0,1,NULL,'2022-09-09 02:17:05','2022-09-14 07:26:49','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('7eabb5c9-0e8a-f1d2-f1a9-632071c4140d','super-mkt 2','$1$/aDa/.Zs$eBapKax17IF5V7t7ddIWB/',0,'2022-09-13 12:03:55',NULL,1,'2','super-mkt',0,0,1,'','2022-09-13 12:03:55','2022-09-13 12:03:55','1','1','',NULL,'','','','','','','Active','','','','','',0,0,1,'Active','','','',0,0,NULL,NULL),('88c77436-5bc0-36f5-58c5-634698297705','RO TELE 2','$1$cOxM/HPI$2ou9mhbdHpUS6Dqb9cW8T/',0,'2022-10-12 10:35:55',NULL,1,'','RO TELE 2',0,0,1,'','2022-10-12 10:35:55','2022-10-12 10:35:55','1','1','',NULL,'','','','','','','Active','','','','','',0,0,1,'Active','','','',0,0,NULL,NULL),('93ae40f9-a2fe-b851-43ef-633bb75ad0a9','BU_TELE','$1$zmYj3ROL$D1eZJ71kWg66MKXH/ySv6/',0,'2022-10-04 04:33:00',NULL,1,NULL,'BU_TELE',0,0,1,NULL,'2022-10-04 04:33:16','2022-10-04 05:59:44','93ae40f9-a2fe-b851-43ef-633bb75ad0a9','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('aacec1bd-6737-81e3-7365-631aa18cd430','MKT 1','$1$dHbikeXu$7IjYS340ux.25USs7JCBQ.',0,'2022-09-09 02:14:00',NULL,1,NULL,'MKT 1',0,0,1,NULL,'2022-09-09 02:14:28','2022-09-09 03:20:11','aacec1bd-6737-81e3-7365-631aa18cd430','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('aea7576b-420a-eaf1-8062-6320718d714a','super-mkt 1','$1$058eaOs/$eTjV3UvjCJ6WINJ4OrSxH.',0,'2022-09-13 12:03:00',NULL,1,NULL,'super-mkt 1',0,0,1,NULL,'2022-09-13 12:03:21','2022-09-13 17:38:36','aea7576b-420a-eaf1-8062-6320718d714a','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('bf510836-90a2-69d4-7db8-631aa285d1e7','BU_NTT','$1$jxakVkLj$T3B1IcAY.fjMlzxQ64H3B0',0,'2022-09-14 07:28:17',NULL,1,NULL,'BU_NTT',0,0,1,NULL,'2022-09-09 02:20:10','2022-09-14 07:28:17','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('c1abb968-9c8d-474e-c297-63282bf888ad','RO TB 1','$1$4pfSZpGN$AZdKUTJfb4DQ0H85Rn7e10',0,'2022-09-19 08:43:00',NULL,1,NULL,'RO TB 1',0,0,1,NULL,'2022-09-19 08:43:57','2022-10-12 10:55:48','c1abb968-9c8d-474e-c297-63282bf888ad','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('ce9806a2-8b0a-bc73-1b6d-63469814cb69','RO DL TB 1','$1$BatUiibZ$7tbHzBgvwvtNOknKRO3hO1',0,'2022-10-12 10:36:00',NULL,1,NULL,'RO DL TB 1',0,0,1,NULL,'2022-10-12 10:36:31','2022-10-13 04:19:50','ce9806a2-8b0a-bc73-1b6d-63469814cb69','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL),('ddee979a-ef5a-e49b-3ce1-634698e24c4a','RO DL TB 2','$1$rOjAWhcR$czZ0.z2yd2EXLiLTJi0vy1',0,'2022-10-12 10:36:48',NULL,1,'','RO DL TB 2',0,0,1,'','2022-10-12 10:36:48','2022-10-12 10:36:48','1','1','',NULL,'','','','','','','Active','','','','','',0,0,1,'Active','','','',0,0,NULL,NULL),('df55b3c8-1764-6ebf-01dd-63218270e96b','RO NTT 2','$1$0hCW/iWb$HiqYH2Yv08eEXlFrbYGfd0',0,'2022-09-19 08:39:31',NULL,1,NULL,'RO NTT 2',0,0,1,NULL,'2022-09-14 07:29:33','2022-09-19 08:39:31','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_feeds`
--

DROP TABLE IF EXISTS `users_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_feeds`
--

LOCK TABLES `users_feeds` WRITE;
/*!40000 ALTER TABLE `users_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_last_import`
--

DROP TABLE IF EXISTS `users_last_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_last_import`
--

LOCK TABLES `users_last_import` WRITE;
/*!40000 ALTER TABLE `users_last_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_last_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_link`
--

DROP TABLE IF EXISTS `users_password_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_link`
--

LOCK TABLES `users_password_link` WRITE;
/*!40000 ALTER TABLE `users_password_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_password_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_signatures`
--

DROP TABLE IF EXISTS `users_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_signatures`
--

LOCK TABLES `users_signatures` WRITE;
/*!40000 ALTER TABLE `users_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcals`
--

DROP TABLE IF EXISTS `vcals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcals`
--

LOCK TABLES `vcals` WRITE;
/*!40000 ALTER TABLE `vcals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-11  0:32:38