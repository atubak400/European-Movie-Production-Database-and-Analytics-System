@startuml MovieProductionERD

!define ENTITY entity
!define STRONG_ENTITY entity
!define WEAK_ENTITY entity

!define ISA isa
!define TOTAL total
!define PARTIAL partial
!define EXCLUDES exclusion
!define OVERLAP overlap

!define LINE end
!define SHAPE database

!define EMBEDDED_START <>
!define EMBEDDED_END <\n> 
!define COMPARTMENT <\n>|

!define ONE "1"
!define MANY "*"

!define OPTION () 

!define BOOLEAN "Y/N"

!define PK [PK]
!define UNIQUE [UQ]
!define FF [FK]

!define AUTO [auto]

!define NOACTION [none]
!define CASCADE [cascade]
!define SETNULL [setnull]
!define SETDEFAULT [setdefault]

!define GRAPHIC_SIZE ["<<20,15>>"]

!define TEMPLATE_PARAMETERS <>
!define TEMPLATE_ARGUMENTS <>

!define PROCESSING "<\nProcessing...\n>"

ENTITY ProductionCompany {
  CompanyName: string PK
  Address: string
  ZIPCode: string
  City: string
  Nation: string
  TypeOfOrganization: string
  NumEmployees: int
  NetValue: decimal
  RegistrationDate: date
  RegistrationOffice: string
  RegistrationFee: decimal
}

ENTITY Employee {
  EmployeeID: int PK
  GivenName: string
  Surname: string
  MiddleName: string
  DateOfBirth: date
  CommencementDate: date
  EmailAddress: string
  CompanyName: string FF
}

ENTITY Film {
  MovieCode: string PK
  Title: string
  FirstReleaseYear: int
}

ENTITY Grant {
  GrantTitle: string PK
  FundingOrganization: string
  MaxMonetaryValue: decimal
  DeadlineForSubmission: date
}

ENTITY Crew {
  Role: string
  RoleDescription: string
  Bonus: decimal
  EmployeeID: int PK
  MovieCode: string PK
}

ENTITY Staff {
  Department: string PK
  Building: string
  MonthlyWage: decimal
  WorkingHours: string
  CompanyName: string FF
}

ENTITY GrantApplication {
  ApplicationDate: date
  DesiredAmount: decimal
  Outcome: string
  GrantTitle: string FF
  CompanyName: string FF
}

ENTITY ContactInformation {
  TelephoneNumber: string
  TelephoneNumberDescription: string
  NationalInsuranceNumber: string
  PassportNumber: string
  EmployeeID: int PK
}

ProductionCompany -|{ Employee
ProductionCompany -|{ Grant
Employee }-|{ Crew
Employee -|{ Staff
Film }-|{ GrantApplication
Grant }-|{ GrantApplication
Crew -|{ Film
Staff -|{ ProductionCompany
ContactInformation }-|{ Employee

@enduml
