/*
  Nathan Nguyen
  CSC 355 Section 510
  Assignment 3
  January 26th, 2021
*/

-- 1
SELECT DISTINCT CITY
	FROM WAREHOUSE
	ORDER BY CITY;

-- 2
SELECT COUNT(WAREHOUSEID)
	FROM WAREHOUSE
	WHERE SQFT > 50000;

-- 3
SELECT STATE, MAX(SQFT)
	FROM WAREHOUSE
	GROUP BY STATE
	ORDER BY STATE;
	
-- 4
SELECT ProductID, Cost
	FROM PRODUCT
	ORDER BY Cost DESC;

-- 5
SELECT Description, Type
	FROM PRODUCT
	WHERE COST < 300
	ORDER BY COST;

-- 6
SELECT ProductID, Description, Cost
	FROM PRODUCT
	WHERE Description LIKE '%Desk%'
	ORDER BY Description;
	
-- 7
SELECT PID, Amount
	FROM INVENTORY
	WHERE WID = 333
	ORDER BY Amount DESC;
	
-- 8
SELECT LastChecked, COUNT(LastChecked)
	FROM INVENTORY
	GROUP BY LastChecked
	ORDER BY COUNT(LastChecked) DESC;
	
-- 9
SELECT WID, PID, LastChecked
	FROM INVENTORY
	WHERE LastChecked >= DATE'2020-12-01' and LastChecked <= DATE '2020-12-31'
	ORDER BY LastChecked, WID;