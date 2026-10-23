
-- =====================================================
-- AWS EC2 MySQL DevOps Project
-- File: 04_joins.sql
-- Database: devops_deployments
-- Purpose: SQL JOIN and deployment analysis exercises
-- All queries in this file are read-only.
-- =====================================================

USE devops_deployments;

-- EXERCISE 1: INNER JOIN
-- Show deployment details with application owners.

SELECT
    a.application_name,
    a.owner,
    d.environment,
    d.version,
    d.status,
    d.deployed_by,
    d.deployment_date
FROM applications AS a
INNER JOIN deployments AS d
    ON a.id = d.application_id
ORDER BY d.id;


-- EXERCISE 2: LEFT JOIN
-- Show all applications, including those without deployments.

SELECT
    a.application_name,
    a.owner,
    d.environment,
    d.status
FROM applications AS a
LEFT JOIN deployments AS d
    ON a.id = d.application_id
ORDER BY a.id, d.id;


-- EXERCISE 3: Failed deployment investigation
-- Identify failed deployments and responsible teams.

SELECT
    a.application_name,
    a.owner,
    d.environment,
    d.version,
    d.status,
    d.deployed_by,
    d.deployment_date
FROM applications AS a
INNER JOIN deployments AS d
    ON a.id = d.application_id
WHERE d.status = 'Failed'
ORDER BY d.deployment_date DESC, d.id DESC;


-- EXERCISE 4: Deployment count per application
-- Include applications with zero deployments.

SELECT
    a.application_name,
    a.owner,
    COUNT(d.id) AS total_deployments
FROM applications AS a
LEFT JOIN deployments AS d
    ON a.id = d.application_id
GROUP BY a.id, a.application_name, a.owner
ORDER BY total_deployments DESC;


-- EXERCISE 5: Deployment status summary
-- Count successful, failed, and pending deployments.

SELECT
    a.application_name,
    COUNT(d.id) AS total_deployments,
    SUM(CASE WHEN d.status = 'Success'
        THEN 1 ELSE 0 END) AS successful,
    SUM(CASE WHEN d.status = 'Failed'
        THEN 1 ELSE 0 END) AS failed,
    SUM(CASE WHEN d.status = 'Pending'
        THEN 1 ELSE 0 END) AS pending
FROM applications AS a
LEFT JOIN deployments AS d
    ON a.id = d.application_id
GROUP BY a.id, a.application_name
ORDER BY a.application_name;


-- EXERCISE 6: Success rate by application
-- NULLIF prevents division by zero.

SELECT
    a.application_name,
    COUNT(d.id) AS total_deployments,
    ROUND(
        100.0 * SUM(
            CASE WHEN d.status = 'Success'
                THEN 1 ELSE 0 END
        ) / NULLIF(COUNT(d.id), 0),
        2
    ) AS success_rate_percent
FROM applications AS a
LEFT JOIN deployments AS d
    ON a.id = d.application_id
GROUP BY a.id, a.application_name
ORDER BY success_rate_percent DESC;


-- EXERCISE 7: Application repository lookup
-- Connect deployment records to source repositories.

SELECT
    a.application_name,
    a.repository_url,
    d.environment,
    d.version,
    d.status
FROM applications AS a
INNER JOIN deployments AS d
    ON a.id = d.application_id
ORDER BY a.application_name, d.id;


-- EXERCISE 8: Applications without deployments
-- Useful for identifying unused or newly registered apps.

SELECT
    a.id,
    a.application_name,
    a.owner
FROM applications AS a
LEFT JOIN deployments AS d
    ON a.id = d.application_id
WHERE d.id IS NULL;
