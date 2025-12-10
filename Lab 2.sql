USE CSE_B8_444
--1.	Retrieve all unique departments from the STUDENT table.
SELECT DISTINCT StuDepartment
FROM STUDENT

--2.	Insert a new student record into the STUDENT table.
--(9, 'Neha Singh', 'neha.singh@univ.edu', '9876543218', 'IT', '2003-09-20', 2021)
INSERT INTO STUDENT VALUES (9, 'Neha Singh', 'neha.singh@univ.edu', '9876543218', 'IT', '2003-09-20', 2021)

--3.	Change the Email of student 'Raj Patel' to 'raj.p@univ.edu'. (STUDENT table)
UPDATE STUDENT 
SET StuEmail = 'raj.p@univ.edu'
WHERE StuName = 'Raj Patel'

--4.	Add a new column 'CGPA' with datatype DECIMAL(3,2) to the STUDENT table.
ALTER TABLE STUDENT 
ADD CGPA DECIMAL(3,2)

--5.	Retrieve all courses whose CourseName starts with 'Data'. (COURSE table)
SELECT CourseName
FROM COURSE
WHERE CourseName LIKE 'Data%'

--6.	Retrieve all students whose Name contains 'Shah'. (STUDENT table)
SELECT StuName
FROM STUDENT
WHERE StuName LIKE '%Shah%'

--7.	Display all Faculty Names in UPPERCASE. (FACULTY table)
SELECT UPPER(FacultyName)
FROM FACULTY

--8.	Find all faculty who joined after 2015. (FACULTY table)
SELECT FacultyName, FacultyJoiningDate
FROM FACULTY
WHERE YEAR(FacultyJoiningDate) >2015 

--9.	Find the SQUARE ROOT of Credits for the course 'Database Management Systems'. (COURSE table)
SELECT SQRT(CourseCredits)
FROM COURSE

--10.	Find the Current Date using SQL Server in-built function.
SELECT GETDATE()

--11.	Find the top 3 students who enrolled earliest (by EnrollmentYear). (STUDENT table)
SELECT TOP 3 StuEnrollmentYear , StuName 
FROM STUDENT
ORDER BY StuEnrollmentYear ASC


--12.	Find all enrollments that were made in the year 2022. (ENROLLMENT table)
SELECT StuEnrollmentYear , StuName 
FROM STUDENT
WHERE StuEnrollmentYear = 2022

--13.	Find the number of courses offered by each department. (COURSE table)


--14.	Retrieve the CourseID which has more than 2 enrollments. (ENROLLMENT table)
SELECT CourseID
FROM ENROLLMENT
GROUP BY CourseID
HAVING COUNT(StudentID) > 2;

--15.	Retrieve all the student name with their enrollment status. (STUDENT & ENROLLMENT table)
SELECT Student.StuName, ENROLLMENT.EnrollmentStatus
FROM STUDENT 
JOIN ENROLLMENT  ON STUDENT.StudentID = Enrollment.StudentID;

--16.	Select all student names with their enrolled course names. (STUDENT, COURSE, ENROLLMENT table)
SELECT STUDENT.StuName, COURSE.CourseName
FROM STUDENT 
JOIN ENROLLMENT  ON STUDENT.StudentID = ENROLLMENT.StudentID
JOIN COURSE  ON ENROLLMENT.CourseID = COURSE.CourseID;


--17.	Create a view called 'ActiveEnrollments' showing only active enrollments with student name and  course name. (STUDENT, COURSE, ENROLLMENT,  table)
CREATE VIEW ActiveEnrollments AS
SELECT STUDENT.StuName, COURSE.CourseName
FROM STUDENT 
JOIN ENROLLMENT  ON STUDENT.StudentID = ENROLLMENT.StudentID
JOIN COURSE  ON ENROLLMENT.CourseID = COURSE.CourseID
WHERE ENROLLMENT.EnrollmentStatus = 'Active';

SELECT * FROM ActiveEnrollments
--18.	Retrieve the student’s name who is not enrol in any course using subquery. (STUDENT, ENROLLMENT TABLE)
SELECT StuName
FROM STUDENT
WHERE StudentID NOT IN (SELECT StudentID FROM ENROLLMENT);


--19.	Display course name having second highest credit. (COURSE table)
SELECT CourseName
FROM COURSE
WHERE CourseCredits = (
    SELECT MAX(CourseCredits)
    FROM COURSE
    WHERE CourseCredits < (SELECT MAX(CourseCredits) FROM COURSE)
);

