/*

We need to be able to see the total amount of time being spent on an assistance request for each cohort. This number will tell use how much time is being spent on assistance requests for each cohort.

Get the total duration of all assistance requests for each cohort.

*/

SELECT cohorts.name AS cohort, SUM(completed_at-started_at) AS total_duration 
FROM assistance_requests
JOIN students 
  ON student_id = students.id 
JOIN cohorts 
  ON cohort_id = cohorts.id
GROUP BY cohort
ORDER BY total_duration;