-- 01. Select the names of all the products in the store.
SELECT Name FROM products; 

-- 02. Select the names and the prices of all the products in the store.
SELECT Name, Price FROM products;

-- 03. Select the name of the products with a price less than or equal to $200.
SELECT Name, Price FROM products
WHERE Price <= 200;

-- 04. Select all the products with a price between $60 and $120.
SELECT Name, Price FROM products
WHERE Price > 60 AND Price < 120;

-- 05. Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name, Price * 100 AS Cents FROM products;

-- 06. Compute the average price of all the products.
SELECT AVG(Price) FROM products;

-- 07. Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price) FROM products
WHERE Manufacturer = 2;

-- 08. Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(Price) FROM products
WHERE Price >= 180;

-- 09. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).

