USE CarDealership;

-- 2. Find all vehicles for a specific dealership
SELECT i.dealership_id
	, v.vin
	, v.make
	, v.model
    , v.sold
FROM vehicles AS v
JOIN inventory AS i
	ON v.vin = i.vin
WHERE dealership_id = 2;