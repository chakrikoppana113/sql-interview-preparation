-- ============================================================
-- DQL BASICS - ADDITIONAL PRACTICE
-- ============================================================


-- ============================================================
-- 1. COUNT, SUM, AVG, MIN, MAX
-- ============================================================

-- Total number of customers
SELECT COUNT(*) AS total_customers
FROM dim_customer;

-- Total number of products
SELECT COUNT(*) AS total_products
FROM dim_product;

-- Average product price
SELECT AVG(unit_price) AS average_price
FROM dim_product;

-- Minimum product price
SELECT MIN(unit_price) AS minimum_price
FROM dim_product;

-- Maximum product price
SELECT MAX(unit_price) AS maximum_price
FROM dim_product;

-- Total value of all product prices
SELECT SUM(unit_price) AS total_product_price
FROM dim_product;


-- ============================================================
-- 2. COUNT(DISTINCT)
-- ============================================================

-- Number of unique countries
SELECT COUNT(DISTINCT country) AS unique_countries
FROM dim_customer;

-- Number of unique cities
SELECT COUNT(DISTINCT city) AS unique_cities
FROM dim_customer;

-- Number of unique product categories
SELECT COUNT(DISTINCT category) AS unique_categories
FROM dim_product;


-- ============================================================
-- 3. NULL CHECKING
-- ============================================================

-- Find customers whose email is NULL
SELECT *
FROM dim_customer
WHERE email IS NULL;

-- Find customers whose email is NOT NULL
SELECT *
FROM dim_customer
WHERE email IS NOT NULL;


-- ============================================================
-- 4. BETWEEN
-- ============================================================

-- Products between 100 and 500
SELECT *
FROM dim_product
WHERE unit_price BETWEEN 100 AND 500;

-- Customers who joined between two dates
SELECT *
FROM dim_customer
WHERE join_date BETWEEN '2022-01-01' AND '2023-01-01';


-- ============================================================
-- 5. NOT IN
-- ============================================================

-- Customers who are not from France or India
SELECT *
FROM dim_customer
WHERE country NOT IN ('France', 'India');


-- ============================================================
-- 6. NOT LIKE
-- ============================================================

-- Product names that do not start with A
SELECT *
FROM dim_product
WHERE product_name NOT LIKE 'A%';


-- ============================================================
-- 7. MORE LIKE PATTERNS
-- ============================================================

-- Names starting with A
SELECT *
FROM dim_customer
WHERE first_name LIKE 'A%';

-- Names ending with a
SELECT *
FROM dim_customer
WHERE first_name LIKE '%a';

-- Names containing 'an'
SELECT *
FROM dim_customer
WHERE first_name LIKE '%an%';

-- Names with exactly 5 characters
SELECT *
FROM dim_customer
WHERE first_name LIKE '_____';


-- ============================================================
-- 8. MULTIPLE CONDITIONS
-- ============================================================

-- Products above 500 and from a specific category
SELECT *
FROM dim_product
WHERE unit_price > 500
  AND category = 'Electronics';

-- Products below 100 OR above 1000
SELECT *
FROM dim_product
WHERE unit_price < 100
   OR unit_price > 1000;


-- ============================================================
-- 9. ORDER BY MULTIPLE COLUMNS
-- ============================================================

SELECT *
FROM dim_product
ORDER BY category ASC, unit_price DESC;


-- ============================================================
-- 10. TOP N RECORDS
-- ============================================================

-- Top 5 most expensive products
SELECT *
FROM dim_product
ORDER BY unit_price DESC
LIMIT 5;

-- Top 10 cheapest products
SELECT *
FROM dim_product
ORDER BY unit_price ASC
LIMIT 10;


-- ============================================================
-- 11. GROUP BY WITH COUNT
-- ============================================================

-- Number of customers in each country
SELECT
    country,
    COUNT(*) AS customer_count
FROM dim_customer
GROUP BY country;


-- Number of products in each category
SELECT
    category,
    COUNT(*) AS product_count
FROM dim_product
GROUP BY category;


-- ============================================================
-- 12. GROUP BY + HAVING
-- ============================================================

-- Countries having more than 5 customers
SELECT
    country,
    COUNT(*) AS customer_count
FROM dim_customer
GROUP BY country
HAVING COUNT(*) > 5;


-- Categories whose average price is greater than 500
SELECT
    category,
    AVG(unit_price) AS avg_price
FROM dim_product
GROUP BY category
HAVING AVG(unit_price) > 500;


-- ============================================================
-- 13. WHERE vs HAVING
-- ============================================================

-- WHERE filters rows BEFORE grouping
SELECT
    category,
    AVG(unit_price) AS avg_price
FROM dim_product
WHERE unit_price > 100
GROUP BY category;


-- HAVING filters groups AFTER grouping
SELECT
    category,
    AVG(unit_price) AS avg_price
FROM dim_product
GROUP BY category
HAVING AVG(unit_price) > 500;


-- ============================================================
-- 14. CASE WHEN
-- ============================================================

SELECT
    product_name,
    unit_price,
    CASE
        WHEN unit_price >= 1000 THEN 'Expensive'
        WHEN unit_price >= 500 THEN 'Medium'
        ELSE 'Cheap'
    END AS price_category
FROM dim_product;


-- ============================================================
-- 15. DISTINCT WITH MULTIPLE COLUMNS
-- ============================================================

SELECT DISTINCT
    country,
    city
FROM dim_customer;


-- ============================================================
-- 16. OFFSET-STYLE PAGINATION
-- ============================================================

-- Skip first 10 products and display next 10
SELECT *
FROM dim_product
ORDER BY product_key
LIMIT 10 OFFSET 10;


-- ============================================================
-- 17. PRACTICAL INTERVIEW QUESTIONS
-- ============================================================

-- Q1. Find the 5 most expensive products.

-- Q2. Find all female customers from France.

-- Q3. Find customers who joined after 2022-01-01.

-- Q4. Find products priced between 200 and 800.

-- Q5. Find the number of customers in each country.

-- Q6. Find countries having more than 5 customers.

-- Q7. Find the average product price for each category.

-- Q8. Find categories whose average price is greater than 500.

-- Q9. Find products whose names start with 'S'.

-- Q10. Find the number of unique cities.

-- Q11. Find the cheapest product.

-- Q12. Find the most expensive product.

-- Q13. Classify products as Cheap, Medium, or Expensive
-- using CASE WHEN.

-- Q14. Find the second page of products
-- (10 records per page).

-- Q15. Find customers whose email is NULL.


-- ============================================================
-- END OF DQL BASICS
-- ============================================================
    