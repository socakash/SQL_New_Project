
-- FIND top 10 highest paid DATA ANALYST remote jobs 

SELECT
    job_title_short,
    job_title,
    company_dim.name,
    job_country,
    salary_year_avg
FROM 
    job_postings_fact
LEFT JOIN company_dim 
ON
job_postings_fact.company_id = company_dim.company_id
WHERE
    job_location = 'Anywhere'
    AND
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;