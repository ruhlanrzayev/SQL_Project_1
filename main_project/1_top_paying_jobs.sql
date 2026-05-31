/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
- BONUS: Include company names of top 10 roles
*/

SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;

/*
Here's the breakdown of the top data analyst jobs in 2023:

Mantys is the outlier — at $650K/year, it sits in a class of its own, more than $300K above the next highest offer (Meta at $336K). Whether this is a compensation error in the posting or a very unusual package, it skews the average significantly. Excluding it, the remaining 9 roles average around $220K/year.
Big Tech pays big — Meta's Director of Analytics at $336K and AT&T's Associate Director at $256K confirm that senior, director-level roles at large companies dominate the top end.
Senior titles cluster at $185K–$205K — roles like "Principal Data Analyst" at SmartAsset and "AV Performance Analysis" at Motional suggest a consistent market floor for senior ICs.
All 10 roles were fully remote — 100% listed "Anywhere" as the location, reflecting the post-2022 normalization of remote work for high-paying analytics positions.
Postings were spread across the year — from January (Motional, UCLA Health) through December (Pinterest, Inclusively), with a small cluster in Q3 (August) from SmartAsset and Meta.

Targeting director or principal-level roles at large tech and finance companies (Meta, AT&T, Pinterest, SmartAsset) is the clearest path to $185K+ as a data analyst in 2023 — and all of them were remote.
RESULTS
=======
[
  {
    "job_id": 226942,
    "company_name": "Mantys",
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20"
  },
  {
    "job_id": 547382,
    "company_name": "Meta".
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements".
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09"
  }
]
*/