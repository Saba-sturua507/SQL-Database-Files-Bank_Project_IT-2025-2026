CREATE DATABASE BankProject

CREATE TABLE Users
(
 UserID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
 Username NVARCHAR(20) NOT NULL UNIQUE ,
 FullName NVARCHAR(50) NOT NULL,
 Email NVARCHAR(50) NOT NULL UNIQUE,
 PhoneNumber NVARCHAR(20) NOT NULL,
 PasswordHash nvarchar(256) NOT NULL,
 BirthDate DATE NOT NULL ,
 Address NVARCHAR(50),
 JoinedDate DATE,
 Status NVARCHAR(50) NOT NULL,

 CONSTRAINT Users_BirthDate CHECK (BirthDate <= GETDATE())
)

CREATE TABLE Bank
(
 BankID INT IDENTITY(1,1)  PRIMARY KEY,
 BankName NVARCHAR(20) NOT NULL ,
 Country NVARCHAR(50) NOT NULL ,
 SwiftCode VARCHAR(11) NOT NULL UNIQUE,
 SupportEmail NVARCHAR(50) UNIQUE,

 CONSTRAINT Bank_SwiftCode CHECK (LEN(SwiftCode) IN (8,11))
)

CREATE TABLE BankAccount
( 
 AccountID INT IDENTITY(1,1) PRIMARY KEY,
 Balance DECIMAL NOT NULL,
 UserID INT NOT NULL,
 BankID INT NOT NULL,
 AccountType NVARCHAR(50) NOT NULL,
 OpenDate DATE NOT NULL,
 Status NVARCHAR(30),

 CONSTRAINT FK_BankAccount_UserID 
 FOREIGN KEY (UserID) REFERENCES Users(UserID),

 CONSTRAINT FK_BankAccount_BankID
 FOREIGN KEY (BankID) REFERENCES Bank(BankID),
)


CREATE TABLE CashWallet
( 
  CashWalletID INT IDENTITY(1,1) PRIMARY KEY,
  UserID INT NOT NULL,
  AccountID INT NOT NULL,
  Amount DECIMAL NOT NULL,
  Currency NVARCHAR(30) ,
  Status NVARCHAR(50), 

  CONSTRAINT FK_CashWallet_UserID
  FOREIGN KEY (UserID) REFERENCES Users(UserID),

  CONSTRAINT FK_CashWallet_BankAccount
  FOREIGN KEY (AccountID) REFERENCES BankAccount(AccountID),
)



CREATE TABLE Cards
(
  CardID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  AccountID INT NOT NULL,
  CardNumberForBank NVARCHAR(19) NOT NULL UNIQUE,
  CVV INT NOT NULL,
  ExpireMonth INT NOT NULL,
  ExpireYear INT NOT NULL,
  IssuedDate DATE NOT NULL,
  Currency NVARCHAR(3),
  CardType NVARCHAR(30),
  CardBalance DECIMAL NOT NULL,
  Status NVARCHAR(50) ,

  CONSTRAINT FK_Cards_AccountID
  FOREIGN KEY (AccountID) REFERENCES BankAccount(AccountID),

  CONSTRAINT Cards_CardNumberForBank CHECK (LEN(CardNumberForBank) BETWEEN 12 AND 19),

  CONSTRAINT Cards_CVV CHECK (CVV BETWEEN 100 AND 999),

  CONSTRAINT Cards_IssuedDate CHECK (IssuedDate <= CAST(GETDATE() AS DATE)),
)


CREATE TABLE TransactionsCards
(
   TransactionID INT IDENTITY(1,1) PRIMARY KEY,
   FromWhereID INT NOT NULL,
   ToWhereID INT NOT NULL,
   Amount DECIMAL NOT NULL,
   Currency NVARCHAR(30) NOT NULL,
   Descritpion NVARCHAR(50) NOT NULL,
   ReferenceNumber NVARCHAR(19) NOT NULL UNIQUE,
WasDoneAt DATE DEFAULT GETDATE(),
   Status NVARCHAR(50),

   CONSTRAINT TransactionsCards_ReferenceNumber CHECK(LEN(ReferenceNumber) BETWEEN 16 AND 19),

   CONSTRAINT FK_TransactionsCards_FromCard
   FOREIGN KEY (FromWhereID) REFERENCES Cards(CardID),

   CONSTRAINT FK_TransactionsCards_ToCard
   FOREIGN KEY (ToWhereID) REFERENCES Cards(CardID),
)


CREATE TABLE PiggyBank
(
  PiggyBankID INT IDENTITY(1,1) PRIMARY KEY,
  AccountID INT,
  Name NVARCHAR(50) NOT NULL,
  TargetAmount DECIMAL NOT NULL,
  SavedAmount DECIMAL NOT NULL,
  CreatedAt DATE , 
  Status NVARCHAR(50),

  CONSTRAINT FK_PiggyBank_AccountID
  FOREIGN KEY (AccountID) REFERENCES BankAccount(AccountID),
)

CREATE TABLE Loans
(
  LoanID INT IDENTITY(1,1) PRIMARY KEY,
  UserID INT,
  AccountID INT,
  BorrowdAmount DECIMAL NOT NULL,
  RemainingAmount DECIMAL NOT NULL,
  InterestRate DECIMAL,
  MonthAmountTotal INT NOT NULL,
  MonthlyPayment DECIMAL,
  StartDate DATE,
  EndDate DATE,
  Status NVARCHAR(50),

  CONSTRAINT FK_Loans_UserID
  FOREIGN KEY (UserID) REFERENCES Users(UserID),

  CONSTRAINT FK_Loans_AccountID
  FOREIGN KEY (AccountID) REFERENCES BankAccount(AccountID),
)


CREATE TABLE LoanPayment
(
  PaymentID INT IDENTITY(1,1) PRIMARY KEY ,
  LoanID INT ,
  TotalAmount DECIMAL NOT NULL,
  LoanPart DECIMAL NOT NULL,
  InterestPay DECIMAL NOT NULL,
  PaymentDate DATE,
  DueDate DATE,
  Status NVARCHAR(50),

  CONSTRAINT FK_LoanPayment_LoanID
  FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
)

CREATE TABLE Notifications
(
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Message NVARCHAR(255) NOT NULL,
    IsRead BIT NOT NULL DEFAULT 0,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    NotificationType NVARCHAR(50),

    CONSTRAINT FK_Notifications_UserID
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
)