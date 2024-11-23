CREATE database TravelAgency;
USE TravelAgency;

/* Table creation*/
CREATE TABLE Users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  passwrd VARCHAR(255) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20),
  role VARCHAR(20) CHECK(role IN ('customer', 'agent', 'admin'))
);

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  nationality VARCHAR(50) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Agents (
  agent_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  agency_name VARCHAR(100) NOT NULL,
  license_number VARCHAR(20) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  agent_id INT NOT NULL,
  booking_date DATE NOT NULL,
  total_amount DECIMAL(10, 2) NOT NULL,
  status VARCHAR(20) CHECK(status IN ('confirmed', 'canceled')),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (agent_id) REFERENCES Agents(agent_id)
);

CREATE TABLE Itineraries (
  itinerary_id INT PRIMARY KEY AUTO_INCREMENT,
  booking_id INT NOT NULL,
  destination VARCHAR(100) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Flights (
  flight_id INT PRIMARY KEY AUTO_INCREMENT,
  flight_number VARCHAR(20) NOT NULL,
  departure_city VARCHAR(50) NOT NULL,
  arrival_city VARCHAR(50) NOT NULL,
  departure_time TIME NOT NULL,
  arrival_time TIME NOT NULL
);

CREATE TABLE Hotels (
  hotel_id INT PRIMARY KEY AUTO_INCREMENT,
  hotel_name VARCHAR(100) NOT NULL,
  location VARCHAR(100) NOT NULL,
  rating INT NOT NULL
);

CREATE TABLE Packages (
  package_id INT PRIMARY KEY AUTO_INCREMENT,
  package_name VARCHAR(100) NOT NULL,
  descrption TEXT NOT NULL,
  price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Payments (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  booking_id INT NOT NULL,
  payment_date DATE NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_method VARCHAR(20) CHECK(payment_method IN ('credit card', 'cash')),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Booking_Flights (
  booking_id INT NOT NULL,
  flight_id INT NOT NULL,
  PRIMARY KEY (booking_id, flight_id),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

CREATE TABLE Booking_Hotels (
  booking_id INT NOT NULL,
  hotel_id INT NOT NULL,
  PRIMARY KEY (booking_id, hotel_id),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

CREATE TABLE Booking_Packages (
  booking_id INT NOT NULL,
  package_id INT NOT NULL,
  PRIMARY KEY (booking_id, package_id),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (package_id) REFERENCES Packages(package_id)
);

/* Table Users insertion*/
INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('Jeff', '123456', 'jeffamudasia@gmail.com', '0712345678', 'customer');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('James', '12342346', 'jamesmaina@gmail.com', '0712345178', 'customer');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('Khanyanji', '1235456', 'khanyanjiamani@gmail.com', '0712145678', 'customer');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('Faith', '12367856', 'faithlemayian@gmail.com', '0712346678', 'customer');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('Marion', '138393456', 'marionkageha@gmail.com', '0712395678', 'customer');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('John', '123saw456', 'johndoe@gmail.com', '0729472819', 'customer');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('Jane', '1234ksjkfo56', 'janedoe@gmail.com', '0793282738', 'customer');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('Kanye', '1219383456', 'kanyeeast@gmail.com', '0798887532', 'agent');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('Elliot', '123456', 'misselliot@gmail.com', '0791738456', 'agent');

INSERT INTO Users (username, passwrd, email, phone_number, role)
VALUES ('Taylor', '123456', 'taylorswiftie@gmail.com', '0798625385', 'agent');

/* Table Customers insertion*/
INSERT INTO Customers (user_id, first_name, last_name, date_of_birth, nationality)
VALUES ('1', 'Jeffa', 'Ngase', '1998-10-02', 'Kenyan');

INSERT INTO Customers (user_id, first_name, last_name, date_of_birth, nationality)
VALUES ('2', 'James', 'Maina', '1996-03-15', 'Kenyan');

INSERT INTO Customers (user_id, first_name, last_name, date_of_birth, nationality)
VALUES ('3', 'Khanyanji', 'Amani', '1997-04-14', 'Kenyan');

INSERT INTO Customers (user_id, first_name, last_name, date_of_birth, nationality)
VALUES ('4', 'Faith', 'Lemaiyan', '1999-08-28', 'Kenyan');

INSERT INTO Customers (user_id, first_name, last_name, date_of_birth, nationality)
VALUES ('5', 'Marion', 'Kageha', '2000-10-24', 'Kenyan');

INSERT INTO Customers (user_id, first_name, last_name, date_of_birth, nationality)
VALUES ('6', 'John', 'Doe', '1999-01-01', 'French');

INSERT INTO Customers (user_id, first_name, last_name, date_of_birth, nationality)
VALUES ('7', 'Jane', 'Doe', '2000-01-01', 'German');

/* Table Agents insertion*/
INSERT INTO Agents (user_id, agency_name, license_number)
VALUES ('8', 'Kanye East', '12345');

INSERT INTO Agents (user_id, agency_name, license_number)
VALUES ('9', 'Missie Elliot', '12125');

INSERT INTO Agents (user_id, agency_name, license_number)
VALUES ('10', 'Taylor Swiftie', '88311');

/* Table Bookings insertion*/
INSERT INTO Bookings (customer_id, agent_id, booking_date, total_amount)
VALUES ('1', '3', '2024-12-20','500000');

INSERT INTO Bookings (customer_id, agent_id, booking_date, total_amount)
VALUES ('2', '2', '2025-08-08','100000');

INSERT INTO Bookings (customer_id, agent_id, booking_date, total_amount)
VALUES ('3', '1', '2025-02-01','300000');

INSERT INTO Bookings (customer_id, agent_id, booking_date, total_amount)
VALUES ('4', '1', '2025-02-01','300000');

INSERT INTO Bookings (customer_id, agent_id, booking_date, total_amount)
VALUES ('5', '2', '2025-06-12','100000');

INSERT INTO Bookings (customer_id, agent_id, booking_date, total_amount)
VALUES ('6', '2', '2025-06-12','100000');

INSERT INTO Bookings (customer_id, agent_id, booking_date, total_amount)
VALUES ('7', '3', '2024-12-20','500000');

/* Table itineraries insertion*/
INSERT INTO Itineraries (booking_id, destination, start_date, end_date)
VALUES ('1', 'Cairo', '2024-12-24','2025-01-01');

INSERT INTO Itineraries (booking_id, destination, start_date, end_date)
VALUES ('2', 'Maasai Mara', '2025-08-15','2025-08-20');

INSERT INTO Itineraries (booking_id, destination, start_date, end_date)
VALUES ('3', 'Mombasa', '2025-02-14','2025-02-15');

INSERT INTO Itineraries (booking_id, destination, start_date, end_date)
VALUES ('4', 'Mombasa', '2025-02-14','2025-02-15');

INSERT INTO Itineraries (booking_id, destination, start_date, end_date)
VALUES ('5', 'Maasai Mara', '2025-07-15','2025-07-25');

INSERT INTO Itineraries (booking_id, destination, start_date, end_date)
VALUES ('6', 'Maasai Mara', '2025-07-15','2025-07-25');

INSERT INTO Itineraries (booking_id, destination, start_date, end_date)
VALUES ('7', 'Cairo', '2024-12-24','2025-01-01');

/* Table Flights insertion*/
INSERT INTO Flights (flight_number, departure_city, arrival_city, departure_time, arrival_time)
VALUES ('333', 'Nairobi', 'Cairo', '0230','0720');

INSERT INTO Flights (flight_number, departure_city, arrival_city, departure_time, arrival_time)
VALUES ('254', 'Nairobi', 'Maasai Mara', '0730','0820');

INSERT INTO Flights (flight_number, departure_city, arrival_city, departure_time, arrival_time)
VALUES ('777', 'Nairobi', 'Mombasa', '0730','0830');

INSERT INTO Flights (flight_number, departure_city, arrival_city, departure_time, arrival_time)
VALUES ('123', 'Nairobi', 'Maasai Mara', '0730','0820');

/* Table Hotels insertion*/
INSERT INTO Hotels (hotel_name, location, rating)
VALUES ('Oasis Hotel', 'Cairo', '5');

INSERT INTO Hotels (hotel_name, location, rating)
VALUES ('Nyali Beach Holiday Resort', 'Mombasa', '5');

INSERT INTO Hotels (hotel_name, location, rating)
VALUES ('Maasai Mara Resort', 'Maasai Mara', '4');

/* Table Packages insertion*/
INSERT INTO Packages (package_name, descrption, price)
VALUES ('Christmas Getaway', 'Take a flight to Egypt this Christmas and enjoy the breathtaking ancient city of Cairo with exclusive tours of the pyramids, Spynx etc', '500000');

INSERT INTO Packages (package_name, descrption, price)
VALUES ('Valentines Special', 'Travel to the beach with our Lovers only special package. Watch the sunset from our beachfront hotel in Nyali and sip a cocktail with your lover this valentines', '300000');

INSERT INTO Packages (package_name, descrption, price)
VALUES ('Adventures Guild', 'Get your Heart racing with our thrilling trips through the Maasai Mara and be inspired by the Grandure of the wild', '100000');

/* Table Payments insertion*/
INSERT INTO Payments (booking_id, payment_date, amount, payment_method)
VALUES ('1', '2024-12-20', '500000', 'credit card');

INSERT INTO Payments (booking_id, payment_date, amount, payment_method)
VALUES ('2', '2025-08-08', '100000', 'credit card');

INSERT INTO Payments (booking_id, payment_date, amount, payment_method)
VALUES ('3', '2025-02-01', '300000', 'credit card');

INSERT INTO Payments (booking_id, payment_date, amount, payment_method)
VALUES ('4', '2025-02-01', '300000', 'credit card');

INSERT INTO Payments (booking_id, payment_date, amount, payment_method)
VALUES ('5', '2025-06-12', '100000', 'cash');

INSERT INTO Payments (booking_id, payment_date, amount, payment_method)
VALUES ('6', '2025-06-12', '100000', 'cash');

INSERT INTO Payments (booking_id, payment_date, amount, payment_method)
VALUES ('7', '2024-12-20', '500000', 'credit card');

/* Table Booking_Flights insertion*/
INSERT INTO Booking_Flights (booking_id, flight_id)
VALUES ('1', '1');

INSERT INTO Booking_Flights (booking_id, flight_id)
VALUES ('2', '2');

INSERT INTO Booking_Flights (booking_id, flight_id)
VALUES ('3', '3');

INSERT INTO Booking_Flights (booking_id, flight_id)
VALUES ('4', '3');

INSERT INTO Booking_Flights (booking_id, flight_id)
VALUES ('5', '4');

INSERT INTO Booking_Flights (booking_id, flight_id)
VALUES ('6', '4');

INSERT INTO Booking_Flights (booking_id, flight_id)
VALUES ('7', '1');

/* Table Booking_Hotels insertion*/
INSERT INTO Booking_Hotels (booking_id, hotel_id)
VALUES ('1', '1');

INSERT INTO Booking_Hotels (booking_id, hotel_id)
VALUES ('2', '3');

INSERT INTO Booking_Hotels (booking_id, hotel_id)
VALUES ('3', '2');

INSERT INTO Booking_Hotels (booking_id, hotel_id)
VALUES ('4', '2');

INSERT INTO Booking_Hotels (booking_id, hotel_id)
VALUES ('5', '3');

INSERT INTO Booking_Hotels (booking_id, hotel_id)
VALUES ('6', '3');

INSERT INTO Booking_Hotels (booking_id, hotel_id)
VALUES ('7', '1');

/* Table Booking_Packages insertion*/
INSERT INTO Booking_Packages (booking_id, package_id)
VALUES ('1', '1');

INSERT INTO Booking_Packages (booking_id, package_id)
VALUES ('2', '3');

INSERT INTO Booking_Packages (booking_id, package_id)
VALUES ('3', '2');

INSERT INTO Booking_Packages (booking_id, package_id)
VALUES ('4', '2');

INSERT INTO Booking_Packages (booking_id, package_id)
VALUES ('5', '3');

INSERT INTO Booking_Packages (booking_id, package_id)
VALUES ('6', '3');

INSERT INTO Booking_Packages (booking_id, package_id)
VALUES ('7', '1');

/*Encrypt Passwords*/
UPDATE Users
SET passwrd= md5(passwrd) WHERE passwrd=passwrd; 

/*Display Table Properties*/
DESC Users;
DESC Customers;
DESC Agents;
DESC Bookings;
DESC Itineraries;
DESC Flights;
DESC Hotels;
DESC Packages;
DESC Payments;
DESC Booking_Flights;
DESC Booking_Hotels;
DESC Booking_Packages;

/*Display Tables*/
SELECT * FROM Users;

SELECT * FROM Customers;

SELECT * FROM Agents;

SELECT * FROM Bookings;

SELECT * FROM Itineraries;

SELECT * FROM Flights;

SELECT * FROM Hotels;

SELECT * FROM Packages;

SELECT * FROM Payments;

SELECT * FROM Booking_Flights;

SELECT * FROM Booking_Hotels;

SELECT * FROM Booking_Packages;

CREATE VIEW Customers_attendance as 
SELECT first_name, last_name
FROM Customers;
SELECT * FROM Customers_attendance;
CREATE VIEW Customers_emails as
SELECT email
FROM Users;
SELECT * FROM Customers_emails;
CREATE VIEW BookingDetails AS
SELECT
booking_id ,
  customer_id,
  agent_id ,
  booking_date ,
  total_amount ,
  status 
  FROM Bookings;
  select* FROM BookingDetails;
  CREATE VIEW ItineraryDetails AS
  SELECT
  itinerary_id ,
  booking_id ,
  destination
  FROM Itineraries;
  SELECT * FROM ItineraryDetails;
  CREATE VIEW PackageInfo AS
  SELECT
  price 
  FROM Packages;
  DELIMITER //

CREATE TRIGGER after_package_update
AFTER UPDATE ON Packages
FOR EACH ROW
BEGIN
    INSERT INTO notifications (customer_id, message, created_at)
    SELECT customer_id, 
           CONCAT('The package ', NEW.package_name, ' has been updated.'), 
           NOW()
    FROM Bookings
    WHERE package_id = NEW.package_id;
END;
DELIMITER //


DELIMITER //

CREATE TRIGGER after_booking_confirm
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
    IF NEW.status = 'confirmed' AND OLD.status <> 'confirmed' THEN
        INSERT INTO notifications (agent_id, message, created_at)
        VALUES (NEW.agent_id, CONCAT('Booking ID ', NEW.booking_id, ' has been confirmed.'), NOW());
    END IF;
END;

//

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_payment_insert
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    INSERT INTO payment_logs (payment_id, amount, payment_date)
    VALUES (NEW.payment_id, NEW.amount, NOW());
END;

//

DELIMITER ;

DELIMITER //

DELIMITER //

CREATE TRIGGER after_booking_insert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    INSERT INTO notifications (agent_id, message, created_at)
    VALUES (NEW.agent_id, CONCAT('New booking created: Booking ID ', NEW.booking_id), NOW());
END;

//

DELIMITER ;