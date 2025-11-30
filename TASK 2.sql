


-- 1. TABLE CREATION (CREATE DATABASE payroll_database, USE payroll_database(UNABLE TO EXECUTE SINCE USING ONE COMPILER))
CREATE TABLE employees (
    EMPLOYEE_ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    DEPARTMENT VARCHAR(50),
    EMAIL VARCHAR(100) UNIQUE,
    PHONE_NO BIGINT,
    JOINING_DATE DATE,
    SALARY DECIMAL(10, 2) NOT NULL CHECK (SALARY >= 0), 
    BONUS DECIMAL(10, 2) CHECK (BONUS >= 0), 
    TAX_PERCENTAGE DECIMAL(4, 2)
);

DESC employees;
-- INSERTING VALUES INTO TABLE 
INSERT INTO employees (EMPLOYEE_ID, NAME, DEPARTMENT, EMAIL, PHONE_NO, JOINING_DATE, SALARY, BONUS, TAX_PERCENTAGE) VALUES
(1001, 'Aarav Sharma', 'Technology', 'aarav.s@payroll.com', 9812345670, '2024-03-15', 1200000.00, 120000.00, 15.50),
(1002, 'Priya Singh', 'HR', 'priya.s@payroll.com', 9923456781, '2023-08-22', 850000.00, 45000.00, 12.00),
(1003, 'Rohan Das', 'Finance', 'rohan.d@payroll.com', 9734567892, '2025-07-05', 920000.00, 0.00, 14.50),
(1004, 'Zoya Khan', 'Marketing', 'zoya.k@payroll.com', 9645678903, '2024-11-01', 750000.00, 30000.00, 10.00),
(1005, 'Vikram Patel', 'Technology', 'vikram.p@payroll.com', 9556789014, '2022-05-10', 1500000.00, 150000.00, 20.00),
(1006, 'Diya Verma', 'Sales', 'diya.v@payroll.com', 9467890125, '2025-06-18', 600000.00, 15000.00, 10.00),
(1007, 'Kabir Reddy', 'Technology', 'kabir.r@payroll.com', 9378901236, '2024-09-29', 1100000.00, 80000.00, 15.50),
(1008, 'Neha Gupta', 'HR', 'neha.g@payroll.com', 9289012347, '2023-01-01', 780000.00, 35000.00, 12.00),
(1009, 'Sameer Jain', 'Finance', 'sameer.j@payroll.com', 9190123458, '2025-09-12', 1500000.00, 50000.00, 14.50),
(1010, 'Leena Rao', 'Marketing', 'leena.r@payroll.com', 9001234569, '2024-07-20', 650000.00, 20000.00, 10.00),
(1011, 'Suresh Kumar', 'Technology', 'suresh.k@payroll.com', 9811122330, '2024-05-20', 1350000.00, 100000.00, 18.00),
(1012, 'Tanya Menon', 'Sales', 'tanya.m@payroll.com', 9922233441, '2023-03-01', 800000.00, 25000.00, 12.00),
(1013, 'Alok Jain', 'HR', 'alok.j@payroll.com', 9733344552, '2025-10-25', 780000.00, 35000.00, 12.00),
(1014, 'Geetika Bahl', 'Marketing', 'geetika.b@payroll.com', 9644455663, '2024-01-10', 950000.00, 40000.00, 14.00),
(1015, 'Himanshu Garg', 'Finance', 'himanshu.g@payroll.com', 9555566774, '2023-11-17', 1150000.00, 60000.00, 16.00);

SELECT * FROM employees;




SELECT                   
    NAME,
    DEPARTMENT,
    SALARY
FROM
    employees
ORDER BY
    SALARY DESC;
    




SELECT
    NAME,
    DEPARTMENT,
    SALARY,
    BONUS,
    (SALARY + BONUS) AS TotalCompensation
FROM
    employees
WHERE
    (SALARY + BONUS) > 1000000
ORDER BY
    TotalCompensation DESC;
  
  
  
    

UPDATE employees
SET BONUS = BONUS * 1.10
WHERE DEPARTMENT = 'Sales';
 
 -- TO SHOW THE RESULT 
SELECT 
    NAME, 
    DEPARTMENT, 
    BONUS AS UpdatedBonus
FROM 
    employees
WHERE 
    DEPARTMENT = 'Sales';





SELECT
    NAME,
    DEPARTMENT,
    SALARY,
    TAX_PERCENTAGE,
    SALARY * (1 - (TAX_PERCENTAGE / 100)) AS AnnualNetSalary
FROM
    employees
ORDER BY
    AnnualNetSalary DESC;
    
   
   
   
   
    
SELECT
    DEPARTMENT,
    COUNT(EMPLOYEE_ID) AS TotalEmployees,
    ROUND(AVG(SALARY), 2) AS AverageSalary,
    MIN(SALARY) AS MinimumSalary,
    MAX(SALARY) AS MaximumSalary
FROM
    employees
GROUP BY
    DEPARTMENT
ORDER BY
    AverageSalary DESC;
    
   ---- ADVANCED QUERY 
    
    
SELECT
    EMPLOYEE_ID,
    NAME,
    DEPARTMENT,
    JOINING_DATE
FROM
    employees
WHERE
    JOINING_DATE >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
ORDER BY
    JOINING_DATE DESC;
    
    
    
SELECT
    DEPARTMENT,
    COUNT(EMPLOYEE_ID) AS EmployeeCount
FROM
    employees
GROUP BY
    DEPARTMENT
ORDER BY
    EmployeeCount DESC;
    
    
    
    
SELECT
    DEPARTMENT,
    ROUND(AVG(SALARY), 2) AS AverageSalary
FROM
    employees
GROUP BY
    DEPARTMENT
ORDER BY
    AverageSalary DESC
LIMIT 1;



SELECT
    e.EMPLOYEE_ID,
    e.NAME,
    e.SALARY,
    e.DEPARTMENT
FROM
    employees e 
INNER JOIN
    employees f ON e.SALARY = f.SALARY 
    AND e.EMPLOYEE_ID <> f.EMPLOYEE_ID 
ORDER BY
    e.SALARY DESC, e.NAME;


