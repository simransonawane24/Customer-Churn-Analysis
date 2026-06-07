-- ==========================================
-- CUSTOMER CHURN ANALYSIS PROJECT
-- Author: Simran Sonawane
-- Database: churn_analysis
-- Table: telco_churn
-- ==========================================

USE churn_analysis;

-- ==========================================
-- 1. TOTAL CUSTOMERS
-- ==========================================

SELECT COUNT(*) AS Total_Customers
FROM telco_churn;

-- ==========================================
-- 2. CHURN DISTRIBUTION
-- ==========================================

SELECT
    Churn,
    COUNT(*) AS Customers
FROM telco_churn
GROUP BY Churn;

-- ==========================================
-- 3. CHURN RATE
-- ==========================================

SELECT
ROUND(
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
    *100.0/
    COUNT(*)
,2) AS Churn_Rate_Percentage
FROM telco_churn;

-- ==========================================
-- 4. CONTRACT TYPE ANALYSIS
-- ==========================================

SELECT
    Contract,
    Churn,
    COUNT(*) AS Customers
FROM telco_churn
GROUP BY Contract, Churn
ORDER BY Contract;

-- ==========================================
-- 5. CHURN RATE BY CONTRACT
-- ==========================================

SELECT
    Contract,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
        *100.0/
        COUNT(*)
    ,2) AS Churn_Rate
FROM telco_churn
GROUP BY Contract
ORDER BY Churn_Rate DESC;

-- ==========================================
-- 6. INTERNET SERVICE CHURN ANALYSIS
-- ==========================================

SELECT
    InternetService,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
        *100.0/
        COUNT(*)
    ,2) AS Churn_Rate
FROM telco_churn
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

-- ==========================================
-- 7. PAYMENT METHOD CHURN ANALYSIS
-- ==========================================

SELECT
    PaymentMethod,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
        *100.0/
        COUNT(*)
    ,2) AS Churn_Rate
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

-- ==========================================
-- 8. TENURE ANALYSIS
-- ==========================================

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS Tenure_Group,

    COUNT(*) AS Customers,

    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
        *100.0/
        COUNT(*)
    ,2) AS Churn_Rate

FROM telco_churn
GROUP BY Tenure_Group
ORDER BY Churn_Rate DESC;

-- ==========================================
-- 9. GENDER ANALYSIS
-- ==========================================

SELECT
    gender,
    COUNT(*) AS Customers,

    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
        *100.0/
        COUNT(*)
    ,2) AS Churn_Rate

FROM telco_churn
GROUP BY gender;

-- ==========================================
-- 10. SENIOR CITIZEN ANALYSIS
-- ==========================================

SELECT
    SeniorCitizen,
    COUNT(*) AS Customers,

    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
        *100.0/
        COUNT(*)
    ,2) AS Churn_Rate

FROM telco_churn
GROUP BY SeniorCitizen
ORDER BY Churn_Rate DESC;

-- ==========================================
-- 11. MONTHLY CHARGES ANALYSIS
-- ==========================================

SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM telco_churn
GROUP BY Churn;

-- ==========================================
-- 12. REVENUE AT RISK
-- ==========================================

SELECT
    ROUND(SUM(MonthlyCharges),2) AS Revenue_At_Risk
FROM telco_churn
WHERE Churn='Yes';