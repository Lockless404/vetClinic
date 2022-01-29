/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals where name LIKE '%mon';
SELECT name FROM animals where date_of_birth BETWEEN '2016-1-1' AND '2019-12-1';
SELECT name FROM animals where neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >=10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species is NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
SAVEPOINT FIRST;
UPDATE animals SET weight_kg= weight_kg * -1;
ROLLBACK TO SAVEPOINT FIRST;
UPDATE animals SET weight_kg= weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT SUM(escape_attempts), neutered FROM animals GROUP BY (neutered);
SELECT MAX(weight_kg), MIN(weight_kg), species FROM animals GROUP BY (species);
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY(species);

SELECT name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals JOIN species ON species.id = animals.species_id WHERE species.name = 'Pokemon';
SELECT full_name, name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;
SELECT species.name, COUNT(animals.name) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species.name;
SELECT animals.name FROM animals JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Jenniffer Orwell' AND species.name = 'Digimon';
SELECT animals.name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT COUNT(owners.full_name), owners.full_name FROM animals JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(owners.full_name) DESC;

SELECT animals.name, visits.visit_date FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tacher' ORDER BY visits.visit_date ASC LIMIT 1;
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' GROUP BY (visits.visit_date, animals.name);
SELECT vets.name, species.name FROM vets LEFT JOIN specialization ON specialization.vet_id = vets.id LEFT JOIN species ON species.id = specialization.species_id;
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id WHERE visits.visit_date BETWEEN '2020-4-1' AND '2020-8-30';
SELECT animals.name, COUNT(visit_date) FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id GROUP BY animals.name ORDER BY COUNT(visit_date) DESC;
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' ORDER BY visit_date ASC LIMIT 1;
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, neutered, weight_kg, vets.name, vets.age, vets.date_of_graduation, visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id ORDER BY visit_date DESC LIMIT 1;
SELECT animals.name, animals.species_id as animal_species_id, visit_date, specialization.species_id as vet_species_id, vets.id, vets.name FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id JOIN specialization ON vets.id = specialization.vet_id WHERE animals.species_id != specialization.species_id;
SELECT animals.species_id, species.name FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id JOIN species ON animals.species_id=species.id  WHERE vets.name = 'Maisy Smith' GROUP BY (species.name, animals.species_id);
