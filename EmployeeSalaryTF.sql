USE CollegeManagement;

CREATE TABLE Employee_Salary (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

INSERT INTO Employee_Salary VALUES
(1, 'Arun', 'CSE', 50000),
(2, 'Ravi', 'CSE', 60000),
(3, 'Priya', 'ECE', 55000),
(4, 'Kiran', 'ECE', 65000),
(5, 'Anu', 'CSE', 70000);

SELECT COUNT(*) AS Total_Employees
FROM Employee_Salary;

SELECT COUNT(*) AS CSE_Employees
FROM Employee_Salary
WHERE Department = 'CSE';

SELECT COUNT(*) AS ECE_Employees
FROM Employee_Salary
WHERE Department = 'ECE';
-- empcount ece
SELECT SUM(Salary) AS Total_Salary
FROM Employee_Salary;
-- cse
SELECT SUM(Salary) AS CSE_Total_Salary
FROM Employee_Salary
WHERE Department = 'CSE';
-- ece
SELECT SUM(Salary) AS ECE_Total_Salary
FROM Employee_Salary
WHERE Department = 'ECE';
-- highest total
SELECT
    Department,
    SUM(Salary) AS Total_Salary
FROM Employee_Salary
GROUP BY Department
ORDER BY Total_Salary DESC
LIMIT 1;
-- AVG 
SELECT AVG(Salary) AS Average_Salary
FROM Employee_Salary;

SELECT AVG(Salary) AS CSE_Average
FROM Employee_Salary
WHERE Department = 'CSE';

SELECT AVG(Salary) AS ECE_Average
FROM Employee_Salary
WHERE Department = 'ECE';

-- min()
SELECT MIN(Salary) AS Lowest_Salary
FROM Employee_Salary;

SELECT MIN(Salary) AS CSE_Lowest
FROM Employee_Salary
WHERE Department = 'CSE';

SELECT MIN(Salary) AS ECE_Lowest
FROM Employee_Salary
WHERE Department = 'ECE';

-- max
SELECT MAX(Salary) AS Highest_Salary
FROM Employee_Salary;

SELECT MAX(Salary) AS CSE_Highest
FROM Employee_Salary
WHERE Department = 'CSE';

SELECT MAX(Salary) AS ECE_Highest
FROM Employee_Salary
WHERE Department = 'ECE';

SELECT
    Name,
    Department,
    Salary
FROM Employee_Salary
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee_Salary
);

-- aggregation funs()
SELECT
    Department,
    COUNT(*) AS Number_of_Employees,
    AVG(Salary) AS Average_Salary,
    SUM(Salary) AS Total_Salary,
    MAX(Salary) AS Highest_Salary,
    MIN(Salary) AS Lowest_Salary
FROM Employee_Salary
GROUP BY Department;

