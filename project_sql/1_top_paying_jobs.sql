SELECT 
      job_id,
      job_title,
      name AS company_name,
      job_location,
      job_schedule_type,
      jp.salary_year_avg,
      job_posted_date::DATE
FROM 
      job_postings_fact AS jp
LEFT JOIN company_dim ON jp.company_id = company_dim.company_id
WHERE
      job_title_short = 'Data Analyst' AND
      job_location = 'Anywhere' AND
      jp.salary_year_avg IS NOT NULL 
ORDER BY
       jp.salary_year_avg DESC
LIMIT 10;
