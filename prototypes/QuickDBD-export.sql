-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Product` (
    `ProductID` int  NOT NULL ,
    `ProductName` string  NOT NULL ,
    `Description` string  NOT NULL ,
    `Price` decimal  NOT NULL ,
    `QuantityInStock` int  NOT NULL ,
    `SupplierID` int  NOT NULL ,
    PRIMARY KEY (
        `ProductID`,`SupplierID`
    )
);

CREATE TABLE `Supplier` (
    `SupplierID` int  NOT NULL ,
    `CompanyName` string  NOT NULL ,
    `ContactName` string  NOT NULL ,
    `ContactTitle` string  NOT NULL ,
    `Phone` string  NOT NULL ,
    `Email` string  NOT NULL ,
    PRIMARY KEY (
        `SupplierID`
    )
);

CREATE TABLE `Customer` (
    `CustomerID` int  NOT NULL ,
    `FirstName` string  NOT NULL ,
    `LastName` string  NOT NULL ,
    `Address` string  NOT NULL ,
    `City` string  NOT NULL ,
    `PostalCode` string  NOT NULL ,
    `Country` string  NOT NULL ,
    `Phone` string  NOT NULL ,
    `Email` string  NOT NULL ,
    PRIMARY KEY (
        `CustomerID`
    )
);

CREATE TABLE `Order` (
    `OrderID` int  NOT NULL ,
    `CustomerID` int  NOT NULL ,
    `OrderDate` date  NOT NULL ,
    `ShippedDate` date  NOT NULL ,
    `ShipAddress` string  NOT NULL ,
    `ShipCity` string  NOT NULL ,
    `ShipPostalCode` string  NOT NULL ,
    `ShipCountry` string  NOT NULL ,
    PRIMARY KEY (
        `OrderID`
    )
);

CREATE TABLE `OrderDetail` (
    `OrderDetailID` int  NOT NULL ,
    `OrderID` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `Quantity` int  NOT NULL ,
    `UnitPrice` decimal  NOT NULL ,
    `Discount` decimal  NOT NULL ,
    PRIMARY KEY (
        `OrderDetailID`
    )
);

ALTER TABLE `Product` ADD CONSTRAINT `fk_Product_SupplierID` FOREIGN KEY(`SupplierID`)
REFERENCES `Supplier` (`SupplierID`);

ALTER TABLE `Order` ADD CONSTRAINT `fk_Order_CustomerID` FOREIGN KEY(`CustomerID`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `OrderDetail` ADD CONSTRAINT `fk_OrderDetail_OrderID` FOREIGN KEY(`OrderID`)
REFERENCES `Order` (`OrderID`);

ALTER TABLE `OrderDetail` ADD CONSTRAINT `fk_OrderDetail_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `Product` (`ProductID`);

