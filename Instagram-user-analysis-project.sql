####   1.Loyal User Reward   ####

USE ig_clone;
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

#2. Inactive user engagement

SELECT p.id, username AS Inactive_username 
FROM photos p
RIGHT JOIN users u
	ON p.user_id = u.id
WHERE image_url IS Null;

#### Contest Winner Declaration

SELECT username,
		p.id,
		p.image_url,
		count(l.user_id) AS total_likes
FROM photos p
JOIN likes l
	ON l.user_id = p.user_id
JOIN users u
	ON p.user_id = u.id
GROUP BY p.id
ORDER BY total_likes DESC
LIMIT 3;


#### Hashtag Research

SELECT t.tag_name,
		count(pt.photo_id) AS total_times_used
FROM photo_tags pt
JOIN tags t
	ON pt.tag_id = t.id
GROUP BY t.id
ORDER BY total_times_used DESC
LIMIT 5;


##### Ad Campaign Launch

SELECT DATE_FORMAT((created_at), '%W') AS Best_Day_of_Week,
		count(username) AS No_of_register
FROM users
GROUP BY Best_Day_of_Week
ORDER BY No_of_register DESC
LIMIT 1;


###-----User Engagement--------
#--1.

SELECT  
		(SELECT count(users.username) FROM users) AS total_users,
		count(photos.id) AS total_photos,
        (SELECT count(*) FROM photos)/(SELECT count(*) FROM users) AS average_posts_per_user
FROM users, photos;
#---2.
