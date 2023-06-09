USE CarDealership;

-- 6. Get all sales information for specific dealer for price range (didn't make a date column)
SELECT d.name
	, v.vin
    , v.make
    , v.model
    , v.sold
    , sc.total_price AS 'Between 8000 & 15000'
FROM sales_contracts AS sc
JOIN inventory AS i
	ON i.vin = sc.vin
JOIN vehicles AS v
	ON v.vin = i.vin
JOIN dealerships AS d
	ON d.dealership_id = i.dealership_id
WHERE d.dealership_id = 2 AND sc.total_price BETWEEN 8000 AND 15000;