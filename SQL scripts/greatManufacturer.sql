-- DATE: 6/15/26
-- AUTHOR: Nina Ortiz
-- Purpose: Great Manufacturer is a manufacturer that produces appliances and this database 
-- holds users, orders, order items and product information

CREATE DATABASE greatmanufacturer;

USE greatmanufacturer;

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
('Great French Doors Fridge', 'French Door Refridgerator', 5, 1200.00),
('Great Electric Range', 'Electric Range', 5, 600.00),
('Great Gas Dryer', 'Gas Dryer', 5, 300.00);


