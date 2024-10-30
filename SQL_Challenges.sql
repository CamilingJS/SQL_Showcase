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

-- 3. We want to target our inactive users with an email campaign. 
--    Find the users who have never posted a photo
SELECT users.username FROM photos
RIGHT JOIN users ON users.id = photos.user_id
WHERE photos.created_at IS NULL;

-- 4. We're running a new contest to see who can get the most likes on a single photo. 
SELECT username, photos.id, photos.image_url, COUNT(*) AS Like_count FROM likes
JOIN photos ON photo_id = photos.id
INNER JOIN users ON photos.user_id = users.id
GROUP BY likes.photo_id
ORDER BY Like_count DESC
LIMIT 1; 

-- 5. Our investors want to know.. How many times does average users post?
SELECT
(SELECT COUNT(*) FROM photos) /
(SELECT COUNT(*) FROM users) AS Avg_Post_Per_User;

-- 6. A brand wants to know which hashtags to use in a post. 
--    What are the top 5 most commonly used hashtags
SELECT tags.tag_name, count(*) AS total_ FROM tags
JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total_ DESC
LIMIT 5;

-- 7. We have a small problem with bots on our site...
--    Finds users who have liked every single photo on the site

SELECT users.username, count(*) AS like_count FROM likes
JOIN users on users.id = likes.user_id
GROUP BY likes.user_id
HAVING like_count = (SELECT COUNT(*) FROM photos); 
 

