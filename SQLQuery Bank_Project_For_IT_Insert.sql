INSERT INTO Users (Username, FullName, Email, PhoneNumber, PasswordHash, BirthDate, Address, JoinedDate, Status)
VALUES 
('jdoe88', 'John Doe', 'john.doe@email.com', '555-0101', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '1988-05-15', '123 Maple St, Springfield', '2023-01-10', 'Active'),
('asmith_92', 'Alice Smith', 'alice.s@provider.net', '555-0102', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1992-11-23', '456 Oak Ave, Riverdale', '2023-02-15', 'Active'),
('b_wayne', 'Bruce Wayne', 'bruce@waynecorp.com', '555-0911', '4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2', '1980-02-19', '1007 Mountain Dr, Gotham', '2023-03-01', 'Active'),
('m_rossi', 'Maria Rossi', 'm.rossi@italy.it', '555-0104', 'ef71a419071b779c676f092776c59b2d87e0b59b85c179c38827419f854a864e', '1995-07-30', 'Via Roma 12, Rome', '2023-05-12', 'Pending'),
('scole_dev', 'Sarah Cole', 'scole@techmail.com', '555-0105', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '1985-12-01', '789 Pine Rd, Seattle', '2023-06-20', 'Inactive'),
('t_stark', 'Tony Stark', 'tony@stark.com', '555-0001', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '1970-05-29', '10880 Malibu Point, CA', '2023-08-14', 'Active'),
('k_miller', 'Kevin Miller', 'kmiller82@webmail.com', '555-0107', '86032470769d4e511110023c06173a14b3f88f8d68f237f37435f30836262a6d', '1982-03-14', '321 Elm St, Fairview', '2023-09-05', 'Suspended');



INSERT INTO Bank (BankName, Country, SwiftCode, SupportEmail)
VALUES 
('Chase Bank', 'USA', 'CHASUS33', 'support@chase.com'),
('HSBC UK', 'United Kingdom', 'HSBCGB2L', 'contact@hsbc.co.uk'),
('Deutsche Bank', 'Germany', 'DEUTDEFF', 'info@db.com'),
('Santander', 'Spain', 'BSCHESSMXXX', 'help@santander.es'),
('MUFG Bank', 'Japan', 'BOTKJPJT', 'service@mufg.jp'),
('BNP Paribas', 'France', 'BNPAFRPP', 'support@bnpparibas.com'),
('Commonwealth Bank', 'Australia', 'CTBAAU2S', 'digital@cba.com.au');


INSERT INTO BankAccount (Balance, UserID, BankID, AccountType, OpenDate, Status)
VALUES 
(2500.50, 1, 1, 'Checking', '2023-01-15', 'Active'),
(15400.00, 2, 3, 'Savings', '2023-02-20', 'Active'),
(1250000.75, 3, 1, 'Business', '2023-03-05', 'Active'),
(50.00, 4, 6, 'Checking', '2023-05-20', 'Pending'),
(0.00, 5, 2, 'Savings', '2023-07-01', 'Inactive'),
(890500.25, 6, 7, 'Money Market', '2023-08-15', 'Active'),
(4300.10, 7, 4, 'Checking', '2023-09-10', 'Active'),
(1200.00, 1, 2, 'Savings', '2023-01-20', 'Active'),
(340.50, 2, 1, 'Checking', '2023-03-12', 'Active'),
(95000.00, 6, 3, 'Savings', '2023-08-20', 'Active');


INSERT INTO CashWallet (UserID, AccountID, Amount, Currency, Status)
VALUES 
(1, 1, 500.00, 'USD', 'Active'),
(2, 2, 1200.50, 'EUR', 'Active'),
(3, 3, 25000.00, 'USD', 'Active'),
(4, 4, 15.25, 'EUR', 'Pending'),
(5, 5, 0.00, 'GBP', 'Inactive'),
(6, 6, 4500.00, 'AUD', 'Active'),
(7, 7, 310.75, 'EUR', 'Active'),
(1, 8, 150.00, 'GBP', 'Active'),
(2, 9, 85.00, 'USD', 'Active'),
(6, 10, 12000.00, 'JPY', 'Active');


INSERT INTO Cards (AccountID,CardNumberForBank,CVV,ExpireMonth,ExpireYear,IssuedDate,Status,CardBalance,CardType,Currency)
VALUES
(1, '4532111122223333', 123, 12, 2028, '2023-01-20', 'Active', 1500.00, 'Debit',  'USD'),
(2, '5412888899990000', 456, 5, 2027, '2023-02-25', 'Active', 820.50,  'Debit',  'EUR'),
(3, '371234567890123',  789, 3, 2030, '2023-03-10', 'Active', 5000.00, 'Credit', 'GBP'),
(4, '4000123456789012', 234, 8, 2026, '2023-05-25', 'Pending', 0.00,    'Debit',  'USD'),
(6, '5555444433332222', 999, 11, 2029, '2023-08-20', 'Active', 2300.00, 'Debit',  'USD'),
(7, '4912000011112222', 555, 1, 2026, '2023-09-15', 'Active', 900.00,  'Debit',  'EUR'),
(1, '4111222233334444', 321, 7, 2024, '2021-02-01', 'Expired', 0.00,    'Debit',  'USD');



INSERT INTO TransactionsCards (FromWhereID, ToWhereID, Amount, Currency, Descritpion, ReferenceNumber, WasDoneAt, Status)
VALUES 
(1, 2, 50.00, 'USD', 'Dinner split at Restaurant', 'TXN7788991122334455', '2023-10-01', 'Completed'),
(2, 6, 1200.50, 'EUR', 'Online Electronics Purchase', 'TXN1122334455667788', '2023-10-05', 'Completed'),
(6, 3, 5000.00, 'USD', 'Consultancy Fee Payment', 'TXN9988776655443322', '2023-11-12', 'Completed'),
(3, 1, 150.75, 'USD', 'Subscription Refund', 'TXN5544332211009988', '2023-11-20', 'Completed'),
(7, 2, 45.00, 'EUR', 'Person-to-Person Transfer', 'REF8877665544332211', '2023-12-01', 'Completed'),
(1, 6, 25.00, 'USD', 'Fuel Payment', 'TXN1234567890123456', '2023-12-15', 'Pending'),
(6, 7, 310.00, 'AUD', 'Travel Reimbursement', 'REF0000111122223333', '2024-01-05', 'Cancelled');

INSERT INTO PiggyBank (AccountID, Name, TargetAmount, SavedAmount, CreatedAt, Status)
VALUES 
(1, 'New Tesla Model 3', 45000.00, 12000.00, '2023-02-01', 'Active'),
(2, 'Summer Vacation in Bali', 5000.00, 4200.00, '2023-03-15', 'Active'),
(3, 'Wayne Enterprises R&D', 500000.00, 480000.00, '2023-04-10', 'Active'),
(6, 'Mark LXXXV Suit Repairs', 100000.00, 95000.00, '2023-09-01', 'Active'),
(7, 'Emergency Fund', 10000.00, 10000.00, '2023-10-15', 'Completed'),
(1, 'Wedding Anniversary', 2500.00, 500.00, '2024-01-05', 'Active'),
(5, 'Dream House Downpayment', 150000.00, 0.00, '2023-07-10', 'Paused');

INSERT INTO Loans (UserID, AccountID, BorrowdAmount, RemainingAmount, InterestRate, MonthAmountTotal, MonthlyPayment, StartDate, EndDate, Status)
VALUES 
(1, 1, 10000.00, 8500.00, 5.5, 24, 440.00, '2023-01-15', '2025-01-15', 'Active'),
(2, 2, 5000.00, 1200.00, 7.2, 12, 435.00, '2023-05-10', '2024-05-10', 'Active'),
(3, 3, 1000000.00, 900000.00, 3.5, 60, 18000.00, '2023-03-01', '2028-03-01', 'Active'),
(6, 6, 250000.00, 0.00, 4.0, 36, 7300.00, '2021-01-01', '2024-01-01', 'Closed'),
(7, 7, 2000.00, 2000.00, 12.0, 6, 345.00, '2023-12-01', '2024-06-01', 'Active'),
(4, 4, 1500.00, 1500.00, 10.0, 12, 132.00, '2024-01-01', '2025-01-01', 'Pending');


INSERT INTO LoanPayment (LoanID, TotalAmount, LoanPart, InterestPay, PaymentDate, DueDate, Status)
VALUES 
(1, 440.00, 390.00, 50.00, '2023-12-15', '2023-12-15', 'Paid'),
(1, 440.00, 395.00, 45.00, '2024-01-15', '2024-01-15', 'Paid'),
(2, 435.00, 400.00, 35.00, '2023-12-10', '2023-12-10', 'Paid'),
(3, 18000.00, 15000.00, 3000.00, '2023-12-01', '2023-12-01', 'Paid'),
(5, 345.00, 320.00, 25.00, NULL, '2024-01-01', 'Overdue'),
(1, 440.00, 400.00, 40.00, NULL, '2024-02-15', 'Pending');


INSERT INTO Notifications (UserID, Title, Message, IsRead, NotificationType)
VALUES 
(1, 'Payment Received', 'Your monthly loan payment of $440.00 was successful.', 1, 'Loan'),
(7, 'Overdue Alert', 'Your loan payment for January is overdue. Please pay immediately.', 0, 'Urgent'),
(3, 'High Value Transfer', 'A transfer of $50,000.00 was initiated from your business account.', 0, 'Security'),
(2, 'Piggy Bank Goal!', 'Congratulations! You are 80% of the way to your "Summer Vacation" goal.', 1, 'Savings'),
(6, 'Loan Closed', 'Your Equipment Loan has been paid in full and is now closed.', 1, 'Loan'),
(4, 'Account Pending', 'Your new checking account is currently under review.', 0, 'System');