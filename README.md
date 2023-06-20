# BootcampX

# Creating the databases 

# assignment will have the following attributes:

    id: A unique identifier
    name: The name of the assignment
    content: The written content body of the assignment
    day: The day that the assignment appears on
    chapter: The order that the assignment will appear in the day.
    duration: The average time it takes a student to finish

CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);


# Assignment_submission will have the following attributes:

    id: A unique identifier
    assignment_id: The id of the assignment
    student_id: The id of the student
    duration: The time it took the student to complete the assignment
    submission_date: The date is was submitted

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);

# A teacher will have the following attributes:

    id: A unique identifier
    name: The name of the teacher
    start_date: The date that the teacher started working.
    end_date: The date that the teacher stopped working.
    is_active: If the teacher is actively teaching right now.

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE
  end_date DATE 
  is_active BOOLEAN DEFAULT TRUE,
);



# An assistance_request will have the following attributes:

    id: A unique identifier
    assignment_id: The id of the assignment the request was made from
    student_id: The id of the student making the request
    teacher_id: The id of the teacher responding to the request
    created_at: The timestamp when the request was made
    started_at: The timestamp when the assistance started
    completed_at: The timestamp when the assistance was completed
    student_feedback: Feedback about the student given by the teacher
    teacher_feedback: Feedback about the teacher given by the student

CREATE TABLE assistance_request (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
  created_at TIMESTAMP, 
  started_at  TIMESTAMP,
  completed_at TIMESTAMP,
  student_feedback TEXT,
  teacher_feedback TEXT,
);


#
#
#
#
#
#
#