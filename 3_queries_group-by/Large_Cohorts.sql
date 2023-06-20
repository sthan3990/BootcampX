/* 
Get all cohorts with 18 or more students.
*/

SELECT cohorts.name as cohort_name, COUNT(students.*) as student_count
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.*) >= 18
ORDER BY cohorts.name;
