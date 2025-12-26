SELECT pname FROM Parts P WHERE EXISTS (SELECT * FROM Catalog C WHERE P.pid=C.pid);

SELECT sname FROM Supplier S
WHERE NOT EXISTS (
  SELECT * FROM Parts P
  WHERE NOT EXISTS (
    SELECT * FROM Catalog C
    WHERE C.sid=S.sid AND C.pid=P.pid
  )
);

CREATE VIEW supplier_parts AS
SELECT sid, COUNT(pid) FROM Catalog GROUP BY sid;
CREATE TRIGGER check_cost
BEFORE INSERT ON Catalog
FOR EACH ROW
IF NEW.cost < 1 THEN SET NEW.cost = 1; END IF;
