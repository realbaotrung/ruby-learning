CREATE DATABASE Contact;

USE Contact;

CREATE TABLE country
(
  country_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  country_name VARCHAR(255),
  CONSTRAINT PK_country_id PRIMARY KEY (country_id),
  CONSTRAINT UNI_country_name UNIQUE (country_name)
);

CREATE TABLE person
(
  person_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  person_first_name VARCHAR(100),
  person_last_name VARCHAR(100),
  person_birth_date DATE,
  person_last_contact_datetime DATETIME,
  person_contacted_number INT UNSIGNED,
  person_created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  person_updated_on DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  person_country_id INT UNSIGNED,
  CONSTRAINT PK_person_id PRIMARY KEY (person_id)
);

CREATE TABLE phone_number
(
  phone_number_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  phone_number VARCHAR(55),
  phone_number_created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  phone_number_updated_on DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  phone_number_person_id INT UNSIGNED,
  CONSTRAINT PK_phone_number PRIMARY KEY (phone_number_id),
  CONSTRAINT UNI_phone_number UNIQUE (phone_number)
);

CREATE TABLE email_address
(
  email_address_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  email_address VARCHAR(255),
  email_address_created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  email_address_updated_on DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
  email_address_person_id INT UNSIGNED,
  CONSTRAINT PK_email_address PRIMARY KEY (email_address_id),
  CONSTRAINT UNI_email_address UNIQUE (email_address)
);

ALTER TABLE person
ADD CONSTRAINT FK_person_country_id FOREIGN KEY (person_country_id)
REFERENCES country (country_id);

ALTER TABLE phone_number
ADD CONSTRAINT FK_phone_number_person_id FOREIGN KEY (phone_number_person_id)
REFERENCES person (person_id);

ALTER TABLE email_address
ADD CONSTRAINT FK_email_address_person_id FOREIGN KEY (email_address_person_id)
REFERENCES person (person_id);

INSERT INTO country
(
  country_name
)
VALUES
('US'),
('JP'),
('DE'),
('CN'),
('VN');

# 2 - TABLE - person

INSERT INTO person
(
  person_first_name,
  person_last_name,
  person_birth_date,
  person_last_contact_datetime,
  person_contacted_number
)
VALUES
('trung1', 'bao1', '1992-05-26', '2022-10-20 10:10:10', 5),
('trung2', NULL, '1992-05-27', '2022-10-21 11:11:11', 6),
('trung3', 'bao3', NULL, '2022-10-22 12:12:12', 7),
('trung4', 'bao4', '1992-05-29', NULL, 8),
('trung5', 'bao5', '1992-05-30', '2022-10-24 14:14:14', NULL);

# 3 - TABLE - phone_number

INSERT INTO phone_number
(
  phone_number
)
VALUES
('0866111111'),
('0866112222'),
('0866113333'),
(NULL),
('0866115555');

# 4 - TABLE - email_address

INSERT INTO email_address
(
  email_address
)
VALUES
('trung1@gmail.com'),
('trung2@yahoo.com'),
(NULL),
('trung4@yarhoo.com.vn'),
(NULL);
