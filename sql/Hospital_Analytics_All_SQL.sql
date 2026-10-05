-- ============================================================
-- HOSPITAL ANALYTICS - COMPLETE SQL REFERENCE
-- Database: MySQL
-- Table: hospital_admissions_data
-- ============================================================

-- 1. CREATE DATABASE
CREATE DATABASE Hospital_analytics;
USE Hospital_analytics;


-- 2. VIEW TABLE STRUCTURE
DESCRIBE hospital_admissions_data;


-- 3. VIEW SAMPLE DATA
SELECT *
FROM hospital_admissions_data
LIMIT 10;


-- 4. TOTAL NUMBER OF ADMISSIONS
SELECT COUNT(*) AS total_admissions
FROM hospital_admissions_data;


-- 5. UNIQUE PATIENTS
SELECT COUNT(DISTINCT patient_id) AS unique_patients
FROM hospital_admissions_data;


-- 6. AVERAGE PATIENT AGE
SELECT ROUND(AVG(age), 2) AS avg_patient_age
FROM hospital_admissions_data;


-- 7. AVERAGE LENGTH OF STAY
SELECT ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay
FROM hospital_admissions_data;


-- 8. TOTAL BILLING
SELECT ROUND(SUM(billing_amount), 2) AS total_billing
FROM hospital_admissions_data;


-- 9. AVERAGE BILLING PER ADMISSION
SELECT ROUND(AVG(billing_amount), 2) AS avg_billing_per_admission
FROM hospital_admissions_data;


-- 10. AVERAGE PATIENT SATISFACTION
SELECT ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
FROM hospital_admissions_data;


-- 11. 30-DAY READMISSIONS
SELECT
    SUM(CASE
        WHEN is_readmission_30d = 'True' THEN 1
        ELSE 0
    END) AS readmissions_30d
FROM hospital_admissions_data;


-- 12. 30-DAY READMISSION RATE
SELECT
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data;


-- 13. DEPARTMENT PERFORMANCE
SELECT
    department,
    COUNT(*) AS admissions,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(SUM(billing_amount), 2) AS total_billing,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    SUM(CASE
        WHEN is_readmission_30d = 'True' THEN 1
        ELSE 0
    END) AS readmissions,
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data
GROUP BY department
ORDER BY total_billing DESC;


-- 14. DEPARTMENT BY ADMISSIONS
SELECT
    department,
    COUNT(*) AS admissions
FROM hospital_admissions_data
GROUP BY department
ORDER BY admissions DESC;


-- 15. DEPARTMENT × ADMISSION TYPE
SELECT
    department,
    admission_type,
    COUNT(*) AS admissions,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data
GROUP BY department, admission_type
ORDER BY readmission_rate_pct DESC;


-- 16. AGE GROUP ANALYSIS
SELECT
    CASE
        WHEN age < 18 THEN 'Pediatric'
        WHEN age BETWEEN 18 AND 34 THEN '18-34'
        WHEN age BETWEEN 35 AND 49 THEN '35-49'
        WHEN age BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS admissions,
    COUNT(DISTINCT patient_id) AS unique_patients,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    SUM(CASE
        WHEN is_readmission_30d = 'True' THEN 1
        ELSE 0
    END) AS readmissions,
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data
GROUP BY age_group
ORDER BY admissions DESC;


-- 17. INSURANCE TYPE ANALYSIS
SELECT
    insurance_type,
    COUNT(*) AS admissions,
    COUNT(DISTINCT patient_id) AS unique_patients,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data
GROUP BY insurance_type
ORDER BY admissions DESC;


-- 18. DIAGNOSIS ANALYSIS
SELECT
    diagnosis,
    COUNT(*) AS admissions,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data
GROUP BY diagnosis
ORDER BY admissions DESC;


-- 19. GENDER ANALYSIS
SELECT
    gender,
    COUNT(*) AS admissions,
    ROUND(AVG(age), 2) AS avg_age,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
FROM hospital_admissions_data
GROUP BY gender
ORDER BY admissions DESC;


-- 20. ADMISSION TYPE ANALYSIS
SELECT
    admission_type,
    COUNT(*) AS admissions,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data
GROUP BY admission_type
ORDER BY readmission_rate_pct DESC;


-- 21. MONTHLY ADMISSION TREND
SELECT
    DATE_FORMAT(STR_TO_DATE(admission_date, '%Y-%m-%d'), '%Y-%m') AS admission_month,
    COUNT(*) AS admissions,
    ROUND(SUM(billing_amount), 2) AS total_billing,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay
FROM hospital_admissions_data
GROUP BY admission_month
ORDER BY admission_month;


-- 22. HIGH-BILLING ADMISSIONS
SELECT
    admission_id,
    patient_id,
    department,
    diagnosis,
    billing_amount,
    length_of_stay_days,
    admission_type
FROM hospital_admissions_data
ORDER BY billing_amount DESC
LIMIT 20;


-- 23. LONGEST LENGTH OF STAY
SELECT
    admission_id,
    patient_id,
    department,
    diagnosis,
    length_of_stay_days,
    billing_amount
FROM hospital_admissions_data
ORDER BY length_of_stay_days DESC
LIMIT 20;


-- 24. LOW-SATISFACTION ADMISSIONS
SELECT
    admission_id,
    patient_id,
    department,
    patient_satisfaction,
    discharge_status,
    admission_type
FROM hospital_admissions_data
WHERE patient_satisfaction < 3
ORDER BY patient_satisfaction ASC;


-- 25. HIGH-RISK DEPARTMENT RANKING
-- Risk score combines readmission, length of stay and dissatisfaction.
WITH department_metrics AS (
    SELECT
        department,
        AVG(
            CASE
                WHEN is_readmission_30d = 'True' THEN 1
                ELSE 0
            END
        ) * 100 AS readmission_rate,
        AVG(length_of_stay_days) AS avg_stay,
        AVG(5 - patient_satisfaction) AS dissatisfaction
    FROM hospital_admissions_data
    GROUP BY department
),
ranked AS (
    SELECT
        department,
        readmission_rate,
        avg_stay,
        dissatisfaction,
        RANK() OVER (ORDER BY readmission_rate DESC) AS readmission_rank,
        RANK() OVER (ORDER BY avg_stay DESC) AS stay_rank,
        RANK() OVER (ORDER BY dissatisfaction DESC) AS dissatisfaction_rank
    FROM department_metrics
)
SELECT
    department,
    ROUND(readmission_rate, 2) AS readmission_rate,
    ROUND(avg_stay, 2) AS avg_stay,
    ROUND(dissatisfaction, 2) AS dissatisfaction,
    ROUND(
        0.40 * readmission_rate
        + 0.35 * (
            avg_stay / (SELECT MAX(avg_stay) FROM department_metrics) * 100
        )
        + 0.25 * (
            dissatisfaction / (SELECT MAX(dissatisfaction) FROM department_metrics) * 100
        ),
        2
    ) AS operational_risk_score
FROM ranked
ORDER BY operational_risk_score DESC;


-- 26. EMERGENCY ADMISSION RISK
SELECT
    department,
    COUNT(*) AS emergency_admissions,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data
WHERE admission_type = 'Emergency'
GROUP BY department
ORDER BY readmission_rate_pct DESC;


-- 27. DEPARTMENTS ABOVE OVERALL READMISSION RATE
SELECT
    department,
    COUNT(*) AS admissions,
    ROUND(
        100.0 * SUM(CASE
            WHEN is_readmission_30d = 'True' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM hospital_admissions_data
GROUP BY department
HAVING readmission_rate_pct >
    (
        SELECT
            100.0 * SUM(CASE
                WHEN is_readmission_30d = 'True' THEN 1
                ELSE 0
            END) / COUNT(*)
        FROM hospital_admissions_data
    )
ORDER BY readmission_rate_pct DESC;


-- 28. DATA QUALITY CHECKS

-- Null values
SELECT
    SUM(admission_id IS NULL) AS null_admission_id,
    SUM(patient_id IS NULL) AS null_patient_id,
    SUM(admission_date IS NULL) AS null_admission_date,
    SUM(department IS NULL) AS null_department,
    SUM(age IS NULL) AS null_age,
    SUM(billing_amount IS NULL) AS null_billing,
    SUM(patient_satisfaction IS NULL) AS null_satisfaction
FROM hospital_admissions_data;


-- Duplicate admission IDs
SELECT
    admission_id,
    COUNT(*) AS duplicate_count
FROM hospital_admissions_data
GROUP BY admission_id
HAVING COUNT(*) > 1;


-- Invalid age values
SELECT *
FROM hospital_admissions_data
WHERE age < 0 OR age > 120;


-- Invalid length of stay
SELECT *
FROM hospital_admissions_data
WHERE length_of_stay_days < 0;


-- 29. BASIC SQL PATTERNS / REFERENCE

-- SELECT
SELECT department, billing_amount
FROM hospital_admissions_data;

-- WHERE
SELECT *
FROM hospital_admissions_data
WHERE department = 'Cardiology';

-- ORDER BY
SELECT *
FROM hospital_admissions_data
ORDER BY billing_amount DESC;

-- GROUP BY
SELECT department, COUNT(*) AS admissions
FROM hospital_admissions_data
GROUP BY department;

-- HAVING
SELECT department, AVG(billing_amount) AS avg_billing
FROM hospital_admissions_data
GROUP BY department
HAVING AVG(billing_amount) > 100000;

-- DISTINCT
SELECT DISTINCT department
FROM hospital_admissions_data;

-- CASE
SELECT
    patient_id,
    CASE
        WHEN age < 18 THEN 'Pediatric'
        WHEN age < 65 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group
FROM hospital_admissions_data;

-- JOIN template
-- SELECT a.column_name, b.column_name
-- FROM table_a a
-- JOIN table_b b ON a.key = b.key;

-- CTE template
WITH summary AS (
    SELECT department, COUNT(*) AS admissions
    FROM hospital_admissions_data
    GROUP BY department
)
SELECT *
FROM summary
ORDER BY admissions DESC;

-- WINDOW FUNCTION template
SELECT
    department,
    billing_amount,
    RANK() OVER (PARTITION BY department ORDER BY billing_amount DESC) AS billing_rank
FROM hospital_admissions_data;


-- ============================================================
-- END OF HOSPITAL ANALYTICS SQL REFERENCE
-- ============================================================
