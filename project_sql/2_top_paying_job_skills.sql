/*
 What are the top-paying data analyst jobs, and what skills are required?** 

- Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
 helping job seekers understand which skills to develop that align with top salaries
*/




SELECT
    j_posting.job_id,
    job_title_short AS job_title,
    job_location,
    job_schedule_type,
    salary_year_avg AS salary,
    job_posted_date,
    s_skill.skills AS skill_name
FROM
    job_postings_fact AS j_posting
LEFT JOIN
    skills_job_dim AS j_skill
    ON j_posting.job_id = j_skill.job_id
LEFT JOIN
    skills_dim AS s_skill
    ON j_skill.skill_id = s_skill.skill_id
WHERE   
    job_work_from_home = TRUE
    AND  job_title_short LIKE  '%Data Analyst%'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary DESC 
LIMIT 10;
    

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title_short AS job_title,
        salary_year_avg AS salary,
        job_location,
        job_posted_date,
        company.name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim AS company
        ON job_postings_fact.company_id = company.company_id
    WHERE
        job_work_from_home = TRUE
        AND job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    tpj.*,
    s_skill.skills AS skill_name
FROM top_paying_jobs AS tpj
LEFT JOIN skills_job_dim AS j_skill
    ON tpj.job_id = j_skill.job_id
LEFT JOIN skills_dim AS s_skill
    ON j_skill.skill_id = s_skill.skill_id
ORDER BY tpj.salary DESC, s_skill.skills;
