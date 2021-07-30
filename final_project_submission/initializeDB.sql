CREATE DATABASE PropertyTracker;

USE PropertyTracker;

CREATE TABLE Property (
    PropertyKey TINYINT UNSIGNED AUTO_INCREMENT,
    Address VARCHAR(50),
    City VARCHAR(30),
    State VARCHAR(30),
    ListingDate DATE,
    PRIMARY KEY (PropertyKey)
);

INSERT INTO Property (PropertyKey, Address, City, State, ListingDate) VALUES
(PropertyKey, '5559 N Elston Ave', 'Chicago', 'Illinois', '2020-12-30'),
(PropertyKey, '1201 19th Pl', 'Vero Beach', 'Florida', '2020-03-11'),
(PropertyKey, '1300 Bethlehem Pike', 'Flourtown', 'Pennsylvania', '2021-03-22'),
(PropertyKey, '7274 Radbourne', 'Upper Darby', 'Pennsylvania', '2021-06-24'),
(PropertyKey, '2628 N Newhall St', 'Milwaukee', 'Wisconsin', '2021-06-11'),
(PropertyKey, '1302 6th Ave', 'Grinnell', 'Iowa', '2021-05-6');

CREATE TABLE PropertyType (
    PropertyKey TINYINT UNSIGNED AUTO_INCREMENT,
    CommercialKey TINYINT UNSIGNED,
    ResidentialKey TINYINT UNSIGNED,
    PRIMARY KEY (PropertyKey)
);

INSERT INTO PropertyType (PropertyKey, CommercialKey, ResidentialKey) VALUES
(PropertyKey, 101, 201),
(PropertyKey, 102, 202),
(PropertyKey, 103, 203);

CREATE TABLE Commercial (
    CommercialKey TINYINT UNSIGNED,
    CommercialType VARCHAR(20),
    ComBrokerKey SMALLINT UNSIGNED,
    ComReportKey SMALLINT UNSIGNED,
    PRIMARY KEY (CommercialKey)
);

INSERT INTO Commercial (CommercialKey, CommercialType, ComBrokerKey, ComReportKey) VALUES
(101, 'Office', 301, 401),
(102, 'Office', 302, 402),
(103, 'Office', 303, 403);

CREATE TABLE Residential (
    ResidentialKey TINYINT UNSIGNED,
    ResidentialType VARCHAR(20),
    ResBrokerKey SMALLINT UNSIGNED,
    ResReportKey SMALLINT UNSIGNED,
    PRIMARY KEY (ResidentialKey)
);

INSERT INTO Residential (ResidentialKey, ResidentialType, ResBrokerKey, ResReportKey) VALUES
(201, 'Multifamily', 501, 601),
(202, 'Multifamily', 502, 602),
(203, 'Multifamily', 503, 603);

CREATE TABLE CommercialBroker (
    ComBrokerKey SMALLINT UNSIGNED,
    `Name` VARCHAR(30),
    Phone VARCHAR(15),
    Email VARCHAR(30),
    PRIMARY KEY (ComBrokerKey)
);

INSERT INTO CommercialBroker (ComBrokerKey, `Name`, Phone, Email) VALUES
(301, 'Glen Hampton', '847-910-9447', 'Glen@HamptonRealty.com'),
(302, 'John DeMarco', '954-453-1000', 'John@DeMarcoGroup.com'),
(303, 'Christine Monigle', '215-300-9688', 'Christine@TriStateCR.com');

CREATE TABLE ResidentialBroker (
    ResBrokerKey SMALLINT UNSIGNED,
    `Name` VARCHAR(30),
    Phone VARCHAR(15),
    Email VARCHAR(30),
    PRIMARY KEY (ResBrokerKey)
);

INSERT INTO ResidentialBroker (ResBrokerKey, `Name`, Phone, Email) VALUES
(501, 'Steve Dawson', '855-342-4739', 'SteveDawson@Rex.com'),
(502, 'Alex Segal', '262-384-4552', 'Alex@SegalGoldmanGroup.com'),
(503, 'Matt Karjalahti', '641-260-0672', 'Matt@RemaxPartners.com');

CREATE TABLE CommercialReport (
    ComReportKey SMALLINT UNSIGNED,
    SquareFeet MEDIUMINT UNSIGNED,
    LotSize FLOAT,
    YearBuilt SMALLINT UNSIGNED,
    BuildingClass CHAR(1),
    ComFinancialKey SMALLINT UNSIGNED,
    PRIMARY KEY (ComReportKey)
);

INSERT INTO CommercialReport (ComReportKey, SquareFeet, LotSize, YearBuilt, BuildingClass, ComFinancialKey) VALUES
(401, 13000, 22215.6, 1974, 'B', 701),
(402, 41634, 79714.8, 1972, 'B', 702),
(403, 7546, 25700.4, 2018, 'B', 703);

CREATE TABLE ResidentialReport (
    ResReportKey SMALLINT UNSIGNED,
    SquareFeet MEDIUMINT UNSIGNED,
    LotSize FLOAT,
    YearBuilt SMALLINT UNSIGNED,
    BuildingClass CHAR(1),
    ResFinancialKey SMALLINT UNSIGNED,
    PRIMARY KEY (ResReportKey)
);

INSERT INTO ResidentialReport (ResReportKey, SquareFeet, LotSize, YearBuilt, BuildingClass, ResFinancialKey) VALUES
(601, 3456, 5227.2, 1926, 'C', 801),
(602, 1800, 2571, 1961, 'C', 802),
(603, 2164, 1241, 2014, 'B', 803);

CREATE TABLE CommercialFinancial (
    ComFinancialKey SMALLINT UNSIGNED,
    Price INTEGER UNSIGNED,
    PPF FLOAT,
    Cap FLOAT,
    NOI INTEGER UNSIGNED,
    PRIMARY KEY (ComFinancialKey)
);

INSERT INTO CommercialFinancial (ComFinancialKey, Price, PPF, Cap, NOI) VALUES
(701, 2149000, 165.0, 9.61, 206624),
(702, 11500000, 276.0, 6.77, 778550),
(703, 3611000, 479.0, 5.0, 180550);

CREATE TABLE ResidentialFinancial (
    ResFinancialKey SMALLINT UNSIGNED,
    Price INTEGER UNSIGNED,
    PPF FLOAT,
    Cap FLOAT,
    NOI INTEGER UNSIGNED,
    PRIMARY KEY (ResFinancialKey)
);

INSERT INTO ResidentialFinancial (ResFinancialKey, Price, PPF, Cap, NOI) VALUES
(801, 299000, 86.5, 7.0, 20930),
(802, 290000, 161.1, 3.8, 11020),
(803, 369900, 170.9, 8.4, 31072);

CREATE TABLE tb_user (
  username VARCHAR(50) primary key,
  `password` VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL
);

ALTER TABLE PropertyType
ADD FOREIGN KEY (PropertyKey) REFERENCES Property(PropertyKey),
ADD FOREIGN KEY (CommercialKey) REFERENCES Commercial(CommercialKey),
ADD FOREIGN KEY (ResidentialKey) REFERENCES Residential(ResidentialKey);

ALTER TABLE Commercial
ADD FOREIGN KEY (ComBrokerKey) REFERENCES CommercialBroker(ComBrokerKey),
ADD FOREIGN KEY (ComReportKey) REFERENCES CommercialReport(ComReportKey);

ALTER TABLE Residential
ADD FOREIGN KEY (ResBrokerKey) REFERENCES ResidentialBroker(ResBrokerKey),
ADD FOREIGN KEY (ResReportKey) REFERENCES ResidentialReport(ResReportKey);

ALTER TABLE CommercialReport
ADD FOREIGN KEY (ComFinancialKey) REFERENCES CommercialFinancial(ComFinancialKey);

ALTER TABLE ResidentialReport
ADD FOREIGN KEY (ResFinancialKey) REFERENCES ResidentialFinancial(ResFinancialKey);