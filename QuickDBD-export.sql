-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `ProductionCompany` (
    `CompanyName` string  NOT NULL ,
    `Address` string  NOT NULL ,
    `ZIPCode` string  NOT NULL ,
    `City` string  NOT NULL ,
    `Nation` string  NOT NULL ,
    `TypeOfOrganization` string  NOT NULL ,
    `NumEmployees` int  NOT NULL ,
    `NetValue` decimal  NOT NULL ,
    `RegistrationDate` date  NOT NULL ,
    `RegistrationOffice` string  NOT NULL ,
    `RegistrationFee` decimal  NOT NULL ,
    PRIMARY KEY (
        `CompanyName`
    )
);

CREATE TABLE `Employee` (
    `EmployeeID` int  NOT NULL ,
    `GivenName` string  NOT NULL ,
    `Surname` string  NOT NULL ,
    `MiddleName` string  NOT NULL ,
    `DateOfBirth` date  NOT NULL ,
    `CommencementDate` date  NOT NULL ,
    `EmailAddress` string  NOT NULL ,
    `CompanyName` string  NOT NULL ,
    PRIMARY KEY (
        `EmployeeID`
    )
);

CREATE TABLE `Film` (
    `MovieCode` string  NOT NULL ,
    `Title` string  NOT NULL ,
    `FirstReleaseYear` int  NOT NULL ,
    PRIMARY KEY (
        `MovieCode`
    )
);

CREATE TABLE `Grant` (
    `GrantTitle` string  NOT NULL ,
    `FundingOrganization` string  NOT NULL ,
    `MaxMonetaryValue` decimal  NOT NULL ,
    `DeadlineForSubmission` date  NOT NULL ,
    PRIMARY KEY (
        `GrantTitle`
    )
);

CREATE TABLE `Crew` (
    `Role` string  NOT NULL ,
    `RoleDescription` string  NOT NULL ,
    `Bonus` decimal  NOT NULL ,
    `EmployeeID` int  NOT NULL ,
    `MovieCode` string  NOT NULL 
);

CREATE TABLE `Staff` (
    `Department` string  NOT NULL ,
    `Building` string  NOT NULL ,
    `MonthlyWage` decimal  NOT NULL ,
    `WorkingHours` string  NOT NULL ,
    `CompanyName` string  NOT NULL 
);

CREATE TABLE `GrantApplication` (
    `ApplicationDate` date  NOT NULL ,
    `DesiredAmount` decimal  NOT NULL ,
    `Outcome` string  NOT NULL ,
    `GrantTitle` string  NOT NULL ,
    `CompanyName` string  NOT NULL 
);

CREATE TABLE `ContactInformation` (
    `TelephoneNumber` string  NOT NULL ,
    `TelephoneNumberDescription` string  NOT NULL ,
    `NationalInsuranceNumber` string  NOT NULL ,
    `PassportNumber` string  NOT NULL ,
    `EmployeeID` int  NOT NULL 
);

ALTER TABLE `Employee` ADD CONSTRAINT `fk_Employee_CompanyName` FOREIGN KEY(`CompanyName`)
REFERENCES `ProductionCompany` (`CompanyName`);

ALTER TABLE `Crew` ADD CONSTRAINT `fk_Crew_EmployeeID` FOREIGN KEY(`EmployeeID`)
REFERENCES `Employee` (`EmployeeID`);

ALTER TABLE `Crew` ADD CONSTRAINT `fk_Crew_MovieCode` FOREIGN KEY(`MovieCode`)
REFERENCES `Film` (`MovieCode`);

ALTER TABLE `Staff` ADD CONSTRAINT `fk_Staff_CompanyName` FOREIGN KEY(`CompanyName`)
REFERENCES `ProductionCompany` (`CompanyName`);

ALTER TABLE `GrantApplication` ADD CONSTRAINT `fk_GrantApplication_GrantTitle` FOREIGN KEY(`GrantTitle`)
REFERENCES `Grant` (`GrantTitle`);

ALTER TABLE `GrantApplication` ADD CONSTRAINT `fk_GrantApplication_CompanyName` FOREIGN KEY(`CompanyName`)
REFERENCES `ProductionCompany` (`CompanyName`);

ALTER TABLE `ContactInformation` ADD CONSTRAINT `fk_ContactInformation_EmployeeID` FOREIGN KEY(`EmployeeID`)
REFERENCES `Employee` (`EmployeeID`);

