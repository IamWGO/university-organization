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
    # ## 1. Get course description for C-004
    
    # query = "SELECT * FROM courses WHERE course_code = %s"
    # filter_course = 'C-004' # Replace with the course_code you want to filter
    # cursor.execute(query, (filter_course,))

    # ------------------------------------------------------------  
    # ## 2. Get student who registered course C-004 with grade and all detail
    query = """
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
        WHERE t.course_code = %s;
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
