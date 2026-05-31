/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10

)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*

This analysis looks at 8 of the top-paying data analyst job postings from 2023 — salaries ranging from $184K to $256K/year — and maps the skills each role required.

SQL is the undisputed king — it appears in all 8 jobs, making it the single most essential skill for landing a high-paying data analyst role. Python follows closely at 7 out of 8, and Tableau rounds out the top 3 at 6.
The core stack every candidate should know:

SQL · Python · Tableau — required by 75–100% of roles
R · Pandas · Excel · Snowflake — show up in 3–4 roles each

Cloud platforms matter — AWS and Azure each appeared in 2 roles, mostly at the senior/director level, suggesting cloud literacy becomes more important as you move up.
Collaboration tools are a bonus — tools like Jira, Confluence, Bitbucket, and Atlassian appeared in a cluster of roles, likely reflecting team-size and engineering-adjacent expectations at those companies.



RESULT : 

    [
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "sql"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "python"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "r"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "azure"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "databricks"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "aws"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "pandas"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "pyspark"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "jupyter"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "excel"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "tableau"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "power bi"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "powerpoint"
        },
        {
            "job_id": 99305,
            "job_title": "Data Analyst, Marketing",
            "salary_year_avg": "232423.0",
            "company_name": "Pinterest Job Advertisements",
            "skills": "sql"
        },
        {
            "job_id": 99305,
            "job_title": "Data Analyst, Marketing",
            "salary_year_avg": "232423.0",
            "company_name": "Pinterest Job Advertisements",
            "skills": "python"
        },
        {
            "job_id": 99305,
            "job_title": "Data Analyst, Marketing",
            "salary_year_avg": "232423.0",
            "company_name": "Pinterest Job Advertisements",
            "skills": "r"
        },
        {
            "job_id": 99305,
            "job_title": "Data Analyst, Marketing",
            "salary_year_avg": "232423.0",
            "company_name": "Pinterest Job Advertisements",
            "skills": "hadoop"
        },
        {
            "job_id": 99305,
            "job_title": "Data Analyst, Marketing",
            "salary_year_avg": "232423.0",
            "company_name": "Pinterest Job Advertisements",
            "skills": "tableau"
        },
        {
            "job_id": 1021647,
            "job_title": "Data Analyst (Hybrid/Remote)",
            "salary_year_avg": "217000.0",
            "company_name": "Uclahealthcareers",
            "skills": "sql"
        },
        {
            "job_id": 1021647,
            "job_title": "Data Analyst (Hybrid/Remote)",
            "salary_year_avg": "217000.0",
            "company_name": "Uclahealthcareers",
            "skills": "crystal"
        },
        {
            "job_id": 1021647,
            "job_title": "Data Analyst (Hybrid/Remote)",
            "salary_year_avg": "217000.0",
            "company_name": "Uclahealthcareers",
            "skills": "oracle"
        },
        {
            "job_id": 1021647,
            "job_title": "Data Analyst (Hybrid/Remote)",
            "salary_year_avg": "217000.0",
            "company_name": "Uclahealthcareers",
            "skills": "tableau"
        },
        {
            "job_id": 1021647,
            "job_title": "Data Analyst (Hybrid/Remote)",
            "salary_year_avg": "217000.0",
            "company_name": "Uclahealthcareers",
            "skills": "flow"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "sql"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "python"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "go"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "snowflake"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "pandas"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "numpy"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "excel"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "tableau"
        },
        {
            "job_id": 168310,
            "job_title": "Principal Data Analyst (Remote)",
            "salary_year_avg": "205000.0",
            "company_name": "SmartAsset",
            "skills": "gitlab"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "sql"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "python"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "azure"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "aws"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "oracle"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "snowflake"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "tableau"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "power bi"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "sap"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "jenkins"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "bitbucket"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "atlassian"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "jira"
        },
        {
            "job_id": 731368,
            "job_title": "Director, Data Analyst - HYBRID",
            "salary_year_avg": "189309.0",
            "company_name": "Inclusively",
            "skills": "confluence"
        },
        {
            "job_id": 310660,
            "job_title": "Principal Data Analyst, AV Performance Analysis",
            "salary_year_avg": "189000.0",
            "company_name": "Motional",
            "skills": "sql"
        },
        {
            "job_id": 310660,
            "job_title": "Principal Data Analyst, AV Performance Analysis",
            "salary_year_avg": "189000.0",
            "company_name": "Motional",
            "skills": "python"
        },
        {
            "job_id": 310660,
            "job_title": "Principal Data Analyst, AV Performance Analysis",
            "salary_year_avg": "189000.0",
            "company_name": "Motional",
            "skills": "r"
        },
        {
            "job_id": 310660,
            "job_title": "Principal Data Analyst, AV Performance Analysis",
            "salary_year_avg": "189000.0",
            "company_name": "Motional",
            "skills": "git"
        },
        {
            "job_id": 310660,
            "job_title": "Principal Data Analyst, AV Performance Analysis",
            "salary_year_avg": "189000.0",
            "company_name": "Motional",
            "skills": "bitbucket"
        },
        {
            "job_id": 310660,
            "job_title": "Principal Data Analyst, AV Performance Analysis",
            "salary_year_avg": "189000.0",
            "company_name": "Motional",
            "skills": "atlassian"
        },
        {
            "job_id": 310660,
            "job_title": "Principal Data Analyst, AV Performance Analysis",
            "salary_year_avg": "189000.0",
            "company_name": "Motional",
            "skills": "jira"
        },
        {
            "job_id": 310660,
            "job_title": "Principal Data Analyst, AV Performance Analysis",
            "salary_year_avg": "189000.0",
            "company_name": "Motional",
            "skills": "confluence"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "sql"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "python"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "go"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "snowflake"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "pandas"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "numpy"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "excel"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "tableau"
        },
        {
            "job_id": 1749593,
            "job_title": "Principal Data Analyst",
            "salary_year_avg": "186000.0",
            "company_name": "SmartAsset",
            "skills": "gitlab"
        },
        {
            "job_id": 387860,
            "job_title": "ERM Data Analyst",
            "salary_year_avg": "184000.0",
            "company_name": "Get It Recruit - Information Technology",
            "skills": "sql"
        },
        {
            "job_id": 387860,
            "job_title": "ERM Data Analyst",
            "salary_year_avg": "184000.0",
            "company_name": "Get It Recruit - Information Technology",
            "skills": "python"
        },
        {
            "job_id": 387860,
            "job_title": "ERM Data Analyst",
            "salary_year_avg": "184000.0",
            "company_name": "Get It Recruit - Information Technology",
            "skills": "r"
        }
    ]
*/