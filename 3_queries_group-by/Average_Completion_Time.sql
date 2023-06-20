/*
Get currently enrolled students' average assignment completion time.
    Select the students name and average time from assignment submissions.
    Order the results from greatest duration to least greatest duration.
    A student will have a null end_date if they are currently enrolled
*/

SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration 
FROM students 
JOIN assignment_submissions ON students_id = student.id 
WHERE students.end_date IS null
GROUP BY students.name
ORDER by average_assignment_duration DESC;
