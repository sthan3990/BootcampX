-- Get the names of all of the students from a single cohort.

SELECTect id, name FROM students WHERE cohort_id = 1 ORDER BY name ASC;

-- Select the total number of students who were in the first 3 cohorts.

SELECT COUNT(id) FROM students WHERE cohort_id IN (1,2,3);


-- Get all of the students that don't have an email or phone number.

SELECT name, id, cohort_id FROM students WHERE email is NULL OR phone is NULL;

-- Get all of the students without a gmail.com account and a phone number.

SELECT name, email, id, cohort_id FROM students WHERE email NOT LIKE '%gmail%' AND phone is NULL;

-- Get all of the students currently enrolled.
SELECT name, id, cohort_id FROM students WHERE end_date IS NULL ORDER BY cohort_id ASC;

-- Get all graduates without a linked Github account.
SELECT name, email, phone FROM students WHERE end_date IS NOT NULL AND github IS NULL ORDER BY name ASC;
