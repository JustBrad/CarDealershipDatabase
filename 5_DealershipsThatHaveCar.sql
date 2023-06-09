USE CarDealership;

-- 5. Find all dealerships that have a certain vehicle type (Ford Mustang)
SELECT d.name
	, v.vin
	, v.make
    , v.model
FROM vehicles AS v
JOIN inventory AS i
	ON v.vin = i.vin
JOIN dealerships AS d
	ON d.dealership_id = i.dealership_id
WHERE v.make = 'Ford' AND v.model = 'Mustang';