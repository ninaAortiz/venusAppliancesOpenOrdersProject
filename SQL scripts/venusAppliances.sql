-- DATE: 6/15/26
-- AUTHOR: Nina Ortiz
-- PURPOSE: Venus Appliances is an appliance store who sells appliances to locals from outsourced manufacturers this database
-- holds users, clients, orders, order items and product information

CREATE DATABASE venusAppliances;

USE venusAppliances;

-- Users are referring to sales people of venus appliances
CREATE table users (
userID INT AUTO_INCREMENT PRIMARY KEY,
firstName VARCHAR(255) NULL,
lastName VARCHAR(255) NULL,
email VARCHAR(254) NOT NULL,
password_hash VARCHAR(191) NOT NULL
);

-- clients using venus appliances
CREATE table clients (
clientID INT AUTO_INCREMENT PRIMARY KEY,
firstName VARCHAR(255) NULL,
lastName VARCHAR(255) NULL,
companyName VARCHAR(255),
email VARCHAR(255),
phoneNumber VARCHAR(50),
address VARCHAR(500),


CONSTRAINT client_name_validation CHECK (
companyName is NOT NULL OR
 (firstName is NOT NULL AND lastName IS NOT NULL)
 )
 );

-- container for client orders
CREATE TABLE orders (
orderNumber INT AUTO_INCREMENT PRIMARY KEY,
clientID INT NOT NULL,
userID INT NOT NULL,
salesTotal DECIMAL(10,2) NOT NULL,
estimatedDelievry DATETIME,
status VARCHAR(50) DEFAULT 'Pending',
FOREIGN KEY (clientID) REFERENCES clients(clientID),
FOREIGN KEY (userID) REFERENCES users(userID)
);

-- products venus appliances use
CREATE table products (
productNumber INT AUTO_INCREMENT PRIMARY KEY,
productName VARCHAR(500) NOT NULL,
manufacturer VARCHAR(500),
manufacturerProductID VARCHAR(55),
cost DECIMAL(10,2) NOT NULL
);

-- holds information of multiple products a client has in a single order
CREATE TABLE orderItems (
orderNumber INT NOT NULL,
productNumber INT NOT NULL,
quantity INT NOT NULL DEFAULT 1,
PRIMARY KEY (orderNumber, productNumber),
FOREIGN KEY (orderNumber)
REFERENCES orders(orderNumber),
FOREIGN KEY (productNumber)
REFERENCES products(productNumber)
);

INSERT INTO users
(firstName, lastName, email, password_hash)
VALUES 
('Cooper', 'Shelton', 'cooper@example.com', 'changeMe'),
('Lincoln', 'Shelton', 'lincoln@example.com', 'changeMe');

-- Please note that manufacturerIDs may be the same but venus has its own unique internal product IDs
INSERT INTO products
(productName, manufacturer, manufacturerProductID, cost)
VALUES
('Side-by-Side Refrigerator', 'Amazing Manufacturer', 1, 1299.99),
('French Door Refrigerator', 'Great Manufacturer', 1, 1899.99),
('Electric Range', 'Great Manufacturer', 2, 899.99),
('Front Load Washer', 'Amazing Manufacturer', 2, 749.99),
('Gas Dryer', 'Great Manufacturer', 3, 699.99),
('Built-In Dishwasher', 'Amazing Manufacturer', 3, 849.99);

INSERT INTO clients 
(firstName, lastName, companyName, email, phoneNumber, address)
VALUES 
('Frank', 'Hemmingway', 'Hemmingway Builders', 'fh@example.com', '555-1001', '123 Bridge St'),
('Hank', 'Smith', 'Smith Builders', 'hs@example.com', '555-1002', '54 Fan St'),
('Sarah', 'Johnson', NULL, 'sjohnson@example.com', '555-1003', '89 Oak Ave'),
('Michael', 'Brown', NULL, 'mbrown@example.com', '555-1004', '12 Pine Rd'),
(NULL, NULL, 'Coastal Construction', 'info@coastalconstruction.com', '555-1005', '777 Harbor Blvd');










