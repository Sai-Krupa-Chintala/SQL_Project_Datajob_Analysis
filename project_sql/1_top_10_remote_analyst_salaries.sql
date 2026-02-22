/*
What are the top-paying data analyst jobs?**

- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
*/


SELECT
    job_id,
    job_title_short AS job_title,
    company.name AS company_name,
    job_location,
    job_schedule_type,
    job_posted_date,
    ROUND(salary_year_avg, 0) AS salary,
    CASE
        WHEN job_work_from_home = TRUE THEN 'remote'
        ELSE 'on_site'
    END AS job_type
FROM
    job_postings_fact AS job_postings
LEFT JOIN
    company_dim AS company
    ON job_postings.company_id = company.company_id
WHERE
    job_title_short LIKE '%Data Analyst%'
    AND job_work_from_home = TRUE 
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary DESC
LIMIT 10;



select *
from job_postings_fact
limit 5;