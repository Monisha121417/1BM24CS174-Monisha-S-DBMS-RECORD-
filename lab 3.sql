CREATE DATABASE bank;
USE bank;

CREATE TABLE Branch(
  branch_name VARCHAR(30) PRIMARY KEY,
  branch_city VARCHAR(20),
  assets INT
);

CREATE TABLE BankAccount(
  accno INT PRIMARY KEY,
  branch_name VARCHAR(30),
  balance INT,
  FOREIGN KEY(branch_name) REFERENCES Branch(branch_name)
);

CREATE TABLE BankCustomer(
  customername VARCHAR(20) PRIMARY KEY,
  customer_street VARCHAR(30),
  customercity VARCHAR(20)
);

CREATE TABLE Depositer(
  customername VARCHAR(20),
  accno INT,
  PRIMARY KEY(customername, accno),
  FOREIGN KEY(customername) REFERENCES BankCustomer(customername),
  FOREIGN KEY(accno) REFERENCES BankAccount(accno)
);

CREATE TABLE Loan(
  loan_number INT PRIMARY KEY,
  branch_name VARCHAR(30),
  amount INT,
  FOREIGN KEY(branch_name) REFERENCES Branch(branch_name)
);
SELECT branch_name, assets/100000 AS 'assets in lakhs' FROM Branch;

SELECT D.customername
FROM Depositer D, BankAccount B
WHERE D.accno=B.accno AND B.branch_name='SBI_ResidencyRoad'
GROUP BY D.customername HAVING COUNT(D.accno)>=2;

CREATE VIEW sum_of_loan AS
SELECT branch_name, SUM(amount) FROM Loan GROUP BY branch_name;
