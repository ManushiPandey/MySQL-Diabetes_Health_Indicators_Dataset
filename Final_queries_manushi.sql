-- 1. Average BMI of Smokers with No Physical Activity
SELECT 
    u.respondent_id,
    u.age,
    u.gender,
    AVG(h.bmi) AS average_bmi
FROM 
    Users u
JOIN 
    Health_Indicators h ON u.respondent_id = h.respondent_id
WHERE 
    h.smoking_status = 1 
    AND h.physical_activity = 0
GROUP BY 
    u.respondent_id, u.age, u.gender
ORDER BY 
    u.age DESC;

-- 2. Respondents with Highest Income and Best Health
SELECT 
    u.respondent_id,
    u.income,
    u.education,
    h.general_health AS health_rating
FROM 
    Users u
JOIN 
    Health_Indicators h ON u.respondent_id = h.respondent_id
WHERE 
    u.income = (SELECT MAX(income) FROM Users)
    AND h.general_health = (SELECT MAX(general_health) FROM Health_Indicators)
ORDER BY 
    u.income DESC;

-- 3. Total Number of Respondents Diagnosed with Diabetes
SELECT 
    COUNT(*) AS diagnosed_count
FROM 
    Diabetes_Risk dr
JOIN 
    Users u ON dr.respondent_id = u.respondent_id
WHERE 
    dr.diabetes_binary = 1;

-- 4. Respondents Over 50 with More than 5 Days of Poor Mental Health
SELECT 
    u.respondent_id,
    u.age,
    u.gender,
    h.mental_health
FROM 
    Users u
JOIN 
    Health_Indicators h ON u.respondent_id = h.respondent_id
WHERE 
    h.mental_health > 5 
    AND u.age > 50
ORDER BY 
    u.age ASC;

-- 5. Respondents with Education Level Starting with 'B'
SELECT 
    u.respondent_id,
    u.education
FROM 
    Users u
WHERE 
    u.education LIKE 'B%'
ORDER BY 
    u.education ASC;
