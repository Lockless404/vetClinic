/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', '2020-2-3', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', '2021-1-7', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', '2017-5-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-2-8', 0, false, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2022-9-15', 2, true, 5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtile', '1993-4-2', 3, false, 12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-6-12', 1, true, 45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon','2005-6-7', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom','1998-10-13', 3, true, 17);

INSERT INTO owners ( full_name, age ) VALUES ('Sam Smith', 34);
INSERT INTO owners ( full_name, age ) VALUES ('Jenniffer Orwell', 19); 
INSERT INTO owners ( full_name, age ) VALUES ('Bob', 45);              
INSERT INTO owners ( full_name, age ) VALUES ('Melody Pond', 77); 
INSERT INTO owners ( full_name, age ) VALUES ('Dean Winchester', 14); 
INSERT INTO owners ( full_name, age ) VALUES ('Joddie Whittaker', 38); 

INSERT INTO species (name) VALUES('Pokemon');
INSERT INTO species (name) VALUES('Digimon');

UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon'; 
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu'); 
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtile', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-5-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Maisy Smith', 26, '2019-1-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, '1981-5-4');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-6-8');

INSERT INTO specialization VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'),( SELECT id FROM species WHERE name = 'Pokemon'));
INSERT INTO specialization VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),( SELECT id FROM species WHERE name = 'Pokenon'));
INSERT INTO specialization VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),( SELECT id FROM species WHERE name = 'Digimon'));
INSERT INTO specialization VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'),( SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'),( SELECT id FROM animals WHERE name = 'Agumon'), '2020-5-24');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),( SELECT id FROM animals WHERE name = 'Agumon'), '2020-7-22'); 
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'),( SELECT id FROM animals WHERE name = 'Gabumon'), '2021-2-2');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Pikachu'), '2020-1-5');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Pikachu'), '2020-3-8');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Pikachu'), '2020-5-14');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),( SELECT id FROM animals WHERE name = 'Devimon'), '2021-5-4');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'),( SELECT id FROM animals WHERE name = 'Charmander'), '2021-2-24');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Plantmon'), '2019-12-24');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'),( SELECT id FROM animals WHERE name = 'Plantmon'), '2020-8-10');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Plantmon'), '2021-4-7');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),( SELECT id FROM animals WHERE name = 'Squirtle'), '2019-9-29');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'),( SELECT id FROM animals WHERE name = 'Angemon'), '2020-10-3');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'),( SELECT id FROM animals WHERE name = 'Angemon'), '2020-11-4');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Boarmon'), '2019-1-24');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Boarmon'), '2019-5-15');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Boarmon'), '2020-2-27');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'),( SELECT id FROM animals WHERE name = 'Boarmon'), '2020-8-3');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),( SELECT id FROM animals WHERE name = 'Blossom'), '2020-5-24');
INSERT INTO visits VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'),( SELECT id FROM animals WHERE name = 'Blossom'), '2021-1-11');
