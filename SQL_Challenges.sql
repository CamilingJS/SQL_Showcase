USE ig_clone;

-- 1. Who are the 5 olders users:
SELECT id, username, DATE_FORMAT(created_at, '%Y-%m-%d')  
FROM users
ORDER BY created_at ASC
LIMIT 5; 

-- 2. What day of the week do most users register on?
--    We need to figure out when to schedule an ad campgain
SELECT 
    DATE_FORMAT(created_at, '%W') AS Day_of_the_Week,  
    COUNT(*) AS user_count
FROM 
    users
GROUP BY 
    Day_of_the_Week
ORDER BY 
    user_count DESC;

-- or
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- 3. We want to target our inactive us

