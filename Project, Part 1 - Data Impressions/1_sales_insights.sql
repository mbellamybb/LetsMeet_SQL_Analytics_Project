
-- Answer the questions from the Sales team in this file.


-- Active Cities
-- 1
SELECT 
DISTINCT city
FROM grp_member
WHERE member_status = 'active';
 /* What cities have active members?
 The cities with active members are:
'San Francisco'
'New York'
'Chicago'
'West New York'
'West Chicago'
'South San Francisco'
'North Chicago'
'Chicago Heights'
'East Chicago'
'Chicago Ridge'

10 of the 12 cities found have active members.*/

-- 2
SELECT 
    city,
    state
FROM city
WHERE city NOT IN (SELECT DISTINCT city
        FROM grp_member
        WHERE member_status = 'active');
/*Are there any cities listed in the city table with no active members? If so, what state are those cities in?
My query has returned three cities with no active members:
'New York Mills'
'New York Mills'
'Chicago Park'

The cities with no active members are in the following states:
'New York Mills', 'NY'
'New York Mills', 'MN'
'Chicago Park', 'CA'

3 of the 6 states have no active members.
Of the 3 areas identified with no active members, LetsMeet only operates in 1, New York Mills, NY. LetsMeet has active members in each area it operates in. This indicates that the data needs to be cleaned in the table.
*/
-- Groups
-- 1
SELECT 
	join_mode,
    COUNT(*)
FROM grp
GROUP BY join_mode;
/*HOW many groups are currently open, waiting for approval and/or closed?
There are 4340 groups currently open, waiting for approval and/or closed.
Of those groups 3602 currently open, 723 waiting for approval and 15 closed.*/
 

-- Categories
-- 1
SELECT 
    category_name,
    group_name,
    COUNT(group_id) AS 5_categories_most_groups
FROM category
        JOIN grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(group_id) DESC
LIMIT 5;

SELECT 
    category_name,
    group_name,
    city_id,
    COUNT(group_id) AS 5_categories_least_groups
FROM category JOIN grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(group_id) ASC
LIMIT 5;

/*What are the five categories that contain the most groups?
The categories that contain the most groups are:
'Tech'
'Career & Business'
'Socializing'
Health & Wellbeing'
Language & Ethnic Identity'

What are the five categories that contain the least number of groups?
The categories that containt the lest number of groups are:
'Paranormal'
'Cars & Motorcycles'
'Sci-Fi & Fantasy'
'Lifestyle'
'Hobbies & Crafts'

The category with the largest number of groups is Tech.
The category witht he smallest number of groups is Paranormal.
Of the 5 categories with the largest number of groups, 4 of the five categories are located in the city New York.
The category 'Paranormal' with the lowest number odf groups is located in San Francisco.
*/

-- Members
-- 1
SELECT
	COUNT(DISTINCT(member_id)) AS num_of_members
FROM grp_member;

-- 2 
SELECT
(SELECT 
COUNT(DISTINCT(member_id))
FROM grp_member
WHERE city = 'San Francisco')
/
(SELECT
	COUNT(DISTINCT(member_id))/100
FROM grp_member) AS pct_members_chi;

/* How many members are there?
There are 39980 members.

What percentage of members are in Chicago?
21.2% of the members are in Chicago.

Chicago has the lowest percentage of members with 21.2%.
New York has the highest percentage of members with 52.9%
San Francisco has 25.4 % of the members.*/
