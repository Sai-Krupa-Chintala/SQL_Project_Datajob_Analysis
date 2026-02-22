/*
Question: What are the most in-demand skills for data analysts?
Join job postings to inner join table similar to query 2
Identify the top 5 in-demand skalls for a data analyst.
Focus on all job postings.
Why? Retrieves the top 5 skills with the highest demand in the job market,
*/

WITH skill_demand AS(
    SELECT
        sj.skill_id,
        j.job_title_short,
        COUNT(*) AS total_skill_count
    FROM job_postings_fact AS j
    INNER JOIN
        skills_job_dim AS sj
        ON j.job_id = sj.job_id
    WHERE
        j.job_title_short ILIKE 'Data Analyst'
    GROUP BY
        sj.skill_id,
        j.job_title_short
)
SELECT
    sd.job_title_short,
    s.skills AS skill_name,
    sd.total_skill_count
FROM
    skill_demand AS sd
INNER JOIN 
    skills_dim AS s
    ON sd.skill_id = s.skill_id
ORDER BY
    total_skill_count DESC
LIMIT 5;
    