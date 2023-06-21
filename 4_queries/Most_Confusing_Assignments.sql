/*
We need to know which assignments are causing the most assistance requests.
Instruction

List each assignment with the total number of assistance requests with it.

*/

SELECT assignments.id AS id, assignments.name AS name, day, chapter, COUNT(assistance_requests) AS total_request 
FROM assignments
JOIN assistance_requests 
  ON assignments.id = assignment_id
GROUP BY assignments.id;
ORDER BY total_requests DESC;