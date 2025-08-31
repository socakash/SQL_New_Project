/*Purpose: The query is determining which skills are most commonly required in job postings 
— essentially highlighting the top 3 skills that are in highest demand.*/

SELECT 
    skills_dim.skills AS skills,
    COUNT(skills_job_dim.job_id) AS job_count
    
FROM 
    skills_dim
INNER JOIN skills_job_dim
ON
skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills
ORDER BY job_count DESC
LIMIT 3;



/*
"skills","job_count"
"sql","385750"
"python","381863"
"aws","145718"
*/

/*
[
  {
    "skills": "sql",
    "job_count": "385750"
  },
  {
    "skills": "python",
    "job_count": "381863"
  },
  {
    "skills": "aws",
    "job_count": "145718"
  }
]
*/

