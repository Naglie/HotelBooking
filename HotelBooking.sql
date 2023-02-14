CREATE DATABASE IF NOT EXISTS hotelBooking
USE hotelBooking
GO

create table Hotel (
    HotelID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Description VARCHAR(255) null,
    CityID INT NOT NULL,
    CONSTRAINT FK_HotelCity FOREIGN KEY (CityID)
    REFERENCES City (CityID),
    Stars TINYINT NOT NULL
)
create table Country (
    CountryID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
)
create table City (
    CityID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    CountryID INT NOT NULL,
    CONSTRAINT FK_CityCountry FOREIGN KEY (CountryID) 
    REFERENCES Country (CountryID)
)
create table HotelRoom (
    ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    HotelID INT NOT NULL,
    CONSTRAINT FK_RoomHotel FOREIGN KEY (HotelID)
    REFERENCES Hotel (HotelID),
    RoomID INT NOT NULL,
    CONSTRAINT FK_HotelRoom FOREIGN KEY (RoomID)
    REFERENCES Room (RoomID)
)
create table Room (
    RoomID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Number INT NOT NULL,
    Sleeps INT NOT NULL,
    Price DOUBLE NOT NULL,
    Type VARCHAR(20) NOT NULL,
    Status ENUM('OCUPPIED', 'NOT OCUPPIED')
)
create table Client (
    ClientID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone INT NULL,
    CountryID INT NOT NULL,
    CONSTRAINT FK_ClientCountry FOREIGN KEY (CountryID) 
    REFERENCES Country (CountryID)
)
create table RoomReservation (
    ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ReservationID INT NOT NULL,
    CONSTRAINT FK_ReservationRoom FOREIGN KEY (ReservationID)
    REFERENCES Reservation (ReservationID),
    RoomID INT NOT NULL,
    CONSTRAINT FK_RoomReservation FOREIGN KEY (RoomID)
    REFERENCES Room (RoomID)
)
create table Reservation (
    ReservationID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Price DOUBLE NOT NULL,
    PurchaseDate DATETIME NOT NULL,
    CheckInDate DATETIME NOT NULL,
    CheckOutDate DATETIME NOT NULL,
    Amount INT DEFAULT 1,
    ClientID INT NOT NULL,
    CONSTRAINT FK_ClientReservation FOREIGN KEY (ClientID)
    REFERENCES Client (ClientID)
)
create table HotelComment (
    ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    HotelID INT NOT NULL,
    CONSTRAINT FK_HotelComment FOREIGN KEY (HotelID)
    REFERENCES Hotel (HotelID),
    CommentID INT NOT NULL,
    CONSTRAINT FK_CommentHotel FOREIGN KEY (CommentID)
    REFERENCES Comment (CommentID)
)
create table Comment (
    CommentID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ClientID INT NOT NULL,
    CONSTRAINT FK_ClientComment FOREIGN KEY (ClientID)
    REFERENCES Client (ClientID),
    Comment VARCHAR(255) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL
)