-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE ProductionCompany (
    CompanyName Text NOT NULL,
    Address Text NOT NULL,
    ZIPCode Text NOT NULL,
    City Text NOT NULL,
    Nation Text NOT NULL,
    TypeOfOrganization Text NOT NULL,
    NumEmployees Number NOT NULL,
    NetValue Currency NOT NULL,
    RegistrationDate Date NOT NULL,
    RegistrationOffice Text NOT NULL,
    RegistrationFee Currency NOT NULL,
    PRIMARY KEY (CompanyName)
);

CREATE TABLE Employee (
    EmployeeID AutoNumber PRIMARY KEY,
    GivenName Text NOT NULL,
    Surname Text NOT NULL,
    MiddleName Text NOT NULL,
    DateOfBirth Date NOT NULL,
    CommencementDate Date NOT NULL,
    EmailAddress Text NOT NULL,
    CompanyName Text NOT NULL,
    FOREIGN KEY (CompanyName) REFERENCES ProductionCompany(CompanyName)
);

CREATE TABLE Film (
    MovieCode Text NOT NULL,
    Title Text NOT NULL,
    FirstReleaseYear Number NOT NULL,
    PRIMARY KEY (MovieCode)
);

CREATE TABLE Grant (
    GrantTitle Text NOT NULL,
    FundingOrganization Text NOT NULL,
    MaxMonetaryValue Currency NOT NULL,
    DeadlineForSubmission Date NOT NULL,
    PRIMARY KEY (GrantTitle)
);

CREATE TABLE Crew (
    Role Text NOT NULL,
    RoleDescription Text NOT NULL,
    Bonus Currency NOT NULL,
    EmployeeID AutoNumber NOT NULL,
    MovieCode Text NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (MovieCode) REFERENCES Film(MovieCode)
);

CREATE TABLE Staff (
    Department Text NOT NULL,
    Building Text NOT NULL,
    MonthlyWage Currency NOT NULL,
    WorkingHours Text NOT NULL,
    CompanyName Text NOT NULL,
    FOREIGN KEY (CompanyName) REFERENCES ProductionCompany(CompanyName)
);

CREATE TABLE GrantApplication (
    ApplicationDate Date NOT NULL,
    DesiredAmount Currency NOT NULL,
    Outcome Text NOT NULL,
    GrantTitle Text NOT NULL,
    CompanyName Text NOT NULL,
    FOREIGN KEY (GrantTitle) REFERENCES Grant(GrantTitle),
    FOREIGN KEY (CompanyName) REFERENCES ProductionCompany(CompanyName)
);

CREATE TABLE ContactInformation (
    TelephoneNumber Text NOT NULL,
    TelephoneNumberDescription Text NOT NULL,
    NationalInsuranceNumber Text NOT NULL,
    PassportNumber Text NOT NULL,
    EmployeeID AutoNumber NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

