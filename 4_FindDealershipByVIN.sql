USE CarDealership;

-- 4. Find dealership where certain vehicle is located, by VIN
SELECT d.name
	, v.vin
	, v.make
    , v.model
FROM vehicles AS v
JOIN inventory AS i
	ON v.vin = i.vin
JOIN dealerships AS d
	ON d.dealership_id = i.dealership_id
WHERE v.vin = 175922;