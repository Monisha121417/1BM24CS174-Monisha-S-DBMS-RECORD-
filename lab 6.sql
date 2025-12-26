SELECT E.empno
FROM Employee E, Assigned_to A, Project P
WHERE E.empno=A.empno AND A.pno=P.pno
AND P.ploc IN ('Bengaluru','Hyderabad','Mysuru');

SELECT empno FROM Employee
WHERE empno NOT IN (SELECT empno FROM Incentives);

SELECT E.ename, E.empno, D.dname, A.job_role, D.dloc, P.ploc
FROM Employee E, Dept D, Assigned_to A, Project P
WHERE E.deptno=D.deptno AND E.empno=A.empno AND A.pno=P.pno AND D.dloc=P.ploc;
