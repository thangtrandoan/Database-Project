CREATE DATABASE IF NOT EXISTS QuanLyDatVeTau;
USE QuanLyDatVeTau;

-- Bảng Tài Khoản
CREATE TABLE IF NOT EXISTS Account (
    Username varchar(15) NOT NULL,
    Password varchar(20) NOT NULL,
    Email_Id varchar(35) NOT NULL,
    Address varchar(50) DEFAULT NULL,
    PRIMARY KEY (Username)
);

-- Bảng Liên Hệ
CREATE TABLE IF NOT EXISTS Contact (
    Username varchar(15) NOT NULL DEFAULT '',
    Phone_No char(10) NOT NULL DEFAULT '',
    PRIMARY KEY (Username, Phone_No)
);

-- Bảng Tàu
CREATE TABLE IF NOT EXISTS Train (
    Train_No int NOT NULL DEFAULT '0',
    Name varchar(25) NOT NULL,
    Seat_Sleeper int(4) NOT NULL,
    Seat_First_Class_AC int(4) NOT NULL,
    Seat_Second_Class_AC int(4) NOT NULL,
    Seat_Third_Class_AC int(4) NOT NULL,
    Wifi char(6) NOT NULL,
    Food char(6) NOT NULL,
    Run_On_Sunday char(6) NOT NULL,
    Run_On_Monday char(6) NOT NULL,
    Run_On_Tuesday char(6) NOT NULL,
    Run_On_Wednesday char(6) NOT NULL,
    Run_On_Thursday char(6) NOT NULL,
    Run_On_Friday char(6) NOT NULL,
    Run_On_Saturday char(6) NOT NULL,
    PRIMARY KEY (Train_No)
);

-- Bảng Đặt Vé
CREATE TABLE IF NOT EXISTS Ticket (
    Ticket_No int NOT NULL AUTO_INCREMENT,
    Coach varchar(2) NOT NULL,
    Seat_No char(2) NOT NULL,
    Train_No int NOT NULL,
    Date_of_Journey date NOT NULL,
    Username varchar(15) NOT NULL,
    PRIMARY KEY (Ticket_No)
);

-- Bảng Hành Khách
CREATE TABLE IF NOT EXISTS Passenger (
    Passenger_Id int NOT NULL AUTO_INCREMENT,
    First_Name varchar(20) NOT NULL,
    Last_Name varchar(20) NOT NULL,
    Gender char(10) NOT NULL,
    Phone_No char(10) DEFAULT NULL,
    Ticket_No int NOT NULL,
    Age int NOT NULL,
    Class varchar(20) NOT NULL,
    PRIMARY KEY (Passenger_Id)
);

-- Bảng Ga Tàu
CREATE TABLE IF NOT EXISTS Station (
    Station_Code char(5) NOT NULL DEFAULT '',
    Station_Name varchar(25) NOT NULL,
    PRIMARY KEY (Station_Code)
);

-- Bảng Điểm Dừng
CREATE TABLE IF NOT EXISTS Stoppage (
    Train_No int NOT NULL DEFAULT '0',
    Station_Code char(5) NOT NULL DEFAULT '',
    Arrival_Time time DEFAULT NULL,
    Departure_Time time DEFAULT NULL,
    PRIMARY KEY (Train_No, Station_Code)
);
