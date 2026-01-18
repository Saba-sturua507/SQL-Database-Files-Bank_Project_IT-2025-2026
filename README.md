# 🏦 BankProject

BankProject is a **SQL Server–based banking database system** designed to model the core functionality of a modern bank.  
It covers users, banks, accounts, cards, transactions, loans, savings, and notifications, making it suitable for learning, academic use, and backend database practice.

---

## 📌 Overview

This project demonstrates:
- Relational database design
- Use of primary keys, foreign keys, and constraints
- Data integrity and validation
- Stored procedures and analytical SQL queries

---

## 🗂 Database Schema

The database consists of the following main tables:

- **Users** – Stores personal and authentication-related data  
- **Bank** – Bank information including SWIFT codes and country  
- **BankAccount** – User bank accounts and balances  
- **CashWallet** – Wallet system linked to bank accounts  
- **Cards** – Bank cards with CVV, expiration dates, and balances  
- **TransactionsCards** – Card-to-card money transfers  
- **PiggyBank** – Savings goals linked to accounts  
- **Loans** – Loan tracking with remaining balance and interest  
- **LoanPayment** – Monthly loan payment details  
- **Notifications** – User notification system  

---

## 🔒 Constraints & Data Integrity

- Primary and foreign key relationships across all tables  
- UNIQUE constraints on:
  - Username
  - Email
  - SWIFT code
  - Card numbers
- CHECK constraints for:
  - Birth dates
  - SWIFT code length
  - Card number length
  - CVV range
  - Issued date validity

---


📊 Sample Queries Included

Users with balances above a given amount

Users filtered by name pattern

Loan summaries per user

Account statistics (count, total, average balance)

Multi-table joins between users, banks, accounts, and cards
## ⚙ Stored Procedure

### Get all users with their balances
```sql
EXEC sp_GetAllUsersWithBalances;

