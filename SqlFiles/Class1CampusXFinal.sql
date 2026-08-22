CREATE DATABASE IF NOT EXISTS campusx;

DROP DATABASE IF EXISTS campusx;

USE campusx;

CREATE TABLE users
( userid INT , name VARCHAR(30) , email VARCHAR(50), password VARCHAR(30) 
);

describe user;

INSERT INTO users VALUES
(1, "Abhishek Morya", "abhimorya8826@gmail.com", "12345"),
(2, "Karan Sharma", "karansh0411@gmail.com", "0411"),
(3, "Krrish Gulia", "krrishgulia32@gmail.com", "092003");

SELECT * FROM users;

CREATE TABLE abhi (
user_id INTEGER NOT NULL,
name VARCHAR(255),
email VARCHAR(255),
password VARCHAR(255),

CONSTRAINT user_email_unique UNIQUE (name,email)
);

INSERT INTO abhi VALUES 
(1,"karan sharma", "karansh0411@gmail.com","123345"),
(2,"karan rawat", "karanrawat0411@gmail.com","1234");

select * from abhi;

CREATE TABLE abhi2
( user_id INTEGER , name VARCHAR(255) , email VARCHAR(255) , password VARCHAR(255));


CREATE TABLE abhi3
( user_id INTEGER AUTO_INCREMENT, 
  name VARCHAR(255) , 
  email VARCHAR(255) , 
  password VARCHAR(255),
  
  CONSTRAINT user_email_unique UNIQUE (email),
  CONSTRAINT users_pk PRIMARY KEY (user_id, name)
  );


CREATE TABLE student
( student_id INTEGER PRIMARY KEY AUTO_INCREMENT, 
  name VARCHAR(50),
  age INTEGER CHECK (age>6 AND age<25)
);

CREATE TABLE ticket 
( ticket_id INTEGER PRIMARY KEY,
  name VARCHAR(255), 
  travel_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO ticket (ticket_id, name)
VALUES (1, "Abhishek Morya");

select * from ticket;

INSERT INTO ticket (ticket_id, name, travel_date)
VALUES
(2, "Karan Sharma", DEFAULT),
(3, "Krrish Gulia", "2026-08-20 12:00:00"),
(4, "Rahul Kumar", DEFAULT);


# now exporing foreign key 

CREATE TABLE customer 
( cid INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL, 
  email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE orders
( order_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  cid INTEGER NOT NULL,
  order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  CONSTRAINT order_fk FOREIGN KEY (cid) REFERENCES customer(cid)
);


DROP TABLE customer;

INSERT INTO customer (name, email)
VALUES
('Abhishek Morya', 'abhishek@gmail.com'),
('Karan Sharma', 'karan@gmail.com'),
('Krrish Gulia', 'krrish@gmail.com');

select * from customer;

INSERT INTO orders (cid)
VALUES
(1),
(2),
(1),
(3),
(1);

select * from orders;


# Alter table 

# add single column 

ALTER TABLE customer ADD COLUMN surname VARCHAR(255) AFTER name;

select * from customer;

# add multiple column 

ALTER TABLE customer ADD COLUMN password VARCHAR(255) NOT NULL AFTER email, ADD COLUMN city VARCHAR(255) NOT NULL;

# delete column 

ALTER TABLE customer DROP COLUMN password , DROP COLUMN city;

describe customer
