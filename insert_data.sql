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
  ('C-006', 'Thermodynamics', 100, TRUE, FALSE, 'DEP-003');

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
    ('SEMINAR', 'C-006');


-- Limited courses  limit 5 students 
INSERT INTO limited_courses (capacity, course_code)
VALUES
  (5,'C-001'),
  (5,'C-003'),
  (5,'C-004');

-- course prerequisites
INSERT INTO course_prerequisites (course_code, prerequisites_course) VALUES
    ('C-003', 'C-001'),
    ('C-003', 'C-002');


-- sample 50 rows students and student_branches 
-- Students
INSERT INTO students (student_code, email, first_name, last_name, image, program_code) VALUES
    ('STD00001', 'student01@example.com', 'FirstName01', 'LastName01', 'image_path_01', 'PRO-001'),
    ('STD00002', 'student02@example.com', 'FirstName02', 'LastName02', 'image_path_02', 'PRO-002'),
    ('STD00003', 'student03@example.com', 'FirstName03', 'LastName03', 'image_path_03', 'PRO-003'),
    ('STD00004', 'student04@example.com', 'FirstName04', 'LastName04', 'image_path_04', 'PRO-001'),
    ('STD00005', 'student05@example.com', 'FirstName05', 'LastName05', 'image_path_05', 'PRO-002'),
    ('STD00006', 'student06@example.com', 'FirstName06', 'LastName06', 'image_path_06', 'PRO-003'),
    ('STD00007', 'student07@example.com', 'FirstName07', 'LastName07', 'image_path_07', 'PRO-001'),
    ('STD00008', 'student08@example.com', 'FirstName08', 'LastName08', 'image_path_08', 'PRO-002'),
    ('STD00009', 'student09@example.com', 'FirstName09', 'LastName09', 'image_path_09', 'PRO-003'),
    ('STD00010', 'student10@example.com', 'FirstName10', 'LastName10', 'image_path_10', 'PRO-001'),
    ('STD00011', 'student11@example.com', 'FirstName11', 'LastName11', 'image_path_11', 'PRO-003'),
    ('STD00012', 'student12@example.com', 'FirstName12', 'LastName12', 'image_path_12', 'PRO-001'),
    ('STD00013', 'student13@example.com', 'FirstName13', 'LastName13', 'image_path_13', 'PRO-002'),
    ('STD00014', 'student14@example.com', 'FirstName14', 'LastName14', 'image_path_14', 'PRO-003'),
    ('STD00015', 'student15@example.com', 'FirstName15', 'LastName15', 'image_path_15', 'PRO-001'),
    ('STD00016', 'student16@example.com', 'FirstName16', 'LastName16', 'image_path_16', 'PRO-002'),
    ('STD00017', 'student17@example.com', 'FirstName17', 'LastName17', 'image_path_17', 'PRO-003'),
    ('STD00018', 'student18@example.com', 'FirstName18', 'LastName18', 'image_path_18', 'PRO-001'),
    ('STD00019', 'student19@example.com', 'FirstName19', 'LastName19', 'image_path_19', 'PRO-002'),
    ('STD00020', 'student20@example.com', 'FirstName20', 'LastName20', 'image_path_20', 'PRO-003');

-- student_branches
INSERT INTO student_branches (student_code, program_code, branch_code) VALUES
    ('STD00001', 'PRO-001', 'BR-001'), ('STD00002', 'PRO-002', 'BR-002'),
    ('STD00003', 'PRO-003', 'BR-003'), ('STD00004', 'PRO-001', 'BR-001'), 
    ('STD00005', 'PRO-002', 'BR-002'), ('STD00006', 'PRO-003', 'BR-003'), 
    ('STD00007', 'PRO-001', 'BR-001'), ('STD00008', 'PRO-002', 'BR-002'), 
    ('STD00009', 'PRO-003', 'BR-003'), ('STD00010', 'PRO-001', 'BR-001'), 
    ('STD00011', 'PRO-002', 'BR-002'), ('STD00012', 'PRO-003', 'BR-003'), 
    ('STD00013', 'PRO-001', 'BR-001'), ('STD00014', 'PRO-002', 'BR-002'), 
    ('STD00015', 'PRO-003', 'BR-003'), ('STD00016', 'PRO-001', 'BR-001'), 
    ('STD00017', 'PRO-002', 'BR-002'), ('STD00018', 'PRO-003', 'BR-003'), 
    ('STD00019', 'PRO-001', 'BR-001'), ('STD00020', 'PRO-002', 'BR-002');

 
