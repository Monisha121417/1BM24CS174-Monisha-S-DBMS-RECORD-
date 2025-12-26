SELECT DISTINCT customername
FROM Depositer D, BankAccount B, Branch R
WHERE D.accno=B.accno AND B.branch_name=R.branch_name AND R.branch_city='Delhi'
GROUP BY customername
HAVING COUNT(DISTINCT R.branch_name) = 
(SELECT COUNT(*) FROM Branch WHERE branch_city='Delhi');

SELECT customername FROM Loan
WHERE customername NOT IN (SELECT customername FROM Depositer);

SELECT branch_name FROM Branch
WHERE assets > (SELECT MAX(assets) FROM Branch WHERE branch_city='Bangalore');

UPDATE BankAccount SET balance = balance * 1.05;
