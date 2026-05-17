CREATE DATABASE ai_workforce;
USE ai_workforce;

SELECT * FROM employees;

SELECT
    Industry,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Job_Status = 'Replaced'
            THEN 1
            ELSE 0
        END
    ) AS replaced_count
FROM employees
GROUP BY Industry
ORDER BY replaced_count DESC; -- Marketing has highest AI replacement rate.

SELECT
    Industry,
    AVG(Salary_After_AI - Salary_Before_AI)
    AS avg_salary_change
FROM employees
GROUP BY Industry
ORDER BY avg_salary_change DESC; -- IT gained salary growth after AI adoption.

SELECT 
    AI_Adoption_Level,
    AVG(`Productivity_Change_%`) AS avg_productivity
FROM employees
GROUP BY AI_Adoption_Level; -- High AI adoption improved productivity.

SELECT
    Job_Role,
    COUNT(*) replaced_jobs
FROM employees
WHERE Job_Status = 'Replaced'
GROUP BY Job_Role
ORDER BY replaced_jobs DESC; -- Replaced jobs

SELECT
    Job_Role,
    AVG(AI_Survival_Score) avg_score
FROM employees
GROUP BY Job_Role
ORDER BY avg_score DESC; -- safest career

SELECT
    Industry,
    COUNT(*) employees_need_upskilling
FROM employees
WHERE Upskilling_Required = 'Yes'
GROUP BY Industry
ORDER BY employees_need_upskilling DESC; -- Which industries urgently need reskilling.

SELECT
    Remote_Work,
    AVG(`Productivity_Change_%`) avg_productivity
FROM employees
GROUP BY Remote_Work; -- Remote workers experienced higher AI productivity gains.

SELECT
    Education_Level,
    AVG(AI_Survival_Score) avg_survival
FROM employees
GROUP BY Education_Level
ORDER BY avg_survival DESC; -- Higher education reduces AI replacement risk.

SELECT
    Industry,
    AVG(AI_Survival_Score) avg_score,

    RANK() OVER(
        ORDER BY AVG(AI_Survival_Score) DESC
    ) industry_rank

FROM employees
GROUP BY Industry;

SELECT
    Employee_ID,
    Job_Role,

    Salary_After_AI - Salary_Before_AI
    AS salary_growth,

    DENSE_RANK() OVER(
        ORDER BY
        Salary_After_AI - Salary_Before_AI DESC
    ) growth_rank

FROM employees;

SELECT
    Industry,
    AVG(Salary_Before_AI) before_ai,
    AVG(Salary_After_AI) after_ai
FROM employees
GROUP BY Industry;

SELECT
    Automation_Risk,
    COUNT(*) employee_count
FROM employees
GROUP BY Automation_Risk;