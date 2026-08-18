-- =====================================================
-- SQL Interview Preparation
-- Day 01: DDL Commands
-- Database: Sales
-- =====================================================

-- 1. Create Database
CREATE DATABASE sales;

USE sales;


-- =====================================================
-- 2. CREATE TABLE
-- =====================================================

CREATE TABLE stores (
    store_id INT,
    store_name VARCHAR(200)
);

-- Check table
SELECT *
FROM stores;


-- =====================================================
-- 3. INSERT DATA
-- =====================================================

INSERT INTO stores(store_id)
VALUES (3);

SELECT *
FROM stores;


-- =====================================================
-- 4. CREATE TABLE WITH CONSTRAINTS
-- =====================================================

CREATE TABLE stores_new (
    store_id INT UNIQUE,
    store_name VARCHAR(200) NOT NULL
);

-- Insert valid record
INSERT INTO stores_new
VALUES (1, 'store_xyz');

-- This demonstrates UNIQUE constraint violation
-- because store_id = 1 already exists.

-- INSERT INTO stores_new
-- VALUES (1, 'abc');


-- =====================================================
-- 5. ALTER TABLE - ADD COLUMN
-- =====================================================

ALTER TABLE stores_new
ADD COLUMN store_city VARCHAR(200);


-- =====================================================
-- 6. ALTER TABLE - RENAME COLUMN
-- =====================================================

ALTER TABLE stores_new
RENAME COLUMN store_city TO store_location;


-- Check table
SELECT *
FROM stores_new;


-- =====================================================
-- 7. TRUNCATE
-- =====================================================

TRUNCATE TABLE stores;

SELECT *
FROM stores;


-- =====================================================
-- 8. DROP TABLE
-- =====================================================

DROP TABLE stores;


-- =====================================================
-- 9. DROP DATABASE
-- =====================================================

-- Run this only when you intentionally want
-- to delete the entire practice database.

-- DROP DATABASE sales;