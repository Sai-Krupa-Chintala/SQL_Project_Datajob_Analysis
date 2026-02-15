-- Display job postings with default timestamp format
SELECT 
    job_title_short AS job_title,
    job_location AS location,
    job_posted_date AS date  -- TIMESTAMP format (date + time)
FROM
    job_postings_fact
LIMIT 5;

-- Converting timestamp to date only
SELECT 
    job_title_short AS job_title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact
LIMIT 5;

-- Converting timezone from UTC to EST with timestamp format
SELECT
    job_title_short AS job_title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time 
FROM
    job_postings_fact
LIMIT 5;

-- Extract month from job posting date
SELECT
    job_title_short AS job_title,
    job_location AS location,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
LIMIT 5;


-- Extracting data analyst jobs posted each month from the job_posting_fact table
SELECT
    COUNT(job_id) AS total_jobs_posted,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY 
    total_jobs_posted DESC;

