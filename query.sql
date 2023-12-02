-- - Two branches with the same name but on different programs.
INSERT INTO program (program_code, program_name)
VALUES 
  ('PRG001', 'Bachelor of Computer Science'),
  ('PRG002', 'Bachelor of Electrical Engineering'),
  ('PRG003', 'Bachelor of Mechanical Engineering');

INSERT INTO branches (branch_code, name, program_code) VALUES
    ('BR001', 'Branch 1', 'PRG001'),
    ('BR002', 'Branch 1', 'PRG002');
DELETE FROM program;
DELETE FROM branches;

-- - A student who has not taken any courses.
SELECT students.*
FROM students
LEFT JOIN taken ON students.student_code = taken.student_code
WHERE taken.taken_id IS NULL;

-- - A student who has only failed.
SELECT DISTINCT s.student_code, s.first_name, s.last_name
FROM students s
JOIN taken t ON s.student_code = t.student_code
WHERE t.grade = 'U'
  AND NOT EXISTS (
    SELECT 1
    FROM taken t2
    WHERE t2.student_code = s.student_code
      AND t2.grade <> 'U'
  );


-- - A student who has not chosen any branch.
SELECT * FROM students s
WHERE (SELECT count(*) FROM student_branches sb
        WHERE s.student_code = sb.student_code) = 0

-- - A waiting list can only exist for courses with limited seats.
INSERT INTO waiting_list (course_code, student_code, created_date)
SELECT c.course_code, 'student123', NOW()
FROM courses c
JOIN limited_courses lc ON c.course_code = lc.course_code
WHERE (
    SELECT COUNT(*) 
    FROM taken t 
    WHERE t.course_code = c.course_code AND t.grade = 'U'
) >= lc.capacity;



-- - And so on...
