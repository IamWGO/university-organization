import psycopg2
from psycopg2 import sql

# Replace these with your actual database credentials
dbname = 'intro'
user = 'postgres'
password = 'deknoi3004'
host = 'localhost'
port = '5432' 

# Establish a connection to the PostgreSQL database
try:
    connection = psycopg2.connect(
        dbname=dbname,
        user=user,
        password=password,
        host=host,
        port=port
    )
    
    cursor = connection.cursor()  
    # ------------------------------------------------------------  
    # # Get register status of a student who registered in course C-004 
    function_query = """
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
        """
    cursor.execute(function_query)

    query = """
        SELECT s.student_code,
        CONCAT(s.first_name ,' ', s.last_name) AS student_name,
        CONCAT(co.name,' (', r.course_code, ')') AS course,
        fn_taken_course_status(r.course_code,r.student_code) as register_status
        FROM registered r
        LEFT JOIN courses co ON co.course_code = r.course_code
        LEFT JOIN students s ON s.student_code = r.student_code
        LEFT JOIN taken t ON t.student_code = r.student_code
        LEFT JOIN waiting_list wl ON wl.student_code = r.student_code
        WHERE r.course_code = %s;
        """
    filter_course = 'C-004' # Replace with the course_code you want to filter
    cursor.execute(query, (filter_course,))

    # Fetch the result in rows
    for row in cursor.fetchall():
        print(row)

except Exception as e:
    print("Error: Unable to connect to the database.")
    print(e)

finally:
    # Close the cursor and connection
    if cursor:
        cursor.close()
    if connection:
        connection.close()