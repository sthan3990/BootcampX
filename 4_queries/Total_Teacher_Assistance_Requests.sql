/* 
Get the total number of assistance_requests for a teacher.
Select the teacher's name and the total assistance requests
*/

SELECT COUNT(assistance_requests.*), teachers.name as name 
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY name;