const { Pool } = require('pg');

const pool = new Pool({
  user: 'steve',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// SQL Injection Protection via Parameterized Query
const cohortName = process.argv[2];

// Store all potentially malicious values in an array.
const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teacher`;

const values = [`%${cohortName}%`];

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort} cohort: ${user.teacher}`);
    })
  });
