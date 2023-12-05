-- ------------------------------SECTION 1--------------------------------------------
-- Delete data to start
-- ############################################
DELETE FROM students;
DELETE FROM registered;
DELETE FROM waiting_list;
DELETE FROM taken;
DELETE FROM student_branches; 
DELETE FROM student_credit_point;
DELETE FROM mandatory_branch;
DELETE FROM recommended_branch;


-- ------------------------------SECTION 2--------------------------------------------
-- register students to the course

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
    ('STD00020', 'student20@example.com', 'FirstName20', 'LastName20', 'image_path_20', 'PRO-003'),
     ('STD00021', 'student21@example.com', 'FirstName21', 'LastName21', 'image_path_21', 'PRO-001'),
    ('STD00022', 'student22@example.com', 'FirstName22', 'LastName22', 'image_path_22', 'PRO-002'),
    ('STD00023', 'student23@example.com', 'FirstName23', 'LastName23', 'image_path_23', 'PRO-003'),
    ('STD00024', 'student24@example.com', 'FirstName24', 'LastName24', 'image_path_24', 'PRO-001'),
    ('STD00025', 'student25@example.com', 'FirstName25', 'LastName25', 'image_path_25', 'PRO-002'),
    ('STD00026', 'student26@example.com', 'FirstName26', 'LastName26', 'image_path_26', 'PRO-003'),
    ('STD00027', 'student27@example.com', 'FirstName27', 'LastName27', 'image_path_27', 'PRO-001'),
    ('STD00028', 'student28@example.com', 'FirstName28', 'LastName28', 'image_path_28', 'PRO-002'),
    ('STD00029', 'student29@example.com', 'FirstName29', 'LastName29', 'image_path_29', 'PRO-003'),
    ('STD00030', 'student30@example.com', 'FirstName30', 'LastName30', 'image_path_30', 'PRO-001'),
    ('STD00031', 'student31@example.com', 'FirstName31', 'LastName31', 'image_path_31', 'PRO-002'),
    ('STD00032', 'student32@example.com', 'FirstName32', 'LastName32', 'image_path_32', 'PRO-003'),
    ('STD00033', 'student33@example.com', 'FirstName33', 'LastName33', 'image_path_33', 'PRO-001'),
    ('STD00034', 'student34@example.com', 'FirstName34', 'LastName34', 'image_path_34', 'PRO-002'),
    ('STD00035', 'student35@example.com', 'FirstName35', 'LastName35', 'image_path_35', 'PRO-003'),
    ('STD00036', 'student36@example.com', 'FirstName36', 'LastName36', 'image_path_36', 'PRO-001'),
    ('STD00037', 'student37@example.com', 'FirstName37', 'LastName37', 'image_path_37', 'PRO-002'),
    ('STD00038', 'student38@example.com', 'FirstName38', 'LastName38', 'image_path_38', 'PRO-003'),
    ('STD00039', 'student39@example.com', 'FirstName39', 'LastName39', 'image_path_39', 'PRO-001'),
    ('STD00040', 'student40@example.com', 'FirstName40', 'LastName40', 'image_path_40', 'PRO-002'),
    ('STD00041', 'student41@example.com', 'FirstName41', 'LastName41', 'image_path_41', 'PRO-003'),
    ('STD00042', 'student42@example.com', 'FirstName42', 'LastName42', 'image_path_42', 'PRO-001'),
    ('STD00043', 'student43@example.com', 'FirstName43', 'LastName43', 'image_path_43', 'PRO-002'),
    ('STD00044', 'student44@example.com', 'FirstName44', 'LastName44', 'image_path_44', 'PRO-003'),
    ('STD00045', 'student45@example.com', 'FirstName45', 'LastName45', 'image_path_45', 'PRO-001'),
    ('STD00046', 'student46@example.com', 'FirstName46', 'LastName46', 'image_path_46', 'PRO-002'),
    ('STD00047', 'student47@example.com', 'FirstName47', 'LastName47', 'image_path_47', 'PRO-003'),
    ('STD00048', 'student48@example.com', 'FirstName48', 'LastName48', 'image_path_48', 'PRO-001'),
    ('STD00049', 'student49@example.com', 'FirstName49', 'LastName49', 'image_path_49', 'PRO-002'),
    ('STD00050', 'student50@example.com', 'FirstName50', 'LastName50', 'image_path_50', 'PRO-003');

-- student_branches
INSERT INTO student_branches (student_code, program_code, branch_code) VALUES
    ('STD00001', 'PRO-001', 'BR-001'), ('STD00002', 'PRO-002', 'BR-002'), ('STD00003', 'PRO-003', 'BR-003'), ('STD00004', 'PRO-001', 'BR-001'), ('STD00005', 'PRO-002', 'BR-002'), ('STD00006', 'PRO-003', 'BR-003'), ('STD00007', 'PRO-001', 'BR-001'), ('STD00008', 'PRO-002', 'BR-002'), ('STD00009', 'PRO-003', 'BR-003'), ('STD00010', 'PRO-001', 'BR-001'), ('STD00011', 'PRO-002', 'BR-002'), ('STD00012', 'PRO-003', 'BR-003'), ('STD00013', 'PRO-001', 'BR-001'), ('STD00014', 'PRO-002', 'BR-002'), ('STD00015', 'PRO-003', 'BR-003'), ('STD00016', 'PRO-001', 'BR-001'), ('STD00017', 'PRO-002', 'BR-002'), ('STD00018', 'PRO-003', 'BR-003'), ('STD00019', 'PRO-001', 'BR-001'), ('STD00020', 'PRO-002', 'BR-002'), ('STD00021', 'PRO-003', 'BR-003'), ('STD00022', 'PRO-001', 'BR-001'), ('STD00023', 'PRO-002', 'BR-002'), ('STD00024', 'PRO-003', 'BR-003'), ('STD00025', 'PRO-001', 'BR-001'), ('STD00026', 'PRO-002', 'BR-002'), ('STD00027', 'PRO-003', 'BR-003'), ('STD00028', 'PRO-001', 'BR-001'), ('STD00029', 'PRO-002', 'BR-002'), ('STD00030', 'PRO-003', 'BR-003');
INSERT INTO student_branches (student_code, program_code, branch_code) VALUES
    ('STD00031', 'PRO-001', 'BR-001'), ('STD00032', 'PRO-002', 'BR-002'), ('STD00033', 'PRO-003', 'BR-003'), ('STD00034', 'PRO-001', 'BR-004'), ('STD00035', 'PRO-002', 'BR-005'), ('STD00036', 'PRO-003', 'BR-001'), ('STD00037', 'PRO-001', 'BR-002'), ('STD00038', 'PRO-002', 'BR-003'), ('STD00039', 'PRO-003', 'BR-004'), ('STD00040', 'PRO-001', 'BR-005'), ('STD00041', 'PRO-002', 'BR-001'), ('STD00042', 'PRO-003', 'BR-002'), ('STD00043', 'PRO-001', 'BR-003'), ('STD00044', 'PRO-002', 'BR-004'), ('STD00045', 'PRO-003', 'BR-005'), ('STD00046', 'PRO-001', 'BR-001'), ('STD00047', 'PRO-002', 'BR-002'), ('STD00048', 'PRO-003', 'BR-003'), ('STD00049', 'PRO-001', 'BR-004'), ('STD00050', 'PRO-002', 'BR-005');


-- 1. ## TEST  if student not pass all prerequisites course before register the next course
-- not added into registered
INSERT INTO taken (course_code, student_code,grade) VALUES 
  ('C-001', 'STD00001', '2'),
  ('C-002', 'STD00001', 'U');

-- check all tacken courses
SELECT * FROM taken WHERE student_code = 'STD00001'; 
-- can't register because student didn't pass C-002
INSERT INTO registered (course_code, student_code) VALUES  ('C-003', 'STD00001');
-- check if student didn't pass any courses
SELECT * FROM taken t
WHERE t.student_code = 'STD00001'
AND t.course_code IN 
  (SELECT prerequisites_course as requied 
    FROM  course_prerequisites cp  WHERE cp.course_code = 'C-003')
AND (grade = NULL OR grade = 'U')

-- update C-002 to pass course
UPDATE taken SET grade = '2' 
WHERE course_code = 'C-002' AND student_code = 'STD00001'
-- double check
SELECT * FROM taken WHERE student_code = 'STD00001';
-- check if student didn't pass any courses
SELECT * FROM taken t
WHERE t.student_code = 'STD00001'
AND t.course_code IN 
  (SELECT prerequisites_course as requied 
    FROM  course_prerequisites cp  WHERE cp.course_code = 'C-003')
AND (grade = NULL OR grade = 'U')
-- register again and now student can register to the course
INSERT INTO registered (course_code, student_code) VALUES  ('C-003', 'STD00001');
-- double check, now C-003 has added
SELECT * FROM taken;

-- ------------------------------SECTION 3--------------------------------------------
-- ############################################
-- - A student who has not taken any courses. (STD00001 doesn't show)
SELECT *  FROM students s
WHERE s.student_code 
NOT IN (SELECT student_code FROM taken WHERE student_code = s.student_code )


-- ############################################
-- - A student who has only failed.
INSERT INTO taken (course_code, student_code,grade) VALUES 
  ('C-001', 'STD00002', 'U'),
  ('C-002', 'STD00002', 'U');

SELECT * FROM taken;

-- who has only failed and list of all courses
SELECT t.student_code,
      s.first_name,s.last_name,co.name,co.course_code
FROM students s 
INNER JOIN taken t ON s.student_code = t.student_code
INNER JOIN courses co ON co.course_code = t.course_code
WHERE t.grade = 'U'
  AND NOT EXISTS (
    SELECT 1
    FROM taken t2
    WHERE t2.student_code = t.student_code
      AND t2.grade <> 'U'
  );

-- who has only failed and list only students
SELECT s.*
FROM students s 
INNER JOIN taken t ON s.student_code = t.student_code
INNER JOIN courses co ON co.course_code = t.course_code
WHERE t.grade = 'U'
  AND NOT EXISTS (
    SELECT 1
    FROM taken t2
    WHERE t2.student_code = t.student_code
      AND t2.grade <> 'U'
  )
GROUP BY s.student_code;

-- ############################################
-- - A student who has not chosen any branch.
-- add new students
INSERT INTO students (student_code, email, first_name, last_name, image, program_code) VALUES
    ('STD00051', 'student51@example.com', 'FirstName51', 'LastName51', 'image_path_51', 'PRO-001'),
    ('STD00052', 'student52@example.com', 'FirstName52', 'LastName52', 'image_path_52', 'PRO-002'),
    ('STD00053', 'student53@example.com', 'FirstName53', 'LastName53', 'image_path_53', 'PRO-003'),
    ('STD00054', 'student54@example.com', 'FirstName54', 'LastName54', 'image_path_54', 'PRO-001'),
    ('STD00055', 'student55@example.com', 'FirstName55', 'LastName55', 'image_path_55', 'PRO-002')

SELECT * FROM students s
WHERE (SELECT count(*) FROM student_branches sb
        WHERE s.student_code = sb.student_code) = 0

-- ############################################
-- prerequisites course and opening
SELECT c.course_code as course, cp.prerequisites_course as requied_course,
c.is_opening, is_ended
FROM
  courses c
INNER JOIN
  course_prerequisites cp ON c.course_code = cp.course_code
WHERE
  c.is_opening = TRUE AND c.course_code = 'C-003';


-- ------------------------------SECTION 4--------------------------------------------
-- limit students and waiting list
-- ############################################
-- - A waiting list can only exist for courses with limited seats.

-- LIST courses has limit 
SELECT * FROM limited_courses wl;
 
-- register student to course C-004
INSERT INTO registered (course_code, student_code)
VALUES
  ('C-004', 'STD00001'), 
  ('C-004', 'STD00002'), 
  ('C-004', 'STD00003'), 
  ('C-004', 'STD00004'), 
  ('C-004', 'STD00005'), 
  ('C-004', 'STD00006'), 
  ('C-004', 'STD00007'), 
  ('C-004', 'STD00008'), 
  ('C-004', 'STD00009'), 
  ('C-004', 'STD00010'), 
  ('C-004', 'STD00011'), 
  ('C-004', 'STD00012'), 
  ('C-004', 'STD00013'), 
  ('C-004', 'STD00014'), 
  ('C-004', 'STD00015'), 
  ('C-004', 'STD00016'), 
  ('C-004', 'STD00017'), 
  ('C-004', 'STD00018'), 
  ('C-004', 'STD00019'), 
  ('C-004', 'STD00020'), 
  ('C-004', 'STD00021'), 
  ('C-004', 'STD00022'), 
  ('C-004', 'STD00023'), 
  ('C-004', 'STD00024'), 
  ('C-004', 'STD00025'), 
  ('C-004', 'STD00026'), 
  ('C-004', 'STD00027'), 
  ('C-004', 'STD00028'), 
  ('C-004', 'STD00029'), 
  ('C-004', 'STD00030');

-- CHECK for register student
SELECT count(*) as registered FROM registered;

SELECT count(*) as waiting_list FROM waiting_list;

SELECT count(*) as taken FROM taken;

SELECT * FROM registered WHERE course_code = 'C-004';
SELECT * FROM waiting_list WHERE course_code = 'C-004';
SELECT * FROM taken WHERE course_code = 'C-004';

-- waiting list queue 
SELECT
  course_code,
  student_code,
  created_date,
  ROW_NUMBER() OVER (PARTITION BY course_code ORDER BY created_date) AS waiting_queue_number
FROM
  waiting_list
  WHERE course_code = 'C-004'
ORDER BY created_date;

--C-004	STD00011
-- TEST  
-- Remove the last record in taken table -- C-004	STD00010
-- registered trigger function  when a taken record is deleted
DELETE FROM taken WHERE taken_id = (SELECT taken_id FROM taken
                                    WHERE course_code = 'C-004'
                                    ORDER BY taken_id DESC LIMIT 1);
-- C-004	STD00010 added to taken
SELECT * FROM taken WHERE course_code = 'C-004' ORDER BY taken_id DESC LIMIT 1;

-- C-004	STD00010 has removed from waiting_list
SELECT
  course_code,
  student_code,
  created_date,
  ROW_NUMBER() OVER (PARTITION BY course_code ORDER BY created_date) AS waiting_queue_number
FROM
  waiting_list
  WHERE course_code = 'C-004'
ORDER BY created_date;

-- ------------------------------SECTION 5--------------------------------------------

-- ############################################
-- ## Student and Credit Point

-- set is_opening = FALSE
UPDATE courses SET is_opening = FALSE
WHERE course_code = 'C-004'
-- check opening status
SELECT * FROM courses WHERE course_code = 'C-004';
-- check students have taken C-004
SELECT * FROM taken WHERE course_code = 'C-004';

-- ** Opps : taken_id in table taken  need to match with taken_id in table student_credit_point 
-- insert credit points of students who registered C-004 
INSERT INTO student_credit_point (taken_id, point)
VALUES
  (6, 25),(6, 20),(6, 15),(6, 25),
  (7, 29),(7, 18),(7, 25),(7, 22),
  (8, 10),(8, 19),(8, 23),(8, 17),
  (9, 25),(9, 24),(9, 25),(9, 25),
  (10, 22),(10, 25),(10, 19),(10, 23),
  (11, 25),(11, 24),(11, 18),(11, 15),
  (12, 25),(12, 25),(12, 25),(12, 25),
  (13, 24),(13, 21),(13, 25),(13, 25),
  (14, 25),(14, 25),(14, 13),(14, 25);

-- summary points with no grade
SELECT t.taken_id, c.course_code, s.student_code,
   c.name as course_name, CONCAT(s.first_name ,' ', s.last_name) AS student_name,
   (SELECT SUM(point) 
      FROM student_credit_point 
      WHERE taken_id = t.taken_id 
      GROUP BY taken_id
    ) as total_point, grade
FROM taken t
INNER JOIN courses c ON c.course_code = t.course_code 
INNER JOIN students s ON s.student_code = t.student_code
WHERE t.course_code = 'C-004';

-- set is_ended = TRUE
UPDATE courses SET is_ended = TRUE
WHERE course_code = 'C-004'

-- get student, course, summary of credit point
SELECT t.taken_id, c.course_code, s.student_code,
   c.name as course_name, CONCAT(s.first_name ,' ', s.last_name) AS student_name,
   (SELECT SUM(point) 
      FROM student_credit_point 
      WHERE taken_id = t.taken_id 
      GROUP BY taken_id
    ) as total_point, grade
FROM taken t
INNER JOIN courses c ON c.course_code = t.course_code 
INNER JOIN students s ON s.student_code = t.student_code
WHERE t.course_code = 'C-004';

-- Now run app.py to se the list of student grade who registered in course C-004


-- ------------------------------SECTION 6--------------------------------------------
-- ############################################
-- get mandatory course that students must take

-- insert sample mandatory_branch
INSERT INTO mandatory_branch (course_code, program_code, branch_code) VALUES
    ('C-005', 'PRO-002', 'BR-002'),
    ('C-006', 'PRO-003', 'BR-003'); 
-- get curses that the student must take
SELECT c.* FROM courses c 
  INNER JOIN mandatory_branch mb ON c.course_code = mb.course_code
 
-- get students who will be auto registered to the mandatory course
SELECT c.course_code,sb.student_code FROM courses c 
  INNER JOIN mandatory_branch mb ON c.course_code = mb.course_code
  INNER JOIN student_branches sb ON mb.branch_code = sb.branch_code

-- auto registering students who are belong to the mandatory branch 
SELECT * 
FROM mandatory_branch, 
    fn_auto_registering_for_mandatory_branch(branch_code);

-- check mandatory courses registered
SELECT t.* 
FROM taken t 
INNER JOIN mandatory_branch mb on t.course_code = mb.course_code
ORDER BY t.student_code 

-- ############################################
-- get recommended branch
-- insert sample date 
INSERT INTO recommended_branch (course_code, program_code, branch_code) VALUES
    ('C-007', 'PRO-001', 'BR-001'), 
    ('C-008', 'PRO-002', 'BR-002'), 
    ('C-009', 'PRO-003', 'BR-003');

-- get curses which 
SELECT c.* FROM courses c 
INNER JOIN recommended_branch mb ON c.course_code = mb.course_code

