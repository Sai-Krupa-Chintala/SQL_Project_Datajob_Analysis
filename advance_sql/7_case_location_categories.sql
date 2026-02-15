-- Categorize job postings by location type for Data Analyst roles
SELECT
    COUNT(job_id) AS total_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE job_title_short ='Data Analyst'
GROUP BY
    location_category;
