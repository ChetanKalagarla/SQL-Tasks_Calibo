USE CollegeManagement;

CREATE TABLE Student_Info (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Department_ID INT
);

CREATE TABLE Department_Info (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);

CREATE TABLE Course_Info (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Department_ID INT
);

CREATE TABLE Enrollment_Info (
    Student_ID INT,
    Course_ID INT
);

INSERT INTO Student_Info VALUES
(101, 'Rahul', 10),
(102, 'Priya', 20),
(103, 'Ravi', 10),
(104, 'Anu', 30),
(105, 'Kiran', 10);

INSERT INTO Department_Info VALUES
(10, 'CSE'),
(20, 'ECE'),
(30, 'EEE'),
(40, 'MECH');

INSERT INTO Course_Info VALUES
(501, 'Python', 10),
(502, 'Java', 10),
(503, 'Embedded Systems', 20),
(504, 'Circuit Analysis', 20),
(505, 'Power Systems', 30);

INSERT INTO Enrollment_Info VALUES
(101, 501),
(101, 502),
(102, 503),
(103, 501),
(104, 505),
(105, 502);

SELECT
    s.Student_Name,
    d.Department_Name,
    c.Course_Name
FROM Student_Info s
INNER JOIN Department_Info d
    ON s.Department_ID = d.Department_ID
INNER JOIN Enrollment_Info e
    ON s.Student_ID = e.Student_ID
INNER JOIN Course_Info c
    ON e.Course_ID = c.Course_ID
WHERE d.Department_Name = 'CSE';

SELECT * FROM Student_Info;

SELECT * FROM Department_Info;

SELECT * FROM Course_Info;

SELECT * FROM Enrollment_Info;

SELECT
    s.Student_Name,
    d.Department_Name,
    c.Course_Name
FROM Student_Info s
INNER JOIN Department_Info d
    ON s.Department_ID = d.Department_ID
INNER JOIN Enrollment_Info e
    ON s.Student_ID = e.Student_ID
INNER JOIN Course_Info c
    ON e.Course_ID = c.Course_ID;
