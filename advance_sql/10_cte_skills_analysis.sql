/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
- Include skill ID, name, and count of postings requiring the skill
*/

WITH remote_job_skill AS (
    SELECT
        skill_id AS top_skills,
        COUNT(*) AS skill_count
    FROM
        job_postings_fact AS job_listing
    INNER JOIN
        skills_job_dim AS j_skills
        ON job_listing.job_id = j_skills.job_id
    WHERE
        job_work_from_home = TRUE
    GROUP BY
        top_skills 
)
SELECT
    skill.skill_id,
    skill.skills AS skill_name,
    remote_job_skill.skill_count  
FROM
    remote_job_skill  
INNER JOIN
    skills_dim AS skill 
    ON remote_job_skill.top_skills = skill.skill_id;
