# 🤝LetsMeet SQL Analytics Project
## Table of Contents
- [Background](#background)
- [The Data](#the-data)
- [Part 1 - Data Impressions](#part-1---data-impressions)
- [Part 2 - Ad Hoc Reports](#part-2---ad-hoc-reports)
- [Part 3 - Database Normalization](#part-3---database-normalization)

# Background
**What is LetsMeet?**

LetsMeet is an online network for professionals and enthusiasts to meet up in real life with groups that share common interests.

**Where is LetsMeet?**

LetsMeet currently operates in New York, Chicago, and San Francisco, with plans to expand across the United States.

**What is my role at LetsMeet?**

LetsMeet has hired me on a temporary contract as a Data Analyst to support the growth LetsMeet has been experiencing in the past six months by providing insights into who LetsMeet members are and how they use the platform.

# The Data

The LetsMeet data exists on a SQL Database.

Entity Relationship Diagram (ERD)

![LetsMeet - Original ERD](https://user-images.githubusercontent.com/95842597/185205075-f37b6b65-8fed-4e9f-875c-444ede8a5f55.png)

The tables in the LetsMeet SQL Database are:

**grp** 

Groups that makeup LetsMeet.

The core part of LetsMeet are the groups. The grp table contains information about the groups
that use LetsMeet to network. Our groups cover a huge range of topics such as animal rights,
backgammon, kayaking, and dachshund.

Columns: group_id, category_id, city_id, created, description, join_mode, group_name, rating,
visibility, members, who.

![LetsMeet -grp table](https://user-images.githubusercontent.com/95842597/185206191-38ff9ce0-f023-4a8a-bbbd-14100c6c53cf.png)

**grp_member** 

Group members that makeup groups

The grp_member table contains data on individual members. Each row lists one member and one
group. So members in multiple groups appear multiple times. Most members are based in the
New York, Chicago, and San Francisco areas, but they come from all over the world.
Columns: member_id, city, country, hometown, joined, member_name, member_status, visited,
group_id.

![LetsMeet - grp_member table](https://user-images.githubusercontent.com/95842597/185206257-2b16c3a0-a907-4db7-9f9c-80a248485857.png)

**event** 

Events that groups put on
Events are what the members gather for. This table contains the most columns. Included are text
descriptions, waitlist information, rsvp information, urls, and more.
Columns: event_id, created, description, duration, event_url, group_id, headcount, how_to_find_us,
maybe_rsvp_count, event_name, photo_url, rsvp_limit, event_status, event time, updated,
utc_offset, venue_id, visibility, waitlist_count, why, yes_rsvp_count.

![LetsMeet - event table](https://user-images.githubusercontent.com/95842597/185206303-c1d98970-c546-41b6-9cc7-0fb0f3a9faf7.png)

**venue_** 

Where groups meet

This table contains data on the venues that host LetsMeet events. Standard information like
latitude and longitude along with the address are provided.
Columns: venue_id, address_1, address_2, city, country, distance, lat, localized_country_name, lon,
venue_name, phone, state, zip, RAND() DOUBLE.

![LetsMeet - venue_ table](https://user-images.githubusercontent.com/95842597/185206342-383e2152-700e-4700-ba80-1cba39201fda.png)

**category** 

Different categories of groups

LetsMeet organizes groups into the following categories: Arts & Culture, Career & Business, Cars &
Motorcycles, Community & Environment, Dancing, Hobbies & Crafts, Language & Ethnic Identity,
Lifestyle, Book Clubs, Movies & Film, Music, New Age & Spirituality, Outdoor & Adventure,
Paranormal, Parents & Family, Pets & Animals, Photography, Religion & Beliefs, Sci-Fi & Fantasy,
Singles, Socializing, Sports and Recreation, Support, Tech, Writing.
Columns: category_id, category_name, shortname, sort_name.

![LetsMeet - category table](https://user-images.githubusercontent.com/95842597/185206419-9d591751-c6b5-4dcb-99b5-75e6eb31fcfa.png)

**city** 

Information about cities that host groups

This table contains information about the cities where LetsMeet groups and members gather. In
addition to state, zip, country, and latitude/longitude, a column member_count displays the
the number of members per city.
Columns: city_id, city, state, zip, country, localized_country_name, distance, longitude, latitude,
member_count, ranking.

![LetsMeet  - city table](https://user-images.githubusercontent.com/95842597/185206479-ebd88954-e63a-4119-a387-3663d1190a1d.png)

# Part 1 - Data Impressions

**Sales Insights**

Queries were conducted to answer questions from the Sales Team. View SQL queries and insights here.

Questions from Sales Team:

**Additional Insights**

Additional questions were generated and corresponding queries were conducted after an examination of each table.

View SQL queries and insights here.

# Part 2 - Ad Hoc Reports

**Toastmaster Report**

Queries were conducted to identify toastmaster events and gather information related to the events. View SQL queries here.

**Growth Report**

Queries were conducted to gather information for the Marketing Team related to the growth of the membership of LetsMeet. View SQL queries here.

**Report on Featured Groups**

Queries were conducted to answer questions from the Marketing Team about which groups were the most popular on LetsMeet. 
View SQL queries here.

**Summary Report**

A summary report with my findings was prepared based on the various queries carried out. View the report here.

# Part 3 - Database Normalization

Normalization was carried out including the modification of tables by eliminating redundant or uninformative columns while preserving information. A strategy was developed to split tables to save storage space and time. Reverse engineering of the Entity Relationship Diagram was carried out to visualize the new database structure.

View my queries and the new ERD here.

