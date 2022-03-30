USE mavenfuzzyfactory;

/* SELECT
   website_sessions.utm_content,
   COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
   COUNT(DISTINCT orders.order_id) AS orders
FROM website_sessions
  LEFT JOIN orders
    on orders.website_session_id = website_sessions.website_session_id
GROUP BY
   website_sessions.utm_content
ORDER BY sessions, orders DESC;
*/-- Analyzing top trafic source

/*SELECT utm_source, utm_campaign, http_referer,COUNT(DISTINCT website_session_id) AS sessions
FROM website_sessions
WHERE created_at < '2012-04-12'
GROUP BY 1,2,3
ORDER BY 4 DESC
*/ -- Finding top trafic source

/*SELECT 
   COUNT(DISTINCT w.website_session_id) AS sessions,
   COUNT(DISTINCT o.order_id) AS totalorders,
   COUNT(DISTINCT o.order_id)/COUNT(DISTINCT w.website_session_id) as order_session_convert_rate
FROM website_sessions AS w
LEFT Join orders AS o
   on o.website_session_id = w.website_session_id
WHERE w.created_at <'2012-04-14'
   AND utm_source = 'gsearch'
   AND utm_campaign ='nonbrand'
*/ -- Trafic source conversion rates

/*SELECT
   YEAR(created_at),
   WEEK(created_at),
   MIN(DATE(created_at)) AS week_start,
   COUNT(DISTINCT website_session_id) AS sessions
FROM website_sessions
GROUP BY 1, 2
*/ -- Data Functions

/*SELECT
   primary_product_id,
   COUNT(DISTINCT CASE WHEN items_purchased = 1 THEN order_id ELSE NULL END) As orders_w1_item,
   COUNT(DISTINCT CASE WHEN items_purchased = 2 THEN order_id ELSE NULL END) AS oredrs_w2_items
FROM orders
WHERE order_id BETWEEN 31000 AND 32000 -- arbitrary
GROUP BY 1
*/ -- Bid optimizaiton and trend analysis

/*SELECT
   YEAR(created_at) AS yr,
   WEEK(created_at) AS wk,
   MIN(DATE(created_at)) As week_started_at,
   COUNT(DISTINCT website_session_id) AS sessions
FROM website_sessions
WHERE created_at < '2012-5-10'
      AND utm_source = 'gsearch'
      AND utm_campaign = 'nonbrand'
GROUP BY 1, 2 
*/ -- Trafic source trending

/*SELECT
   w.device_type,
   COUNT(DISTINCT w.website_session_id) As sessions,
   COUNT(DISTINCT o.order_id) As totalorder,
   COUNT(DISTINCT o.order_id)/COUNT(DISTINCT w.website_session_id) AS convert_rate
FROM website_sessions w
   LEFT JOIN orders o
   ON o.website_session_id = w.website_session_id
WHERE w.created_at < '2012-05-11'
	AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY 1
*/ -- Bid opimization for paid traffic

/*SELECT
    -- YEAR(created_at) As yr,
    -- WEEK(created_at) AS wk,
    MIN(DATE(created_at)) AS week_start_date,
    COUNT(DiSTINCT CASE WHEN device_type ='desktop' THEN website_session_id ELSE NULL END) As dtop_sessions,
    COUNT(DiSTINCT CASE WHEN device_type ='mobile' THEN website_session_id ELSE NULL END) As mobile_sessions
FROM website_sessions
WHERE created_at < '2012-06-09' AND created_at > '2012-4-15'
     AND utm_source = 'gsearch'
     AND utm_campaign = 'nonbrand' 
GROUP BY 
    YEAR(created_at),
    WEEK(created_at)
*/ -- Trending w/granular segments

