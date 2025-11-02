-- Create Database
CREATE DATABASE ComapnyDB;
USE ComapnyDB;

-- Crete Table for Department
CREATE TABLE Department
(
   Dept_ID INT PRIMARY KEY IDENTITY(1,1),
   Dept_Name VARCHAR(30) NOT NULL,
   Location VARCHAR(50)

);

-- Crete Table for Employee
CREATE TABLE Employee
(
   Emp_ID INT PRIMARY KEY IDENTITY(1,1),
   Emp_Name VARCHAR(50) NOT NULL,
   Gender VARCHAR(10),
   Hire_Date DATE,
   Dept_ID INT,
   FOREIGN KEY (Dept_ID)
   REFERENCES Department (Dept_ID)

);

-- Crete Table for Salary
CREATE TABLE Salary
(
   Salary_ID INT PRIMARY KEY IDENTITY(1,1),
   Emp_ID INT,
   Basic_Salary DECIMAL(10,2),
   Bonus DECIMAL(10,2),
   FOREIGN KEY (Emp_ID)
   REFERENCES Employee(Emp_ID)

);

-- Insert Data into Department Table
INSERT INTO Department(Dept_Name, Location)
VALUES ('FINANCE', 'Bengaluru'),
       ('IT', 'Pune'),
       ('HR', 'Delhi'),
       ('MANAGER', 'Noida'),
       ('MIS', 'Delhi'),
       ('HR', 'Noida'),
       ('MANAGER', 'Mubai'),
       ('IT', 'Pune'),
       ('MIS', 'Bengaluru'),
       ('IT', 'Pune');

SELECT * FROM Department;

-- Insert Data into Employee Table
INSERT INTO Employee (Emp_Name, Gender, Hire_Date, Dept_ID)
VALUES ('Ravi Sharma', 'Male', '2024-07-13', 1),
       ('Priya', 'Female', '2022-10-03', 2),
       ('Shilpa', 'Female', '2021-11-14', 3),
       ('Gagan Pratap', 'Male', '2020-06-28', 4),
       ('Vicky Singh', 'Male', '2025-05-25', 5),
       ('Pooja Hegde', 'Female', '2024-05-20', 6),
       ('Ravi Sharma', 'Male', '2024-09-27', 7),
       ('Ankit', 'Male', '2025-02-23', 8),
       ('Manish Sharma', 'Male', '2024-01-11', 9),
       ('Kalpana', 'Female', '2021-02-17', 10);

SELECT * FROM Employee;

-- Insert Data into Salary Table
INSERT INTO Salary (Emp_ID, Basic_Salary, Bonus)
VALUES (1, 400000, 5000),
       (2, 480000, 4800),
       (3, 380000, 3000),
       (4, 550000, 2500),
       (5, 290000, 4000),
       (6, 500000, 2500),
       (7, 400000, 2800),
       (8, 350000, 3500),
       (9, 450000, 5000),
       (10, 600000, 4500);

SELECT * FROM Salary;

SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Salary;

1) -- Show employee names and their departments.
SELECT e.EMP_NAME, d.Dept_Name
FROM Employee e
JOIN Department d
ON e.Emp_ID = d.Dept_ID;

2) -- Find employees who work in the 'IT' department.
SELECT e.EMP_NAME, d.Dept_Name
FROM Employee e
JOIN Department d
ON e.Emp_ID = d.Dept_ID
WHERE Dept_Name = 'IT';

3) -- Find top 3 highest-paid employees.
SELECT TOP 3 e.Emp_ID, Emp_Name, d.Dept_Name,
(s.Basic_Salary + s.Bonus) AS Highest_Salary
FROM Employee e
JOIN Salary s
ON e.Emp_ID = s.Salary_ID
JOIN Department d
ON d.Dept_ID = e.Emp_ID
ORDER BY Highest_Salary DESC;

4) -- Find average salary of each department.
SELECT D.DEPT_NAME, AVG(S.BASIC_SALARY + S.BONUS) AS AVG_SAL
FROM Department D
JOIN Employee E
ON D.Dept_ID = E.Emp_ID
JOIN SALARY S
ON S.Salary_ID = E.Emp_ID
GROUP BY D.DEPT_NAME;

4) -- Find total male and female employees.
SELECT GENDER, COUNT(*) AS TOTAL
FROM Employee
GROUP BY GENDER;

5) -- List department names and total employees in each department.
SELECT D.DEPT_NAME, COUNT(E.EMP_ID) AS Total_EMP
FROM Department D
JOIN Employee E
ON E.Emp_ID = D.Dept_ID
GROUP BY Dept_Name;

6) -- Find employees with salary greater than ₹500000.
SELECT E.Emp_ID, EMP_NAME, D.DEPT_NAME, (S.BASIC_SALARY + S.BONUS) AS NET_SALARY
FROM Employee E
JOIN Salary S
ON E.Emp_ID = S.SALARY_ID
JOIN Department D
ON D.Dept_ID = E.Emp_ID
WHERE (S.BASIC_SALARY + S.BONUS) > 500000;

7) -- Find Net Salary of each employee.
SELECT E.EMP_NAME, (S.BASIC_SALARY + S.BONUS) AS NET_SALARY
FROM Employee E
JOIN Salary S
ON E.Emp_ID = S.Salary_ID;

8) -- Find employees hired after 2020 with salary > 400000.
SELECT E.EMP_NAME, E.HIRE_DATE, (S.BASIC_SALARY + S.BONUS) AS TOTAL_SALARY
FROM Employee E
JOIN SALARY S
ON E.EMP_ID = S.SALARY_ID
WHERE E.HIRE_DATE > '2020-06-28' AND (S.BASIC_SALARY + S.BONUS) > 400000;

9) -- Find number of employees in each Department
SELECT D.DEPT_NAME, COUNT(E.Emp_ID) AS Total_Employees
FROM Employee E
JOIN Department D
ON E.Emp_ID = D.Dept_ID
GROUP BY DEPT_NAME;

10) -- Find employees with salary between 300000 to 500000.
SELECT E.EMP_NAME, (S.BASIC_SALARY + S.BONUS) AS SAL_BET_3L_to_5L
FROM Employee E
JOIN Salary S
ON E.Emp_ID = S.Salary_ID
WHERE (S.BASIC_SALARY + S.BONUS) BETWEEN 300000 AND 500000;


--** Employee Management System Project(SQL Server) **--
--> Designed and implemented a relational database with employee, department, and salary tables.
--> Applied SQL joins, group by, having and aggregate functions to manage HR data & generate department-wise salary insights.
--> Ensured referential integrity using primary and foreign key constraints.