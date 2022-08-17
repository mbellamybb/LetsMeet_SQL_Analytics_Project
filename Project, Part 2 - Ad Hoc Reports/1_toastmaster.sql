-- Toastmaster Queries
-- 1
SELECT
	*
FROM event;
/* general search of event table*/

-- 2
SELECT
	event_name
FROM event
WHERE LOWER (event_name) LIKE "%Toastmaster%";
/* Find all events with "toastmaster" in their name*/

-- 3
SELECT
	event_name,
    city
FROM event
JOIN grp ON grp.group_id = event.group_id
JOIN city ON city.city_id = grp.city_id
WHERE LOWER (event_name) LIKE "%Toastmaster%";
/* Show the toastmaster events along with the cities in which there are hosted.
city, grp and event tables joined to match toastmaster events to the cities hosting them*/ 

-- 4
SELECT
	 city,
     COUNT(event_name) AS num_toasmasters_events_per_city
   FROM (SELECT
		event_name,
		city
		FROM event
        JOIN grp ON grp.group_id = event.group_id
		JOIN city ON city.city_id = grp.city_id
        WHERE LOWER (event_name) LIKE "%Toastmastes%") AS a
GROUP BY city
ORDER BY COUNT(event_name) DESC;
/* How many toastmaster events are held in each city?
Subquery used to determine the number of toastmaster events held in each city*/	
