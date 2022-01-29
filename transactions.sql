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