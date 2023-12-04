-- not included ables below 
--  students;
--  registered;
--  waiting_list;
--  taken;
--  student_branches; 

-- Departments
INSERT INTO departments (department_code, department_name) VALUES
  ('DEP-001', 'Computer Science'),
  ('DEP-002', 'Electrical Engineering'),
  ('DEP-003', 'Mechanical Engineering');

-- Programs
INSERT INTO programs (program_code, program_name) VALUES
  ('PRO-001', 'Bachelor of Computer Science'),
  ('PRO-002', 'Bachelor of Electrical Engineering'),
  ('PRO-003', 'Bachelor of Mechanical Engineering');

-- Insert data into the departments_relate_programs table
INSERT INTO departments_relate_programs (department_code, program_code)
VALUES 
  ('DEP-001', 'PRO-001'),
  ('DEP-002', 'PRO-002'),
  ('DEP-003', 'PRO-003');

-- Branches
-- ** Two branches with the same name but on different programs.
INSERT INTO branches (branch_code, name, program_code)
VALUES
  ('BR-001', 'Branch 1', 'PRO-001'),
  ('BR-002', 'Branch 1', 'PRO-002'),
  ('BR-003', 'Branch 3', 'PRO-001'),
  ('BR-004', 'Branch 4', 'PRO-003'),
  ('BR-005', 'Branch 5', 'PRO-002');

-- Courses
INSERT INTO courses (course_code, name, credits, is_opening, is_ended, department_code) VALUES
  ('C-001', 'Introduction to Programming', 100, TRUE, FALSE, 'DEP-001'),
  ('C-002', 'Digital Circuits', 100, TRUE, FALSE, 'DEP-002'),
  ('C-003', 'Mechanics 101', 100, TRUE, FALSE, 'DEP-003'),
  ('C-004', 'Database Management', 100, TRUE, FALSE, 'DEP-001'),
  ('C-005', 'Electromagnetic Fields', 100, TRUE, FALSE, 'DEP-002'),
  ('C-006', 'Thermodynamics', 100, TRUE, FALSE, 'DEP-003'),
  ('C-007', 'Software Engineering', 100, TRUE, FALSE, 'DEP-001'),
  ('C-008', 'Control Systems', 100, TRUE, FALSE, 'DEP-002'),
  ('C-009', 'Materials Science', 100, TRUE, FALSE, 'DEP-003'),
  ('C-010', 'Algorithms and Data Structures', 100, TRUE, FALSE, 'DEP-001');

INSERT INTO classifications (classified_code, name) VALUES
    ('MATH', 'mathematical courses'),
    ('RESEARCH', 'research courses'),
    ('SEMINAR', 'seminar courses');

INSERT INTO classified (classified_code, course_code) VALUES
    ('MATH', 'C-001'),
    ('RESEARCH', 'C-002'),
    ('SEMINAR', 'C-003'),
    ('MATH', 'C-004'),
    ('RESEARCH', 'C-005'),
    ('SEMINAR', 'C-006'),
    ('MATH', 'C-007'),
    ('RESEARCH', 'C-008'),
    ('SEMINAR', 'C-009'),
    ('MATH', 'C-010');


-- Limited courses
INSERT INTO limited_courses (capacity, course_code)
VALUES
  (10,'C-001'),
  (10,'C-003'),
  (10,'C-004'),
  (10,'C-005'),
  (10,'C-006'),
  (10,'C-007'),
  (10,'C-010');

-- course prerequisites
INSERT INTO course_prerequisites (course_code, prerequisites_course) VALUES
    ('C-003', 'C-001'),
    ('C-003', 'C-002'),
    ('C-010', 'C-009');

