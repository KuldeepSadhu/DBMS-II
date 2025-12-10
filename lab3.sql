USE CSE_B8_444

CREATE OR ALTER PROC PR_INSERT_STUDENT
@StdID int,
@Name varchar(100),
@Email varchar(100),
@Phone varchar(15),
@Dept varchar(50),
@DOB date,
@Eny int
AS
BEGIN
INSERT INTO STUDENT VALUES(@StdID,@Name,@Email,@Phone,@Dept,@DOB,@Eny,null)
end



PR_INSERT_STUDENT 10,"Harsh Parmar","harsh@univ.edu","9876543218","CSE",'2005-09-18',2023

PR_INSERT_STUDENT 20,"Om Patel","omuniv.edu","9876543218","IT",'2002-08-22',2022


select * from STUDENT


CREATE OR ALTER PROC PR_INSERT_COURSE
@CourseID varchar(10),
@CourseName varchar(100),
@Credits int,
@Dept varchar(50),
@Semester int
AS
BEGIN
INSERT INTO COURSE VALUES(@CourseID,@CourseName,@Credits,@Dept,@Semester)
end

PR_INSERT_COURSE "CS330","Computer Networks",4,"CSE",5
PR_INSERT_COURSE "EC120","Electronic Circuits",3,"ECE",2


select * from COURSE


--UPDATE PROCEDURE


CREATE OR ALTER PROC PR_UP_STUDENT
@id int,
@Email varchar(100),
@Phone varchar(15)
AS
BEGIN
UPDATE STUDENT
SET StuEmail = @Email,StuPhone=@Phone
where StudentID = @id
end


PR_UP_STUDENT 6,"joshi@uni.edu","999999999"


select * from STUDENT

--delete procedure



CREATE OR ALTER PROC PR_DEL_STUDENT
@Name varchar(100)
AS
BEGIN
DELETE FROM STUDENT
where StuName = @Name
end

PR_DEL_STUDENT "Om Patel"

select * from STUDENT


--select by primary key

--SP_SELECT_STUDENT_BY_ID


CREATE OR ALTER PROC SP_SELECT_STUDENT_BY_ID
@id int
AS	
BEGIN
SELECT * FROM STUDENT
where StudentID = @id
end

SP_SELECT_STUDENT_BY_ID 3

select * from STUDENT

--TOP 5 BY ENROLL


CREATE OR ALTER PROC SP_TOP5_ENR

AS	
BEGIN
SELECT TOP 5 * FROM STUDENT
ORDER BY StuEnrollmentYear
end

SP_TOP5_ENR

--PART B

--FACULTY DESGINATION


CREATE OR ALTER PROC SP_FAC_DES
AS	
BEGIN
SELECT count(FacultyID),FacultyDesignation
from FACULTY
group by FacultyDesignation
end

SP_FAC_DES


--8.

CREATE OR ALTER PROC SP_STU_BY_DEPT
@Dept varchar(50)
AS	
BEGIN
SELECT StuName From STUDENT
where StuDepartment=@Dept
end

SP_STU_BY_DEPT CSE

--9.

CREATE OR ALTER PROC SP_COURSE_DETAIL
AS	
BEGIN
SELECT CourseDepartment,MAX(CourseCredits) AS MAXI,MIN(CourseCredits) AS MINI , AVG(CourseCredits) AS AVERAGE FROM COURSE
GROUP BY CourseDepartment
end
SP_COURSE_DETAIL
	
--10.

CREATE OR ALTER PROC SP_STUCOURSE_BY_ID
@ID INT
AS	
BEGIN
SELECT COURSE.CourseName
From 
STUDENT JOIN COURSE
ON STUDENT.StuDepartment = COURSE.CourseDepartment
where STUDENT.StudentID = @ID
end
	
SP_STUCOURSE_BY_ID 2