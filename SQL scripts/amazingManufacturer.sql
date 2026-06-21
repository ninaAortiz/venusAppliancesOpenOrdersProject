-- DATE: 6/15/26
-- AUTHOR: Nina Ortiz
-- PURPOSE: Amazing Manufacturer is a manufacturer that produces appliances and this database
-- holds users, orders, order items and product information

CREATE DATABASE amazingmanufacturer;

USE amazingmanufacturer;

-- companies that use amazing manufacturer to order products for their store
CREATE table users (
userID INT AUTO_INCREMENT PRIMARY KEY,
companyName VARCHAR(255) NOT NULL,
email VARCHAR(254) NOT NULL,
password_hash VARCHAR(191) NOT NULL
);


-- amazing manufacturer current products
CREATE table products (
productID INT AUTO_INCREMENT PRIMARY KEY, 
productName VARCHAR(255) NOT NULL,
productType VARCHAR(255) NOT NULL,
stock INT NOT NULL,
cost DECIMAL(10,2) NOT NULL
);

-- product orders from users
CREATE table orders (
purchaseNumber INT AUTO_INCREMENT PRIMARY KEY,
userID INT NOT NULL,
userOrderNumber INT NOT NULL,
totalCost DECIMAL(10,2) NOT NULL,
productTracker VARCHAR(50) DEFAULT 'Pending',

FOREIGN KEY (userID) REFERENCES users(userID)
);

-- so a single order can have multiple order items
CREATE table orderItems (
purchaseNumber INT NOT NULL,
productID INT NOT NULL,
quantity INT NOT NULL DEFAULT 1,
unitCost DECIMAL(10,2) NOT NULL,

PRIMARY KEY (purchaseNumber, productID),

FOREIGN KEY (purchaseNumber)
REFERENCES orders(purchaseNumber),

FOREIGN KEY (productID)
REFERENCES products(productID)

);

INSERT INTO users
(companyName, email, password_hash)
VALUES
('Venus Appliances', 'venusappliances@example.com', 'changeMe');

INSERT INTO products
(productName, productType, stock, cost)
VALUES 
('Amazing Side-by-Side Extreme', 'Side-by-Side Refrigerator', '5', 800.00),
('Amazing Front Loader', 'Front Load Washer', '5', 400.00),
('Amazning Built-In Dishwasher', 'Built-In Dishwasher', '5', 600.00);


