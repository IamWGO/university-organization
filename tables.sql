CREATE TABLE IF NOT EXISTS departments (
  department_code VARCHAR(10) PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS programs (
  program_code VARCHAR(10) PRIMARY KEY,
  program_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS departments_relate_programs (
  department_code VARCHAR(10) NOT NULL,
  program_code VARCHAR(10) NOT NULL,
  UNIQUE (department_code, program_code),
  FOREIGN KEY (department_code)  REFERENCES departments(department_code),
  FOREIGN KEY (program_code)  REFERENCES programs(program_code)
);

CREATE TABLE IF NOT EXISTS branches (
  branch_code VARCHAR(10) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  program_code VARCHAR(10) NOT NULL,
  UNIQUE (branch_code, program_code),
  FOREIGN KEY (program_code)  REFERENCES programs(program_code)
);


CREATE TABLE IF NOT EXISTS courses (
  course_code VARCHAR(6) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  credits INT,
  is_opening BOOLEAN,
  is_ended BOOLEAN,
  department_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (department_code) REFERENCES departments(department_code)
);

CREATE TABLE IF NOT EXISTS limited_courses (
  capacity INT,
  course_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (course_code)  REFERENCES courses(course_code)
);

CREATE TABLE IF NOT EXISTS classifications (
  classified_code VARCHAR(10) PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS classified (
  classified_code VARCHAR(10) NOT NULL,
  course_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (classified_code)  REFERENCES classifications(classified_code),
  FOREIGN KEY (course_code)  REFERENCES courses(course_code)
);

CREATE TABLE IF NOT EXISTS students (
  student_code VARCHAR(10) PRIMARY KEY,
  email varchar(100) NOT NULL,
  first_name varchar(100),
  last_name varchar(100),
  image varchar(255),
  program_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (program_code)  REFERENCES programs(program_code)
);

CREATE TABLE IF NOT EXISTS student_branches (
  student_code VARCHAR(10) PRIMARY KEY,
  program_code VARCHAR(10) NOT NULL,
  branch_code VARCHAR(10) NOT NULL,
  UNIQUE (student_code,program_code, branch_code),
  FOREIGN KEY (program_code)  REFERENCES programs(program_code),
  FOREIGN KEY (branch_code)  REFERENCES branches(branch_code)
);

CREATE TABLE IF NOT EXISTS mandatory_program (
  program_code VARCHAR(10) NOT NULL,
  course_code VARCHAR(10) NOT NULL,
  UNIQUE (program_code, course_code),
  FOREIGN KEY (program_code)  REFERENCES programs(program_code),
  FOREIGN KEY (course_code)  REFERENCES courses(course_code)
);

CREATE TABLE IF NOT EXISTS mandatory_branch (
  course_code VARCHAR(10) NOT NULL,
  program_code VARCHAR(10) NOT NULL,
  branch_code VARCHAR(10) NOT NULL,
  UNIQUE (program_code, branch_code,course_code),
  FOREIGN KEY (program_code)  REFERENCES programs(program_code),
  FOREIGN KEY (course_code)  REFERENCES courses(course_code),
  FOREIGN KEY (branch_code)  REFERENCES branches(branch_code)
);

CREATE TABLE IF NOT EXISTS recommended_branch (
  course_code VARCHAR(10) NOT NULL,
  program_code VARCHAR(10) NOT NULL,
  branch_code VARCHAR(10) NOT NULL,
  UNIQUE (program_code, branch_code,course_code),
  FOREIGN KEY (program_code)  REFERENCES programs(program_code),
  FOREIGN KEY (course_code)  REFERENCES courses(course_code),
  FOREIGN KEY (branch_code)  REFERENCES branches(branch_code)
);

-- Section 2
CREATE TABLE IF NOT EXISTS registered (
  course_code VARCHAR(10) NOT NULL,
  student_code VARCHAR(10) NOT NULL,
  UNIQUE (course_code, student_code),
  FOREIGN KEY (course_code)  REFERENCES courses(course_code),
  FOREIGN KEY (student_code)  REFERENCES students(student_code)
);

CREATE TABLE IF NOT EXISTS taken (
  taken_id SERIAL PRIMARY KEY,
  course_code VARCHAR(10) NOT NULL,
  student_code VARCHAR(10) NOT NULL,
  grade VARCHAR(1),
  UNIQUE (course_code, student_code),
  FOREIGN KEY (course_code)  REFERENCES courses(course_code),
  FOREIGN KEY (student_code)  REFERENCES students(student_code)
);

CREATE TABLE IF NOT EXISTS student_credit_point (
  taken_id SERIAL NOT NULL,
  point INT,
  FOREIGN KEY (taken_id)  REFERENCES taken(taken_id)
);

CREATE TABLE IF NOT EXISTS course_prerequisites (
  course_code VARCHAR(10) NOT NULL,
  prerequisites_course VARCHAR(6) NOT NULL,
  FOREIGN KEY (course_code)  REFERENCES courses(course_code),
  FOREIGN KEY (prerequisites_course)  REFERENCES courses(course_code)
);

CREATE TABLE IF NOT EXISTS waiting_list (
  course_code VARCHAR(10) NOT NULL,
  student_code VARCHAR(10) NOT NULL,
  created_date TIMESTAMP,
  UNIQUE (course_code, student_code),
  FOREIGN KEY (course_code)  REFERENCES courses(course_code),
  FOREIGN KEY (student_code)  REFERENCES students(student_code)
);

-- Add indexes for foreign key columns
CREATE INDEX IF NOT EXISTS idx_program_code ON departments_relate_programs(program_code);
CREATE INDEX IF NOT EXISTS idx_program_code_branch ON branches(program_code);
CREATE INDEX IF NOT EXISTS idx_department_code_courses ON courses(department_code);
CREATE INDEX IF NOT EXISTS idx_course_code_limited_courses ON limited_courses(course_code);
CREATE INDEX IF NOT EXISTS idx_program_code_student_branches ON student_branches(program_code);
CREATE INDEX IF NOT EXISTS idx_branch_code_student_branches ON student_branches(branch_code);
CREATE INDEX IF NOT EXISTS idx_course_code_classified ON classified(course_code);
CREATE INDEX IF NOT EXISTS idx_program_code_mandatory_program ON mandatory_program(program_code);
CREATE INDEX IF NOT EXISTS idx_course_code_mandatory_program ON mandatory_program(course_code);
CREATE INDEX IF NOT EXISTS idx_program_code_branch_mandatory_branch ON mandatory_branch(program_code, branch_code);
CREATE INDEX IF NOT EXISTS idx_course_code_mandatory_branch ON mandatory_branch(course_code);
CREATE INDEX IF NOT EXISTS idx_program_code_branch_recommended_branch ON recommended_branch(program_code, branch_code);
CREATE INDEX IF NOT EXISTS idx_course_code_recommended_branch ON recommended_branch(course_code);
CREATE INDEX IF NOT EXISTS idx_program_code_students ON students(program_code);
CREATE INDEX IF NOT EXISTS idx_course_code_registered ON registered(course_code);
CREATE INDEX IF NOT EXISTS idx_course_code_taken ON taken(course_code);
CREATE INDEX IF NOT EXISTS idx_student_code_taken ON taken(student_code);
CREATE INDEX IF NOT EXISTS idx_taken_id_student_credit_point ON student_credit_point(taken_id);
CREATE INDEX IF NOT EXISTS idx_course_code_prerequisites ON course_prerequisites(course_code);
CREATE INDEX IF NOT EXISTS idx_prerequisites_course_prerequisites ON course_prerequisites(prerequisites_course);
CREATE INDEX IF NOT EXISTS idx_course_code_waiting_list ON waiting_list(course_code);
CREATE INDEX IF NOT EXISTS idx_student_code_waiting_list ON waiting_list(student_code);
