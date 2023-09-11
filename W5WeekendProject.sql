CREATE TABLE Mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
  
);

CREATE TABLE Parts (
  parts_id SERIAL PRIMARY KEY,
  part VARCHAR(50)
);

CREATE TABLE Services (
  service_id SERIAL PRIMARY KEY,
  description VARCHAR(200),
  price NUMERIC(10,2),
  customer_id INTEGER,
  VIN VARCHAR(25)
  
);

CREATE TABLE Car (
  car_id SERIAL PRIMARY KEY,
  car_model VARCHAR(50),
  car_make VARCHAR(50),
  year_ VARCHAR(20),
  VIN VARCHAR(25),
  price NUMERIC(10,2)
  
);

CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(50)
  
  
);

CREATE TABLE Salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
  
);

CREATE TABLE Service_Mechanic (
  mechanic_id INTEGER,
  service_id INTEGER,
  FOREIGN KEY (service_id) REFERENCES Services(service_id),
  FOREIGN KEY (mechanic_id) REFERENCES Mechanic(mechanic_id)
);

CREATE TABLE Invoice_Info (
  invoice_id SERIAL PRIMARY KEY,
  salesperson_id INTEGER,
  car_id INTEGER,
  total NUMERIC(10,2),
  customer_id INTEGER,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id)
);

CREATE TABLE Service_Parts  (
  service_id INTEGER,
  parts_id INTEGER,
  FOREIGN KEY (service_id) REFERENCES Services(service_id)
);


-- Adding a Salesperson
CREATE OR REPLACE FUNCTION add_salesperson(
	_salesperson_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR

)
RETURNS void -- what datatype is going to be returned
AS $MAIN$ -- naming the body or string literal
BEGIN
	INSERT INTO salesperson
	VALUES(_salesperson_id, _first_name, _last_name );
END;
$MAIN$
LANGUAGE plpgsql;
SELECT *
FROM salesperson
WHERE salesperson_id = 100;

-- Selecting a salesperson

SELECT add_salesperson(100, 'Jimmy', 'Neutron');
SELECT add_salesperson(101, 'Johnny', 'Bravo');

-- Altering the car table to make VIN a unique value
-- so we can join by vin in services

ALTER TABLE car
ADD CONSTRAINT VIN_unique UNIQUE (VIN);

SELECT *
FROM salesperson

-- creating customer function


CREATE OR REPLACE FUNCTION add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_email VARCHAR,
	_phone_number varchar

)
RETURNS void -- what datatype is going to be returned
AS $MAIN$ -- naming the body or string literal
BEGIN
	INSERT INTO customer
	VALUES(_customer_id, _first_name, _last_name, _email, _phone_number );
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer(100, 'Bruce', 'Wayne', 'theonlybatman@gmail.com', '5889091191');

-- Creating car function



CREATE OR REPLACE FUNCTION add_car(
	_car_id INTEGER,
	_car_model VARCHAR,
	_car_make VARCHAR,
	_year_ VARCHAR,
	_vin varchar,
	_price NUMERIC

)
RETURNS void -- what datatype is going to be returned
AS $MAIN$ -- naming the body or string literal
BEGIN
	INSERT INTO customer
	VALUES(_car_id, _car_model, _year_, _vin, _price );
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_car(5, '540i', 'Bmw', '2020', 'C1249IED23K7L8P0', '50000');

-- creating function for adding mechanic

CREATE OR REPLACE FUNCTION add_mechanic(
	_mechanic_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR
	
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO mechanic
	VALUES(_mechanic_id, _first_name, _last_name );
END;
$MAIN$
LANGUAGE plpgsql;



    
    

	
