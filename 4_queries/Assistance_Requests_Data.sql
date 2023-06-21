/*
Assistance_Requests_Data

    Select the teacher's name, student's name, assignment's name if it has one, and the duration of each assistance request.
    Subtract completed_at by started_at to find the duration.
    Order by the duration of the request.

*/

SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment, (completed_at - created_at) AS duration 
FROM assistance_requests 
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
ORDER BY duration;