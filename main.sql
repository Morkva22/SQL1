USE master

-- Check if the database exists, and drop it if necessary
IF DB_ID('HospitalDB') IS NOT NULL
    DROP DATABASE HospitalDB

-- create a new database
CREATE DATABASE HospitalDB
USE HospitalDB
GO
-- create a table Departments
CREATE TABLE Departments
(
    ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    Building  INT NOT NULL,
    Financing MONEY NOT NULL DEFAULT (0),
    Name NVARCHAR(100) NOT NULL UNIQUE,

    CONSTRAINT CHK_Departments_Building CHECK (Building BETWEEN 1 AND 5),
    CONSTRAINT CHK_Departments_Financing CHECK (Financing >= 0),
    CONSTRAINT CHK_Departments_Name CHECK (Name <> '')
)
-- create a table Diseases
CREATE TABLE Diseases
(
    ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Severity INT NOT NULL DEFAULT (1),

    CONSTRAINT CHK_Diseases_Severity CHECK (Severity >= 1),
    CONSTRAINT CHK_Diseases_Name CHECK (Name <> '')
)
-- create a table Doctors
    CREATE TABLE Doctors
    (
    ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    Name nvarchar(MAX) NOT NULL,
    Phone char(10) NOT NULL,
    Salary MONEY NOT NULL DEFAULT (0),
    Surname nvarchar(MAX) NOT NULL,

    CONSTRAINT CHK_Doctors_Name CHECK (Name <> ''),
    CONSTRAINT CHK_Doctors_Salary CHECK (Salary >= 0),
    CONSTRAINT CHK_Doctors_Surname CHECK (Surname <> ''),
    )
--create a table Examinations
CREATE TABLE Examinations
(
    ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    DayOfWeek INT NOT NULL,
    EndTime TIME NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE,
    StartTime TIME NOT NULL,

    CONSTRAINT CHK_Examinations_Name CHECK (Name <> ''),
    CONSTRAINT CHK_Examinations_DayOfWeek CHECK (DayOfWeek BETWEEN 1 AND 7),
    CONSTRAINT CHK_Examinations_EndTime CHECK (EndTime > StartTime),
    CONSTRAINT CHK_Examinations_StartTime CHECK (CAST(StartTime AS TIME) BETWEEN '08:00' AND '18:00')
)