SELECT
    AVG(salary_year_avg) as average_year,
    AVG(salary_hour_avg) as average_hour,
    job_schedule_type
FROM
    job_postings_fact
WHERE job_posted_date::DATE > '2023-06-01'
GROUP BY
    job_schedule_type;


    