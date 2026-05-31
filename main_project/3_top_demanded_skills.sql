/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/


SELECT
    skills,
    COUNT(skills_job_dim.skill_id) AS demand_skills
FROM   
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = True
GROUP BY 
    skills
ORDER BY
    demand_skills DESC
LIMIT 5

/*

Here's a full breakdown of what the data shows:

- SQL is king — at 7291 postings it's the single most requested skill by a wide margin, showing up in nearly 1 in 3 skill mentions across all Data Analyst job postings in 2023.
- Excel refuses to die — 4611 postings still require it, solidly in second place. Despite all the modern tooling, spreadsheet fluency is a non-negotiable baseline.
- Python is close on Excel's heels — 4330 mentions puts it at 19%, and it's increasingly preferred over Excel for data manipulation, suggesting the role is getting more technical.
- BI tools are split — Tableau (3745) still leads Power BI (2609), but together they represent 28.2% of all demand, making visualization skills nearly as important as programming.

RESULT:

    [
        {
            "skills": "sql",
            "demand_skills": "7291"
        },
        {
            "skills": "excel",
            "demand_skills": "4611"
        },
        {
            "skills": "python",
            "demand_skills": "4330"
        },
        {
            "skills": "tableau",
            "demand_skills": "3745"
        },
        {
            "skills": "power bi",
            "demand_skills": "2609"
        }
    ]

*/