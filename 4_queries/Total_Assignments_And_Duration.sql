/*

We need to be able to see the number of assignments that each day has and the total duration of assignments for each day.
Instruction

Get each day with the total number of assignments and the total duration of the assignments.

*/

SELECT day, COUNT(*) as number_of_assignments, SUM(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;