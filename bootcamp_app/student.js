const { Pool } = require('pg');

const pool = new Pool({
  user: 'steve',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

console.log(process.argv);

pool.query(`
SELECT students.id, students.name, cohorts.name AS cohort
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${process.argv[3]}%'
LIMIT ${process.argv[4] || 5}
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
  })
});
