
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

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` (`id`, `application_name`, `owner`, `repository_url`, `created_at`) VALUES (1,'CartFlow','DevOps Team','https://github.com/johnson-busuyi/CartFlow','2026-10-22 02:11:19'),(2,'PaymentAPI','Backend Team',NULL,'2026-10-22 02:11:19'),(3,'CustomerChurn','MLOps Team',NULL,'2026-10-22 02:11:19'),(4,'InventoryAPI','Backend Team',NULL,'2026-10-22 02:11:19');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `deployments` WRITE;
/*!40000 ALTER TABLE `deployments` DISABLE KEYS */;
INSERT INTO `deployments` (`id`, `application_name`, `environment`, `version`, `status`, `deployed_by`, `deployment_date`, `application_id`) VALUES (1,'CartFlow','Production','1.0.0','Success','Azure DevOps','2026-10-21 20:48:51',1),(2,'CartFlow','Staging','1.1.0','Success','Jenkins','2026-10-21 20:50:48',1),(3,'PaymentAPI','Production','2.0.0','Failed','GitHub Actions','2026-10-21 20:50:48',2),(4,'CustomerChurn','Development','1.0.0','Success','Azure DevOps','2026-10-21 20:50:48',3),(5,'InventoryAPI','Staging','1.2.0','Pending','Jenkins','2026-10-21 20:50:48',4),(6,'CartFlow','Production','1.2.0','Success','Azure DevOps','2026-10-21 20:50:48',1),(7,'CartFlow','Staging','1.1.0','Success','Jenkins','2026-10-22 01:07:48',1),(8,'PaymentAPI','Production','2.0.0','Failed','GitHub Actions','2026-10-22 01:07:48',2),(9,'CustomerChurn','Development','1.0.0','Success','Azure DevOps','2026-10-22 01:07:48',3),(10,'InventoryAPI','Staging','1.2.0','Pending','Jenkins','2026-10-22 01:07:48',4),(11,'CartFlow','Production','1.2.0','Success','Azure DevOps','2026-10-22 01:07:48',1),(12,'CartFlow','Staging','1.1.0','Success','Jenkins','2026-10-22 01:07:53',1),(13,'PaymentAPI','Production','2.0.0','Failed','GitHub Actions','2026-10-22 01:07:53',2),(14,'CustomerChurn','Development','1.0.0','Success','Azure DevOps','2026-10-22 01:07:53',3),(15,'InventoryAPI','Staging','1.2.0','Pending','Jenkins','2026-10-22 01:07:53',4),(16,'CartFlow','Production','1.2.0','Success','Azure DevOps','2026-10-22 01:07:53',1);
/*!40000 ALTER TABLE `deployments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

