DROP DATABASE IF EXISTS lesson_5;
CREATE DATABASE lesson_5;
USE lesson_5;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
DROP TABLE IF EXISTS trains;
CREATE TABLE trains
(
	id INT NOT NULL PRIMARY KEY,
    train_id INT,
    station VARCHAR(20),
    station_time TIME
);

INSERT trains
VALUES
	(1, 110, "San Francisco", "10:00:00"),
    (2, 110, "Redwood city", "10:54:00"),
    (3, 110, "Palo Alto", "11:02:00"),
    (4, 110, "San Jose", "12:35:00"),
    (5, 120, "San Francisco", "11:00:00"),
    (6, 120, "Palo Alto", "12:49:00"),
    (7, 120, "San Jose", "13:30:00");

SELECT *
FROM cars;

SELECT *
FROM trains;

-- Задание 1
DROP VIEW IF EXISTS cars_cost_lower_25000;
CREATE VIEW cars_cost_lower_25000 
AS SELECT 
	id,
    name
FROM cars 
WHERE cost < 25000;

SELECT *
FROM cars_cost_lower_25000;

-- Задание 2
ALTER VIEW cars_cost_lower_25000  
AS  
SELECT id,
	name
FROM cars 
WHERE cost < 30000; 

SELECT *
FROM cars_cost_lower_25000;

-- Задание 3
DROP VIEW IF EXISTS cars_name_only_Skoda_and_Audi;
CREATE VIEW cars_name_only_Skoda_and_Audi 
AS SELECT 
	id,
    name,
    cost
FROM cars 
WHERE name = "Skoda" OR name = "Audi";

SELECT *
FROM  cars_name_only_Skoda_and_Audi;

-- Задание 4
SELECT id,
    train_id,
    station,
    station_time,
    TIMEDIFF(LEAD(station_time) OVER (ORDER BY station_time), station_time) AS time_to_next_station
FROM trains;
