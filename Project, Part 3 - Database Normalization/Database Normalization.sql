
--LetsMeet Database Normalization--
-- 1
SELECT
	* 
FROM venue_;

/* Query ran to view venue_ table and determine redundant columns.
ERD generated toview all tables, columns and connections and identify any redundancies.
*/

SELECT
	*
FROM grp;

/* viewing grp to determine redundant columns*/

SELECT
	*
FROM city;

/* viewing city to determine redundant columns*/

SELECT
	*
FROM event;
/* viewing event to determine redundant columns*/

SELECT
	*
FROM category;
/* viewing category to determine redundant columns*/

SELECT
	*
FROM grp_member;
/* viewing grp_member to determine redundant columns*/

-- 2
-- venue_ table
ALTER TABLE venue_
DROP COLUMN `RAND()`;
/* The RAND() column was removed as it does not provide any useful information about the venue_ table*/

ALTER TABLE venue_
DROP COLUMN address_2;
/* The address_2 column was removed as it does not provide any useful information about the venue_ table */

ALTER TABLE venue_
DROP COLUMN country;
/* The country column was removed as it is redundant because LetsMeet only operates in one country*/

ALTER TABLE venue_
DROP COLUMN distance;
/*The distance column was removed as it already exists in the city table and does not provide any useful information about the venue_ table*/

ALTER TABLE venue_
DROP COLUMN localized_country_name;
/*The localized_country_name was removed as it is redundant because this information already appears in the country column and LetsMeet only operates in one country*/

ALTER TABLE venue_
DROP COLUMN phone;
/*The phone column was removed as it does not provide any useful information about the venue_table */

-- grp_member table

ALTER TABLE grp_member
DROP COLUMN country;
/* The country column was removed as it is redundant because LetsMeet only operates in one country*/

-- category table

ALTER TABLE category
DROP COLUMN shortname;
/* The shortman column was removed as it is redundant because it repeats information found in the category_name column*/

ALTER TABLE category
DROP COLUMN sort_name;
/* The sort_name column was removed as it is redundant because it repeats information found in the category_name column*/

-- event table

ALTER TABLE event
DROP COLUMN headcount;
/* The headcount column was removed as it is redundant because it does not provide any useful information about the event table */

ALTER TABLE event
DROP COLUMN maybe_rsvp_count;
/* The maybe_rsvp_count column was removed as it is redundant because it does not provide any useful information about the event table */

ALTER TABLE event
DROP COLUMN visibility;
/* The visibility column was removed as it is redundant because it does not provide any useful information about the event table */

ALTER TABLE event
DROP COLUMN why;
/* The why column was removed as it is redundant because it does not provide any useful information about the event table */

ALTER TABLE event
DROP COLUMN utc_offset;
/* The utc_offset column was removed as it is redundant because it does not provide any useful information about the event table */

-- city table

ALTER TABLE city
DROP COLUMN country;
/* The country column was removed as it is redundant because LetsMeet only operates in one country*/

ALTER TABLE city
DROP COLUMN distance;
/* The distance column was removed as it is redundant because it does not provide any useful information about the city table*/

ALTER TABLE city
DROP COLUMN localized_country_name;
/*The localized_country_name was removed as it is redundant because this information already appears in the country column and LetsMeet only operates in one country*/

-- 3
SELECT
	*
FROM grp_member;

DESCRIBE grp_member;
/* Query done to determine if the grp_member table has PRIMARY KEYS*/

-- A 
CREATE TABLE group_sign_ups
SELECT
	DISTINCT 
    group_id,
    member_id,
    joined
FROM grp_member;
/*group_sign_ups table created*/

SELECT
	*
FROM group_sign_ups;
/*query ran to determine if group_sign_ups table was correctly created*/

-- B 
CREATE TABLE members
SELECT
	DISTINCT 
    member_id,
    member_name,
    member_status,
    hometown,
    city
FROM grp_member;
/*members table created*/

SELECT
	*
FROM members;
/*query ran to determine if members table was correctly created*/

-- C 
DESCRIBE members;
/*query ran to determine if the members table had a PRIMARY KEY*/

ALTER TABLE members
ADD PRIMARY KEY (member_id);
/* PRIMARY KEY of "member_id" created for the members table*/

-- D 
DESCRIBE group_sign_ups;
/*query ran to determine if the group_sign_ups table had a PRIMARY KEY or FOREIGN KEY*/

ALTER TABLE group_sign_ups
ADD FOREIGN KEY (member_id)
	REFERENCES members (member_id),
ADD FOREIGN KEY (group_id)
	REFERENCES grp (group_id);
/* 
FOREIGN KEY member_id added to group_sign_ups referencing members table.
FOREIGN KEY group_id added to group_sign_ups referencing grp table.
*/

-- E 
DROP TABLE grp_member;
/* Deleted the grp_member table using the DROP statement*/

-- 4
/*New ERD created to show new tables and columns created*/
