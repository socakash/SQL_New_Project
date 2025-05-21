-- Top 10 Skills required for highest paying jobs
WITH top_jobs AS
(
    SELECT
        job_id,
        job_title_short,
        job_title,
        company_dim.name AS name,
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
)

SELECT 
    top_jobs.job_title_short,
    top_jobs.job_title,
    top_jobs.name,
    top_jobs.job_country,
    top_jobs.salary_year_avg,
    skills_dim.skills
FROM top_jobs
INNER JOIN skills_job_dim 
ON
top_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON
skills_dim.skill_id = skills_job_dim.skill_id;


/* Query Purpose
Filtering for remote ("Anywhere") Data Analyst jobs.
Ensuring jobs have non-null salary information.
Joining with the skills_dim table to find out what skills are linked to these roles.
Selecting detailed job and company info along with associated skills.

Key Insights 
Most In-Demand Skills in High-Paying Remote Data Analyst Jobs:
Skills like SQL, Python, Tableau, or Excel are likely to appear frequently.
These would be high-value skills that employers associate with top compensation.
Employer Preferences:
The company_dim.name help identify which companies are offering the highest salaries and what skills they prioritize.
Geographical Trends (even though job is remote) still break it down by job_country to see if there are salary or skill preferences across countries.*/

/*[
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Texas Workforce Commission",
    "job_country": "United States",
    "salary_year_avg": "79415.5",
    "skills": "microsoft teams"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (SQL) :Role 3354",
    "name": "iTalent Digital",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (SQL) :Role 3354",
    "name": "iTalent Digital",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (SQL) :Role 3354",
    "name": "iTalent Digital",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "express"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (SQL) :Role 3354",
    "name": "iTalent Digital",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (SQL) :Role 3354",
    "name": "iTalent Digital",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "matlab"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst with SQL (Strong)",
    "name": "Innova Solutions",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst with SQL (Strong)",
    "name": "Innova Solutions",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst with SQL (Strong)",
    "name": "Innova Solutions",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst with SQL (Strong)",
    "name": "Innova Solutions",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Engineer",
    "name": "Neurons Lab",
    "job_country": "Ukraine",
    "salary_year_avg": "62000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Engineer",
    "name": "Neurons Lab",
    "job_country": "Ukraine",
    "salary_year_avg": "62000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Engineer",
    "name": "Neurons Lab",
    "job_country": "Ukraine",
    "salary_year_avg": "62000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Engineer",
    "name": "Neurons Lab",
    "job_country": "Ukraine",
    "salary_year_avg": "62000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Engineer",
    "name": "Neurons Lab",
    "job_country": "Ukraine",
    "salary_year_avg": "62000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "shell"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "airflow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "jupyter"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "golang"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "elasticsearch"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "gcp"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "scikit-learn"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Level",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "kubernetes"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "126452.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "126452.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "126452.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "126452.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "126452.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "126452.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "126452.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "REMOTE PowerBI Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Kaye/Bassman International, Corp.",
    "job_country": "Sudan",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Kaye/Bassman International, Corp.",
    "job_country": "Sudan",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Kaye/Bassman International, Corp.",
    "job_country": "Sudan",
    "salary_year_avg": "60000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Kaye/Bassman International, Corp.",
    "job_country": "Sudan",
    "salary_year_avg": "60000.0",
    "skills": "smartsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manufacturing Data Analyst",
    "name": "ATR International",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manufacturing Data Analyst",
    "name": "ATR International",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manufacturing Data Analyst",
    "name": "ATR International",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manufacturing Data Analyst",
    "name": "ATR International",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "matplotlib"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manufacturing Data Analyst",
    "name": "ATR International",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manufacturing Data Analyst",
    "name": "ATR International",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "scala"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "World Education Services",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director, Data Analysis",
    "name": "EL Education (Formerly Expeditionary Learning)",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director, Data Analysis",
    "name": "EL Education (Formerly Expeditionary Learning)",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director, Data Analysis",
    "name": "EL Education (Formerly Expeditionary Learning)",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "name": "Home Depot / THD",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "name": "Home Depot / THD",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Supply Chain (Remote)",
    "name": "Home Depot / THD",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analysts- Capital Markets Team",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analysts- Capital Markets Team",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analysts- Capital Markets Team",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Legal Project Management Data Analyst",
    "name": "Ogletree Deakins",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Legal Project Management Data Analyst",
    "name": "Ogletree Deakins",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Legal Project Management Data Analyst",
    "name": "Ogletree Deakins",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Legal Project Management Data Analyst",
    "name": "Ogletree Deakins",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Legal Project Management Data Analyst",
    "name": "Ogletree Deakins",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Data Analyst II",
    "name": "BlueLabs Analytics, Inc.",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Data Analyst II",
    "name": "BlueLabs Analytics, Inc.",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Data Analyst II",
    "name": "BlueLabs Analytics, Inc.",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Data Analyst II",
    "name": "BlueLabs Analytics, Inc.",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "github"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "smartsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EPIC Brokers",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "name": "GEICO",
    "job_country": "United States",
    "salary_year_avg": "113500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "name": "GEICO",
    "job_country": "United States",
    "salary_year_avg": "113500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "name": "GEICO",
    "job_country": "United States",
    "salary_year_avg": "113500.0",
    "skills": "db2"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "name": "GEICO",
    "job_country": "United States",
    "salary_year_avg": "113500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "name": "GEICO",
    "job_country": "United States",
    "salary_year_avg": "113500.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "name": "GEICO",
    "job_country": "United States",
    "salary_year_avg": "113500.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "name": "GEICO",
    "job_country": "United States",
    "salary_year_avg": "113500.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical Business/Data Analyst (REMOTE)",
    "name": "GEICO",
    "job_country": "United States",
    "salary_year_avg": "113500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "73000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "73000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "73000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "73000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "73000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "73000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "73000.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Mortgage Enforcement Unit, Remote Opportunity",
    "name": "New York State Office of the Attorney General",
    "job_country": "United States",
    "salary_year_avg": "81047.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Mortgage Enforcement Unit, Remote Opportunity",
    "name": "New York State Office of the Attorney General",
    "job_country": "United States",
    "salary_year_avg": "81047.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Predictive Data Lab",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Predictive Data Lab",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Informatics Data Analyst II",
    "name": "IDR, Inc.",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Informatics Data Analyst II",
    "name": "IDR, Inc.",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Informatics Data Analyst II",
    "name": "IDR, Inc.",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "In Technology Group Inc (US)",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "In Technology Group Inc (US)",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "In Technology Group Inc (US)",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "In Technology Group Inc (US)",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "In Technology Group Inc (US)",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "In Technology Group Inc (US)",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "100% REMOTE Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "100% REMOTE Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "100% REMOTE Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "100% REMOTE Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "100% REMOTE Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "numpy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "100% REMOTE Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "plotly"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "100% REMOTE Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "seaborn"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "100% REMOTE Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mobile Data Analyst",
    "name": "Verizon",
    "job_country": "United States",
    "salary_year_avg": "89500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Every Body Texas",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Every Body Texas",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Every Body Texas",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Every Body Texas",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Every Body Texas",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Empowering Insights for a Healthier Future",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Empowering Insights for a Healthier Future",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior System/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior System/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior System/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior System/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior System/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior System/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Ad Tech and Google Ad Manager Experience (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Ad Tech and Google Ad Manager Experience (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Ad Tech and Google Ad Manager Experience (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Ad Tech and Google Ad Manager Experience (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Ad Tech and Google Ad Manager Experience (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Ad Tech and Google Ad Manager Experience (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Ad Tech and Google Ad Manager Experience (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Ad Tech and Google Ad Manager Experience (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst & Dashboard Developer",
    "name": "Impact Genome",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst & Dashboard Developer",
    "name": "Impact Genome",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "terminal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "117000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "117000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "117000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "117000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Category Management & Demand Planning",
    "name": "MaryRuth's",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Category Management & Demand Planning",
    "name": "MaryRuth's",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sap"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Category Management & Demand Planning",
    "name": "MaryRuth's",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "arch"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pharmacy Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "71000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "71000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "71000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Goldbelt, Inc.",
    "job_country": "United States",
    "salary_year_avg": "98750.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Goldbelt, Inc.",
    "job_country": "United States",
    "salary_year_avg": "98750.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Goldbelt, Inc.",
    "job_country": "United States",
    "salary_year_avg": "98750.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Contract/Data Analyst",
    "name": "Kermit",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experienced Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "86500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "86500.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Delivery Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Delivery Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Delivery Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Business/Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "72000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Business/Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "72000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics and Reporting Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics and Reporting Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics and Reporting Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics and Reporting Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics and Reporting Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Risk Adjustment Data Analytics Lead",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "95150.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Risk Adjustment Data Analytics Lead",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "95150.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Risk Adjustment Data Analytics Lead",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "95150.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Risk Adjustment Data Analytics Lead",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "95150.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Epic Chronicles Database Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Call Center",
    "name": "Suncoast Credit Union",
    "job_country": "United States",
    "salary_year_avg": "59500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Call Center",
    "name": "Suncoast Credit Union",
    "job_country": "United States",
    "salary_year_avg": "59500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Call Center",
    "name": "Suncoast Credit Union",
    "job_country": "United States",
    "salary_year_avg": "59500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Analyst (all genders) - Remote",
    "name": "OUTFITTERY",
    "job_country": "Germany",
    "salary_year_avg": "92000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Analyst (all genders) - Remote",
    "name": "OUTFITTERY",
    "job_country": "Germany",
    "salary_year_avg": "92000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Analyst (all genders) - Remote",
    "name": "OUTFITTERY",
    "job_country": "Germany",
    "salary_year_avg": "92000.0",
    "skills": "pascal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Analyst (all genders) - Remote",
    "name": "OUTFITTERY",
    "job_country": "Germany",
    "salary_year_avg": "92000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "WhiteCrow",
    "job_country": "Namibia",
    "salary_year_avg": "137000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "WhiteCrow",
    "job_country": "Namibia",
    "salary_year_avg": "137000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst",
    "name": "SHI International Corp.",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "visual basic"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst",
    "name": "SHI International Corp.",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst",
    "name": "SHI International Corp.",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst",
    "name": "SHI International Corp.",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst",
    "name": "SHI International Corp.",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "git"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insight Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insight Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insight Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Intern",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "104000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Treasury Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "87000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Information Protection Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Information Protection Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Information Protection Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77000.0",
    "skills": "powershell"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Information Protection Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Information Protection Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Information Protection Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Information Protection Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Information Protection Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77000.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "AI-focused Data Analyst/Tableau Developer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "AI-focused Data Analyst/Tableau Developer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "AI-focused Data Analyst/Tableau Developer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "AI-focused Data Analyst/Tableau Developer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst with PowerBI expertise",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst with PowerBI expertise",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst with PowerBI expertise",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Acosta, Inc.",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "windows"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Acosta, Inc.",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Acosta, Inc.",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Acosta, Inc.",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Acosta, Inc.",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Plexus Resource Solutions",
    "job_country": "United Kingdom",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Plexus Resource Solutions",
    "job_country": "United Kingdom",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Plexus Resource Solutions",
    "job_country": "United Kingdom",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "United Site Services",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Community Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Community Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "planner"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Retail Systems Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Retail Systems Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Retail Systems Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Retail Systems Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Retail Systems Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "103500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pricing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pricing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "sap"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Asset Verification Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Looker Studio Expert",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Looker Studio Expert",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "arch"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technical/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "bash"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "powershell"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Earth Observation Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "99500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Asset Verification Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Dice",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Dice",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Dice",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Dice",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sap"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EUCON AMERICAS LLC",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EUCON AMERICAS LLC",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EUCON AMERICAS LLC",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EUCON AMERICAS LLC",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EUCON AMERICAS LLC",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EUCON AMERICAS LLC",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "PPM Data Analyst - Remote",
    "name": "Mint Mobile",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "express"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "PPM Data Analyst - Remote",
    "name": "Mint Mobile",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "PPM Data Analyst - Remote",
    "name": "Mint Mobile",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "PPM Data Analyst - Remote",
    "name": "Mint Mobile",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "atlassian"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "PPM Data Analyst - Remote",
    "name": "Mint Mobile",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "chef"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "sqlite"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Remote / Telecommute Jobs",
    "name": "Paratus Solutions LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Statistical Data Analyst (Buyer Engagement Strategist)",
    "name": "University of South Florida",
    "job_country": "United States",
    "salary_year_avg": "53000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Statistical Data Analyst (Buyer Engagement Strategist)",
    "name": "University of South Florida",
    "job_country": "United States",
    "salary_year_avg": "53000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Statistical Data Analyst (Buyer Engagement Strategist)",
    "name": "University of South Florida",
    "job_country": "United States",
    "salary_year_avg": "53000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Statistical Data Analyst (Buyer Engagement Strategist)",
    "name": "University of South Florida",
    "job_country": "United States",
    "salary_year_avg": "53000.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "ms access"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Internal Audit Data Analyst",
    "name": "Aegon",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Internal Audit Data Analyst",
    "name": "Aegon",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Internal Audit Data Analyst",
    "name": "Aegon",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Internal Audit Data Analyst",
    "name": "Aegon",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Internal Audit Data Analyst",
    "name": "Aegon",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Ohio Shared Information Services Inc",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Ohio Shared Information Services Inc",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Ohio Shared Information Services Inc",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "crystal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Ohio Shared Information Services Inc",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Ohio Shared Information Services Inc",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Ohio Shared Information Services Inc",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Ohio Shared Information Services Inc",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "git"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Ohio Shared Information Services Inc",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Energy Data Analyst",
    "name": "DNV",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Data Analyst",
    "name": "Syrup",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Data Analyst",
    "name": "Syrup",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Data Analyst",
    "name": "Syrup",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Data Analyst",
    "name": "Syrup",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Data Analyst",
    "name": "Syrup",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Data Analyst",
    "name": "Syrup",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Data Analyst",
    "name": "Syrup",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Environmental Data Analyst",
    "name": "JARBO Employment Group",
    "job_country": "United States",
    "salary_year_avg": "55000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Environmental Data Analyst",
    "name": "JARBO Employment Group",
    "job_country": "United States",
    "salary_year_avg": "55000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "name": "Starbridge Partners",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "name": "Starbridge Partners",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "name": "Starbridge Partners",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "name": "Starbridge Partners",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "name": "Starbridge Partners",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gravy Analytics",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gravy Analytics",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gravy Analytics",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gravy Analytics",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gravy Analytics",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gravy Analytics",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gravy Analytics",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gravy Analytics",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Financial and Data Analyst",
    "name": "Oxfam America",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Financial and Data Analyst",
    "name": "Oxfam America",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Financial and Data Analyst",
    "name": "Oxfam America",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Financial and Data Analyst",
    "name": "Oxfam America",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Financial and Data Analyst",
    "name": "Oxfam America",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Financial and Data Analyst",
    "name": "Oxfam America",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Financial and Data Analyst",
    "name": "Oxfam America",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Financial and Data Analyst",
    "name": "Oxfam America",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "planner"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Jr. Data Analyst",
    "name": "Chicken of the Sea",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Jr. Data Analyst",
    "name": "Chicken of the Sea",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Jr. Data Analyst",
    "name": "Chicken of the Sea",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "scala"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "postgresql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "couchbase"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "watson"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "pyspark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "airflow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "linux"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "cognos"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior - Data Analyst",
    "name": "DIRECTV",
    "job_country": "United States",
    "salary_year_avg": "160515.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "name": "Kelly Science, Engineering, Technology & Telecom",
    "job_country": "Sudan",
    "salary_year_avg": "170000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "name": "Kelly Science, Engineering, Technology & Telecom",
    "job_country": "Sudan",
    "salary_year_avg": "170000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "name": "Kelly Science, Engineering, Technology & Telecom",
    "job_country": "Sudan",
    "salary_year_avg": "170000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "name": "Kelly Science, Engineering, Technology & Telecom",
    "job_country": "Sudan",
    "salary_year_avg": "170000.0",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "name": "Kelly Science, Engineering, Technology & Telecom",
    "job_country": "Sudan",
    "salary_year_avg": "170000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst [70649]",
    "name": "0nward Select",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst [70649]",
    "name": "0nward Select",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst [70649]",
    "name": "0nward Select",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "html"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst [70649]",
    "name": "0nward Select",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst [70649]",
    "name": "0nward Select",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst [70649]",
    "name": "0nward Select",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "atlassian"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst [70649]",
    "name": "0nward Select",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst [70649]",
    "name": "0nward Select",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Acorns",
    "job_country": "United States",
    "salary_year_avg": "127000.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobmatchingpartner Ltd",
    "job_country": "Malta",
    "salary_year_avg": "35000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobmatchingpartner Ltd",
    "job_country": "Malta",
    "salary_year_avg": "35000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobmatchingpartner Ltd",
    "job_country": "Malta",
    "salary_year_avg": "35000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobmatchingpartner Ltd",
    "job_country": "Malta",
    "salary_year_avg": "35000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobmatchingpartner Ltd",
    "job_country": "Malta",
    "salary_year_avg": "35000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobmatchingpartner Ltd",
    "job_country": "Malta",
    "salary_year_avg": "35000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Product Data Analyst)",
    "name": "Revolut",
    "job_country": "Sudan",
    "salary_year_avg": "139000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Product Data Analyst)",
    "name": "Revolut",
    "job_country": "Sudan",
    "salary_year_avg": "139000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Product Data Analyst)",
    "name": "Revolut",
    "job_country": "Sudan",
    "salary_year_avg": "139000.0",
    "skills": "scala"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Product Data Analyst)",
    "name": "Revolut",
    "job_country": "Sudan",
    "salary_year_avg": "139000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Product Data Analyst)",
    "name": "Revolut",
    "job_country": "Sudan",
    "salary_year_avg": "139000.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "JDC",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Architect",
    "name": "Motion Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Architect",
    "name": "Motion Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "120000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Architect",
    "name": "Motion Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "120000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Architect",
    "name": "Motion Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "120000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Architect",
    "name": "Motion Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "120000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Architect",
    "name": "Motion Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "120000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Architect",
    "name": "Motion Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "120000.0",
    "skills": "gcp"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Architect",
    "name": "Motion Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Comp Data Analyst (Remote, U.S.)",
    "name": "Pitney Bowes",
    "job_country": "United States",
    "salary_year_avg": "104300.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Comp Data Analyst (Remote, U.S.)",
    "name": "Pitney Bowes",
    "job_country": "United States",
    "salary_year_avg": "104300.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Comp Data Analyst (Remote, U.S.)",
    "name": "Pitney Bowes",
    "job_country": "United States",
    "salary_year_avg": "104300.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Comp Data Analyst (Remote, U.S.)",
    "name": "Pitney Bowes",
    "job_country": "United States",
    "salary_year_avg": "104300.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "BI Data Analyst IV",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "BI Data Analyst IV",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "BI Data Analyst IV",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "BI Data Analyst IV",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - DHS Clearance Required Remote / Telecommute Jobs",
    "name": "Redwood Strategy Group",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "github"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "smartsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Vatica Health",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Vatica Health",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Vatica Health",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Vatica Health",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Vatica Health",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Management & Program Analyst (Data Analytics)",
    "name": "US Patent and Trademark Office",
    "job_country": "United States",
    "salary_year_avg": "152221.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Management & Program Analyst (Data Analytics)",
    "name": "US Patent and Trademark Office",
    "job_country": "United States",
    "salary_year_avg": "152221.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Management & Program Analyst (Data Analytics)",
    "name": "US Patent and Trademark Office",
    "job_country": "United States",
    "salary_year_avg": "152221.5",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Management & Program Analyst (Data Analytics)",
    "name": "US Patent and Trademark Office",
    "job_country": "United States",
    "salary_year_avg": "152221.5",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Management & Program Analyst (Data Analytics)",
    "name": "US Patent and Trademark Office",
    "job_country": "United States",
    "salary_year_avg": "152221.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Management & Program Analyst (Data Analytics)",
    "name": "US Patent and Trademark Office",
    "job_country": "United States",
    "salary_year_avg": "152221.5",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "numpy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "scikit-learn"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Cherry Bekaert Advisory, LLC",
    "job_country": "United States",
    "salary_year_avg": "106562.5",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Manager",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "140000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Scaleai",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Scaleai",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Scaleai",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Medicaid Data Analyst",
    "name": "Apex Systems",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "79968.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "79968.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "79968.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "79968.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "79968.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "79968.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "79968.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Jr. Marketing Data Analyst- Ecommerce",
    "name": "Aquent Studios",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Jr. Marketing Data Analyst- Ecommerce",
    "name": "Aquent Studios",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Jr. Marketing Data Analyst- Ecommerce",
    "name": "Aquent Studios",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data & Analytics Analyst - Virtual, USA",
    "name": "Diversified",
    "job_country": "United States",
    "salary_year_avg": "69500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data & Analytics Analyst - Virtual, USA",
    "name": "Diversified",
    "job_country": "United States",
    "salary_year_avg": "69500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data & Analytics Analyst - Virtual, USA",
    "name": "Diversified",
    "job_country": "United States",
    "salary_year_avg": "69500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobot",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobot",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobot",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "microstrategy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "name": "AT&T",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Claims Data Analyst - 208554",
    "name": "Medix Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Claims Data Analyst - 208554",
    "name": "Medix Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Claims Data Analyst - 208554",
    "name": "Medix Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Claims Data Analyst - 208554",
    "name": "Medix Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (QA)",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95680.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "matlab"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist Analyst",
    "name": "ALTA IT Services",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist Analyst",
    "name": "ALTA IT Services",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist Analyst",
    "name": "ALTA IT Services",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist Analyst",
    "name": "ALTA IT Services",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist Analyst",
    "name": "ALTA IT Services",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist Analyst",
    "name": "ALTA IT Services",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist Analyst",
    "name": "ALTA IT Services",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist Analyst",
    "name": "ALTA IT Services",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114805.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114805.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114805.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114805.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114805.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114805.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114805.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Business Analyst/Data Analyst",
    "name": "CBRE",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Business Analyst/Data Analyst",
    "name": "CBRE",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Business Analyst/Data Analyst",
    "name": "CBRE",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "IBM",
    "job_country": "United States",
    "salary_year_avg": "111500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "IBM",
    "job_country": "United States",
    "salary_year_avg": "111500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "IBM",
    "job_country": "United States",
    "salary_year_avg": "111500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "IBM",
    "job_country": "United States",
    "salary_year_avg": "111500.0",
    "skills": "ibm cloud"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "IBM",
    "job_country": "United States",
    "salary_year_avg": "111500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "IBM",
    "job_country": "United States",
    "salary_year_avg": "111500.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Data Analyst",
    "name": "LAI",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Data Analyst",
    "name": "LAI",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Data Analyst",
    "name": "LAI",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Data Analyst",
    "name": "LAI",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Data Analyst",
    "name": "LAI",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Data Analyst",
    "name": "LAI",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "kubernetes"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Data Analyst",
    "name": "LAI",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Intelligence Data Analyst",
    "name": "LAI",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Risk Data Analyst",
    "name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "job_country": "United States",
    "salary_year_avg": "119908.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Risk Data Analyst",
    "name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "job_country": "United States",
    "salary_year_avg": "119908.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Risk Data Analyst",
    "name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "job_country": "United States",
    "salary_year_avg": "119908.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Risk Data Analyst",
    "name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "job_country": "United States",
    "salary_year_avg": "119908.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Health Choice Network",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Health Choice Network",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Health Choice Network",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Convergenz",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Convergenz",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Convergenz",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Convergenz",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Convergenz",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Convergenz",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Investment Management",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Investment Management",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Investment Management",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Investment Management",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Investment Management",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Investment Management",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Medicare Compliance Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "73631.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Medicare Compliance Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "73631.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Medicare Compliance Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "73631.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Medicare Compliance Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "73631.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst (Entry to Mid Level)",
    "name": "Allied Technologies & Consulting",
    "job_country": "United States",
    "salary_year_avg": "48500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "numpy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "skills": "gitlab"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "QNXT/TriZetto Data Analyst",
    "name": "Medasource",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "QNXT/TriZetto Data Analyst",
    "name": "Medasource",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "QNXT/TriZetto Data Analyst",
    "name": "Medasource",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "QNXT/TriZetto Data Analyst",
    "name": "Medasource",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Quality Data Analyst",
    "name": "Insight Global Healthcare",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Quality Data Analyst",
    "name": "Insight Global Healthcare",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Quality Data Analyst",
    "name": "Insight Global Healthcare",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Quality Data Analyst",
    "name": "Insight Global Healthcare",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "87500.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "87500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "87500.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bluesight",
    "job_country": "Sudan",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bluesight",
    "job_country": "Sudan",
    "salary_year_avg": "72500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bluesight",
    "job_country": "Sudan",
    "salary_year_avg": "72500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bluesight",
    "job_country": "Sudan",
    "salary_year_avg": "72500.0",
    "skills": "ruby"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bluesight",
    "job_country": "Sudan",
    "salary_year_avg": "72500.0",
    "skills": "ruby"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bluesight",
    "job_country": "Sudan",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bluesight",
    "job_country": "Sudan",
    "salary_year_avg": "72500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "job_country": "United States",
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "job_country": "United States",
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "job_country": "United States",
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "job_country": "United States",
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "name": "Pinterest Job Advertisements",
    "job_country": "United States",
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst - Remote",
    "name": "UnitedHealthcare",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst - Remote",
    "name": "UnitedHealthcare",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst - Remote",
    "name": "UnitedHealthcare",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst - Remote",
    "name": "UnitedHealthcare",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pricing Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Pricing Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sap"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "112661.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "112661.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "112661.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Tableau Data Analyst",
    "name": "SAIC",
    "job_country": "United States",
    "salary_year_avg": "100000.5",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Marketing",
    "job_country": "United States",
    "salary_year_avg": "75566.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Marketing",
    "job_country": "United States",
    "salary_year_avg": "75566.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Marketing",
    "job_country": "United States",
    "salary_year_avg": "75566.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Marketing",
    "job_country": "United States",
    "salary_year_avg": "75566.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Information Management Data Analyst III",
    "name": "Health Plan of San Mateo",
    "job_country": "United States",
    "salary_year_avg": "104106.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Information Management Data Analyst III",
    "name": "Health Plan of San Mateo",
    "job_country": "United States",
    "salary_year_avg": "104106.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Information Management Data Analyst III",
    "name": "Health Plan of San Mateo",
    "job_country": "United States",
    "salary_year_avg": "104106.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Information Management Data Analyst III",
    "name": "Health Plan of San Mateo",
    "job_country": "United States",
    "salary_year_avg": "104106.5",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Information Management Data Analyst III",
    "name": "Health Plan of San Mateo",
    "job_country": "United States",
    "salary_year_avg": "104106.5",
    "skills": "spreadsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Information Management Data Analyst III",
    "name": "Health Plan of San Mateo",
    "job_country": "United States",
    "salary_year_avg": "104106.5",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Information Management Data Analyst III",
    "name": "Health Plan of San Mateo",
    "job_country": "United States",
    "salary_year_avg": "104106.5",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Cava Connect",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Cava Connect",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Cava Connect",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Cava Connect",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Cava Connect",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Cava Connect",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Cava Connect",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "Cava Connect",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "New World Now LLC",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Amplified Sourcing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Amplified Sourcing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Amplified Sourcing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Amplified Sourcing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Amplified Sourcing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "LHH",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "LHH",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "LHH",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "LHH",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "LHH",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sap"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Budget Data Analyst (Power BI/Excel/VBA expert)",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Budget Data Analyst (Power BI/Excel/VBA expert)",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Budget Data Analyst (Power BI/Excel/VBA expert)",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Budget Data Analyst (Power BI/Excel/VBA expert)",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Budget Data Analyst (Power BI/Excel/VBA expert)",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Budget Data Analyst (Power BI/Excel/VBA expert)",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst I",
    "name": "Aflac, Incorporated",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst I",
    "name": "Aflac, Incorporated",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst I",
    "name": "Aflac, Incorporated",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst I",
    "name": "Aflac, Incorporated",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst I",
    "name": "Aflac, Incorporated",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst I",
    "name": "Aflac, Incorporated",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Adaptive Solutions Group",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Adaptive Solutions Group",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Adaptive Solutions Group",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Adaptive Solutions Group",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst & Dashboard Developer",
    "name": "Impact Genome",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst & Dashboard Developer",
    "name": "Impact Genome",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "terminal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Ali Awad Law, P.C.",
    "job_country": "United States",
    "salary_year_avg": "47500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Ali Awad Law, P.C.",
    "job_country": "United States",
    "salary_year_avg": "47500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Mid",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95650.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Mid",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95650.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Mid",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95650.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Mid",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95650.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst",
    "name": "Alpha Silicon",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst",
    "name": "Alpha Silicon",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst",
    "name": "Alpha Silicon",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst",
    "name": "Alpha Silicon",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "110000.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "110000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "110000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "110000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "110000.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "110000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "65000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "65000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "unix"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "windows"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Integration Analyst",
    "name": "AIDS Healthcare Foundation",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Governance Analyst II - Frameworks, Standards, & Policies",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Governance Analyst II - Frameworks, Standards, & Policies",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Governance Analyst II - Frameworks, Standards, & Policies",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Governance Analyst II - Frameworks, Standards, & Policies",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "name": "SmartAsset",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote - Data Analyst - Permanent - W2",
    "name": "Apex Systems",
    "job_country": "United States",
    "salary_year_avg": "79000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote - Data Analyst - Permanent - W2",
    "name": "Apex Systems",
    "job_country": "United States",
    "salary_year_avg": "79000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote - Data Analyst - Permanent - W2",
    "name": "Apex Systems",
    "job_country": "United States",
    "salary_year_avg": "79000.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote - Data Analyst - Permanent - W2",
    "name": "Apex Systems",
    "job_country": "United States",
    "salary_year_avg": "79000.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst I - Healthcare Analytics",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "50000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst I - Healthcare Analytics",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "50000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Media Data Analyst/Media Coordinator",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Media Data Analyst/Media Coordinator",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Media Data Analyst/Media Coordinator",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III (REMOTE)",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III (REMOTE)",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "95000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III (REMOTE)",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "95000.0",
    "skills": "express"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III (REMOTE)",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III (REMOTE)",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III (REMOTE)",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "95000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "123000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "123000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "123000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "123000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Scientist (Remote)",
    "name": "Center for Open Science",
    "job_country": "United States",
    "salary_year_avg": "73000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "117713.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "117713.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "117713.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "117713.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "117713.0",
    "skills": "ms access"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Atmospheric Scientist/Data Analyst",
    "name": "BLUE STORM ASSOCIATES INC",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Atmospheric Scientist/Data Analyst",
    "name": "BLUE STORM ASSOCIATES INC",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "matlab"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst",
    "name": "Citron IT, Inc.",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst",
    "name": "Citron IT, Inc.",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst",
    "name": "Citron IT, Inc.",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst",
    "name": "Citron IT, Inc.",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst",
    "name": "Citron IT, Inc.",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst",
    "name": "Citron IT, Inc.",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Analyst - Remote",
    "name": "Teacher Retirement System of Texas",
    "job_country": "United States",
    "salary_year_avg": "75296.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Analyst - Remote",
    "name": "Teacher Retirement System of Texas",
    "job_country": "United States",
    "salary_year_avg": "75296.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Analyst - Remote",
    "name": "Teacher Retirement System of Texas",
    "job_country": "United States",
    "salary_year_avg": "75296.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "151500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "151500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "151500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "matplotlib"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "cognos"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Visual Connections, LLC",
    "job_country": "United States",
    "salary_year_avg": "78000.0",
    "skills": "webex"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst- Hybrid",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst- Hybrid",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst- Hybrid",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Payroll Operations",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "name": "United Services Automobile Association",
    "job_country": "United States",
    "salary_year_avg": "138640.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "name": "United Services Automobile Association",
    "job_country": "United States",
    "salary_year_avg": "138640.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "name": "United Services Automobile Association",
    "job_country": "United States",
    "salary_year_avg": "138640.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "name": "United Services Automobile Association",
    "job_country": "United States",
    "salary_year_avg": "138640.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "name": "United Services Automobile Association",
    "job_country": "United States",
    "salary_year_avg": "138640.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "name": "United Services Automobile Association",
    "job_country": "United States",
    "salary_year_avg": "138640.0",
    "skills": "phoenix"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "name": "United Services Automobile Association",
    "job_country": "United States",
    "salary_year_avg": "138640.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Analyst - Hybrid",
    "name": "Teacher Retirement System of Texas",
    "job_country": "United States",
    "salary_year_avg": "79060.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Analyst - Hybrid",
    "name": "Teacher Retirement System of Texas",
    "job_country": "United States",
    "salary_year_avg": "79060.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Analyst - Hybrid",
    "name": "Teacher Retirement System of Texas",
    "job_country": "United States",
    "salary_year_avg": "79060.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst - Python/SQL/PowerBI/Tableau",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst - Python/SQL/PowerBI/Tableau",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst - Python/SQL/PowerBI/Tableau",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst - Python/SQL/PowerBI/Tableau",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst - Python/SQL/PowerBI/Tableau",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst - Python/SQL/PowerBI/Tableau",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst - Python/SQL/PowerBI/Tableau",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst - Python/SQL/PowerBI/Tableau",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data BI Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst - Healthcare",
    "name": "Village Care",
    "job_country": "United States",
    "salary_year_avg": "82350.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst - Healthcare",
    "name": "Village Care",
    "job_country": "United States",
    "salary_year_avg": "82350.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst - Healthcare",
    "name": "Village Care",
    "job_country": "United States",
    "salary_year_avg": "82350.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst - Healthcare",
    "name": "Village Care",
    "job_country": "United States",
    "salary_year_avg": "82350.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL Data Analyst - Healthcare",
    "name": "Village Care",
    "job_country": "United States",
    "salary_year_avg": "82350.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "ServiceTitan",
    "job_country": "United States",
    "salary_year_avg": "75500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "ServiceTitan",
    "job_country": "United States",
    "salary_year_avg": "75500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "ServiceTitan",
    "job_country": "United States",
    "salary_year_avg": "75500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "ServiceTitan",
    "job_country": "United States",
    "salary_year_avg": "75500.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "ServiceTitan",
    "job_country": "United States",
    "salary_year_avg": "75500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "ServiceTitan",
    "job_country": "United States",
    "salary_year_avg": "75500.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "swift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Specialist (Data Analytics) (Remote)",
    "name": "NBCUniversal",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Specialist (Data Analytics) (Remote)",
    "name": "NBCUniversal",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Specialist (Data Analytics) (Remote)",
    "name": "NBCUniversal",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Specialist (Data Analytics) (Remote)",
    "name": "NBCUniversal",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Product Specialist (Data Analytics) (Remote)",
    "name": "NBCUniversal",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Operations (Remote)",
    "name": "hims & hers",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Operations (Remote)",
    "name": "hims & hers",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Operations (Remote)",
    "name": "hims & hers",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Operations (Remote)",
    "name": "hims & hers",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "bash"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Operations (Remote)",
    "name": "hims & hers",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "postgresql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Operations (Remote)",
    "name": "hims & hers",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Operations (Remote)",
    "name": "hims & hers",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "airflow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Operations (Remote)",
    "name": "hims & hers",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "76000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "76000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level)",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data BI Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "167000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "167000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "167000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "167000.0",
    "skills": "swift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "167000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "167000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analyst",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "167000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Global Business Development",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "114000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Global Business Development",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "114000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Global Business Development",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "114000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Global Business Development",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "114000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Global Business Development",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "114000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "46500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "46500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "46500.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "46500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "46500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "46500.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Entry Level) - US/Canada",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "Cash App",
    "job_country": "United States",
    "salary_year_avg": "127000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "Cash App",
    "job_country": "United States",
    "salary_year_avg": "127000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "Cash App",
    "job_country": "United States",
    "salary_year_avg": "127000.0",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst (Remote)",
    "name": "Cash App",
    "job_country": "United States",
    "salary_year_avg": "127000.0",
    "skills": "twilio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "People Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "People Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "People Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "140500.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Prime Team Partners",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Prime Team Partners",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Prime Team Partners",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Prime Team Partners",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Prime Team Partners",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "bash"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "gcp"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "jenkins"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "github"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Orion Groups",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "sap"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "jenkins"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "bitbucket"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "atlassian"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "name": "Inclusively",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - New Grad - Remote",
    "name": "SeatGeek",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - New Grad - Remote",
    "name": "SeatGeek",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - New Grad - Remote",
    "name": "SeatGeek",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "spring"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - New Grad - Remote",
    "name": "SeatGeek",
    "job_country": "United States",
    "salary_year_avg": "87500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76783.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "84950.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "84950.0",
    "skills": "db2"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "84950.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "84950.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Class Action Capital Recovery LLC",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Class Action Capital Recovery LLC",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "skills": "git"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "skills": "bitbucket"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "skills": "atlassian"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "name": "Motional",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Telecom Data Analyst",
    "name": "Axelerate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "job_country": "United States",
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "job_country": "United States",
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "job_country": "United States",
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "job_country": "United States",
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "name": "Uclahealthcareers",
    "job_country": "United States",
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Power BI (Remote)",
    "name": "HighGround",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Power BI (Remote)",
    "name": "HighGround",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Power BI (Remote)",
    "name": "HighGround",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Power BI (Remote)",
    "name": "HighGround",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "spreadsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Kforce Technology Staffing",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Kforce Technology Staffing",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Kforce Technology Staffing",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Kforce Technology Staffing",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Kforce Technology Staffing",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Kforce Technology Staffing",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Kforce Technology Staffing",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Kforce Technology Staffing",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "Itemize Corp.",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "Itemize Corp.",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "Itemize Corp.",
    "job_country": "Sudan",
    "salary_year_avg": "80000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobot",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobot",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Jobot",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "LHH",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "LHH",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "LHH",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Contact Center Data Analyst",
    "name": "CharterUP",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "erlang"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Contact Center Data Analyst",
    "name": "CharterUP",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "express"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Contact Center Data Analyst",
    "name": "CharterUP",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Contact Center Data Analyst",
    "name": "CharterUP",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Contact Center Data Analyst",
    "name": "CharterUP",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Contact Center Data Analyst",
    "name": "CharterUP",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data analyst remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data analyst remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data analyst remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data analyst remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data analyst remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data analyst remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "name": "M13",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Privacy Data Analyst- (remote)",
    "name": "Cognizant Technology Solutions",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Privacy Data Analyst- (remote)",
    "name": "Cognizant Technology Solutions",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst & Dashboard Developer",
    "name": "Impact Genome",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst & Dashboard Developer",
    "name": "Impact Genome",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "terminal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Underwriting",
    "name": "Automobile Club of Southern California",
    "job_country": "United States",
    "salary_year_avg": "80250.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Underwriting",
    "name": "Automobile Club of Southern California",
    "job_country": "United States",
    "salary_year_avg": "80250.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Underwriting",
    "name": "Automobile Club of Southern California",
    "job_country": "United States",
    "salary_year_avg": "80250.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Underwriting",
    "name": "Automobile Club of Southern California",
    "job_country": "United States",
    "salary_year_avg": "80250.0",
    "skills": "bash"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Underwriting",
    "name": "Automobile Club of Southern California",
    "job_country": "United States",
    "salary_year_avg": "80250.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Underwriting",
    "name": "Automobile Club of Southern California",
    "job_country": "United States",
    "salary_year_avg": "80250.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "59000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "59000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "59000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "Guam",
    "salary_year_avg": "59000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Data Analyst",
    "name": "Patterned Learning AI",
    "job_country": "United States",
    "salary_year_avg": "150000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Cisco Meraki",
    "job_country": "United States",
    "salary_year_avg": "112050.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Cisco Meraki",
    "job_country": "United States",
    "salary_year_avg": "112050.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Cisco Meraki",
    "job_country": "United States",
    "salary_year_avg": "112050.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Cisco Meraki",
    "job_country": "United States",
    "salary_year_avg": "112050.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Cisco Meraki",
    "job_country": "United States",
    "salary_year_avg": "112050.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Cisco Meraki",
    "job_country": "United States",
    "salary_year_avg": "112050.0",
    "skills": "sap"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Applied Scientist - Maps",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "157500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Applied Scientist - Maps",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "157500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Applied Scientist - Maps",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "157500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Applied Scientist - Maps",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "157500.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Master Data Analyst (Remote or Onsite)",
    "name": "Driscoll's",
    "job_country": "United States",
    "salary_year_avg": "97000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Master Data Analyst (Remote or Onsite)",
    "name": "Driscoll's",
    "job_country": "United States",
    "salary_year_avg": "97000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst, Growth (Remote)",
    "name": "Rocket Money",
    "job_country": "United States",
    "salary_year_avg": "152500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst, Growth (Remote)",
    "name": "Rocket Money",
    "job_country": "United States",
    "salary_year_avg": "152500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "name": "Zscaler",
    "job_country": "United States",
    "salary_year_avg": "152625.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analysis & Reporting Specialist",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "50500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analysis & Reporting Specialist",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "50500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - SaaS - EdTech",
    "name": "KodeKloud",
    "job_country": "Singapore",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - SaaS - EdTech",
    "name": "KodeKloud",
    "job_country": "Singapore",
    "salary_year_avg": "75000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - SaaS - EdTech",
    "name": "KodeKloud",
    "job_country": "Singapore",
    "salary_year_avg": "75000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - SaaS - EdTech",
    "name": "KodeKloud",
    "job_country": "Singapore",
    "salary_year_avg": "75000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager - Data Analyst",
    "name": "EXL Service",
    "job_country": "United States",
    "salary_year_avg": "147285.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "Sudan",
    "salary_year_avg": "67500.0",
    "skills": "colocation"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Statistical Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "93000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Statistical Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "93000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Statistical Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "93000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Statistical Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "93000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst I (REMOTE-USA)",
    "name": "Ambry Genetics Corporation",
    "job_country": "United States",
    "salary_year_avg": "69000.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst I (REMOTE-USA)",
    "name": "Ambry Genetics Corporation",
    "job_country": "United States",
    "salary_year_avg": "69000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst I (REMOTE-USA)",
    "name": "Ambry Genetics Corporation",
    "job_country": "United States",
    "salary_year_avg": "69000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst I (REMOTE-USA)",
    "name": "Ambry Genetics Corporation",
    "job_country": "United States",
    "salary_year_avg": "69000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst-Operations",
    "name": "U.S. Wire and Cable Company/ Flexon Industries",
    "job_country": "United States",
    "salary_year_avg": "42500.0",
    "skills": "windows"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst-Operations",
    "name": "U.S. Wire and Cable Company/ Flexon Industries",
    "job_country": "United States",
    "salary_year_avg": "42500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst-Operations",
    "name": "U.S. Wire and Cable Company/ Flexon Industries",
    "job_country": "United States",
    "salary_year_avg": "42500.0",
    "skills": "wire"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. People Data Analyst",
    "name": "Medidata Solutions",
    "job_country": "United States",
    "salary_year_avg": "92750.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. People Data Analyst",
    "name": "Medidata Solutions",
    "job_country": "United States",
    "salary_year_avg": "92750.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. People Data Analyst",
    "name": "Medidata Solutions",
    "job_country": "United States",
    "salary_year_avg": "92750.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. People Data Analyst",
    "name": "Medidata Solutions",
    "job_country": "United States",
    "salary_year_avg": "92750.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. People Data Analyst",
    "name": "Medidata Solutions",
    "job_country": "United States",
    "salary_year_avg": "92750.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. People Data Analyst",
    "name": "Medidata Solutions",
    "job_country": "United States",
    "salary_year_avg": "92750.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Protect Democracy",
    "job_country": "United States",
    "salary_year_avg": "94871.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Protect Democracy",
    "job_country": "United States",
    "salary_year_avg": "94871.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Preveta",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Preveta",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Preveta",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Preveta",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Preveta",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (US REMOTE)",
    "name": "LeanTaaS",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (US REMOTE)",
    "name": "LeanTaaS",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (US REMOTE)",
    "name": "LeanTaaS",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (US REMOTE)",
    "name": "LeanTaaS",
    "job_country": "United States",
    "salary_year_avg": "92500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - CropSights, a Precision Ag Platform (Remote - Must...",
    "name": "Wilbur-Ellis Company",
    "job_country": "United States",
    "salary_year_avg": "77350.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - CropSights, a Precision Ag Platform (Remote - Must...",
    "name": "Wilbur-Ellis Company",
    "job_country": "United States",
    "salary_year_avg": "77350.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - CropSights, a Precision Ag Platform (Remote - Must...",
    "name": "Wilbur-Ellis Company",
    "job_country": "United States",
    "salary_year_avg": "77350.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - CropSights, a Precision Ag Platform (Remote - Must...",
    "name": "Wilbur-Ellis Company",
    "job_country": "United States",
    "salary_year_avg": "77350.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "CREDITSERVE INC",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "DTCC Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "170000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "DTCC Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "170000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "DTCC Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "170000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - ggplot2, R, SQL, Python- Remote",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - ggplot2, R, SQL, Python- Remote",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - ggplot2, R, SQL, Python- Remote",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - ggplot2, R, SQL, Python- Remote",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "ggplot2"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - ggplot2, R, SQL, Python- Remote",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Customer Success (Chicago, IL or Remote)",
    "name": "Square",
    "job_country": "United States",
    "salary_year_avg": "112850.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Customer Success (Chicago, IL or Remote)",
    "name": "Square",
    "job_country": "United States",
    "salary_year_avg": "112850.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Customer Success (Chicago, IL or Remote)",
    "name": "Square",
    "job_country": "United States",
    "salary_year_avg": "112850.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Customer Success (Chicago, IL or Remote)",
    "name": "Square",
    "job_country": "United States",
    "salary_year_avg": "112850.0",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Customer Success (Chicago, IL or Remote)",
    "name": "Square",
    "job_country": "United States",
    "salary_year_avg": "112850.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Customer Success (Chicago, IL or Remote)",
    "name": "Square",
    "job_country": "United States",
    "salary_year_avg": "112850.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Customer Success (Chicago, IL or Remote)",
    "name": "Square",
    "job_country": "United States",
    "salary_year_avg": "112850.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Ops Data Analyst (Austin, TX or Remote)",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "122000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Ops Data Analyst (Austin, TX or Remote)",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "122000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Ops Data Analyst (Austin, TX or Remote)",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "122000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Ops Data Analyst (Austin, TX or Remote)",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "122000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "United States",
    "salary_year_avg": "59000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "United States",
    "salary_year_avg": "59000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "United States",
    "salary_year_avg": "59000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "United States",
    "salary_year_avg": "59000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "CrowdStrike",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "CrowdStrike",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "CrowdStrike",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "DeepIntent",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "DeepIntent",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "DeepIntent",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "DeepIntent",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Partnership Employment",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Partnership Employment",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Partnership Employment",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "name": "M13",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "name": "M13",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "name": "M13",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "name": "M13",
    "job_country": "United States",
    "salary_year_avg": "120000.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "51000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "51000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "51000.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Angi",
    "job_country": "Colombia",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Angi",
    "job_country": "Colombia",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Angi",
    "job_country": "Colombia",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Angi",
    "job_country": "Colombia",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead I - Power BI Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "138000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead I - Power BI Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "138000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead I - Power BI Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "138000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead I - Power BI Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "138000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead I - Power BI Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "138000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead I - Power BI Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "138000.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research/Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "ms access"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analysis and Production Support Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analysis and Production Support Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "jupyter"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Real Estate Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Real Estate Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Real Estate Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "117500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "matplotlib"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "plotly"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "seaborn"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coda Search│Staffing",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Fraud Data Analyst",
    "name": "Pentasia",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Fraud Data Analyst",
    "name": "Pentasia",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Fraud Data Analyst",
    "name": "Pentasia",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Fraud Data Analyst",
    "name": "Pentasia",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Emotive",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Emotive",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Emotive",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Emotive",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114956.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114956.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114956.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114956.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114956.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114956.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Behavioral Health Data Analyst",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "114956.5",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Real Estate Transaction Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Real Estate Transaction Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Real Estate Transaction Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Real Estate Transaction Data Analyst",
    "name": "Get It Recruit - Real Estate",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Accountant/Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Supply Chain Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "88000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Supply Chain Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "88000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Supply Chain Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "88000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Supply Chain Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "88000.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "CaptivateIQ",
    "job_country": null,
    "salary_year_avg": "155485.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "CaptivateIQ",
    "job_country": null,
    "salary_year_avg": "155485.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "CaptivateIQ",
    "job_country": null,
    "salary_year_avg": "155485.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "CaptivateIQ",
    "job_country": null,
    "salary_year_avg": "155485.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "CaptivateIQ",
    "job_country": null,
    "salary_year_avg": "155485.5",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Remote",
    "name": "CaptivateIQ",
    "job_country": null,
    "salary_year_avg": "155485.5",
    "skills": "datarobot"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Loan Data Analyst",
    "name": "AdelFi",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "spreadsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "html"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "IT Data Analyst - Remote | WFH",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Global Accounting Network",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Global Accounting Network",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Global Accounting Network",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Research Data Programmer Analyst",
    "name": "Vitalief Inc.",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Research Data Programmer Analyst",
    "name": "Vitalief Inc.",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Research Data Programmer Analyst",
    "name": "Vitalief Inc.",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Research Data Programmer Analyst",
    "name": "Vitalief Inc.",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Research Data Programmer Analyst",
    "name": "Vitalief Inc.",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "ms access"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "OZ",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "OZ",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "OZ",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "bash"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "OZ",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "OZ",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "OZ",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst * Work from home",
    "name": "American Red Cross",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst * Work from home",
    "name": "American Red Cross",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst * Work from home",
    "name": "American Red Cross",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst / SQL Developer",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Role",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Role",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Role",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Role",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "powershell"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Role",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "php"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Role",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Role",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "mariadb"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Role",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Report Writer and Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "Puerto Rico",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Report Writer and Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "Puerto Rico",
    "salary_year_avg": "62500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Report Writer and Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "Puerto Rico",
    "salary_year_avg": "62500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Report Writer and Data Analyst- REMOTE",
    "name": "Ryder System",
    "job_country": "Puerto Rico",
    "salary_year_avg": "62500.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Department of Surgery/JRSC (Greater NYC Area, NY or...",
    "name": "Memorial Sloan Kettering Cancer Center",
    "job_country": "United States",
    "salary_year_avg": "75250.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Department of Surgery/JRSC (Greater NYC Area, NY or...",
    "name": "Memorial Sloan Kettering Cancer Center",
    "job_country": "United States",
    "salary_year_avg": "75250.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Department of Surgery/JRSC (Greater NYC Area, NY or...",
    "name": "Memorial Sloan Kettering Cancer Center",
    "job_country": "United States",
    "salary_year_avg": "75250.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Department of Surgery/JRSC (Greater NYC Area, NY or...",
    "name": "Memorial Sloan Kettering Cancer Center",
    "job_country": "United States",
    "salary_year_avg": "75250.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Department of Surgery/JRSC (Greater NYC Area, NY or...",
    "name": "Memorial Sloan Kettering Cancer Center",
    "job_country": "United States",
    "salary_year_avg": "75250.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Ops Data Analyst (Remote)",
    "name": "CloudFlare",
    "job_country": "United States",
    "salary_year_avg": "122000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Ops Data Analyst (Remote)",
    "name": "CloudFlare",
    "job_country": "United States",
    "salary_year_avg": "122000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Ops Data Analyst (Remote)",
    "name": "CloudFlare",
    "job_country": "United States",
    "salary_year_avg": "122000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sales Ops Data Analyst (Remote)",
    "name": "CloudFlare",
    "job_country": "United States",
    "salary_year_avg": "122000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Secret Data Analyst Remote / Telecommute Jobs",
    "name": "Insight Global, Inc.",
    "job_country": "United States",
    "salary_year_avg": "137500.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "CCBHC Data Analyst (Grant Funded Position)",
    "name": "State of Georgia",
    "job_country": "United States",
    "salary_year_avg": "55000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "CCBHC Data Analyst (Grant Funded Position)",
    "name": "State of Georgia",
    "job_country": "United States",
    "salary_year_avg": "55000.0",
    "skills": "html"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "CCBHC Data Analyst (Grant Funded Position)",
    "name": "State of Georgia",
    "job_country": "United States",
    "salary_year_avg": "55000.0",
    "skills": "crystal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "CCBHC Data Analyst (Grant Funded Position)",
    "name": "State of Georgia",
    "job_country": "United States",
    "salary_year_avg": "55000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Jacksonville",
    "job_country": "United States",
    "salary_year_avg": "51059.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Jacksonville",
    "job_country": "United States",
    "salary_year_avg": "51059.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Jacksonville",
    "job_country": "United States",
    "salary_year_avg": "51059.0",
    "skills": "mongodb"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Jacksonville",
    "job_country": "United States",
    "salary_year_avg": "51059.0",
    "skills": "ruby"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Jacksonville",
    "job_country": "United States",
    "salary_year_avg": "51059.0",
    "skills": "mongodb"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Jacksonville",
    "job_country": "United States",
    "salary_year_avg": "51059.0",
    "skills": "ruby"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Jacksonville",
    "job_country": "United States",
    "salary_year_avg": "51059.0",
    "skills": "ruby on rails"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Governance Project Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Governance Project Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76559.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76559.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76559.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76559.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76559.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "80500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "80500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Northeast Territory Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Northeast Territory Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Northeast Territory Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "smartsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "db2"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "microstrategy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "148238.5",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "86500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "86500.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Provider Data Configuration Analyst IV",
    "name": "Central California Alliance for Health (Remote)",
    "job_country": "United States",
    "salary_year_avg": "97070.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst (Manager)- $120,000-130,000/yr | Remote in PST",
    "name": "PWR Staffing & Recruiting",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Sisense",
    "job_country": "United States",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Sisense",
    "job_country": "United States",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Sisense",
    "job_country": "United States",
    "salary_year_avg": "140000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Sisense",
    "job_country": "United States",
    "salary_year_avg": "140000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Stride inc",
    "job_country": "United States",
    "salary_year_avg": "76364.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Stride inc",
    "job_country": "United States",
    "salary_year_avg": "76364.5",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Stride inc",
    "job_country": "United States",
    "salary_year_avg": "76364.5",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Stride inc",
    "job_country": "United States",
    "salary_year_avg": "76364.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Stride inc",
    "job_country": "United States",
    "salary_year_avg": "76364.5",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Stride inc",
    "job_country": "United States",
    "salary_year_avg": "76364.5",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Stride inc",
    "job_country": "United States",
    "salary_year_avg": "76364.5",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Retriever Medial Dental Payments LLC",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Retriever Medial Dental Payments LLC",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Retriever Medial Dental Payments LLC",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Retriever Medial Dental Payments LLC",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Retriever Medial Dental Payments LLC",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Retriever Medial Dental Payments LLC",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Remote)",
    "name": "Retriever Medial Dental Payments LLC",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Engineer/Data Analyst",
    "name": "Segue Technologies Inc",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Engineer/Data Analyst",
    "name": "Segue Technologies Inc",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Engineer/Data Analyst",
    "name": "Segue Technologies Inc",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Engineer/Data Analyst",
    "name": "Segue Technologies Inc",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Engineer/Data Analyst",
    "name": "Segue Technologies Inc",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Accountant/Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Greater LA Area, CA or Remote)",
    "name": "HopSkipDrive",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "Global Healthcare Exchange, Inc.",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "Global Healthcare Exchange, Inc.",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "Global Healthcare Exchange, Inc.",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "Global Healthcare Exchange, Inc.",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "Global Healthcare Exchange, Inc.",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "gitlab"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Support Operations",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "124000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Support Operations",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "124000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Support Operations",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "124000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Support Operations",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "124000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Support Operations",
    "name": "Cloudflare",
    "job_country": "United States",
    "salary_year_avg": "124000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Syndicatebleu",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Syndicatebleu",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Syndicatebleu",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "html"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Syndicatebleu",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Syndicatebleu",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst",
    "name": "Chicken of the Sea",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst",
    "name": "Chicken of the Sea",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Data Analyst",
    "name": "Chicken of the Sea",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Apex Legends)",
    "name": "Respawn Entertainment",
    "job_country": "United States",
    "salary_year_avg": "96400.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Apex Legends)",
    "name": "Respawn Entertainment",
    "job_country": "United States",
    "salary_year_avg": "96400.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Social Media Data Analyst",
    "name": "Get It Recruit - Marketing",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "95329.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "95329.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "95329.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "95329.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Looker",
    "name": "Hays",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Looker",
    "name": "Hays",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "mongodb"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Looker",
    "name": "Hays",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "postgresql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Looker",
    "name": "Hays",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "mongodb"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Looker",
    "name": "Hays",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76842.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76842.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76842.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76842.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76842.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76842.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Conversion Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "126000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Starr And Associates LLC",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Starr And Associates LLC",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Starr And Associates LLC",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Starr And Associates LLC",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Starr And Associates LLC",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Starr And Associates LLC",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "83500.0",
    "skills": "node.js"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "REMOTE Director of Data Analytics",
    "name": "A-Line Staffing Solutions",
    "job_country": "United States",
    "salary_year_avg": "170000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "REMOTE Director of Data Analytics",
    "name": "A-Line Staffing Solutions",
    "job_country": "United States",
    "salary_year_avg": "170000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "REMOTE Director of Data Analytics",
    "name": "A-Line Staffing Solutions",
    "job_country": "United States",
    "salary_year_avg": "170000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "(Remote) Marketing Data Analyst",
    "name": "Clark Associates",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "(Remote) Marketing Data Analyst",
    "name": "Clark Associates",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "(Remote) Marketing Data Analyst",
    "name": "Clark Associates",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "(Remote) Marketing Data Analyst",
    "name": "Clark Associates",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Entry Level Data Analyst",
    "name": "Jumpvine",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst must have telecom domain experince",
    "name": "ApTask",
    "job_country": "Sudan",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Electronic Data Interchange Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Quality Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "spreadsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "microsoft teams"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Advanced Analytics",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Advanced Analytics",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Advanced Analytics",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Advanced Analytics",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Advanced Analytics",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Lead Analyst - Fully Remote",
    "name": "Constant Associates",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Lead Analyst - Fully Remote",
    "name": "Constant Associates",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Lead Analyst - Fully Remote",
    "name": "Constant Associates",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Lead Analyst - Fully Remote",
    "name": "Constant Associates",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Lead Analyst - Fully Remote",
    "name": "Constant Associates",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Health Data Lead Analyst - Fully Remote",
    "name": "Constant Associates",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III - SQL Analytics - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "99000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III - SQL Analytics - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "99000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Analyst, Master Data Management",
    "name": "Ascension",
    "job_country": "United States",
    "salary_year_avg": "65062.3984375",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Analyst, Master Data Management",
    "name": "Ascension",
    "job_country": "United States",
    "salary_year_avg": "65062.3984375",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "101500.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Reporting Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Reporting Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Reporting Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Reporting Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Reporting Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Reporting Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst with PowerBI Dashboards Experience",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst with PowerBI Dashboards Experience",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst with PowerBI Dashboards Experience",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Market Research & Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Market Research & Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Market Research & Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Market Research & Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "106000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "vb.net"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Applied Engineering Management Corporation",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Applied Engineering Management Corporation",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Applied Engineering Management Corporation",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Applied Engineering Management Corporation",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Applied Engineering Management Corporation",
    "job_country": "United States",
    "salary_year_avg": "74000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst",
    "name": "Modis",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst",
    "name": "Modis",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Govcio LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Govcio LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Govcio LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "atlassian"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "ZipRecruiter",
    "job_country": "United States",
    "salary_year_avg": "102250.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "ZipRecruiter",
    "job_country": "United States",
    "salary_year_avg": "102250.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data/Information Architect",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data/Information Architect",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data/Information Architect",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "postgresql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data/Information Architect",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data/Information Architect",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Survey Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Survey Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Survey Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Analytics Expert",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "114948.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Analytics Expert",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "114948.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Analytics Expert",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "114948.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Analytics Expert",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "114948.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Analytics Expert",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "114948.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Analytics Expert",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "114948.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "matplotlib"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "plotly"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "seaborn"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Marketing",
    "name": "Coda Staffing",
    "job_country": "United States",
    "salary_year_avg": "72500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "OPEN RANK: Qualitative Research Data Analyst or Senior Research...",
    "name": "University of Maryland, Baltimore",
    "job_country": "United States",
    "salary_year_avg": "51500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "OPEN RANK: Qualitative Research Data Analyst or Senior Research...",
    "name": "University of Maryland, Baltimore",
    "job_country": "United States",
    "salary_year_avg": "51500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "OPEN RANK: Qualitative Research Data Analyst or Senior Research...",
    "name": "University of Maryland, Baltimore",
    "job_country": "United States",
    "salary_year_avg": "51500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "OPEN RANK: Qualitative Research Data Analyst or Senior Research...",
    "name": "University of Maryland, Baltimore",
    "job_country": "United States",
    "salary_year_avg": "51500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data SAS Analyst I",
    "name": "Ascendo Resources",
    "job_country": "United States",
    "salary_year_avg": "57300.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data SAS Analyst I",
    "name": "Ascendo Resources",
    "job_country": "United States",
    "salary_year_avg": "57300.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data SAS Analyst I",
    "name": "Ascendo Resources",
    "job_country": "United States",
    "salary_year_avg": "57300.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data SAS Analyst I",
    "name": "Ascendo Resources",
    "job_country": "United States",
    "salary_year_avg": "57300.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Decision Science Analyst - Consumer Lending",
    "name": "Analytic Recruiting Inc.",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Decision Science Analyst - Consumer Lending",
    "name": "Analytic Recruiting Inc.",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Decision Science Analyst - Consumer Lending",
    "name": "Analytic Recruiting Inc.",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Decision Science Analyst - Consumer Lending",
    "name": "Analytic Recruiting Inc.",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Decision Science Analyst - Consumer Lending",
    "name": "Analytic Recruiting Inc.",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Decision Science Analyst - Consumer Lending",
    "name": "Analytic Recruiting Inc.",
    "job_country": "United States",
    "salary_year_avg": "122500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Doximity",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Doximity",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Doximity",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Doximity",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "pandas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Doximity",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "numpy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Doximity",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "unix"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Doximity",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "git"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Doximity",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "github"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "ManyPets",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "ManyPets",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "ManyPets",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Logistics Data Analyst (Remote Friendly)",
    "name": "Webstaurant Store",
    "job_country": "United States",
    "salary_year_avg": "58000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Logistics Data Analyst (Remote Friendly)",
    "name": "Webstaurant Store",
    "job_country": "United States",
    "salary_year_avg": "58000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "crystal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Software Developer",
    "name": "QSE7, LLC",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Software Developer",
    "name": "QSE7, LLC",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Software Developer",
    "name": "QSE7, LLC",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Software Developer",
    "name": "QSE7, LLC",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Software Developer",
    "name": "QSE7, LLC",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analytics (Bioscience) - Remote",
    "name": "Lonza",
    "job_country": "United States",
    "salary_year_avg": "129000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analytics (Bioscience) - Remote",
    "name": "Lonza",
    "job_country": "United States",
    "salary_year_avg": "129000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Tableau)",
    "name": "Customer Value Partners",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Tableau)",
    "name": "Customer Value Partners",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "plotly"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Tableau)",
    "name": "Customer Value Partners",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Tableau)",
    "name": "Customer Value Partners",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Tableau)",
    "name": "Customer Value Partners",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst must have telecom domain experince",
    "name": "ApTask",
    "job_country": "Sudan",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst must have telecom domain experince",
    "name": "ApTask",
    "job_country": "Sudan",
    "salary_year_avg": "130000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst must have telecom domain experince",
    "name": "ApTask",
    "job_country": "Sudan",
    "salary_year_avg": "130000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist/Financial Data Analyst",
    "name": "NCUA",
    "job_country": "Sudan",
    "salary_year_avg": "74224.5",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist/Financial Data Analyst",
    "name": "NCUA",
    "job_country": "Sudan",
    "salary_year_avg": "74224.5",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Scientist/Financial Data Analyst",
    "name": "NCUA",
    "job_country": "Sudan",
    "salary_year_avg": "74224.5",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Data Analyst",
    "name": "CyberCoders",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experian Data Analyst Remote / Telecommute Jobs",
    "name": "Seneca Resources, LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Engineer/Data Analyst",
    "name": "Segue Technologies Inc",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Coders Data",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst I",
    "name": "FiberFirst",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst I",
    "name": "FiberFirst",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst I",
    "name": "FiberFirst",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst I",
    "name": "FiberFirst",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst I",
    "name": "FiberFirst",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst I",
    "name": "FiberFirst",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "HR Reporting & Analytics Manager",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Analyst - Data Analytics - Remote",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "122769.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Analyst - Data Analytics - Remote",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "122769.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Analyst - Data Analytics - Remote",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "122769.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Analyst - Data Analytics - Remote",
    "name": "ICF",
    "job_country": "United States",
    "salary_year_avg": "122769.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gotely",
    "job_country": "Sweden",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gotely",
    "job_country": "Sweden",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gotely",
    "job_country": "Sweden",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gotely",
    "job_country": "Sweden",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Gotely",
    "job_country": "Sweden",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Kaye/Bassman International",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "smartsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Accounting / Data Analyst",
    "name": "Confidential",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Accounting / Data Analyst",
    "name": "Confidential",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sap"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Lighthouse Professional Services",
    "job_country": "United States",
    "salary_year_avg": "115000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Financial Services",
    "name": "Earnest Analytics",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Financial Services",
    "name": "Earnest Analytics",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Health Choice Network",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Health Choice Network",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Health Choice Network",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "sass"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "AllianceChicago",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "terminal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Data Analyst",
    "name": "Beyond 12",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Data Analyst",
    "name": "Beyond 12",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Data Analyst",
    "name": "Beyond 12",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Data Analyst",
    "name": "Beyond 12",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Entry Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "50000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data and Process Modeling Analyst",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data and Process Modeling Analyst",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "scala"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "matlab"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "81000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Realtime Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "160000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Realtime Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "160000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "name": "Realtime Recruitment",
    "job_country": "Canada",
    "salary_year_avg": "160000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst",
    "name": "Engage Partners Inc.",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst",
    "name": "Engage Partners Inc.",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst",
    "name": "Engage Partners Inc.",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst",
    "name": "Engage Partners Inc.",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Clinical Data Analyst",
    "name": "Engage Partners Inc.",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Data Analyst (CRE / CMBS)",
    "name": "CRED iQ",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Data Analyst (CRE / CMBS)",
    "name": "CRED iQ",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Data Analyst (CRE / CMBS)",
    "name": "CRED iQ",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Data Analyst (CRE / CMBS)",
    "name": "CRED iQ",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "rust"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Data Analyst (CRE / CMBS)",
    "name": "CRED iQ",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Data Analyst (CRE / CMBS)",
    "name": "CRED iQ",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Data Analyst (CRE / CMBS)",
    "name": "CRED iQ",
    "job_country": "United States",
    "salary_year_avg": "97500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "shell"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "bash"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "powershell"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "db2"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "EDI Data Analyst/Business Systems Analyst III  (Great Place to...",
    "name": "Paradigm",
    "job_country": "United States",
    "salary_year_avg": "109600.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Spark451 Inc.",
    "job_country": "United States",
    "salary_year_avg": "52000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Spark451 Inc.",
    "job_country": "United States",
    "salary_year_avg": "52000.0",
    "skills": "mongodb"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Spark451 Inc.",
    "job_country": "United States",
    "salary_year_avg": "52000.0",
    "skills": "mongodb"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Spark451 Inc.",
    "job_country": "United States",
    "salary_year_avg": "52000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Spark451 Inc.",
    "job_country": "United States",
    "salary_year_avg": "52000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Spark451 Inc.",
    "job_country": "United States",
    "salary_year_avg": "52000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Technology and Data Analyst",
    "name": "McAllister & Quinn, LLC",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Alameda Health Consortium/Community Health Center Network",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Alameda Health Consortium/Community Health Center Network",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Alameda Health Consortium/Community Health Center Network",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Alameda Health Consortium/Community Health Center Network",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Alameda Health Consortium/Community Health Center Network",
    "job_country": "United States",
    "salary_year_avg": "83000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "name": "CEDARS-SINAI",
    "job_country": "United States",
    "salary_year_avg": "163500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "name": "CEDARS-SINAI",
    "job_country": "United States",
    "salary_year_avg": "163500.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "name": "CEDARS-SINAI",
    "job_country": "United States",
    "salary_year_avg": "163500.0",
    "skills": "crystal"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "name": "CEDARS-SINAI",
    "job_country": "United States",
    "salary_year_avg": "163500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "name": "CEDARS-SINAI",
    "job_country": "United States",
    "salary_year_avg": "163500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "The Walt Disney Company",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "The Walt Disney Company",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "The Walt Disney Company",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "The Walt Disney Company",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "The Walt Disney Company",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "The Walt Disney Company",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "The Walt Disney Company",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "The Walt Disney Company",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Wrangling and Visualization Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Wrangling and Visualization Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Wrangling and Visualization Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Wrangling and Visualization Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "databricks"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Wrangling and Visualization Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Wrangling and Visualization Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "103000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Experian Data Analyst Remote / Telecommute Jobs",
    "name": "Seneca Resources, LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "linux"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst I",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst I",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst I",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst",
    "name": "Get It Recruit - Administrative",
    "job_country": "United States",
    "salary_year_avg": "39000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "91000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "91000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "91000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "91000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Supplemental Data Analyst - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Supplemental Data Analyst - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Supplemental Data Analyst - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Supplemental Data Analyst - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Supplemental Data Analyst - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Supplemental Data Analyst - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "ms access"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr Supplemental Data Analyst - Remote",
    "name": "UnitedHealth Group",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "scala"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "airflow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "155000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Growth Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Growth Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Growth Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Growth Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Growth Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Trinity Solar Careers",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Trinity Solar Careers",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Trinity Solar Careers",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Trinity Solar Careers",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Trinity Solar Careers",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Trinity Solar Careers",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Trinity Solar Careers",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - US Healthcare (REMOTE)",
    "name": "WALGREENS",
    "job_country": "United States",
    "salary_year_avg": "54540.0",
    "skills": "cognos"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "windows"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "webex"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Processing and Reporting Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "62000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Early Career Quality Engineer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Early Career Quality Engineer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Early Career Quality Engineer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Early Career Quality Engineer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Early Career Quality Engineer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "html"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Early Career Quality Engineer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst- Early Career Quality Engineer",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Tactis LLC",
    "job_country": "United States",
    "salary_year_avg": "94000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Tactis LLC",
    "job_country": "United States",
    "salary_year_avg": "94000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Business Data Analyst",
    "name": "Tactis LLC",
    "job_country": "United States",
    "salary_year_avg": "94000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "visual basic"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "ms access"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare Industry (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Healthcare Industry (Remote)",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Zelo Digital Recruitment",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Zelo Digital Recruitment",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Zelo Digital Recruitment",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Zelo Digital Recruitment",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Zelo Digital Recruitment",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Early Career Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Early Career Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Early Career Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "nosql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Early Career Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Early Career Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "El Buen Samaritano",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "confluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sr. Data Analyst",
    "name": "Launch Consulting Group",
    "job_country": "United States",
    "salary_year_avg": "130000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "matplotlib"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "76007.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "SoftDev Incorporated",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "SoftDev Incorporated",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "SoftDev Incorporated",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst III",
    "name": "SoftDev Incorporated",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "The Difference Card",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "The Difference Card",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "The Difference Card",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "The Difference Card",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "The Difference Card",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "The Difference Card",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst II",
    "name": "The Difference Card",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex.",
    "job_country": "Sudan",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex.",
    "job_country": "Sudan",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex.",
    "job_country": "Sudan",
    "salary_year_avg": "77500.0",
    "skills": "sqlite"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex.",
    "job_country": "Sudan",
    "salary_year_avg": "77500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex.",
    "job_country": "Sudan",
    "salary_year_avg": "77500.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Supply Chain Analytics Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Supply Chain Analytics Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Supply Chain Analytics Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Senior Supply Chain Analytics Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "89000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "E-Commerce Digital Analyst",
    "name": "Fitsoftware OU",
    "job_country": "Estonia",
    "salary_year_avg": "52500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "E-Commerce Digital Analyst",
    "name": "Fitsoftware OU",
    "job_country": "Estonia",
    "salary_year_avg": "52500.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "E-Commerce Digital Analyst",
    "name": "Fitsoftware OU",
    "job_country": "Estonia",
    "salary_year_avg": "52500.0",
    "skills": "html"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "E-Commerce Digital Analyst",
    "name": "Fitsoftware OU",
    "job_country": "Estonia",
    "salary_year_avg": "52500.0",
    "skills": "css"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "E-Commerce Digital Analyst",
    "name": "Fitsoftware OU",
    "job_country": "Estonia",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "E-Commerce Digital Analyst",
    "name": "Fitsoftware OU",
    "job_country": "Estonia",
    "salary_year_avg": "52500.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insight Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "73696.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insight Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "73696.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insight Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "73696.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Operations Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "Mexico",
    "salary_year_avg": "70500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manufacturing Operations Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manufacturing Operations Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "70000.0",
    "skills": "planner"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Vista Global Solutions, LLC",
    "job_country": "Sudan",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Vista Global Solutions, LLC",
    "job_country": "Sudan",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Vista Global Solutions, LLC",
    "job_country": "Sudan",
    "salary_year_avg": "105000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Vista Global Solutions, LLC",
    "job_country": "Sudan",
    "salary_year_avg": "105000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Vista Global Solutions, LLC",
    "job_country": "Sudan",
    "salary_year_avg": "105000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Vista Global Solutions, LLC",
    "job_country": "Sudan",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Vista Global Solutions, LLC",
    "job_country": "Sudan",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Vista Global Solutions, LLC",
    "job_country": "Sudan",
    "salary_year_avg": "105000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "110000.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst or Data Scientist",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst or Data Scientist",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst or Data Scientist",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Strategic Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Strategic Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Strategic Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Strategic Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "planner"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Southern California University",
    "job_country": "United States",
    "salary_year_avg": "74500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Southern California University",
    "job_country": "United States",
    "salary_year_avg": "74500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Southern California University",
    "job_country": "United States",
    "salary_year_avg": "74500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Southern California University",
    "job_country": "United States",
    "salary_year_avg": "74500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Southern California University",
    "job_country": "United States",
    "salary_year_avg": "74500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Southern California University",
    "job_country": "United States",
    "salary_year_avg": "74500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Southern California University",
    "job_country": "United States",
    "salary_year_avg": "74500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Southern California University",
    "job_country": "United States",
    "salary_year_avg": "74500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "82000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "jenkins"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Motion Recruitment",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Strategy and Data Analyst, Sustainability",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "125500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Strategy and Data Analyst, Sustainability",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "125500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Strategy and Data Analyst, Sustainability",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "125500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Strategy and Data Analyst, Sustainability",
    "name": "Uber",
    "job_country": "United States",
    "salary_year_avg": "125500.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Program/Data Analyst (Health Services) Remote!",
    "name": "General Dynamics Information Technology",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Analyst III",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Analyst III",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Analyst III",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Insights Analyst III",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Community Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "66500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Community Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "66500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Community Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "66500.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Community Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "66500.0",
    "skills": "planner"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "50000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "50000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "50000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "50000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "50000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Data and Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Data and Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Data and Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Data and Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Data and Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Data and Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Data and Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Investment Data and Analytics Manager",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Bargersville, IN",
    "name": "VetJobs & Military Spouse Jobs",
    "job_country": "United States",
    "salary_year_avg": "63000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Bargersville, IN",
    "name": "VetJobs & Military Spouse Jobs",
    "job_country": "United States",
    "salary_year_avg": "63000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "El Buen Samaritano",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "El Buen Samaritano",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "El Buen Samaritano",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "El Buen Samaritano",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "El Buen Samaritano",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "El Buen Samaritano",
    "job_country": "United States",
    "salary_year_avg": "60000.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Hospitality",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst/Epic Cogito",
    "name": "Engage Partners Inc.",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst/Epic Cogito",
    "name": "Engage Partners Inc.",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Mining Analyst",
    "name": "Envision Staffing Solutions",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Mining Analyst",
    "name": "Envision Staffing Solutions",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Mining Analyst",
    "name": "Envision Staffing Solutions",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "spreadsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Mining Analyst",
    "name": "Envision Staffing Solutions",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sustainability Oversight Data Lead Analyst - Remote",
    "name": "The Cigna Group",
    "job_country": "United States",
    "salary_year_avg": "94400.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Sustainability Oversight Data Lead Analyst - Remote",
    "name": "The Cigna Group",
    "job_country": "United States",
    "salary_year_avg": "94400.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - up to 160K+",
    "name": "Hire With Jarvis",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - up to 160K+",
    "name": "Hire With Jarvis",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - up to 160K+",
    "name": "Hire With Jarvis",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - up to 160K+",
    "name": "Hire With Jarvis",
    "job_country": "United States",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Consultant",
    "name": "FutureNET",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Consultant",
    "name": "FutureNET",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Consultant",
    "name": "FutureNET",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analytics Consultant",
    "name": "FutureNET",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "cognos"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "name": "Robert Half",
    "job_country": "United States",
    "salary_year_avg": "160000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CODING DOJO INC.",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "outlook"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "c"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst / Engineer",
    "name": "Men's Health Clinic (MHC)",
    "job_country": "Australia",
    "salary_year_avg": "47500.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EcoCart",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EcoCart",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EcoCart",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EcoCart",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "redshift"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EcoCart",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EcoCart",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "EcoCart",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "clickup"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Lead - Remote",
    "name": "Olympus Corporation of the Americas",
    "job_country": "United States",
    "salary_year_avg": "95500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Lead - Remote",
    "name": "Olympus Corporation of the Americas",
    "job_country": "United States",
    "salary_year_avg": "95500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Lead - Remote",
    "name": "Olympus Corporation of the Americas",
    "job_country": "United States",
    "salary_year_avg": "95500.0",
    "skills": "vba"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Lead - Remote",
    "name": "Olympus Corporation of the Americas",
    "job_country": "United States",
    "salary_year_avg": "95500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Lead - Remote",
    "name": "Olympus Corporation of the Americas",
    "job_country": "United States",
    "salary_year_avg": "95500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst Lead - Remote",
    "name": "Olympus Corporation of the Americas",
    "job_country": "United States",
    "salary_year_avg": "95500.0",
    "skills": "unity"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "GTM Revenue Operations Data Analyst",
    "name": "UiPath",
    "job_country": "United States",
    "salary_year_avg": "76000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "GTM Revenue Operations Data Analyst",
    "name": "UiPath",
    "job_country": "United States",
    "salary_year_avg": "76000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "GTM Revenue Operations Data Analyst",
    "name": "UiPath",
    "job_country": "United States",
    "salary_year_avg": "76000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "GTM Revenue Operations Data Analyst",
    "name": "UiPath",
    "job_country": "United States",
    "salary_year_avg": "76000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst 2 - Remote",
    "name": "Optum",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst 2 - Remote",
    "name": "Optum",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst 2 - Remote",
    "name": "Optum",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "sql server"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst 2 - Remote",
    "name": "Optum",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "ssis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst 2 - Remote",
    "name": "Optum",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "ssrs"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst 2 - Remote",
    "name": "Optum",
    "job_country": "United States",
    "salary_year_avg": "100400.0",
    "skills": "github"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "shell"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "html"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "t-sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "unix"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Grant Leading Technology, LLC",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "visio"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analytics & Reporting - Remote",
    "name": "Infinity Consulting Solutions, Inc.",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analytics & Reporting - Remote",
    "name": "Infinity Consulting Solutions, Inc.",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analytics & Reporting - Remote",
    "name": "Infinity Consulting Solutions, Inc.",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Manager, Data Analytics & Reporting - Remote",
    "name": "Infinity Consulting Solutions, Inc.",
    "job_country": "United States",
    "salary_year_avg": "125000.0",
    "skills": "notion"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "phoenix"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "71850.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst - Remote in RI",
    "name": "Complete HR Solutions",
    "job_country": "United States",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Platform Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Platform Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Platform Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Modeling) (Remote)",
    "name": "Heluna Health",
    "job_country": "United States",
    "salary_year_avg": "89796.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Modeling) (Remote)",
    "name": "Heluna Health",
    "job_country": "United States",
    "salary_year_avg": "89796.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Modeling) (Remote)",
    "name": "Heluna Health",
    "job_country": "United States",
    "salary_year_avg": "89796.0",
    "skills": "julia"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Modeling) (Remote)",
    "name": "Heluna Health",
    "job_country": "United States",
    "salary_year_avg": "89796.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "24 Seven Talent",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "24 Seven Talent",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "24 Seven Talent",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "24 Seven Talent",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "24 Seven Talent",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "airflow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "24 Seven Talent",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "24 Seven Talent",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "git"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "74049.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "74049.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "74049.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "74049.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "74049.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Healthcare Data Analyst",
    "name": "Get It Recruit - Healthcare",
    "job_country": "United States",
    "salary_year_avg": "74049.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "java"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "c++"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "c#"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "hackajob",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "matlab"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst",
    "name": "Edgewater Federal Solutions, Inc.",
    "job_country": "United States",
    "salary_year_avg": "157500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst",
    "name": "Edgewater Federal Solutions, Inc.",
    "job_country": "United States",
    "salary_year_avg": "157500.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "System Data Analyst",
    "name": "Edgewater Federal Solutions, Inc.",
    "job_country": "United States",
    "salary_year_avg": "157500.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Hearth",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Hearth",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Hearth",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Hearth",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Hearth",
    "job_country": "United States",
    "salary_year_avg": "100000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "Sudan",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "Sudan",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "Sudan",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "Sudan",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "Sudan",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "Sudan",
    "salary_year_avg": "95000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Polygence",
    "job_country": "Sudan",
    "salary_year_avg": "95000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Part Time (Greater NYC Area, NY or Remote)",
    "name": "Memorial Sloan Kettering Cancer Center",
    "job_country": "United States",
    "salary_year_avg": "83200.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Part Time (Greater NYC Area, NY or Remote)",
    "name": "Memorial Sloan Kettering Cancer Center",
    "job_country": "United States",
    "salary_year_avg": "83200.0",
    "skills": "go"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95700.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95700.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95700.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95700.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95700.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95700.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Booz Allen Hamilton",
    "job_country": "United States",
    "salary_year_avg": "95700.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Ecommerce Business Analyst/Data Analyst with Good exp with SQL",
    "name": "BayOne Solutions",
    "job_country": "United States",
    "salary_year_avg": "41000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Ecommerce Business Analyst/Data Analyst with Good exp with SQL",
    "name": "BayOne Solutions",
    "job_country": "United States",
    "salary_year_avg": "41000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst-",
    "name": "InsideHigherEd",
    "job_country": "United States",
    "salary_year_avg": "80740.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst-",
    "name": "InsideHigherEd",
    "job_country": "United States",
    "salary_year_avg": "80740.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst-",
    "name": "InsideHigherEd",
    "job_country": "United States",
    "salary_year_avg": "80740.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst-",
    "name": "InsideHigherEd",
    "job_country": "United States",
    "salary_year_avg": "80740.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst-",
    "name": "InsideHigherEd",
    "job_country": "United States",
    "salary_year_avg": "80740.0",
    "skills": "zoom"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bright Power",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bright Power",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bright Power",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "mysql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bright Power",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bright Power",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bright Power",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "flow"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Bright Power",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "jira"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Mothership Strategies, LLC",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Mothership Strategies, LLC",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Mothership Strategies, LLC",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Mothership Strategies, LLC",
    "job_country": "United States",
    "salary_year_avg": "65000.0",
    "skills": "spark"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Invitae",
    "job_country": "United States",
    "salary_year_avg": "76500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Invitae",
    "job_country": "United States",
    "salary_year_avg": "76500.0",
    "skills": "spring"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Invitae",
    "job_country": "United States",
    "salary_year_avg": "76500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Invitae",
    "job_country": "United States",
    "salary_year_avg": "76500.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Invitae",
    "job_country": "United States",
    "salary_year_avg": "76500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Invitae",
    "job_country": "United States",
    "salary_year_avg": "76500.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst: regional physical security",
    "name": "Blackstone Consulting, Inc.",
    "job_country": "United States",
    "salary_year_avg": "124500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst: regional physical security",
    "name": "Blackstone Consulting, Inc.",
    "job_country": "United States",
    "salary_year_avg": "124500.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst: regional physical security",
    "name": "Blackstone Consulting, Inc.",
    "job_country": "United States",
    "salary_year_avg": "124500.0",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst: regional physical security",
    "name": "Blackstone Consulting, Inc.",
    "job_country": "United States",
    "salary_year_avg": "124500.0",
    "skills": "sharepoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst: regional physical security",
    "name": "Blackstone Consulting, Inc.",
    "job_country": "United States",
    "salary_year_avg": "124500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst: regional physical security",
    "name": "Blackstone Consulting, Inc.",
    "job_country": "United States",
    "salary_year_avg": "124500.0",
    "skills": "microsoft teams"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "windows"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "word"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "spreadsheet"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst",
    "name": "Calbright College",
    "job_country": "United States",
    "salary_year_avg": "99746.90625",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (QA)",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95680.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "FocusKPI Inc.",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "FocusKPI Inc.",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "FocusKPI Inc.",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Marketing Data Analyst",
    "name": "FocusKPI Inc.",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Reporting and Data Analyst - Boston, MA",
    "name": "Crescentia GTS",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Reporting and Data Analyst - Boston, MA",
    "name": "Crescentia GTS",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Reporting and Data Analyst - Boston, MA",
    "name": "Crescentia GTS",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "windows"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Reporting and Data Analyst - Boston, MA",
    "name": "Crescentia GTS",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Operations Reporting and Data Analyst - Boston, MA",
    "name": "Crescentia GTS",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Management Analyst- Remote",
    "name": "Stafford Consulting Company, Inc.",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "powerpoint"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Management Analyst- Remote",
    "name": "Stafford Consulting Company, Inc.",
    "job_country": "United States",
    "salary_year_avg": "57500.0",
    "skills": "microsoft teams"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "DATA ANALYST - We offer career advancement, a work-life balance...",
    "name": "Zunch Staffing",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "DATA ANALYST - We offer career advancement, a work-life balance...",
    "name": "Zunch Staffing",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "DATA ANALYST - We offer career advancement, a work-life balance...",
    "name": "Zunch Staffing",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "DATA ANALYST - We offer career advancement, a work-life balance...",
    "name": "Zunch Staffing",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Overmind",
    "job_country": "Greece",
    "salary_year_avg": "138500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Overmind",
    "job_country": "Greece",
    "salary_year_avg": "138500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "javascript"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "84000.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "oracle"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst II - Firm Analytics",
    "name": "Edward Jones",
    "job_country": "United States",
    "salary_year_avg": "106479.0",
    "skills": "spss"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Scientist (Remote)",
    "name": "Osmind",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Scientist (Remote)",
    "name": "Osmind",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Quantitative Scientist (Remote)",
    "name": "Osmind",
    "job_country": "United States",
    "salary_year_avg": "132500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "184000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "184000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "ERM Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "184000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Science Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Predictive Modeling",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "119200.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Predictive Modeling",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "119200.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Predictive Modeling",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "119200.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Predictive Modeling",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "119200.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Telecom Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "86000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Telecom Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "86000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Telecom Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "86000.0",
    "skills": "sheets"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Supply Chain Data Integrity Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Visualization Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "html"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Visualization Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Visualization Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Visualization Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "105000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst for Democratic Attorneys General and AG Candidates",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst for Democratic Attorneys General and AG Candidates",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst for Democratic Attorneys General and AG Candidates",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst for Democratic Attorneys General and AG Candidates",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "67500.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "119200.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "119200.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "119200.0",
    "skills": "hadoop"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "CVS Health",
    "job_country": "United States",
    "salary_year_avg": "119200.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst IV (Healthcare Analytics) - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "98500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst IV (Healthcare Analytics) - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "98500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst IV (Healthcare Analytics) - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "98500.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst IV (Healthcare Analytics) - Remote | WFH",
    "name": "Get It Recruit - Technology",
    "job_country": "United States",
    "salary_year_avg": "98500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Peraton",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Peraton",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Peraton",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Peraton",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Peraton",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Peraton",
    "job_country": "United States",
    "salary_year_avg": "80000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "36000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Financial Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "36000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst III",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Data Analyst III",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "102000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst/Data Architect",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "55500.0",
    "skills": "aws"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Lead Data Analyst/Data Architect",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "55500.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Decision Science Analyst",
    "name": "USAA",
    "job_country": "United States",
    "salary_year_avg": "125930.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Decision Science Analyst",
    "name": "USAA",
    "job_country": "United States",
    "salary_year_avg": "125930.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Decision Science Analyst",
    "name": "USAA",
    "job_country": "United States",
    "salary_year_avg": "125930.0",
    "skills": "phoenix"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Mid-Level Decision Science Analyst",
    "name": "USAA",
    "job_country": "United States",
    "salary_year_avg": "125930.0",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Get It Recruit - Information Technology",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Supply Chain Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Supply Chain Data Analyst",
    "name": "Get It Recruit - Transportation",
    "job_country": "United States",
    "salary_year_avg": "75000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Predictive Data Analyst",
    "name": "SimioCloud",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Predictive Data Analyst",
    "name": "SimioCloud",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Predictive Data Analyst",
    "name": "SimioCloud",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Predictive Data Analyst",
    "name": "SimioCloud",
    "job_country": "Sudan",
    "salary_year_avg": "85000.0",
    "skills": "alteryx"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Credit Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Credit Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Credit Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Credit Data Analyst",
    "name": "Get It Recruit - Finance",
    "job_country": "United States",
    "salary_year_avg": "90000.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Phoenix Capital Group Holdings LLC",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "julia"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Phoenix Capital Group Holdings LLC",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "phoenix"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst",
    "name": "Phoenix Capital Group Holdings LLC",
    "job_country": "United States",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "sqlite"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "azure"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Simplex",
    "job_country": "United States",
    "salary_year_avg": "77500.0",
    "skills": "snowflake"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "Insight Global",
    "job_country": "United States",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Finance and Accounting (Remote)",
    "name": "Rhino",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Finance and Accounting (Remote)",
    "name": "Rhino",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Finance and Accounting (Remote)",
    "name": "Rhino",
    "job_country": "United States",
    "salary_year_avg": "107500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Lead Business Data Analyst (Chicago, IL or Remote)",
    "name": "UL Solutions",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Remote Lead Business Data Analyst (Chicago, IL or Remote)",
    "name": "UL Solutions",
    "job_country": "United States",
    "salary_year_avg": "112500.0",
    "skills": "dax"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "name": "InvestM Technology LLC",
    "job_country": "United States",
    "salary_year_avg": "135000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst (remote)",
    "name": "Ad Hoc Team",
    "job_country": "United States",
    "salary_year_avg": "98800.0",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst (remote)",
    "name": "Ad Hoc Team",
    "job_country": "United States",
    "salary_year_avg": "98800.0",
    "skills": "python"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst (remote)",
    "name": "Ad Hoc Team",
    "job_country": "United States",
    "salary_year_avg": "98800.0",
    "skills": "r"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst (remote)",
    "name": "Ad Hoc Team",
    "job_country": "United States",
    "salary_year_avg": "98800.0",
    "skills": "tableau"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Research Data Analyst (remote)",
    "name": "Ad Hoc Team",
    "job_country": "United States",
    "salary_year_avg": "98800.0",
    "skills": "looker"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "name": "IT Pros",
    "job_country": "United States",
    "salary_year_avg": "140000.0",
    "skills": "bigquery"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "name": "IT Pros",
    "job_country": "United States",
    "salary_year_avg": "140000.0",
    "skills": "power bi"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "name": "IT Pros",
    "job_country": "United States",
    "salary_year_avg": "140000.0",
    "skills": "qlik"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "BI Data Analyst IV",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sql"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "BI Data Analyst IV",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "BI Data Analyst IV",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "excel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "BI Data Analyst IV",
    "name": "Kern Health Systems",
    "job_country": "United States",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  }
]*/