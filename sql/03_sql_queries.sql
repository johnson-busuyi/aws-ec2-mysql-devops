
-- AWS EC2 MySQL DevOps Project
-- File: 03_sql_queries.sql
-- Purpose: SQL querying and data analysis exercises
-- Run against devops_deployments after loading sample data.
-- SELECT statements are read-only.

USE devops_deployments;

-- Exercise 1: Display all deployments
SELECT * FROM deployments;

-- Exercise 2: Successful deployments
SELECT *
FROM deployments
WHERE status = 'Success';

-- Exercise 3: Failed deployments
SELECT *
FROM deployments
WHERE status = 'Failed';

-- Exercise 4: Production deployments
SELECT *
FROM deployments
WHERE environment = 'Production';

-- Exercise 5: Most recent deployments
SELECT *
FROM deployments
ORDER BY deployment_date DESC, id DESC
LIMIT 5;

-- Exercise 6: Total deployments
SELECT COUNT(*) AS total_deployments
FROM deployments;

-- Exercise 7: Deployments by status
SELECT status, COUNT(*) AS total
FROM deployments
GROUP BY status;

-- Exercise 8: Deployments by environment
SELECT environment, COUNT(*) AS total
FROM deployments
GROUP BY environment
ORDER BY total DESC;

-- Exercise 9: Deployments by application
SELECT application_name,
       COUNT(*) AS total_deployments
FROM deployments
GROUP BY application_name
ORDER BY total_deployments DESC;

-- Exercise 10: Deployment success rate
SELECT
    COUNT(*) AS total_deployments,
    SUM(CASE WHEN status = 'Success'
        THEN 1 ELSE 0 END) AS successful,
    ROUND(
        100.0 * SUM(
            CASE WHEN status = 'Success'
            THEN 1 ELSE 0 END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS success_rate
FROM deployments;

-- Exercise 11: Applications with multiple deployments
SELECT application_name,
       COUNT(*) AS total
FROM deployments
GROUP BY application_name
HAVING COUNT(*) > 1;

-- Exercise 12: Earliest and latest deployments
SELECT
    MIN(deployment_date) AS earliest,
    MAX(deployment_date) AS latest
FROM deployments;
