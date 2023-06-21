/*
    Select the student's name and the total assistance requests.
    Since this query needs to work with any specific student name, use 'Elliot Dickinson' for the student's name here.

Get the total number of assistance_requests for a student.

*/
SELECT COUNT(assistance_requests.*), students.name AS name 
FROM students
JOIN assistance_requests ON student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY name;