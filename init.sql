-- Create a new user here
CREATE USER prj2 WITH ENCRYPTED PASSWORD 'secret';
-- Create a new database here
CREATE DATABASE ais;
-- Connect to database
\connect ais;
-- Optional: create a schema inside the database
-- CREATE SCHEMA dev;

-- Set the privileges that you want your user to have here
GRANT ALL PRIVIlEGES ON DATABASE ais TO prj2;

-- Setup all tables here
-- If you created a schema, use the full name e.g. dev.airplanes
CREATE TABLE airplanes (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL
);

-- Add dummy data here
INSERT INTO airplanes(name)
VALUES ('Cessna');