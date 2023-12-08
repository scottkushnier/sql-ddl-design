

DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical;


CREATE TABLE medical_center
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  medical_center_id INT REFERENCES medical_center(id)
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE patients_doctors
(
  id SERIAL PRIMARY KEY,
  patient_id INT REFERENCES patients(id),
  doctor_id INT REFERENCES doctors(id)
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease_name TEXT NOT NULL
);

CREATE TABLE patients_diseases
(
  id SERIAL PRIMARY KEY,
  patient_id INT REFERENCES patients(id),
  disease_id INT REFERENCES diseases(id)
);

INSERT INTO medical_center
  (name)
VALUES
  ('Silver Spring Medical Center'), ('Rockville Medical Center');
