-- Create the new DB
USE sys;
DROP DATABASE IF EXISTS CarDealership;
CREATE DATABASE CarDealership;

-- ----------------- --
-- Create the tables --
-- ----------------- --
USE CarDealership;

CREATE TABLE dealerships (
	dealership_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL,
    PRIMARY KEY (dealership_id)
);

CREATE TABLE vehicles (
	vin INT NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    sold BOOL NOT NULL,
    PRIMARY KEY (vin)
);

CREATE TABLE inventory (
	dealership_id INT NOT NULL,
    vin INT NOT NULL,
    PRIMARY KEY (dealership_id, vin),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE sales_contracts (
	sales_id INT NOT NULL AUTO_INCREMENT,
    vin INT NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (sales_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Auto increment starting at 101
ALTER TABLE sales_contracts AUTO_INCREMENT = 101;

-- --------------------- --
-- Load Data into Tables --
-- --------------------- --

INSERT INTO dealerships(name, address, phone)
VALUES  ('Elite Motors', '123 Apex Dr', '9725550918')
		, ('Two Wheelers','456 Cycle Ln', '4695558829');
        
INSERT INTO vehicles(vin, make, model, sold)
VALUES	(183928, 'Toyota', 'Supra', FALSE)
        , (175922, 'Subaru', 'WRX STI', TRUE)
        , (112839, 'BMW', 'M4', FALSE)
        , (998472, 'Ford', 'Mustang', FALSE);
        
INSERT INTO inventory(dealership_id, vin)
VALUES	(1, 123456)
		, (1, 183928)
		, (1, 175922)
        , (1, 112839)
        , (1, 998472);
        
INSERT INTO sales_contracts(vin, customer_name, customer_email, total_price)
VALUES	(175922, 'Billy Jenkins', 'billy@gmail.com', 34233.86);
        
INSERT INTO vehicles(vin, make, model, sold)
VALUES	(1234, 'Yamaha', 'MT-07', TRUE)
        , (5678, 'Honda', 'CB500X', TRUE)
        , (1000, 'Honda', 'CBR1000RR', FALSE);
        
INSERT INTO inventory(dealership_id, vin)
VALUES	(2, 1234)
		, (2, 5678)
		, (2, 1000);
        
INSERT INTO sales_contracts(vin, customer_name, customer_email, total_price)
VALUES		(1234, 'Brad Egbert', 'brad@gmail.com', 8522.83)
			, (5678, 'Scott Egbert', 'scott@aol.com', 7203.91);

