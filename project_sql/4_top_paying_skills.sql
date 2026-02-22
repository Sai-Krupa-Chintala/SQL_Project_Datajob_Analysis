/*
Questions to Answer
What are the highest-paying job postings for the Data Analyst role?
What skills are required for these highest-paying Data Analyst jobs?
What are the most in-demand skills for Data Analysts? (Based on the number of job postings requiring each skill)
Which skills are associated with the highest average salaries for Data Analysts?
What are the most optimal skills to learn for a Data Analyst?

Optimal = High Demand + High Salary
Skills that appear frequently in job postings and are associated with higher pay.
*/

WITH skills_in_demand AS (
SELECT
    j.job_title_short AS job_title,
    sj.skill_id,
    ROUND(AVG(j.salary_year_avg) , 0) AS avg_salary,
    COUNT(*) AS total_skill_count
FROM
    job_postings_fact AS j
INNER JOIN
    skills_job_dim AS sj
    ON j.job_id = sj.job_id
WHERE
    j.job_title_short ILIKE 'Data Analyst'
    AND j.salary_year_avg IS NOT NULL
GROUP BY
    j.job_title_short,
    sj.skill_id
)
SELECT
    sd.job_title,
    s.skills AS most_in_demand_skills,
    sd.avg_salary
FROM
    skills_in_demand AS sd
INNER JOIN
    skills_dim AS s
    ON sd.skill_id = s.skill_id
ORDER BY
    sd.avg_salary DESC;


/*
Insights:
Cloud & Big Data pays a premium. Skills like Snowflake, Kafka, Spark, Databricks, and GCP all cluster in the $110K–$130K range, 
signaling that companies pay well for analysts who can work beyond just Excel/SQL.

The SVN outlier ($400K) is suspicious. SVN is a version control tool, not typically a high-value analyst skill. 
That single data point likely skews from one unusually high-paying job posting — worth noting it's probably not representative.

ML/AI tools are surprisingly high. PyTorch ($125K), Keras ($127K), TensorFlow ($120K), and Hugging Face ($123K) 
appearing in the Data Analyst list suggests the line between analyst and data scientist is blurring — 
companies want analysts who can at least work alongside ML pipelines.

DevOps/Engineering crossover skills command top dollar. Terraform ($146K), Ansible ($124K), 
Puppet ($129K) are infrastructure tools — not traditional analyst skills at all. Analysts with 
these skills are likely in hybrid engineering-analyst roles at tech companies.

The practical takeaway: The core skills you're learning — SQL, Python, 
Snowflake, AWS — sit solidly in the $96K–$111K range, which is realistic target band. 
The $120K+ skills (ML frameworks, DevOps) are stretch goals once you land the role.
*/
