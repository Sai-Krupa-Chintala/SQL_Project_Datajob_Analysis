-- Load company_dim table data from local CSV file into database
COPY company_dim
FROM 'C:\Users\Sai Krupa\Desktop\SQL\SQL_Project_Datajob_Analysis\csv_files-20260212T044930Z-1-001\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Load skills_dim table data from local CSV file into database
COPY skills_dim
FROM 'C:\Users\Sai Krupa\Desktop\SQL\SQL_Project_Datajob_Analysis\csv_files-20260212T044930Z-1-001\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Load job_posting_fact table data from local CSV file into database
COPY job_postings_fact
FROM 'C:\Users\Sai Krupa\Desktop\SQL\SQL_Project_Datajob_Analysis\csv_files-20260212T044930Z-1-001\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Load skills_job_dim table data from local CSV file into database
COPY skills_job_dim
FROM 'C:\Users\Sai Krupa\Desktop\SQL\SQL_Project_Datajob_Analysis\csv_files-20260212T044930Z-1-001\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
