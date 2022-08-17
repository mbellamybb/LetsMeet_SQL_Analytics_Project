-- VENUE_
SELECT
	*
FROM venue_;
/*What is the RAND() column in this table? Does it have any relation to the venues?
The column labelled RAND() does not appear to have a specfic purpose in relation to the venues */

SELECT
    DISTINCT(city)
FROM venue_;
/*There are invalid values in the 'state' column of the 'venue_' table, this column needs to be cleaned.*/

SELECT
	city,
    state,
    COUNT(venue_id)
FROM venue_
GROUP BY city
ORDER BY COUNT(venue_id) DESC;
/*Which city has the most venues?
Venues were mostly concentrated in 'New York' with the most venues at 518, while 'Chicago' has 287 vanues and 'San Francisco' with 202 venues. The invalid values were not taken into account and were not enough to skew the analysis.*/

SELECT
	zip,
    COUNT(venue_id)
FROM venue_
GROUP BY zip
ORDER BY COUNT(venue_id) DESC;

/*Which zip code has the most venues? Identify the neighborhood. 
I was unable to gather accurate insights from this query because of invalid values in the 'zip' column of the 'venue_' table. The number of venue ids associated with the invalid zip codes means that the any analysis would be skewed.
Of the zip codes correctly entered in the database, 'New York City' had the most venues.*/

-- GRP
SELECT
	*
FROM grp;

SELECT
    *
    group_id,
    group_name,
    created
FROM grp
GROUP BY group_id
ORDER BY created DESC;

SELECT 
	group_name,
	members
FROM grp
WHERE group_name = 'Curvy Girls in the City';

/*What is the shortest running group on LetsMeet? How many members does that group they have?
The shortest running group on LetsMeet is 'Curvy Girls in the City', and this group has 668 members.*/

SELECT
    *
    group_id,
    group_name,
    created
FROM grp
GROUP BY group_id
ORDER BY created ASC;

SELECT
	group_name,
	members
FROM grp
WHERE group_name = 'New York City Poker Group';

/*What is the longest running group of LetsMeet? How many members does that group they have?
The longest running group on LetsMeet is 'New York City Poker Group' and this group has 1797 member.*/

SELECT
	visibility,
    COUNT(group_id)
FROM grp
GROUP BY visibility
ORDER BY COUNT(group_id) DESC;
/* What does public_limited mean? How many groups are public_limited?
'public_limited appears to refer to groups which are visibile to certain demographics of the public. 
There are 3822 groups with public visibility, this visibility has the most groups. There are 514 groups with 'public_limited' visibility and 4 groups that have members visibility.*/

SELECT
	rating,
    COUNT(group_id)
FROM grp
GROUP BY rating
ORDER BY COUNT(group_id) DESC;

/*How many groups have a rating of 5 and how many have a rating of 0?
 There are 1548 groups with a rating of 0.
There are 745 groups with a rating of 5.*/

SELECT
	rating, 
    visibility,
    COUNT(group_id)
FROM grp
GROUP by rating
ORDER BY COUNT(group_id) DESC;

/* What information does ranking and visibility columns provide?
Of the groups with a rating of 0, 1548 of those groups have a visibility of public.
The 745 groups with a rating of 5 have a visibility of public_limited.*/

SELECT
	who,
    COUNT(group_id)
FROM grp
GROUP BY who
ORDER BY COUNT(group_id) DESC;

/*What values come up most frequently in the who column?
The value 'members' appears the most frequently in the 'who' column, while.*/

SELECT
	group_name,
    event_name,
    event_id,
    COUNT(event_id)
FROM grp JOIN event ON grp.group_id = event.group_id
GROUP BY group_name
ORDER BY COUNT(event_id) DESC;

/*Which group held the most events and how many events did it hold?
Chicago Area District 30 Toastmasters held the most events with 1061.*/

-- GRP_MEMBER
SELECT
	*
FROM grp_member;
/* Can you use the grp_member table to determine the total number of members?
The 'grp_member' table only shows the active members of groups and would therefore be unable to show the total number of members.*/

SELECT
	member_id,
    member_name,
    joined,
    member_status
FROM grp_member
WHERE member_status = 'active'
ORDER BY joined ASC
LIMIT 1;
/*Who was the first LetsMeet member that is still active?
The first LetsMeet member who is still active is 'Christine'(member _id 257351).*/

SELECT 
	member_id,
    member_name,
	COUNT(group_id)
FROM grp_member
GROUP BY member_id
ORDER BY COUNT(group_id) DESC;
/*What member is a part of the most groups?
Michael (member_id 413896) is a part of the most groups, 350.*/

-- CITY
SELECT 
	*
FROM city;

SELECT
	city,
    member_count
FROM city
ORDER BY member_count DESC;
/* What city has the highest member_count? Which city has the lowest member_count?
'New York' is the city with the highest member_count with 229371, while Chicago Park has the lowest member_count with 4.*/

SELECT
	city,
    ranking
FROM city
ORDER BY ranking ASC;
/*What is the purpose of the ranking column? Is it providing any additional useful information about cities?
The formula for the ranking column is unclear and therefore does not provide any additional useful information about the cities.*/

SELECT
	zip,
    city,
    member_count
FROM city
ORDER BY member_count DESC;

/* What zip codes have the hightest 3 member counts and which city do they represent?
The zip codes with the 4 highest member counts are:
'10001' with '229371'
'60290' with'90918'
'94101' with'60351'

The 10001 zip code represents 'New York' and 60290 represents Chicago and 94101 represents San Francisco.*/

SELECT
	city,
    COUNT(group_id)
FROM city JOIN grp ON city.city_id = grp.city_id
GROUP BY city
ORDER BY COUNT(group_id) DESC;
	
/*How many groups does New York, Chicago and San Francisco have?
New York has the most groups with 2282, while San Francisco has 1191 and Chicago has 857.*/

SELECT
	city,
    COUNT(group_id)
FROM city JOIN grp ON city.city_id = grp.city_id
WHERE rating >= '4.00'
GROUP BY city
ORDER BY COUNT(group_id) DESC;

/*Which city has the most groups with a rating of 4 or more?
New York had the most groups with a rating of 4.00 or more with 1389 groups.*/

-- EVENT
SELECT
	*
FROM event;

SELECT
	venue_id,
    COUNT(event_id)
FROM event
GROUP BY venue_id
ORDER BY COUNT( event_id) DESC;

SELECT
	venue_name,
    venue_id
FROM venue_ 
WHERE venue_id = '24102474';

/*Which venue is the most popular and how many events were held there?
'The Ainsworth' was the most popular venue and held 279 events.*/

SELECT
	event_id
FROM event
WHERE how_to_find_us LIKE '%DigitalMarketingNYC%' OR how_to_find_us LIKE '%DigitalMarketingQueens%';
/* How many events utilised social media marketing for their events?
10 events utilised social media marketing for their events*/

SELECT
	event_id,
    event_name,
    yes_rsvp_count
FROM event
ORDER BY yes_rsvp_count DESC;

/*Which event had the most confirmed rsvps?
'Friday Nights Drinks had the most confirmed rsvps*/

SELECT
    event_name,
    created
FROM event
ORDER BY created ASC;

/*What event was the longest running?
'Business Card to Business Monthly Meetup' was the longest running event.*/

-- CATEGORY
SELECT
	*
FROM category;

SELECT 
    category_name,
    COUNT(member_id)
FROM category
        JOIN grp ON category.category_id = grp.category_id
        JOIN grp_member ON grp.group_id = grp_member.group_id
WHERE member_status = 'active'
GROUP BY category_name
ORDER BY COUNT(member_id) DESC;

/*Which category has the most active members and which has the least ?
Tech has the most active members and Paranormal has the least.*/