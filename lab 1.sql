CREATE DATABASE insurance;
USE insurance;

CREATE TABLE PERSON(
  driver_id VARCHAR(20) PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(100)
);

CREATE TABLE CAR(
  reg_num VARCHAR(20) PRIMARY KEY,
  model VARCHAR(50),
  year INT
);

CREATE TABLE ACCIDENT(
  report_num INT PRIMARY KEY,
  accident_date DATE,
  location VARCHAR(50)
);

CREATE TABLE OWNS(
  driver_id VARCHAR(20),
  reg_num VARCHAR(20),
  PRIMARY KEY(driver_id, reg_num),
  FOREIGN KEY(driver_id) REFERENCES PERSON(driver_id),
  FOREIGN KEY(reg_num) REFERENCES CAR(reg_num)
);

CREATE TABLE PARTICIPATED(
  driver_id VARCHAR(20),
  reg_num VARCHAR(20),
  report_num INT,
  damage_amount INT,
  PRIMARY KEY(driver_id, reg_num, report_num),
  FOREIGN KEY(driver_id) REFERENCES PERSON(driver_id),
  FOREIGN KEY(reg_num) REFERENCES CAR(reg_num),
  FOREIGN KEY(report_num) REFERENCES ACCIDENT(report_num)
);
UPDATE PARTICIPATED
SET damage_amount = 25000
WHERE reg_num='KA053408' AND report_num=12;

SELECT COUNT(DISTINCT driver_id)
FROM PARTICIPATED P, ACCIDENT A
WHERE P.report_num = A.report_num AND YEAR(accident_date)=2008;

INSERT INTO ACCIDENT VALUES(16,'2008-01-07','Bomala');

SELECT accident_date, location FROM ACCIDENT;

SELECT driver_id FROM PARTICIPATED WHERE damage_amount>=25000;
