-- ## Trigger for register student
CREATE OR REPLACE FUNCTION fn_insert_register_or_wait()
RETURNS TRIGGER AS $$
DECLARE
  current_taken INT;
  current_capacity INT;
BEGIN
    -- BEGIN
    -- CHECK - return if program has started
    IF EXISTS (
        SELECT 1 FROM courses c
        WHERE is_opening = FALSE
        AND course_code = NEW.course_code
    ) THEN 
        RAISE NOTICE 'course has not started yet : %', NEW.course_code;
        RETURN NULL;
    END IF; 

    -- CHECK - return if student not pass all prerequisites course before register the next course
    IF EXISTS (
        SELECT 1 FROM taken t
        WHERE t.student_code = NEW.student_code
        AND t.course_code IN 
        (SELECT prerequisites_course as requied 
            FROM  course_prerequisites cp  WHERE cp.course_code = NEW.course_code)
        AND (grade = NULL OR grade = 'U')
    ) THEN 
        RAISE NOTICE 'student not pass all prerequisites course: %', NEW.student_code;
        RETURN NULL;
    END IF; 

    -- CHECK - register if the course has no limit registered
    IF NOT EXISTS (
        SELECT 1
        FROM limited_courses wl
        WHERE wl.course_code = NEW.course_code
    ) THEN 
        RAISE NOTICE 'register to the course has no limit registered: %', NEW.student_code;
        INSERT INTO taken (course_code, student_code)
        VALUES (NEW.course_code, NEW.student_code);
        RETURN NEW;
    END IF; 

    -- CHECK - A waiting list can only exist for courses with limited seats.
    SELECT COUNT(*) INTO current_taken
    FROM taken
    WHERE course_code = NEW.course_code;

    SELECT capacity INTO current_capacity
    FROM limited_courses
    WHERE course_code = NEW.course_code;

    IF current_taken < current_capacity THEN
        -- insert into registered
        RAISE NOTICE 'Insert % into registered for the course %.', NEW.student_code, NEW.course_code;
        INSERT INTO taken (course_code, student_code)
        VALUES (NEW.course_code, NEW.student_code);
        
    ELSE
        -- insert into waiting_list
        RAISE NOTICE 'Insert % into waiting list for the course %.', NEW.student_code, NEW.course_code;
        INSERT INTO waiting_list (course_code, student_code, created_date)
        VALUES (NEW.course_code, NEW.student_code, CURRENT_TIMESTAMP);
        
    END IF; 

    RETURN NEW;
    -- END
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_insert_register_or_wait
BEFORE INSERT ON registered
FOR EACH ROW
EXECUTE FUNCTION fn_insert_register_or_wait();

-- ## Trigger function for registered when a taken record is deleted
CREATE OR REPLACE FUNCTION fn_register_from_waiting_list()
RETURNS TRIGGER AS $$
DECLARE
  wl_course_code TEXT;
  wl_student_code TEXT;
BEGIN

    -- get the first order of waiting list
    SELECT 
        wl.student_code,
        wl.course_code
    INTO 
        wl_student_code,
        wl_course_code
    FROM waiting_list wl
    WHERE wl.course_code = OLD.course_code
    ORDER BY wl.created_date  LIMIT 1; 

    RAISE NOTICE 'PROCESS  %   course %.', wl_student_code, wl_course_code;

    IF EXISTS (
        SELECT 1
        FROM waiting_list wl
        WHERE wl.course_code = OLD.course_code
    ) THEN
        RAISE NOTICE 'INSERT INTO registered  %   course %.', wl_student_code, wl_course_code;
        RAISE NOTICE 'DELETE FROM waiting_list  %   course %.', wl_student_code, wl_course_code;
  
        INSERT INTO taken (course_code, student_code)
        VALUES (wl_course_code, wl_student_code);

        DELETE FROM waiting_list
        WHERE course_code = wl_course_code 
        AND student_code = wl_student_code;
    END IF;

  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Create Trigger
CREATE TRIGGER tr_register_from_waiting_list
AFTER DELETE ON taken
FOR EACH ROW
EXECUTE FUNCTION fn_register_from_waiting_list();


-- ## Trigger function for grading for ended course
CREATE OR REPLACE FUNCTION fn_grade_students_when_course_update_to_ended()
RETURNS TRIGGER AS $$
DECLARE
  v_taken_row RECORD;
  v_taken_id INT;
BEGIN
  -- Check if the course is updated and is_ended = false
  IF NEW.is_ended = TRUE AND OLD.is_ended = FALSE THEN

    FOR v_taken_row IN SELECT taken_id FROM taken WHERE course_code = NEW.course_code
    LOOP
      v_taken_id := v_taken_row.taken_id;
      -- Update the grade in the taken table based on the found taken_id
      UPDATE taken
      SET grade = CASE
                  WHEN (SELECT SUM(point) FROM student_credit_point WHERE taken_id = v_taken_id) >= 90 THEN '4'
                  WHEN (SELECT SUM(point) FROM student_credit_point WHERE taken_id = v_taken_id) >= 80 THEN '3'
                  WHEN (SELECT SUM(point) FROM student_credit_point WHERE taken_id = v_taken_id) >= 70 THEN '2'
                  ELSE 'U'
                END
      WHERE taken_id = v_taken_id;
    END LOOP;

  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_grade_students_when_course_update_to_ended
AFTER UPDATE ON courses
FOR EACH ROW
EXECUTE FUNCTION fn_grade_students_when_course_update_to_ended();


 