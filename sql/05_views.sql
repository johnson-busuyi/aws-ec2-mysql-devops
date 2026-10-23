
-- =====================================================
-- AWS EC2 MySQL DevOps Project
-- File: 05_views.sql
-- Purpose: Reproduce existing deployment reporting views
-- Database: devops_deployments
-- MySQL: 8.4
-- =====================================================

USE devops_deployments;

-- VIEW 1: Detailed Deployment Report
-- Includes deployment ID, application owner, repository,
-- environment, version, status, and deployment metadata.
-- SQL SECURITY DEFINER allows authorized view users
-- to query the view using the definer's privileges.

CREATE OR REPLACE
SQL SECURITY DEFINER
VIEW vw_deployment_report AS
SELECT
    d.id AS deployment_id,
    a.application_name,
    a.owner,
    a.repository_url,
    d.environment,
    d.version,
    d.status,
    d.deployed_by,
    d.deployment_date
FROM deployments AS d
INNER JOIN applications AS a
    ON d.application_id = a.id;


-- VIEW 2: Deployment Summary
-- Includes application ownership and deployment counts.
-- LEFT JOIN retains applications with no deployments.

CREATE OR REPLACE
SQL SECURITY DEFINER
VIEW vw_deployment_summary AS
SELECT
    a.application_name,
    a.owner,
    COUNT(d.id) AS total_deployments,
    COUNT(
        CASE WHEN d.status = 'Success'
        THEN 1 END
    ) AS successful,
    COUNT(
        CASE WHEN d.status = 'Failed'
        THEN 1 END
    ) AS failed,
    COUNT(
        CASE WHEN d.status = 'Pending'
        THEN 1 END
    ) AS pending
FROM applications AS a
LEFT JOIN deployments AS d
    ON a.id = d.application_id
GROUP BY
    a.id,
    a.application_name,
    a.owner;

