-- Using subquery to filter companies with no-degree-mention jobs
SELECT                         -- outer query
    company_id,
    name AS company_name
FROM
    company_dim
WHERE company_id IN (
    SELECT                     -- nested query
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
        company_id
);