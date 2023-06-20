/*
Get the total number of assignment submissions for each cohort.
*/

SELECT cohorts.name as cohort_name, COUNT(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON cohorts.id = cohort_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;