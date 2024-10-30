# SQL Database Analysis for an Instagram Clone

Completing this SQL exercise for an Instagram clone database has deepened my understanding of how databases can capture complex social interactions and how queries can extract meaningful insights. By constructing this database and writing SQL queries, I learned not only how to create tables and manage relationships but also how to derive valuable information that a social platform might need to run its operations effectively. For instance, I used queries to retrieve user data, track engagement, and identify the most active times and popular content. Each step helped reinforce the importance of database design, while the SQL syntax became more familiar as I applied it to practical, real-world scenarios.

One of the tasks involved retrieving the five oldest users in the database. Using the query `SELECT id, username, DATE_FORMAT(created_at, '%Y-%m-%d') FROM users ORDER BY created_at ASC LIMIT 5;`, I learned how to sort records by a date field to find early adopters. This step taught me the mechanics of ordering and limiting results, both essential for optimizing query performance. The formatted date in `YYYY-MM-DD` also emphasized the value of presenting data in user-friendly formats. I realized that understanding who the oldest users are might help in analyzing long-term user engagement trends or recognizing loyal users.

Another insightful query was identifying which day of the week most users registered on, using:

```sql
SELECT 
    DATE_FORMAT(created_at, '%W') AS Day_of_the_Week, 
    COUNT(*) AS user_count 
FROM users 
GROUP BY Day_of_the_Week 
ORDER BY user_count DESC;
```

This query was particularly interesting because it revealed how to use SQL to extract patterns from temporal data, which can support marketing strategies. For example, by targeting advertisements or promotional posts on high-traffic days, a company could maximize user engagement. This task reinforced my understanding of `GROUP BY` and `COUNT` functions in aggregating data, a fundamental skill in SQL.

I also wrote a query to find inactive users—those who registered but never posted a photo—using:

```sql
SELECT 
    users.username 
FROM photos 
RIGHT JOIN users ON users.id = photos.user_id 
WHERE photos.created_at IS NULL;
```

This was valuable because it showed how to use outer joins and `NULL` checks to filter out users without specific interactions. Such information would be essential in designing a re-engagement strategy, allowing the platform to prompt inactive users with tailored content or notifications to boost engagement. The exercise demonstrated the versatility of SQL joins and taught me how they can be applied in varied ways to answer complex questions about user behavior.

The exercise further included finding the most liked photo with:

```sql
SELECT 
    username, photos.id, photos.image_url, COUNT(*) AS Like_count 
FROM likes 
JOIN photos ON photo_id = photos.id 
INNER JOIN users ON photos.user_id = users.id 
GROUP BY likes.photo_id 
ORDER BY Like_count DESC 
LIMIT 1;
```

Through this, I learned about aggregating data for competitive or performance-based insights. Identifying the photo with the most likes can be useful in highlighting popular content, identifying trends, or even creating engagement-driven challenges. This part of the project illustrated the role of `GROUP BY` combined with `ORDER BY` and `LIMIT` in pinpointing peak engagement.

Finally, calculating the average number of posts per user:

```sql
SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS Avg_Post_Per_User;
```

taught me how SQL can be used to generate summary statistics across different data sets. Knowing the average post frequency gives insight into general user engagement and can serve as a benchmark to measure growth or inactivity. Throughout the project, I saw firsthand how queries can be structured to pull specific insights and support strategic decisions for a social platform. Each of these exercises collectively honed my SQL skills, provided a framework for data-driven decision-making, and reinforced the foundational importance of a well-designed database in supporting platform functionality and analysis.