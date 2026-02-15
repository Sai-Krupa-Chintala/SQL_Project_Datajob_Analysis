/*
Find the companies that have the most job openings.
- Get the total number of job postings per company id (job_posting_fact)
- Return the total number of jobs with the company name (company_dim)
*/

-- Finding companies with most job openings using CTE
WITH company_job_count AS (                                        
    SELECT
        COUNT(job_id) as total_number_jobs,
        company_id
    FROM
        job_postings_fact
    GROUP BY
        company_id
)
SELECT                                                               
    name AS company_name,
    company_job_count.total_number_jobs
FROM
    company_dim
LEFT JOIN 
    company_job_count
    ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_number_jobs DESC;
