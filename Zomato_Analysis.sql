USE zomato_analysis;

SELECT COUNT(*) AS total_records
FROM zomato_restaurants;

SELECT * FROM zomato_restaurants
LIMIT 20;

DESCRIBE zomato_restaurants;

SELECT SUM(CASE WHEN restaurant_name IS NULL THEN 1 ELSE 0 END) AS restaurant_name_null,
SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS rating_null,
SUM(CASE WHEN votes IS NULL THEN 1 ELSE 0 END) AS votes_null,
SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS location_null,
SUM(CASE WHEN rest_type IS NULL THEN 1 ELSE 0 END) AS rest_type_null
FROM zomato_restaurants;

Set SQL_safe_updates =0;

UPDATE zomato_restaurants
SET restaurant_name = TRIM(restaurant_name),
location = TRIM(location),
rest_type = TRIM(rest_type),
listed_city = TRIM(listed_city),
listed_type = TRIM(listed_type);

SELECT restaurant_name,location,
COUNT(*) AS duplicate_count
FROM zomato_restaurants
GROUP BY restaurant_name, location
HAVING COUNT(*) > 1;

SELECT MIN(rating), MAX(rating)
FROM zomato_restaurants;

SELECT MIN(approx_cost_for_two),MAX(approx_cost_for_two)
FROM zomato_restaurants;

-- Business KPIs
SELECT COUNT(*) AS Total_Restaurants
FROM zomato_restaurants;

SELECT ROUND(AVG(rating),2) AS Average_Rating
FROM zomato_restaurants;

SELECT SUM(votes) AS Total_Votes
FROM zomato_restaurants;

SELECT ROUND(AVG(approx_cost_for_two),0) AS Average_Cost
FROM zomato_restaurants;

SELECT COUNT(*) AS Online_Order_Restaurants
FROM zomato_restaurants
WHERE online_order='Yes';

-- Top 10 Locations
SELECT location, COUNT(*) AS total_restaurants
FROM zomato_restaurants
GROUP BY location
ORDER BY total_restaurants DESC
LIMIT 10;

-- Top Restaurants type
SELECT rest_type,COUNT(*) AS total
FROM zomato_restaurants
GROUP BY rest_type
ORDER BY total DESC;

-- Top rated Restaurants
SELECT rest_type,COUNT(*) AS total
FROM zomato_restaurants
GROUP BY rest_type
ORDER BY total DESC;

-- Most Popular Cuisines
SELECT cuisine_1,COUNT(*) AS restaurants
FROM zomato_restaurants
GROUP BY cuisine_1
ORDER BY restaurants DESC;

-- Average Rating by Location
SELECT location,ROUND(AVG(rating),2) AS avg_rating
FROM zomato_restaurants
GROUP BY location
ORDER BY avg_rating DESC;

-- Restaurant Type vs Average Cost
SELECT rest_type,ROUND(AVG(approx_cost_for_two),0) AS avg_cost
FROM zomato_restaurants
GROUP BY rest_type
ORDER BY avg_cost DESC;

-- Restaurants with Highest Votes
SELECT restaurant_name,votes,rating
FROM zomato_restaurants
ORDER BY votes DESC
LIMIT 10;

-- Cost Range Distribution
SELECT cost_range,COUNT(*) AS restaurants
FROM zomato_restaurants
GROUP BY cost_range;

-- Online order analysis
SELECT online_order,COUNT(*) AS restaurants
FROM zomato_restaurants
GROUP BY online_order;

-- Table Booking Analysis
SELECT book_table,COUNT(*) AS restaurants
FROM zomato_restaurants
GROUP BY book_table;