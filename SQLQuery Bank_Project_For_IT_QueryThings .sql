CREATE PROCEDURE sp_GetAllUsersWithBalances 
AS
    SELECT u.FullName, u.Email, ba.Balance
    FROM Users u
    INNER JOIN BankAccount ba ON u.UserID = ba.UserID
    ORDER BY FullName ASC;
GO


--პროცედურით
EXEC sp_GetAllUsersWithBalances;


-- პროცედურის გარეშე
SELECT u.FullName,u.Email,ba.Balance
FROM Users u
INNER JOIN BankAccount ba ON u.UserID=ba.UserID
ORDER BY FullName ASC
---------------------------

SELECT u.FullName,u.Email,ba.Balance
FROM Users u
INNER JOIN BankAccount ba ON u.UserID=ba.UserID
WHERE Balance > 3000
ORDER BY FullName ASC
------------------------------

SELECT u.FullName,u.Email,ba.Balance
FROM Users u
INNER JOIN BankAccount ba ON u.UserID=ba.UserID
WHERE FullName LIKE 'sa%'
ORDER BY FullName ASC


SELECT u.FullName, l.BorrowdAmount, l.RemainingAmount, l.Status
FROM Users u
LEFT JOIN Loans l ON u.UserID = l.UserID
ORDER BY RemainingAmount  DESC


SELECT u.Username,u.PhoneNumber,ba.Balance,ba.AccountType,b.Country,c.Status
FROM USERS u
JOIN BankAccount ba ON u.UserID=ba.UserID
JOIN Bank b ON ba.BankID=b.BankID
JOIN Cards c ON ba.AccountID=c.AccountID
ORDER BY Username DESC


SELECT UserID,
       COUNT(AccountID) AS TotalAccounts,  
       SUM(Balance) AS WholeBalance,
       AVG(Balance) AS AverageBalance
FROM  BankAccount
GROUP BY UserID



SELECT UserID,
       COUNT(LoanID) AS LoansAmount,
       SUM(RemainingAmount) AS WhatIsLeft,
       MAX(RemainingAmount) AS LargestLoan,
       MIN(RemainingAmount) AS LowestLoan
FROM Loans
GROUP BY UserID

