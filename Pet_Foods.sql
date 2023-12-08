SELECT * FROM Friends_4_Life.pet_food;

SELECT COUNT(*) FROM pet_food;

--- Find unique cities where the pet food was distributed:
SELECT DISTINCT City FROM pet_food;

--- Calculate the average number of household pets:
SELECT AVG(`Household-Pets`) FROM pet_food;

--- Filter by City:
SELECT * FROM pet_food WHERE City = 'Houston';

--- Find the dates when pet food was distributed in 2022:
SELECT * FROM pet_food WHERE YEAR(Date) = '2022';

--- Retrieve addresses and corresponding wet food quantities where HouseholdPets is greater than 5
SELECT Address, `Wet Foods` 
FROM pet_food 
WHERE `Number of Household Pets` > 5 
LIMIT 0, 1000;

--- Count the Number of Pets by Type:

SELECT Pets, SUM(`Number of Household Pets`) AS TotalPets 
FROM pet_food 
GROUP BY Pets 
LIMIT 0, 1000;

--- Find Average Number of Household Pets:
SELECT AVG(`Number of Household Pets`) AS AveragePets FROM pet_food;

--- Total Dry Foods Pounds and Wet Foods Cans:
SELECT SUM(`Dry Foods`) AS TotalDryFoodPounds, SUM(`Wet Foods`) AS TotalWetFoodCans FROM pet_food;

--- Find Pets with Specific Type:
SELECT `Address`, `Pets`
FROM `pet_food`
WHERE `Dry Foods` >= 50 AND `Pets` = 'Cat'
LIMIT 0, 1000;

--- Update Number of Household Pets for a Specific Address:
UPDATE pet_food SET `Number of Household Pets` = 6 WHERE Address = '2827 Elser' LIMIT 1;

---- Find Addresses with Both Dogs and Cats:
SELECT DISTINCT Address
FROM pet_food
WHERE Pets IN ('Dog', 'Cat')
GROUP BY Address
HAVING COUNT(DISTINCT Pets) = 2;

--- Calculate Average Dry Foods Pounds per Pet Type:
SELECT Pets, AVG(`Dry Foods`) AS AvgDryFood
FROM pet_food
GROUP BY Pets;

--- Find Addresses with the Highest Total Number of Household Pets:
SELECT Address, SUM(`Number of Household Pets`) AS TotalPets
FROM pet_food
GROUP BY Address
ORDER BY TotalPets DESC
LIMIT 1;

--- Calculate the Ratio of Dry Foods to Wet Foods for Each Pet Type:
SELECT Pets, SUM(`Dry Foods`) / SUM(`Wet Foods`) AS DryToWetRatio
FROM pet_food
GROUP BY Pets;

--- 1. Find Addresses with Dogs and Wet Foods Cans More Than 10:
SELECT `Address`, `Zip Code`
FROM pet_food
WHERE Pets = 'Dog' AND `Wet Foods` > 10;


--- Calculate the Percentage of Dogs among All Pets:
SELECT (COUNT(CASE WHEN Pets = 'Dog' THEN 1 ELSE NULL END) / COUNT(*)) * 100 AS PercentageDogs
FROM pet_food;

--- Find Addresses Where Dogs Outnumber Cats:
SELECT Address
FROM pet_food
WHERE Pets = 'Dog'
GROUP BY Address
HAVING COUNT(*) > 1
AND COUNT(CASE WHEN Pets = 'Cat' THEN 1 ELSE NULL END) < COUNT(*);

--- 2. Calculate the Total Dry Foods Pounds for Each Zip Code:
SELECT `Zip Code`, SUM(`Dry Foods`) AS TotalDryFoodPounds
FROM pet_food
GROUP BY `Zip Code`; 

---  Find the Address with the Highest Average Dry Foods Pounds:
SELECT `Address`, AVG(`Dry Foods`) AS AvgDryFoodPounds
FROM pet_food
GROUP BY `Address`
ORDER BY AvgDryFoodPounds DESC
LIMIT 1;

--- 3.Calculate the Total Wet Foods Pounds for Each City and Zip Code:GROUP BY `City`, `Zip Code`;
SELECT `City`, `Zip Code`, SUM(`Wet Foods`) AS TotalWetFoodCans
FROM pet_food
GROUP BY `City`, `Zip Code`
ORDER BY `TotalWetFoodCans` DESC;

--- Find Addresses with Cats and Calculate Their Total Pets:
SELECT `Address`, SUM(`Household-Pets`) AS TotalPets
FROM pet_food
WHERE `Pets` IN ('Cat')
GROUP BY `Address`
HAVING COUNT(DISTINCT `Pets`) = 1;

SELECT `Address`, SUM(`Household Pets`) AS TotalPets
FROM `pet_food`
WHERE `Pets` IN ('Cat')
GROUP BY `Address`
HAVING COUNT(DISTINCT `Pets`) = 1
LIMIT 0, 1000;


--- Calculate the Average Dry Foods Pounds per Household:
SELECT AVG(`Dry Foods`) AS AvgDryFoodPoundsPerHousehold
FROM pet_food;

--- 5. Calculate the Percentage of Households with Dogs in Each Zip Code:
SELECT `Zip Code`, 
       (SUM(CASE WHEN `Pets` = 'Dog' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS PercentageWithDogs
FROM pet_food
GROUP BY `Zip Code`;

--- date with the most dry food served.
SELECT `Date`, `Dry Foods`
FROM pet_food
ORDER BY `Dry Foods` DESC
LIMIT 1;

--- date with the most Wet Food served.
SELECT `Date`, `Wet Foods`
FROM pet_food
ORDER BY `Wet Foods` DESC
LIMIT 1;


SELECT DAYNAME(`Date`) AS `Day of Week`, SUM(`Dry Foods`) AS `Total Dry Foods`
FROM pet_food
GROUP BY `Day of Week`
ORDER BY `Total Dry Foods` DESC;

--- Day in 2022 served higest Dry Foods
SELECT `Date`, `Dry Foods`
FROM pet_food
WHERE YEAR(`Date`) = 2022
ORDER BY `Dry Foods` DESC
LIMIT 1;

--- Day in 2022 served higest Wet Foods
SELECT `Date`, `Wet Foods`
FROM pet_food
WHERE YEAR(`Date`) = 2022
ORDER BY `Wet Foods` DESC
LIMIT 1;

--- the maximum number of household pets for each address
SELECT Address, MAX(`Number of Household Pets`) AS MaxPets
FROM pet_food
GROUP BY Address
ORDER BY MaxPets DESC
LIMIT 1;

--- 5.Calculate the Total Dry Food Pounds and Wet Food Cans for Each Pet Type (Dog, Cat, Both):
SELECT Pets,
       SUM(`Dry Foods`) AS TotalDryFoodPounds,
       SUM(`Wet Foods`) AS TotalWetFoodCans
FROM pet_food
GROUP BY Pets;

--- Calculate the Total Dry Food Pounds and Wet Food Cans for Each Pet Type (Dog, Cat, Both) in Year 2022:
SELECT Pets,
       SUM(`Dry Foods`) AS TotalDryFoodPounds,
       SUM(`Wet Foods`) AS TotalWetFoodCans
FROM pet_food
WHERE YEAR(`Date`) = 2022
GROUP BY Pets;

--- Find Addresses with More Than 10 Pets and the Number of Pets:
SELECT Address, 
       `Number of Household Pets` AS NumPets
FROM pet_food
WHERE `Number of Household Pets` > 10;

--- Find Addresses with More Than 10 Pets and the Number of Pets:
SELECT Address, `Zip Code`, Pets, `Number of Household Pets` AS NumPets
FROM pet_food
WHERE `Number of Household Pets` > 10;



--- Calculate Total Dry Foods Pounds and Wet Foods Cans for Each Year:
SELECT YEAR(`Date`) AS Year, SUM(`Dry Foods`) AS TotalDryFoodPounds, SUM(`Wet Foods`) AS TotalWetFoodCans
FROM pet_food
GROUP BY YEAR(`Date`)
ORDER BY Year DESC;

--- Identifying 4/5 underserved Zip Code
SELECT `Zip Code`, 
       SUM(`Dry Foods`) AS TotalDryFoodPounds, 
       SUM(`Wet Foods`) AS TotalWetFoodCans
FROM pet_food
GROUP BY `Zip Code`
ORDER BY `Zip Code`;

SELECT `Zip Code`, 
       Pets,
       SUM(`Dry Foods`) AS TotalDryFoodPounds, 
       SUM(`Wet Foods`) AS TotalWetFoodCans
FROM pet_food
GROUP BY `Zip Code`, Pets
ORDER BY `Zip Code`, Pets;

---- Calculate Total Dry Foods Pounds and Wet Foods Cans for Each Zip Code for Cats
SELECT `Zip Code`, 
       SUM(`Dry Foods`) AS CatTotalDryFoodPounds, 
       SUM(`Wet Foods`) AS CatTotalWetFoodCans
FROM pet_food
WHERE Pets = 'Cat'
GROUP BY `Zip Code`
ORDER BY `Zip Code`;

--- Calculate Total Dry Foods Pounds and Wet Foods Cans for Each Zip Code for Cats and number of Cats:
SELECT `Zip Code`, 
       COUNT(*) AS NumOfCats,
       SUM(`Dry Foods`) AS CatTotalDryFoodPounds, 
       SUM(`Wet Foods`) AS CatTotalWetFoodCans
FROM pet_food
WHERE Pets = 'Cat'
GROUP BY `Zip Code`
ORDER BY `Zip Code`;

---- Calculate Total Dry Foods Pounds and Wet Foods Cans for Each Zip Code for Dogs
SELECT `Zip Code`, 
       SUM(`Dry Foods`) AS CatTotalDryFoodPounds, 
       SUM(`Wet Foods`) AS CatTotalWetFoodCans
FROM pet_food
WHERE Pets = 'Dog'
GROUP BY `Zip Code`
ORDER BY `Zip Code`;


--- find addresses with pets and sort the results by the year 2022
SELECT Address, Pets, `Date`
FROM pet_food
WHERE YEAR(`Date`) = 2022 AND Pets IS NOT NULL
ORDER BY `Date` ASC;

--- Calculate Average Dry Foods Pounds per Year:
SELECT YEAR(`Date`) AS Year, AVG(`Dry Foods`) AS AvgDryFoodPounds
FROM pet_food
GROUP BY YEAR(`Date`);

--- Retrieve Addresses and Zip Codes of Houses with Both Dogs and Cats:
SELECT Address, `Zip Code`
FROM pet_food
WHERE Pets IN ('Dog', 'Cat')
GROUP BY Address, `Zip Code`
HAVING COUNT(DISTINCT Pets) = 2;

---  6. the year with the highest dry foods and wet foods served
SELECT YEAR(`Date`) AS Year,
       SUM(`Dry Foods`) AS TotalDryFoods,
       SUM(`Wet Foods`) AS TotalWetFoods
FROM pet_food
GROUP BY YEAR(`Date`)
ORDER BY TotalDryFoods DESC, TotalWetFoods DESC
LIMIT 1;


SELECT Address, (SUM('Dry Foods') + SUM('Wet Foods')) AS TotalPets
FROM pet_food                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
WHERE Pets IN ('Dog', 'Cat')
GROUP BY Address
HAVING COUNT(DISTINCT Pets) = 2;


