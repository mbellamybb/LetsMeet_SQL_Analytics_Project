-- Marketing Campagin Queries
-- 1
SELECT
	*
FROM grp;
/* general search of grp table*/

-- 2
SELECT
	CASE
		WHEN rating = 0 THEN 'grp_no_rating'
        WHEN rating BETWEEN 1 AND 1.99 THEN 'grp_rating_1_to_1.99'
        WHEN rating BETWEEN 2 AND 2.99 THEN 'grp_rating_2_to_2.99'
        WHEN rating BETWEEN 3 AND 3.99 THEN 'grp_rating_3_to_3.99'
        WHEN rating BETWEEN 4 AND 4.99 THEN 'grp_rating_4_to_4.99'
        WHEN rating = 5 THEN 'grp_rating_5'
	END AS group_ratings,
    COUNT(*) AS group_count
FROM grp
GROUP BY rating
ORDER BY group_ratings DESC;
/*Query to list the number of groups by rating*/

SELECT
		SUM(CASE WHEN rating = 0 THEN 1 ELSE 0 END) 'grp_no_rating',
		SUM(CASE WHEN rating BETWEEN 1 AND 1.99 THEN 1 ELSE 0 END)'grp_rating_1_to_1.99',
        SUM(CASE WHEN rating BETWEEN 2 AND 2.99 THEN 1 ELSE 0 END)'grp_rating_2_to_2.99',
        SUM(CASE WHEN rating BETWEEN 3 AND 3.99 THEN 1 ELSE 0 END)'grp_rating_3_to_3.99',
        SUM(CASE WHEN rating BETWEEN 4 AND 4.99 THEN 1 ELSE 0 END)'grp_rating_4_to_4.99',
		SUM(CASE WHEN rating = 5 THEN 1 ELSE 0 END)'grp_rating_5'
FROM grp;
/*Query to Transpose table with CASE function to better visually represent findings*/

SELECT
	CASE
		WHEN rating = 0 THEN 'grp_no_rating'
        WHEN rating BETWEEN 1 AND 1.99 THEN 'grp_rating_1_to_1.99'
        WHEN rating BETWEEN 2 AND 2.99 THEN 'grp_rating_2_to_2.99'
        WHEN rating BETWEEN 3 AND 3.99 THEN 'grp_rating_3_to_3.99'
        WHEN rating BETWEEN 4 AND 4.99 THEN 'grp_rating_4_to_4.99'
        WHEN rating = 5 THEN 'grp_rating_5'
	END AS group_ratings,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) over(), 2) AS percentage_of_ratings
FROM grp
GROUP BY rating
ORDER BY group_ratings DESC
LIMIT 1;

-- OR

SELECT
	(SELECT
		COUNT(group_id)
	FROM grp
	WHERE rating = 5)* 100
/
(SELECT
	COUNT(rating)
FROM grp) as pct_grp_rating_5;
/* Query for the percetange of groups with a 5 star rating*/

SELECT
	(SELECT
		COUNT(group_id)
	FROM grp
	WHERE rating BETWEEN 4 AND 4.99)* 100
/
(SELECT
	COUNT(rating)
FROM grp) as pct_grp_rating_4;
/* Query for the percetange of groups with a 4 - 4.99 star rating*/

/*There are 745 groups with 5 star ratings, this represents 17.17% of the total number of groups. The Groups with a rating of 4 - 4.99 were 1964, representing 45.25%.*/

-- 3
SELECT
	group_name,
	members,
    rating
FROM grp
ORDER BY members DESC;
/* Query for the locating the groups with the most members */

SELECT
	group_name,
	members,
    rating
FROM grp
WHERE rating = "5"
ORDER BY members DESC;
/* Query for the locating the groups with a 5 rating and the most members */
/*The above queries were run as a comparison between the 5 star rated groups and all other groups. The findings indicated that the rating of 5 stars was not a reliable measure of success or popularity. Groups not rated with 5 stars had significately more members than those who had the rating*/ 

-- 4
SELECT
	  city,
      group_name,
      members,
      rating
FROM grp
JOIN city ON grp.city_id = city.city_id
WHERE rating = "5" 
ORDER BY members DESC;
/* Query for the locating the cities where the groups with a 5 rating and the most members are*/

SELECT
	  city,
      group_name,
      members,
      rating
FROM grp
JOIN city ON grp.city_id = city.city_id
ORDER BY members DESC;
/* Query for the locating the cities with groups with the most members are*/

/*A further two queries were run as a comparison between the cities with the 5 star rated groups and all other groups. The findings indicated that the rating of 5 stars was not a reliable measure of success or popularity when filtered by city. Cities with groups not rated with 5 stars had significately more members than those who had the rating*/ 

-- 5
SELECT
	  city,
      group_name,
      category_name,
      members,
      rating
FROM grp
JOIN city ON grp.city_id = city.city_id
JOIN category ON grp.category_id = category.category_id
WHERE rating = "5" 
ORDER BY members DESC;
/* Query for the locating the category in which the groups with a 5 rating and the most members fall into*/

SELECT
	  city,
      group_name,
      category_name,
      members,
      rating
FROM grp
JOIN city ON grp.city_id = city.city_id
JOIN category ON grp.category_id = category.category_id
ORDER BY members DESC;
/* Query for the locating the category which the groups with the most members fall into*/

/*A further two queries were run as a comparison between groups filtered by category and city with the 5 star rated groups and all other groups. The findings indicated that the rating of 5 stars was not a reliable measure of success or popularity when filtered by city and then by category.*/ 

