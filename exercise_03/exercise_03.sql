-- 01. Select all warehouses.
SELECT * FROM warehouses;

-- 02. Select all boxes with a value larger than $150.
SELECT * FROM boxes
WHERE Value > 150;

-- 03. Select all distinct contents in all the boxes.
SELECT DISTINCT Contents FROM boxes;

-- 04. Select the average value of all the boxes.
SELECT AVG(Value) FROM boxes;

-- 05. Select the warehouse code and the average value of the boxes in each warehouse.
SELECT w.Code, AVG(b.Value) FROM boxes b
LEFT JOIN warehouses w
ON b.Warehouse = w.Code
GROUP BY w.Code;

-- 06. Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
SELECT w.Code, AVG(b.Value) FROM boxes b
LEFT JOIN warehouses w
ON b.Warehouse = w.Code
GROUP BY w.Code
HAVING AVG(b.Value) > 150;

-- 07. Select the code of each box, along with the name of the city the box is located in.
SELECT b.Code, w.Location FROM boxes b
LEFT JOIN warehouses w
ON b.Warehouse = w.Code;

-- 08. Select the warehouse codes, along with the number of boxes in each warehouse. 
-- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
SELECT w.Code, COUNT(b.Code) FROM boxes b
RIGHT JOIN warehouses w
ON b.Warehouse = w.Code
GROUP BY w.Code;

-- 09. Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT w.Code, COUNT(b.Code) AS number_of_boxes, w.Capacity FROM boxes b
RIGHT JOIN warehouses w
ON b.Warehouse = w.Code
GROUP BY w.Code, w.Capacity
HAVING COUNT(b.Code) > w.Capacity;

-- 10. Select the codes of all the boxes located in Chicago.
SELECT b.Code FROM boxes b
LEFT JOIN warehouses w
ON b.Warehouse = w.Code
WHERE w.Location = "Chicago";

-- 11. Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO warehouses(Code,Location,Capacity)
VALUE(6, "New York", 3);

-- 12. Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
