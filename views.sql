-- ##########################################################
-- 1. **basic_information(idnr, name, program, branch):**
--    - Displays information about all students. Branch is allowed to be NULL.
DROP VIEW student_branch_view;

CREATE VIEW student_branch_view AS
    SELECT 
        s.student_code,
        s.first_name,
        s.last_name,
        CONCAT(b.name,' (', b.branch_code, ')') AS branch,
        CONCAT(d.department_name,' (', d.department_code, ')') AS department,
        CONCAT(p.program_name,' (', p.program_code, ')') AS program
        FROM students s
        LEFT JOIN student_branches sb ON s.student_code = sb.student_code
        LEFT JOIN branches b ON b.branch_code = sb.branch_code
        LEFT JOIN departments_relate_programs dp ON sb.program_code = dp.program_code
        INNER JOIN departments d ON dp.department_code = d.department_code
        INNER JOIN programs p on dp.program_code = p.program_code;

SELECT * FROM student_branch_view;

-- ##########################################################
-- 2. **finished_courses(student, course, grade, credits):**
--    - All completed courses for each student, along with grades and credit points.
DROP VIEW student_finished_course_view;

CREATE VIEW student_finished_course_view AS
    SELECT s.student_code, s.first_name, s.last_name,
        c.name as course_name, c.course_code, t.grade,
        (SELECT COUNT(*) FROM student_credit_point where taken_id = t.taken_id) AS credit
    FROM taken t
        INNER JOIN students s ON t.student_code = s.student_code
        INNER JOIN courses c ON  c.course_code = t.course_code
        WHERE t.grade <> NULL OR grade <> 'U';
 
SELECT * FROM student_finished_course_view;



-- 3. **passed_courses(student, course, credits):**
--    - All passed courses for each student.
DROP VIEW student_passed_course_view;

CREATE VIEW student_passed_course_view AS
    SELECT
        s.student_code,
        CONCAT(s.first_name ,' ', s.last_name) AS student_name,
        CONCAT(c.name,' (', c.course_code, ')') AS course,
        (SELECT SUM(point) 
            FROM student_credit_point 
            WHERE taken_id = t.taken_id 
            GROUP BY taken_id
            ) as total_point
        FROM taken t
        INNER JOIN students s ON t.student_code = s.student_code
        INNER JOIN courses c ON  c.course_code = t.course_code
        WHERE c.is_ended = TRUE;
        

SELECT * FROM student_passed_course_view;

-- 4. **registrations(student, course, status):**
--    - All registered and waiting students for different courses. The status can be either 'waiting' or 'registered'.

-- get status either 'waiting' or 'registered'
DROP FUNCTION IF EXISTS fn_taken_course_status;

CREATE FUNCTION fn_taken_course_status(course_code text,student_code text) RETURNS text AS $$
DECLARE message text;
DECLARE is_waiting INT; -- 1 : waiting, 0 : registered
BEGIN
    SELECT COUNT(*) INTO is_waiting
	FROM waiting_list wl
	WHERE wl.course_code = fn_taken_course_status.course_code 
    AND wl.student_code = fn_taken_course_status.student_code;

    CASE 
	WHEN is_waiting = 0 THEN
		message:= 'registered';
	ELSE 
		message:= 'waiting';
	END CASE;
    RETURN message;
END;
$$ LANGUAGE plpgsql; 


-- create view
CREATE VIEW student_register_status AS
    SELECT s.student_code,
    CONCAT(s.first_name ,' ', s.last_name) AS student_name,
    CONCAT(co.name,' (', r.course_code, ')') AS course,
    fn_taken_course_status(r.course_code,r.student_code) as register_status,
    wl.created_date
    FROM registered r
    LEFT JOIN courses co ON co.course_code = r.course_code
    LEFT JOIN students s ON s.student_code = r.student_code
    LEFT JOIN taken t ON t.student_code = r.student_code
    LEFT JOIN waiting_list wl ON wl.student_code = r.student_code;

SELECT * FROM student_register_status;

-- ##########################################################
-- 5. **unread_mandatory(student, course):**
--    - Unread mandatory courses for each student.
-- Create a view for unread mandatory courses

DROP VIEW unread_mandatory_courses;

CREATE VIEW unread_mandatory_courses AS
    SELECT  s.student_code, s.first_name, s.last_name,
        c.name as course_name, c.course_code
    FROM taken t
    INNER JOIN courses c ON c.course_code = t.course_code
    INNER JOIN mandatory_branch mb ON mb.course_code = c.course_code
    LEFT JOIN students s ON s.student_code = t.student_code
    -- WHERE
    --     NOT EXISTS (
    --         SELECT 1
    --         FROM taken ta
    --         WHERE ta.course_code = t.course_code
    --         AND ta.student_code = t.student_code
    --     );


SELECT * FROM unread_mandatory_courses;

-- ##########################################################
-- 6. **course_queue_position(course, student, place):**
--    - All waiting students, ranked in order on the waiting list.  
DROP VIEW range_in_order_waiting_students;

CREATE VIEW range_in_order_waiting_students AS
    SELECT wl.student_code,
        CONCAT(s.first_name ,' ', s.last_name) AS student_name,
        CONCAT(co.name,' (', co.course_code, ')') AS course,
        ROW_NUMBER() OVER (PARTITION BY wl.course_code ORDER BY wl.created_date) AS waiting_queue_number,
        wl.created_date
    FROM waiting_list wl
    LEFT JOIN courses co ON co.course_code = wl.course_code
    LEFT JOIN students s ON s.student_code = wl.student_code
    WHERE co.is_opening = TRUE -- only opening registred comment out if you want to show all
    ORDER BY wl.course_code,wl.created_date;

SELECT * FROM range_in_order_waiting_students;

 


