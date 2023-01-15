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
SELECT NAME, Price FROM products
WHERE Price >= 180
ORDER BY Price DESC, NAME ASC;

-- 10. Select all the data from the products, including all the data for each product's manufacturer.
SELECT * FROM products AS p
LEFT JOIN manufacturers AS m
ON p.Manufacturer = m.Code;

-- 11. Select the product name, price, and manufacturer name of all the products.
SELECT p.Name, p.Price, m.Name FROM products AS p
LEFT JOIN manufacturers AS m
ON p.Manufacturer = m.Code;

-- 12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT Manufacturer, AVG(Price) AS average_price FROM products
GROUP BY Manufacturer;

-- 13. Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT m.Name, AVG(p.Price) AS average_price FROM products AS p
LEFT JOIN manufacturers AS m
ON p.Manufacturer = m.Code
GROUP BY m.Name;

-- 14. Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT m.Name FROM products AS p
LEFT JOIN manufacturers AS m
ON p.Manufacturer = m.Code
GROUP BY m.Name
HAVING AVG(p.Price) >= 150;

-- 15. Select the name and price of the cheapest product.
SELECT Name, Price FROM products
ORDER BY Price ASC
LIMIT 1;

-- 16. Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT m.Name, Max(p.Price) AS most_expensive_price FROM products AS p
LEFT JOIN manufacturers AS m
ON p.Manufacturer = m.Code
GROUP BY m.Name;

-- 17. Select the name of each manufacturer which have an average price above $145 and contain at least 2 different products.
SELECT m.Name FROM products AS p
LEFT JOIN manufacturers AS m
ON p.Manufacturer = m.Code
GROUP BY m.Name
HAVING AVG(p.Price) > 145 AND COUNT(p.Name) > 2;

-- 18. Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO products(Code,Name,Price,Manufacturer)
VALUE (11, 'Loudspeakers', 70, 2);

-- 19. Update the name of product 8 to "Laser Printer".
UPDATE products
SET NAME = 'Laser Printer'
WHERE Code = 8;

-- 20. Apply a 10% discount to all products.          (having a bug with row 4 & 9, still working on it ...)
UPDATE products
SET Price = Price * 0.9;

-- 21. Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE products
SET Price = Price * 0.9
WHERE Price >= 120;
