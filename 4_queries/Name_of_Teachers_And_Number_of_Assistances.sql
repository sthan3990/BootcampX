/*
We need to know which teachers actually assisted students during any cohort, and how many assistances they did for that cohort.
Instruction

  Perform the same query as before, but include the number of assistances as well.

*/

SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests.id) AS total_assistances 
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;

SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;
