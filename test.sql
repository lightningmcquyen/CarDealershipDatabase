USE car_dealership;

SELECT * FROM Dealerships;

SELECT * FROM Vehicles
INNER JOIN Inventory ON Vehicles.VIN = Inventory.VIN
WHERE Inventory.DealershipID = 'D & B Used Cars';

SELECT * FROM Vehicles
WHERE VIN = 1111;

SELECT * FROM Dealerships
INNER JOIN Inventory ON Dealerships.DealershipID = Inventory.DealershipID
WHERE Inventory.VIN = 2222;

SELECT * FROM Dealerships
INNER JOIN Inventory ON Dealerships.DealershipID = Inventory.DealershipID
INNER JOIN Vehicles ON Inventory.VIN = Vehicles.VIN
WHERE Vehicles.Make = 'Honda' AND Vehicles.Model = 'Civic' AND Vehicles.Color = 'Red';

SELECT 
    Sales_contracts.ID,
    Sales_contracts.DateOfContract,
    Sales_contracts.CustomerName,
    Sales_contracts.CustomerEmail,
    Sales_contracts.VIN,
    Sales_contracts.OriginalPrice,
    Sales_contracts.Financed,
    Vehicles.Make,
    Vehicles.Model,
    Vehicles.Color,
    Dealerships.Name,
    Dealerships.Address
FROM Sales_contracts
INNER JOIN Vehicles ON Sales_contracts.VIN = Vehicles.VIN
INNER JOIN Inventory ON Vehicles.VIN = Inventory.VIN
INNER JOIN Dealerships ON Inventory.DealershipID = Dealerships.DealershipID
WHERE Dealerships.DealershipID = 'Formula 1 Imports' AND Sales_contracts.DateOfContract BETWEEN '2024-01-01' AND '2024-12-31';

