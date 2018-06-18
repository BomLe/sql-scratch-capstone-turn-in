SQL queries for Capstone: Attribution from Bom Lee:

SQL 1 of 6:
SELECT COUNT (DISTINCT utm_campaign)
FROM page_visits;

SELECT COUNT (DISTINCT utm_source)
FROM page_visits;

SELECT  utm_campaign, utm_source
FROM page_visits
GROUP BY utm_campaign;


SQL 2 of 6:
SELECT DISTINCT page_name
FROM page_visits;


SQL 3 of 6:
WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) AS first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT pv.utm_campaign, count(*)
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
GROUP BY utm_campaign
ORDER BY COUNT(*) DESC;     


SQL 4 of 6:
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) AS last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT pv.utm_campaign, COUNT(*)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY utm_campaign
ORDER BY COUNT(*) DESC;  


SQL 5 of 6:
SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '4 - purchase';


SQL 6 of 6:
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) AS last_touch_at
    FROM page_visits
    WHERE page_name = '4 - purchase'
    GROUP BY user_id)
SELECT pv.utm_campaign, count(*)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY utm_campaign
ORDER BY COUNT(*) DESC;  




