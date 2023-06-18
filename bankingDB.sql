CREATE DATABASE Dbo_OnlineBankingSystem
use Dbo_OnlineBankingSystem

create table SecurityQuestion
(
    SecurityQuestionId int PRIMARY KEY IDENTITY(1,1),
	SecurityQuestionName VARCHAR(50),
)
INSERT INTO SecurityQuestion VALUES ('Ýlkokul eðitimini aldýðýn okulun adý nedir?');
INSERT INTO SecurityQuestion VALUES ('Annenin kýzlýk soyadý nedir?');
INSERT INTO SecurityQuestion VALUES ('Favori Aktörünüzün ismi nedir?');


create table Account
(
    AccountId int PRIMARY KEY IDENTITY(1,1),
	AccountNumber VARCHAR(30),
	AccountType VARCHAR(20),
	UserName VARCHAR(30),
	Gender VARCHAR(10),
	Email VARCHAR(50),
	Address VARCHAR(MAX),
	SecurityQuestionId int FOREIGN KEY REFERENCES SecurityQuestion(SecurityQuestionId),
	Answer VARCHAR(50),
	Amount int,
	Password VARCHAR(30)
)

create table [Transaction]
(
    TransactionId int PRIMARY KEY IDENTITY(1,1),
	SenderAccountId int FOREIGN KEY REFERENCES Account(AccountId),
	ReceiverAccountId int FOREIGN KEY REFERENCES Account(AccountId),
	MobileNumber VARCHAR(30),
	Amount int,
	TransactionType VARCHAR(10),
	Remarks VARCHAR(30)
)