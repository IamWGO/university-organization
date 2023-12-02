-- ## Trigger for register student
CREATE OR REPLACE FUNCTION fn_insert_register_or_wait()
RETURNS TRIGGER AS $$
DECLARE
  current_taken INT;
  current_capacity INT;
BEGIN
  
  SELECT COUNT(*) INTO current_taken
  FROM taken
  WHERE course_code = NEW.course_code;

  SELECT capacity INTO current_capacity
  FROM limited_courses
  WHERE course_code = NEW.course_code;

  IF current_taken < current_capacity THEN
    -- insert into registered
    INSERT INTO taken (course_code, student_code)
    VALUES (NEW.course_code, NEW.student_code);
    RAISE NOTICE 'Insert % into registered for the course %.', NEW.student_code, NEW.course_code;
  ELSE
    -- insert into waiting_list
    INSERT INTO waiting_list (course_code, student_code, created_date)
    VALUES (NEW.course_code, NEW.student_code, CURRENT_TIMESTAMP);
    RAISE NOTICE 'Insert % into waiting list for the course %.', NEW.student_code, NEW.course_code;
  END IF; 

  RETURN NEW;

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



--   -- Check if there are students in the waiting list for the deleted course
--   IF EXISTS (
--     SELECT 1
--     FROM waiting_list wl
--     WHERE wl.course_code = OLD.course_code
--   ) THEN
--     -- Move the first student from the waiting list to the registered list
--     INSERT INTO registered (course_code, student_code)
--     VALUES (wl_course_code, wl_student_code);

--     -- Delete the corresponding record from the waiting list
--     DELETE FROM waiting_list
--     WHERE course_code = wl_course_code 
--       AND student_code = wl_student_code;
--     RETURN NULL

--   END IF;
