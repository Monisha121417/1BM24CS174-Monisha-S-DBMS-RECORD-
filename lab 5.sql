
CREATE DATABASE employee_db;
USE employee_db;

CREATE TABLE Dept (
  deptno INT PRIMARY KEY,
  dname VARCHAR(30),
  dloc VARCHAR(30)
);

CREATE TABLE Employee (
  empno INT PRIMARY KEY,
  ename VARCHAR(30),
  mgr_no INT,
  hiredate DATE,
  sal INT,
  deptno INT,
  FOREIGN KEY (deptno) REFERENCES Dept(deptno)
);

CREATE TABLE Project (
  pno INT PRIMARY KEY,
  pname VARCHAR(30),
  ploc VARCHAR(30)
);

CREATE TABLE Assigned_To (
  empno INT,
  pno INT,
  job_role VARCHAR(30),
  PRIMARY KEY(empno,pno),
  FOREIGN KEY(empno) REFERENCES Employee(empno),
  FOREIGN KEY(pno) REFERENCES Project(pno)
);

CREATE TABLE Incentives (
  empno INT,
  incentive_date DATE,
  incentive_amount INT,
  FOREIGN KEY(empno) REFERENCES Employee(empno)
);


INSERT INTO Dept VALUES
(10,'HR','Bengaluru'),
(20,'IT','Hyderabad'),
(30,'Finance','Mysuru');

INSERT INTO Employee VALUES
(1,'Asha',NULL,'2020-01-10',50000,10),
(2,'Ravi',1,'2021-03-15',40000,20),
(3,'Neha',1,'2022-06-20',45000,30),
(4,'John',2,'2023-01-05',35000,20);

INSERT INTO Project VALUES
(101,'Payroll','Bengaluru'),
(102,'ERP','Hyderabad'),
(103,'Audit','Mysuru');

INSERT INTO Assigned_To VALUES
(1,101,'Manager'),
(2,102,'Developer'),
(3,103,'Analyst'),
(4,102,'Tester');

INSERT INTO Incentives VALUES
(1,'2019-01-10',5000),
(2,'2019-01-15',3000);


SELECT DISTINCT E.empno
FROM Employee E
JOIN Assigned_To A ON E.empno=A.empno
JOIN Project P ON A.pno=P.pno
WHERE P.ploc IN ('Bengaluru','Hyderabad','Mysuru');


SELECT empno FROM Employee
WHERE empno NOT IN (SELECT empno FROM Incentives);


SELECT E.ename, E.empno, D.dname, A.job_role, D.dloc, P.ploc
FROM Employee E
JOIN Dept D ON E.deptno=D.deptno
JOIN Assigned_To A ON E.empno=A.empno
JOIN Project P ON A.pno=P.pno
WHERE D.dloc=P.ploc;
