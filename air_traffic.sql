-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airports
(
  id SERIAL PRIMARY KEY,
  code VARCHAR(4),
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  flight_number INT NOT NULL,
  airline TEXT,
  from_airport_id INT REFERENCES airports(id),
  to_airport_id INT REFERENCES airports(id),
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INT REFERENCES flights(id)
);

INSERT INTO airports
 (code, city, country)
VALUES
 ('DCA', 'Washington DC', 'United States'),   -- 1
 ('SEA', 'Seattle', 'United States'),  -- 2
 ('TKY', 'Tokyo', 'Japan'),  -- 3
 ('LNH', 'London', 'United Kingdom'),  -- 4
 ('LAX', 'Los Angeles', 'United States'),  -- 5
 ('LVV', 'Los Vegas', 'United States'),  -- 6
 ('MXC', 'Mexico City', 'Mexico'),  -- 7
 ('PRS', 'Paris', 'France'),  -- 8
 ('CAS', 'Casablanca', 'Morocco'),  -- 9
 ('DUB', 'Dubai', 'UAE'),  -- 10
 ('BEI', 'Beijing', 'China'),  -- 11
 ('LAG', 'New York', 'United States'),  -- 12
 ('CHR', 'Charlotte', 'United States'),  -- 13
 ('CDR', 'Cedar Rapids', 'United States'),  -- 14
 ('OHR', 'Chicago', 'United States'),  -- 15
 ('NWO', 'New Orleans', 'United States'),  -- 16
 ('SAO', 'Sao Paolo', 'Brazil'),  -- 17
 ('SAN', 'Santiago', 'Chile');  -- 18

INSERT INTO flights
 (flight_number, airline, from_airport_id, to_airport_id, departure, arrival)
 VALUES
 ('23', 'United', 1, 2, '2018-04-08 09:00:00', '2018-04-08 12:00:00'),     -- 1
 ('24', 'United', 3, 4, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),     -- 2
 ('25', 'United', 5, 6, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),     -- 3
 ('26', 'United', 2, 7, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),     -- 4
 ('27', 'United', 8, 9, '2018-08-01 18:30:00', '2018-08-01 21:50:00'),     -- 5
 ('28', 'United', 10, 11, '2018-10-31 01:15:00', '2018-10-31 12:55:00'),     -- 6
 ('29', 'United', 12, 13, '2019-02-06 06:00:00', '2019-02-06 07:47:00'),     -- 7
 ('30', 'United', 14, 15, '2018-12-22 14:42:00', '2018-12-22 15:56:00'),     -- 8
 ('31', 'United', 13, 16, '2019-02-06 16:28:00', '2019-02-06 19:18:00'),     -- 9
 ('32', 'United', 17, 18, '2019-01-20 19:30:00', '2019-01-20 22:45:00')     -- 10
 ;

 INSERT INTO tickets
  (first_name, last_name, seat, flight_id)
 VALUES
  ('Jennifer', 'Finch', '33B', 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);
