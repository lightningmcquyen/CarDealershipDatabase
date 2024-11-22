DROP DATABASE IF EXISTS car_dealership;
CREATE DATABASE car_dealership;
USE car_dealership;

CREATE TABLE `Dealerships` (
`DealershipID` INTEGER NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(50) NOT NULL,
`Address` VARCHAR(50) NOT NULL,
`Phone` VARCHAR(12) NOT NULL,
PRIMARY KEY (DealershipID)
);

INSERT INTO `Dealerships` (`DealershipID`, `Name`, `Address`, `Phone`)
VALUES
(NULL, 'D & B Used Cars', '111 Old Benbrook Rd', '817-555-5555'),
(NULL, 'Formula Imports', '7511 E Independence Blvd', '980-202-5890'),
(NULL, 'Scott Clark Toyota', '9215 South Blvd', '855-334-8662');


CREATE TABLE `Vehicles` (
  `VIN` VARCHAR(20) NOT NULL,   -- VIN is the primary key (not auto-incremented)
  `Year` INTEGER NOT NULL,
  `Make` VARCHAR(50) NOT NULL,
  `Model` VARCHAR(50) NOT NULL,
  `VehicleType` VARCHAR(50) NOT NULL,
  `Color` VARCHAR(20) NOT NULL,
  `Odometer` INTEGER NOT NULL,
  `Price` DECIMAL (10,2) NOT NULL,
  `Sold` BOOLEAN NOT NULL,  -- SOLD column
  PRIMARY KEY (VIN)
  );
  
  INSERT INTO `Vehicles` (`VIN`, `Year`, `Make`, `Model`, `VehicleType`, `Color`, `Odometer`, `Price`, `Sold`)
VALUES
('1111', 2020, 'Honda', 'Civic', 'Sedan', 'Red', 15000, 19999.99, FALSE),
('2222', 2014, 'Lexus', 'IS 250', 'Sedan', 'Black', 16000, 35999.99, TRUE),
('3333', 2023, 'Subaru', 'Outback', 'Wagon', 'Green', 5000, 31999.99, TRUE);
  
  
  CREATE TABLE `Inventory` (
  `InventoryID`INTEGER NOT NULL AUTO_INCREMENT,
  `DealershipID` INTEGER NOT NULL,
  `VIN` VARCHAR(20) NOT NULL,
  PRIMARY KEY (InventoryID), FOREIGN KEY (DealershipID) REFERENCES Dealerships(DealershipID),
  FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
  );
  
  INSERT INTO `Inventory` (`InventoryID`, `DealershipID`, `VIN`)
VALUES
(NULL, 1, '1111'),
(NULL, 2, '2222'),
(NULL, 3, '3333');

  
  CREATE TABLE `Sales_contracts` (
  `ID` INTEGER NOT NULL AUTO_INCREMENT,
  `DateOfContract` DATETIME,
  `CustomerName` VARCHAR (100) NOT NULL,
  `CustomerEmail` VARCHAR(100) NOT NULL,
  `VIN` VARCHAR(20) NOT NULL,
  `OriginalPrice` DECIMAL (10,2) NOT NULL,
  `Financed` BOOLEAN NOT NULL,
  PRIMARY KEY (ID), FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
  );
  
  INSERT INTO `Sales_contracts` (`ID`, `DateOfContract`, `CustomerName`, `CustomerEmail`, `VIN`, `OriginalPrice`, `Financed`)
VALUES
(NULL, '2024-11-01 14:30:00', 'John Doe', 'john.doe@example.com', '1111', 19999.99, TRUE),
(NULL, '2024-11-05 10:00:00', 'Quyen Vong', 'qvong1@appdev.yearup.org', '2222', 35999.99, TRUE),
(NULL, '2024-11-15 12:15:00', 'Emily Davis', 'emily.davis@example.com', '3333', 31999.99, FALSE);

  
  
  CREATE TABLE `Lease_contracts` (
  `ID` INTEGER NOT NULL AUTO_INCREMENT,  -- Auto-incremented ID for each contract
  `DateOfContract` DATETIME,             
  `CustomerName` VARCHAR(100) NOT NULL,  
  `CustomerEmail` VARCHAR(100) NOT NULL, 
  `VIN` VARCHAR(20) NOT NULL,            -- Vehicle VIN linked as a foreign key
  `OriginalPrice` DECIMAL(10,2) NOT NULL, 
  `Financed` BOOLEAN NOT NULL,           -- Whether the vehicle is financed
  PRIMARY KEY (ID), FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
  );

INSERT INTO `Lease_contracts` (`ID`, `DateOfContract`, `CustomerName`, `CustomerEmail`, `VIN`, `OriginalPrice`, `Financed`)
VALUES
(NULL, '2024-11-01 14:30:00', 'John Doe', 'john.doe@example.com', '1111', 19999.99, TRUE),
(NULL, '2024-11-05 10:00:00', 'Quyen Vong', 'qvong1@appdev.yearup.org', '2222', 35999.99, TRUE),
(NULL, '2024-11-15 12:15:00', 'Emily Davis', 'emily.davis@example.com', '3333', 31999.99, FALSE);



