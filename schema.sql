/* Database schema to keep the structure of entire database. */

createdb vet_clinic
psql vet_clinic

CREATE TABLE animals (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal,
PRIMARY KEY(id)
);
ALTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
id INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(100),
age INT,
PRIMARY KEY(id)
);

CREATE TABLE species (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
PRIMARY KEY (id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT; 
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
age INT,
date_of_graduation date,
PRIMARY KEY (id)
);

CREATE TABLE specialization (      
vet_id INT REFERENCES vets (id),   
species_id INT REFERENCES species (id)
);

CREATE TABLE visits (
vet_id INT REFERENCES vets (id),
animal_id INT REFERENCES animals(id),
visit_date date
);
