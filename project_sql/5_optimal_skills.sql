/*
What are the highest-paying job postings for Data Analyst role?
What skills are required for these highest-paying positions?
What are the most in-demand skills for my role? (Based on frequency in job postings)
Which skills are associated with the highest average salaries?
What are the most optimal skills to learn?

Optimal = High Demand AND High Paying
Skills that appear frequently in job postings and are linked to higher salaries.
*/

WITH highest_paying_skills AS (
    SELECT
        j.job_title_short AS job_title,
        sj.skill_id,
        ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
    FROM 
        job_postings_fact AS j
    INNER JOIN 
        skills_job_dim AS sj ON j.job_id = sj.job_id
    WHERE
        j.job_title_short ILIKE 'Data Analyst'
        AND j.salary_year_avg IS NOT NULL
    GROUP BY
        j.job_title_short,
        sj.skill_id
),
skill_demand AS (
    SELECT
        sj.skill_id,
        j.job_title_short,
        COUNT(*) AS demand_count
    FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
    WHERE
        j.job_title_short ILIKE 'Data Analyst'
    GROUP BY
        sj.skill_id,
        j.job_title_short
)
SELECT
    sd.skill_id,
    s.skills AS skill_name,
    sd.demand_count,
    hps.avg_salary
FROM skill_demand AS sd
INNER JOIN highest_paying_skills AS hps
    ON sd.skill_id = hps.skill_id
    AND sd.job_title_short = hps.job_title
INNER JOIN skills_dim AS s
    ON sd.skill_id = s.skill_id
ORDER BY
    sd.demand_count DESC,
    hps.avg_salary DESC;