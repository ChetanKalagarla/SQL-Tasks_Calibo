USE CollegeManagement;

CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Manager_ID INT
);

INSERT INTO Employees VALUES
(1, 'yasaswi', NULL),
(2, 'srini', 1),
(3, 'mayank', 1),
(4, 'karunakar', 2);

UPDATE Employees
SET Employee_Name = 'yasaswi'
WHERE Employee_ID = 1;

UPDATE Employees
SET Employee_Name = 'srini'
WHERE Employee_ID = 2;

UPDATE Employees
SET Employee_Name = 'mayank'
WHERE Employee_ID = 3;

UPDATE Employees
SET Employee_Name = 'karunakar'
WHERE Employee_ID = 4;

-- self -- 
SELECT
    e.Employee_Name AS Employee_Name,
    m.Employee_Name AS Manager_Name
FROM Employees e
LEFT JOIN Employees m
ON e.Manager_ID = m.Employee_ID;