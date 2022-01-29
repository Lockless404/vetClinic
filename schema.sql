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
