-- ============================================================
-- CollegeManagement - Complete Working SQL File
-- ============================================================
-- This script can be executed from top to bottom in MySQL Workbench.
-- It safely recreates the tables so the script can be run again.
-- ============================================================

CREATE DATABASE IF NOT EXISTS CollegeManagement;
USE CollegeManagement;

-- Remove old tables so this file can be executed repeatedly
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Students;

-- ============================================================
-- 1. CREATE STUDENTS TABLE
-- ============================================================

CREATE TABLE Students (
    Student_ID INT UNSIGNED PRIMARY KEY,
    Student_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    Age INT UNSIGNED NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Year INT UNSIGNED NOT NULL,
    CGPA DECIMAL(3,2) UNSIGNED
);

-- ============================================================
-- 2. INSERT STUDENT DATA
-- ============================================================

INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
VALUES
(1, 'Rahul', 'rahul@gmail.com', '9876543210', 19, 'CSE', 1, 8.50),
(2, 'Priya', 'priya@gmail.com', '9876543211', 20, 'ECE', 2, 7.80),
(3, 'Arjun', 'arjun@gmail.com', '9876543212', 21, 'CSE', 3, 9.10),
(4, 'Sneha', 'sneha@gmail.com', '9876543213', 22, 'IT', 4, 8.20),
(5, 'Karthik', 'karthik@gmail.com', '9876543214', 20, 'CSE', 2, 8.75),
(6, 'Ananya', 'ananya@gmail.com', '9876543215', 23, 'MECH', 4, 7.40),
(7, 'Vikram', 'vikram@gmail.com', '9876543216', 21, 'CSE', 3, 9.30),
(8, 'Pooja', 'pooja@gmail.com', '9876543217', 19, 'ECE', 1, 8.00),
(9, 'Rohit', 'rohit@gmail.com', '9876543218', 22, 'IT', 4, 8.60),
(10, 'Divya', 'divya@gmail.com', '9876543219', 20, 'CSE', 2, 7.95);

-- ============================================================
-- 3. DISPLAY ALL STUDENTS
-- ============================================================

SELECT *
FROM Students;

-- ============================================================
-- 4. DISPLAY CSE STUDENTS
-- ============================================================

SELECT *
FROM Students
WHERE Department = 'CSE';

-- ============================================================
-- 5. DISPLAY STUDENTS WITH CGPA GREATER THAN 8
-- ============================================================

SELECT *
FROM Students
WHERE CGPA > 8;

-- ============================================================
-- 6. DISPLAY STUDENTS WITH AGE GREATER THAN 20
-- ============================================================

SELECT *
FROM Students
WHERE Age > 20;

-- ============================================================
-- 7. ADD A NEW VALID STUDENT
-- ============================================================

INSERT INTO Students
(Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
VALUES
(11, 'Suresh', 'suresh@gmail.com', '9876543220', 21, 'CSE', 3, 8.50);

-- ============================================================
-- 8. ADD ADDRESS COLUMN
-- ============================================================

ALTER TABLE Students
ADD Address VARCHAR(200);

-- ============================================================
-- 9. DISPLAY TABLE STRUCTURE
-- ============================================================

DESC Students;

-- ============================================================
-- 10. DISPLAY UPDATED STUDENT TABLE
-- ============================================================

SELECT *
FROM Students;

-- ============================================================
-- 11. CREATE DEPARTMENTS TABLE
-- ============================================================

CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department VARCHAR(50),
    HOD VARCHAR(50)
);

-- ============================================================
-- 12. INSERT DEPARTMENT DATA
-- ============================================================

INSERT INTO Departments
(Department_ID, Department, HOD)
VALUES
(10, 'CSE', 'Dr. Kumar'),
(20, 'ECE', 'Dr. Sharma'),
(30, 'IT', 'Dr. Ramesh'),
(40, 'MECH', 'Dr. Suresh');

-- ============================================================
-- 13. DISPLAY DEPARTMENTS
-- ============================================================

SELECT *
FROM Departments;

-- ============================================================
-- 14. INNER JOIN
-- ============================================================
-- The original file used s.Department_ID, but Students does not
-- contain a Department_ID column. The valid join is therefore
-- based on the Department column.

SELECT
    s.Student_ID,
    s.Student_Name,
    d.Department,
    d.HOD
FROM Students s
INNER JOIN Departments d
ON s.Department = d.Department;

-- ============================================================
-- 15. CONSTRAINT TESTS FROM THE ORIGINAL FILE
-- ============================================================
-- The following original statements were intentionally invalid:
--
-- A) Duplicate Student_ID -> PRIMARY KEY violation
-- B) Duplicate Email -> UNIQUE violation
-- C) NULL Student_Name -> NOT NULL violation
-- D) Negative Age -> UNSIGNED violation
-- E) Duplicate Student_ID / other duplicate values -> constraint violation
--
-- They are kept below as comments so the complete script runs
-- successfully without stopping on errors.
--
-- INSERT INTO Students
-- (Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
-- VALUES
-- (1, 'Suresh', 'suresh@gmail.com', '9876543220', 21, 'CSE', 3, 8.50);
--
-- INSERT INTO Students
-- (Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
-- VALUES
-- (11, 'Suresh', 'rahul@gmail.com', '9876543220', 21, 'CSE', 3, 8.50);
--
-- INSERT INTO Students
-- (Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
-- VALUES
-- (11, NULL, 'suresh@gmail.com', '9876543220', 21, 'CSE', 3, 8.50);
--
-- INSERT INTO Students
-- (Student_ID, Student_Name, Email, Phone, Age, Department, Year, CGPA)
-- VALUES
-- (11, 'Suresh', 'suresh@gmail.com', '9876543220', -21, 'CSE', 3, 8.50);

-- ============================================================
-- 16. FINAL CHECKS
-- ============================================================

SELECT *
FROM Students;

SELECT *
FROM Departments;

SELECT
    s.Student_ID,
    s.Student_Name,
    s.Department,
    d.HOD
FROM Students s
INNER JOIN Departments d
ON s.Department = d.Department;

-- ============================================================
-- END OF FILE
-- ============================================================
