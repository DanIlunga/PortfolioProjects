/*Step1: Beginner to intermediate queries
1. Total Number of Employees and average salary at the company
SELECT COUNT(*) as TotalEmployees
FROM Employee_analysis;*/
SELECT 
    COUNT(*) AS TotalEmployees,
    AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM
    employee_analysis;
/*2. Number of Employees  and average salary per Department
SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employee_analysis
GROUP BY Department;*/
SELECT 
    Department,
    COUNT(*) AS NumberOfEmployees,
    AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM
    employee_analysis
GROUP BY Department;
/*3. Average Performance Score per Department:
SELECT Department, AVG(PerformanceScore) AS AveragePerformanceScore
FROM EmployeePerformanceData
GROUP BY Department;*/
SELECT 
    Department,
    AVG(PerformanceRating) AS AveragePerformanceScore
FROM
    employee_analysis
GROUP BY Department;
/*4. Top Performers:
SELECT EmployeeID, EmployeeName, PerformanceScore
FROM EmployeePerformanceData
ORDER BY PerformanceScore DESC
LIMIT 10;*/
SELECT 
    Employee_ID, Employee_Name, Performancerating
FROM
    Employee_analysis
ORDER BY Performancerating DESC
LIMIT 10;
/*5. Employees with Performance Score above a Threshold:
SELECT EmployeeID, EmployeeName, Department, PerformanceScore
FROM EmployeePerformanceData
WHERE PerformanceScore > 80;*/
SELECT 
    Employee_ID,
    Employee_Name,
    Department,
    Performancerating,
    JobRole
FROM
    employee_analysis
WHERE
    Performancerating >= 4;
/*6. Performance Improvement Over Time:
SELECT EmployeeID, EmployeeName, PerformanceScore, LastReviewDate
FROM EmployeePerformanceData
ORDER BY LastReviewDate;*/
SELECT 
    Employee_ID,
    Employee_Name,
    Performancerating,
    LastReviewDate
FROM
    employee_analysis
ORDER BY LastReviewDate;
/*7. Area of improvement, employee performing poorly
SELECT Employee_ID, Employee_Name, Performancerating
FROM Employee_analysis
where performancerating <=2
ORDER BY Performancerating DESC
LIMIT 10;*/ 
SELECT 
    Employee_ID, Employee_Name, Performancerating
FROM
    Employee_analysis
WHERE
    performancerating <= 2;

/*8. Minimum ,average and Maximum Years at the Company:
SELECT MIN(YearsAtCompany) as MinYearsAtCompany, MAX(YearsAtCompany) as MaxYearsAtCompany
FROM Employee_analysis;*/
SELECT 
    MIN(YearsAtCompany) AS MinYearsAtCompany,
    MAX(YearsAtCompany) AS MaxYearsAtCompany,
    ROUND(AVG(YearsAtCompany), 0) AS AvgYearsAtCompany
FROM
    employee_analysis;
/*9. numbers of employees with minimun,average and maximum years at the company
WITH MinYears AS (
    SELECT MIN(YearsAtCompany) as MinYearsAtCompany
    FROM employee_analysis
),
MaxYears AS (
    SELECT MAX(YearsAtCompany) as MaxYearsAtCompany
    FROM employee_analysis
),
AvgYears AS (
    SELECT ROUND(AVG(YearsAtCompany), 0) as AvgYearsAtCompany
    FROM employee_analysis
)

SELECT 
    (SELECT COUNT(*) FROM employee_analysis WHERE YearsAtCompany = (SELECT MinYearsAtCompany FROM MinYears)) as EmployeesWithMinYears,
    (SELECT COUNT(*) FROM employee_analysis WHERE YearsAtCompany = (SELECT MaxYearsAtCompany FROM MaxYears)) as EmployeesWithMaxYears,
    (SELECT COUNT(*) FROM employee_analysis WHERE YearsAtCompany = (SELECT AvgYearsAtCompany FROM AvgYears)) as EmployeesWithAvgYears;
*/
WITH MinYears AS (
    SELECT MIN(YearsAtCompany) as MinYearsAtCompany
    FROM employee_analysis
),
MaxYears AS (
    SELECT MAX(YearsAtCompany) as MaxYearsAtCompany
    FROM employee_analysis
),
AvgYears AS (
    SELECT ROUND(AVG(YearsAtCompany), 0) as AvgYearsAtCompany
    FROM employee_analysis
)

SELECT 
    (SELECT COUNT(*) FROM employee_analysis WHERE YearsAtCompany = (SELECT MinYearsAtCompany FROM MinYears)) as EmployeesWithMinYears,
    (SELECT COUNT(*) FROM employee_analysis WHERE YearsAtCompany = (SELECT MaxYearsAtCompany FROM MaxYears)) as EmployeesWithMaxYears,
    (SELECT COUNT(*) FROM employee_analysis WHERE YearsAtCompany = (SELECT AvgYearsAtCompany FROM AvgYears)) as EmployeesWithAvgYears;
/*Create a View for Employees with Long Tenure:
CREATE VIEW LongTenureEmployees AS
SELECT Employee_ID, YearsAtCompany, JobRole
FROM Employee_analysis
WHERE YearsAtCompany > 10;*/
SELECT 
    Employee_ID, YearsAtCompany, JobRole, department
FROM
    Employee_analysis
WHERE
    YearsAtCompany > 10;
    
/*Step 2: Advanced Queries
1. Correlation Between Age and Performance Rating:
SELECT Age, PerformanceRating
FROM Employee_analysis;*/
SELECT 
    Age, PerformanceRating
FROM
    Employee_analysis;

/*2. Employees Who Have Not Been Promoted in Last 5 Years:
SELECT Employee_ID, YearsSinceLastPromotion, JobRole
FROM Employee_analysis
WHERE YearsSinceLastPromotion >= 5;*/
SELECT 
    Employee_ID, YearsSinceLastPromotion, JobRole
FROM
    Employee_analysis
WHERE
    YearsSinceLastPromotion >= 5;
/*3. Employees with More Than 10 Years at the Company and High Performance Rating:
SELECT Employee_ID, YearsAtCompany, PerformanceRating
FROM Employee_analysis
WHERE YearsAtCompany > 10 AND PerformanceRating >= 4;*/
SELECT 
    Employee_ID, YearsAtCompany, PerformanceRating
FROM
    employee_analysis
WHERE
    YearsAtCompany > 10
        AND PerformanceRating >= 4;

/*Step 3 : Conditional Queries
1. Employees with High Job Satisfaction and Low Attrition Risk:
SELECT Employee_ID, JobSatisfaction, Attrition
FROM Employee_analysis
WHERE JobSatisfaction >= 4 AND Attrition = 'No';*/
SELECT 
    Employee_ID, JobSatisfaction, Attrition
FROM
    Employee_analysis
WHERE
    JobSatisfaction >= 4
        AND Attrition = 'No';
/*2. Count of Employees by Education Field:
SELECT EducationField, COUNT(*) as EmployeeCount
FROM Employee_analysis
GROUP BY EducationField;*/
SELECT 
    EducationField, COUNT(*) AS EmployeeCount
FROM
    Employee_analysis
GROUP BY EducationField;
