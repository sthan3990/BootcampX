/*
Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.

    Select the name of the student, their average completion time, and the average suggested completion time.
    Order by average completion time from smallest to largest.
    Only get currently enrolled students.
    This will require data from students, assignment_submissions, and assignments.

*/

SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration, AVG(assignments.duration) as average_estimated_duration 
FROM students 
JOIN assignments ON assignments.id = students.id
JOIN assignment_submissions ON assignment_id = assignment_submissions.id
WHERE students.end_date IS NULL  
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY AVG(assignments.duration) DESC;
