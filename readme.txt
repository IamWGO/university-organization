------- start with -------
drop.sql 
    - delete all tables (make sure that we get empty tables)
tables.sql
    - create tables
trigger.sql
    - triggers and functions
insert_data.sql
    - insert data


----------- 
query.sql
    - run sql following comment guides
    - see results if it correct

view.sql 
    - following project requriment


- ERD https://dbdiagram.io/d/University-program-v3-5e8e21593d30f00839b3b682 and also in github 



The domain that you will model in this task is for courses and students at a university.

The university is organized into:
1. Departments, for example, the Department of Computer Science.
2. Educational programs for students, such as the Computer Science and Engineering Program.
 

The educational programs are organized by departments, but multiple departments can collaborate on a program, as is the case with the CSEP (Computer Science Engineering Program) organized jointly by the Department of Computer Science and the Department of Computer Engineering. Department names and abbreviations are unique, as are program names, but not necessarily program abbreviations.

Each program is further divided into branches; for example, CSEP has branches like Programming Languages, Algorithms, Software Engineering, etc. Note that branch names are unique within a specific program but not necessarily across multiple programs. For instance, both CSEP and a program in automation engineering may have a branch named Interaction Design.

For each program, there are mandatory courses. Additionally, for each branch, there are additional mandatory courses that students studying that branch must take. The branches also specify a set of recommended courses from which all students in that branch must take a certain amount to fulfill the degree requirements.


A student always belongs to a program. Students must choose a single branch within that program and fulfill its degree requirements to be able to graduate. Typically, students choose which branch to study in their fourth year, which means that students who are in the early stages of their studies may not yet belong to any specific branch.

Each course is offered by an institution (e.g., CS offers the course Databases). Each course has a unique six-character course code. All courses can be taken by students from all programs. Some courses may be mandatory for certain programs but not for others. Students receive credit points for successfully completed courses; the exact number may vary between different courses (but all students receive the same number of points for the same course). Some, but not all, courses have a limit on the number of students who can take the course simultaneously.

Courses can be classified as either mathematical courses, research courses, or seminar courses. Not all courses need to be classified, and some courses may have more than one classification. The university may sometimes introduce new classifications, so the database must allow for this. Some courses have prerequisites, i.e., other courses that must be passed before a student can register for them.

Students must register for courses to be able to attend them. To register, a student must first fulfill all prerequisites for the course. It should not be possible for a student to register for a course if the prerequisites are not already approved. It should not be possible for a student to register for a course they have already passed.
If a course reaches full capacity, students who register late are placed on a waiting list. If one of the previously registered students decides to drop the course, creating an available slot, that slot is given to the student who has been on the waiting list the longest. After the course is completed, all students are graded on a scale from "U," "3," "4," "5". Receiving a "U" indicates that the student did not pass the course, while the other grades signify varying degrees of success.


A study administrator (an individual with direct access to the database) has the authority to override both prerequisites and size limitations, enabling them to directly add a student as registered for a course.
