-- Member Growth Queries
-- 1
SELECT
	*
FROM grp_member;
/* general search of grp_member table*/

-- 2
SELECT
	member_id,
	YEAR(MIN(joined)) AS yr_mbr_joined_letsmeet
FROM grp_member
GROUP BY member_id
ORDER BY YEAR(MIN(joined)) ASC;
/* Query to find the year in which members joined LetsMeet*/

SELECT 
    yr_mbr_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined
FROM
    (SELECT 
        member_id,
		YEAR(MIN(joined)) AS yr_mbr_joined_letsmeet
    FROM grp_member
    GROUP BY member_id) AS a
GROUP BY yr_mbr_joined_letsmeet
ORDER BY yr_mbr_joined_letsmeet ASC;
/* Query to show the growth in members on LetsMeet over the years*/

SELECT
	yr_mbr_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined,
    COUNT(member_id) - LAG(COUNT(member_id))
    OVER (ORDER BY yr_mbr_joined_letsmeet) AS difference_previous_year
FROM (SELECT
		member_id,
		YEAR(MIN(joined)) AS yr_mbr_joined_letsmeet
	  FROM grp_member
	  GROUP BY member_id) AS a
GROUP BY yr_mbr_joined_letsmeet
ORDER BY yr_mbr_joined_letsmeet ASC;

/* Query to show the difference in growth of members per year*/

-- 3
SELECT
	DISTINCT(city)
FROM grp_member;
/*query to find each unique city name*/

SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member
	SET city = "New York"
WHERE city IN ( "New York", "West New York");
/* DML carried out to update city names from smaller cities to "New York*/

UPDATE grp_member
	SET city = "San Francisco"
WHERE city  IN ("San Francisco", "South San Francisco");
/* DML carried out to update city names from smaller cities to "San Francisco*/

UPDATE grp_member
	SET city = "Chicago"
WHERE city IN ("East Chicago", "West Chicago", "North Chicago", "Chicago Heights", "Chicago Ridge", "Chicago");
/* DML carried out to update city names from smaller cities to "Chicago*/

SET SQL_SAFE_UPDATES = 1;

-- 4
-- Chicago
SELECT
	yr_chi_mbrs_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined    
FROM (SELECT
		member_id,
		YEAR(MIN(joined)) AS yr_chi_mbrs_joined_letsmeet
	  FROM grp_member
      WHERE city = "Chicago"
	  GROUP BY member_id) AS a
GROUP BY yr_chi_mbrs_joined_letsmeet
ORDER BY yr_chi_mbrs_joined_letsmeet ASC;
/* Query to show the growth in members on LetsMeet for the city of Chicago over the year*/

SELECT
	yr_chi_mbrs_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined,
    COUNT(member_id) - LAG(COUNT(member_id))
    OVER (ORDER BY yr_chi_mbrs_joined_letsmeet) AS difference_previous_year
FROM (SELECT
		member_id,
		YEAR(MIN(joined)) AS yr_chi_mbrs_joined_letsmeet
	  FROM grp_member
      WHERE city = "Chicago"
	  GROUP BY member_id) AS a
GROUP BY yr_chi_mbrs_joined_letsmeet
ORDER BY yr_chi_mbrs_joined_letsmeet ASC;

/* Query to show the difference in growth of members on LetsMeet for the city of Chicago per year*/

-- San Francisco
SELECT
	yr_sf_mbrs_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined    
FROM (SELECT
		member_id,
		YEAR(MIN(joined)) AS yr_sf_mbrs_joined_letsmeet
	  FROM grp_member
      WHERE city = "San Francisco"
	  GROUP BY member_id) AS a
GROUP BY yr_sf_mbrs_joined_letsmeet
ORDER BY yr_sf_mbrs_joined_letsmeet ASC;
/* Query to show the growth in members on LetsMeet for the city of San Francisco over the year*/

SELECT
	yr_sf_mbrs_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined,
    COUNT(member_id) - LAG(COUNT(member_id))
    OVER (ORDER BY yr_sf_mbrs_joined_letsmeet) AS difference_previous_year
FROM (SELECT
		member_id,
		YEAR(MIN(joined)) AS yr_sf_mbrs_joined_letsmeet
	  FROM grp_member
      WHERE city = "San Francisco"
	  GROUP BY member_id) AS a
GROUP BY yr_sf_mbrs_joined_letsmeet
ORDER BY yr_sf_mbrs_joined_letsmeet ASC;

/* Query to show the difference in growth of members on LetsMeet for the city of San Francisco per year*/

-- New York
SELECT
	yr_ny_mbrs_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined    
FROM (SELECT
		member_id,
		YEAR(MIN(joined)) AS yr_ny_mbrs_joined_letsmeet
	  FROM grp_member
      WHERE city = "New York"
	  GROUP BY member_id) AS a
GROUP BY yr_ny_mbrs_joined_letsmeet
ORDER BY yr_ny_mbrs_joined_letsmeet ASC;
/* Query to show the growth in members on LetsMeet for the city of New York over the year*/

SELECT
	yr_ny_mbrs_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined,
    COUNT(member_id) - LAG(COUNT(member_id))
    OVER (ORDER BY yr_ny_mbrs_joined_letsmeet) AS difference_previous_year
FROM (SELECT
		member_id,
		YEAR(MIN(joined)) AS yr_ny_mbrs_joined_letsmeet
	  FROM grp_member
      WHERE city = "New York"
	  GROUP BY member_id) AS a
GROUP BY yr_ny_mbrs_joined_letsmeet
ORDER BY yr_ny_mbrs_joined_letsmeet ASC;

/* Query to show the difference in growth of members on LetsMeet for the city of New York per year*/

-- 5
SELECT
	mo_2017_mbr_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined
      FROM (SELECT
		member_id,
		MONTH(joined) AS mo_2017_mbr_joined_letsmeet
	FROM grp_member
	WHERE YEAR(joined) = "2017"
	GROUP BY member_id) AS a
GROUP BY mo_2017_mbr_joined_letsmeet
ORDER BY mo_2017_mbr_joined_letsmeet ASC;
/* Query to show the growth in members on LetsMeet during 2017*/

SELECT
	mo_2017_mbr_joined_letsmeet,
    COUNT(member_id) AS num_mbrs_joined,
      COUNT(member_id) - LAG(COUNT(member_id))
    OVER (ORDER BY mo_2017_mbr_joined_letsmeet) AS difference_previous_month
FROM (SELECT
		member_id,
		MONTH(joined) AS mo_2017_mbr_joined_letsmeet
	FROM grp_member
	WHERE YEAR(joined) = "2017"
	GROUP BY member_id) AS a
GROUP BY mo_2017_mbr_joined_letsmeet
ORDER BY mo_2017_mbr_joined_letsmeet ASC;
/* Query to show the difference in growth of members on LetsMeet for 2017 per month*/

