
CREATE DATABASE supplier_db;
USE supplier_db;

CREATE TABLE Supplier (
  sid INT PRIMARY KEY,
  sname VARCHAR(30),
  city VARCHAR(30)
);

CREATE TABLE Parts (
  pid INT PRIMARY KEY,
  pname VARCHAR(30),
  color VARCHAR(20)
);

CREATE TABLE Catalog (
  sid INT,
  pid INT,
  cost INT,
  PRIMARY KEY(sid,pid),
  FOREIGN KEY(sid) REFERENCES Supplier(sid),
  FOREIGN KEY(pid) REFERENCES Parts(pid)
);

INSERT INTO Supplier VALUES
(1,'Acme Widget','Bengaluru'),
(2,'Global Parts','Delhi'),
(3,'FastSupply','Mumbai');

INSERT INTO Parts VALUES
(101,'Bolt','Red'),
(102,'Nut','Blue'),
(103,'Screw','Red');

INSERT INTO Catalog VALUES
(1,101,20),
(1,102,30),
(2,101,25),
(2,103,35),
(3,102,15),
(3,103,40);


SELECT pname FROM Parts P
WHERE EXISTS (SELECT * FROM Catalog C WHERE C.pid=P.pid);


SELECT sname FROM Supplier S
WHERE NOT EXISTS (
  SELECT * FROM Parts P
  WHERE NOT EXISTS (
    SELECT * FROM Catalog C
    WHERE C.sid=S.sid AND C.pid=P.pid
  )
);

SELECT sname FROM Supplier S
WHERE NOT EXISTS (
  SELECT * FROM Parts P
  WHERE P.color='Red' AND NOT EXISTS (
    SELECT * FROM Catalog C
    WHERE C.sid=S.sid AND C.pid=P.pid
  )
);


SELECT pname FROM Parts P
WHERE EXISTS (
  SELECT * FROM Catalog C JOIN Supplier S ON C.sid=S.sid
  WHERE S.sname='Acme Widget' AND C.pid=P.pid
)
AND NOT EXISTS (
  SELECT * FROM Catalog C JOIN Supplier S ON C.sid=S.sid
  WHERE S.sname<>'Acme Widget' AND C.pid=P.pid
);

SELECT DISTINCT S.sid
FROM Supplier S, Catalog C1
WHERE S.sid=C1.sid AND C1.cost >
(
  SELECT AVG(C2.cost) FROM Catalog C2 WHERE C2.pid=C1.pid
);

SELECT P.pname, S.sname
FROM Parts P, Supplier S, Catalog C
WHERE P.pid=C.pid AND S.sid=C.sid
AND C.cost = (
  SELECT MAX(cost) FROM Catalog WHERE pid=P.pid
);
