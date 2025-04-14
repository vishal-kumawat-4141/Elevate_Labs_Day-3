-- USE the ecommerce_db
USE ecommerce_db;

-- Step 1: View All Products
SELECT * FROM products;

-- Step 2: Products Above a Certain Price
SELECT ProductName, ProductPrice 
FROM products 
WHERE ProductPrice > 50;

-- Step 3: Count Products per Category
SELECT pc.CategoryName, COUNT(p.ProductID) AS product_count
FROM products p
JOIN productcategories pc ON p.ProductCategoryID = pc.CategoryID
GROUP BY pc.CategoryName;

-- Step 4: Insert Dummy User
INSERT INTO users (UserEmail, UserFirstName, UserLastName, UserCity, UserState, UserCountry)
VALUES 
('testuser@example.com', 'John', 'Doe', 'New York', 'NY', 'USA');

-- Step 5: Insert Dummy Order for the User
INSERT INTO orders (OrderUserID, OrderAmount, OrderShipName, OrderShipAddress, OrderCity, OrderState, OrderZip, OrderCountry, OrderPhone, OrderShipping, OrderTax, OrderEmail)
VALUES 
(1, 49.99, 'John Doe', '123 Main St', 'New York', 'NY', '10001', 'USA', '555-1234', 5.99, 4.00, 'testuser@example.com');

-- Step 6: Show Orders with User Info (INNER JOIN)
SELECT o.OrderID, u.UserFirstName, u.UserLastName, o.OrderAmount, o.OrderDate
FROM orders o
JOIN users u ON o.OrderUserID = u.UserID;

-- Step 7: Create a View for Live Products
CREATE VIEW live_products AS
SELECT ProductName, ProductPrice, ProductCategoryID
FROM products
WHERE ProductLive = 1;

-- Step 8: Subquery - Products Above Average Price
SELECT ProductName, ProductPrice 
FROM products 
WHERE ProductPrice > (SELECT AVG(ProductPrice) FROM products);

-- Step 9: Create Index on OrderUserID in Orders Table
CREATE INDEX idx_order_user ON orders(OrderUserID);
