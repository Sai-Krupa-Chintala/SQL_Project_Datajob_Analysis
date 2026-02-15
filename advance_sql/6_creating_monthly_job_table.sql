-- Extract jobs posted in each month into separate tables

-- January jobs table
CREATE TABLE january_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February jobs table
CREATE TABLE february_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March jobs table
CREATE TABLE march_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

-- April jobs table
CREATE TABLE april_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

-- May jobs table
CREATE TABLE may_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

-- June jobs table
CREATE TABLE june_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

-- July jobs table
CREATE TABLE july_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

-- August jobs table
CREATE TABLE august_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

-- September jobs table
CREATE TABLE september_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

-- October jobs table
CREATE TABLE october_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

-- November jobs table
CREATE TABLE november_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

-- December jobs table
CREATE TABLE december_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 12;

-- View results by changing table name
SELECT 
    job_posted_date
FROM
    december_jobs;