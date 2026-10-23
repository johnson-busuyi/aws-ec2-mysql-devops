
-- =====================================================
-- AWS EC2 MySQL DevOps Project
-- File: 06_user_permissions.sql
-- Purpose: MySQL role-based access demonstration
-- MySQL Version: 8.4
--
-- SECURITY:
-- This is a documentation template.
-- Replace password placeholders securely before use.
-- Never commit actual passwords to GitHub.
-- Run only as an authorized MySQL administrator.
-- =====================================================

USE devops_deployments;

-- =====================================================
-- USER 1: DEVOPS USER
-- =====================================================
-- Permissions: SELECT, INSERT, UPDATE
-- No DELETE or database administration privileges.

-- TEMPLATE ONLY: Replace placeholder securely.
-- Do not execute with the example password.
CREATE USER IF NOT EXISTS 'devops_user'@'localhost'
IDENTIFIED BY 'REPLACE_WITH_SECURE_PASSWORD';

GRANT SELECT, INSERT, UPDATE
ON devops_deployments.*
TO 'devops_user'@'localhost';


-- =====================================================
-- USER 2: REPORT USER
-- =====================================================
-- Permissions: SELECT on reporting views only.
-- Underlying tables remain inaccessible directly.

-- TEMPLATE ONLY: Replace placeholder securely.
-- Do not execute with the example password.
CREATE USER IF NOT EXISTS 'report_user'@'localhost'
IDENTIFIED BY 'REPLACE_WITH_SECURE_PASSWORD';

GRANT SELECT
ON devops_deployments.vw_deployment_report
TO 'report_user'@'localhost';

GRANT SELECT
ON devops_deployments.vw_deployment_summary
TO 'report_user'@'localhost';


-- =====================================================
-- VERIFY PERMISSIONS
-- =====================================================

SHOW GRANTS FOR 'devops_user'@'localhost';

SHOW GRANTS FOR 'report_user'@'localhost';
