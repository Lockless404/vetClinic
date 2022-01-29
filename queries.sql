/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals where name LIKE '%mon%';
SELECT name FROM animals where date_of_birth BETWEEN '2016-1-1' AND '2019-12-1';
SELECT name FROM animals where neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >=10.4 AND weight_kg <= 17.3;
