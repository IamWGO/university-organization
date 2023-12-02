-- ## drop views and functions before deleting tables
-- 1. **basic_information(idnr, name, program, branch):**
DROP VIEW IF EXISTS student_branch_view;

-- 2. **finished_courses(student, course, grade, credits):**
DROP VIEW IF EXISTS student_finished_course_view;

-- 3. **passed_courses(student, course, credits):**
DROP VIEW IF EXISTS student_finished_course_view;

-- 4. **registrations(student, course, status):**
DROP VIEW IF EXISTS student_register_status;
DROP FUNCTION IF EXISTS taken_course_status(text, text);

-- 5. **unread_mandatory(student, course):**
DROP VIEW IF EXISTS unread_mandatory_courses; 

-- 6. **course_queue_position(course, student, place):**  
DROP VIEW IF EXISTS range_in_order_waiting_students;


-- ## Drop foreign key constraints
ALTER TABLE student_credit_point DROP CONSTRAINT IF EXISTS student_credit_point_taken_id_fkey;
ALTER TABLE branches DROP CONSTRAINT IF EXISTS branches_program_code_fkey;
ALTER TABLE classified DROP CONSTRAINT IF EXISTS classified_course_code_fkey;
ALTER TABLE limited_courses DROP CONSTRAINT IF EXISTS limited_courses_course_code_fkey;
ALTER TABLE mandatory_branch DROP CONSTRAINT IF EXISTS mandatory_branch_branch_code_fkey;
ALTER TABLE mandatory_branch DROP CONSTRAINT IF EXISTS mandatory_branch_course_code_fkey;
ALTER TABLE mandatory_program DROP CONSTRAINT IF EXISTS mandatory_program_course_code_fkey;
ALTER TABLE mandatory_program DROP CONSTRAINT IF EXISTS mandatory_program_program_code_fkey;
ALTER TABLE recommended_branch DROP CONSTRAINT IF EXISTS recommended_branch_branch_code_fkey;
ALTER TABLE recommended_branch DROP CONSTRAINT IF EXISTS recommended_branch_course_code_fkey;
ALTER TABLE recommended_branch DROP CONSTRAINT IF EXISTS recommended_branch_program_code_fkey;
ALTER TABLE registered DROP CONSTRAINT IF EXISTS registered_course_code_fkey;
ALTER TABLE registered DROP CONSTRAINT IF EXISTS registered_student_code_fkey;
ALTER TABLE taken DROP CONSTRAINT IF EXISTS taken_course_code_fkey;
ALTER TABLE taken DROP CONSTRAINT IF EXISTS taken_student_code_fkey;
ALTER TABLE waiting_list DROP CONSTRAINT IF EXISTS waiting_list_course_code_fkey;
ALTER TABLE waiting_list DROP CONSTRAINT IF EXISTS waiting_list_student_code_fkey;

-- DROP tables
DROP TABLE IF EXISTS student_credit_point;
DROP TABLE IF EXISTS limited_courses;
DROP TABLE IF EXISTS mandatory_branch;
DROP TABLE IF EXISTS mandatory_program;
DROP TABLE IF EXISTS recommended_branch;
DROP TABLE IF EXISTS registered;
DROP TABLE IF EXISTS taken;
DROP TABLE IF EXISTS waiting_list;
DROP TABLE IF EXISTS course_prerequisites;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS student_branches;
DROP TABLE IF EXISTS branches;
DROP TABLE IF EXISTS classified;
DROP TABLE IF EXISTS classifications;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments_relate_programs;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS programs;

