const { Pool } = require('pg');

const pool = new Pool({
  user: 'steve',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// SQL Injection Protection via Parameterized Query
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
// Store all potentially malicious values in an array.
const queryString = `
SELECT students.id, students.name, cohorts.name AS cohort 
FROM students 
JOIN cohorts ON cohort_id = cohorts.id 
WHERE cohorts.name LIKE $1
LIMIT $2`;

const values = [`%${cohortName}%`, limit];

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    })
  });
