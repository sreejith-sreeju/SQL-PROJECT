CREATE DATABASE library;
USE library;

CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_ID INT,
Branch_address VARCHAR(30),
Contact_no INT);

INSERT INTO Branch VALUES
(1, 001, 'KOCHI', 0465278654),
(2, 020, 'PALAKKAD', 964575795),
(3, 011, 'KANNUR', 606675871),
(4, 040, 'THRISSUR', 527894516),
(5, 050, 'KOZHIKODE', 816322046);

SELECT * FROM Branch;

CREATE TABLE Employee(
Emp_ID INT PRIMARY KEY,
Branch_no INT ,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(8, 2),
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));

INSERT INTO Employee VALUES
(101,1, 'Sreejith', 'Manager', 35000),
(102,2, 'Anisha', 'Librarian', 18000),
(103,3, 'Sidharth', 'Librarian', 28000),
(104,4, 'Arya', 'staff', 15000),
(105,5, 'Sandra', 'Front Desk Staff', 29000),
(106,5, 'Athira', 'Manager', 31000),
(107,4, 'stilson', 'Manager', 32000),
(108,2, 'Arjun', 'staff', 15000),
(109,2, 'akhil', 'Manager', 35000),
(110,1, 'amritha', 'Librarian', 20000),
(111,3, 'nimisha', 'Manager', 33000),
(112,4, 'Revathi', 'Librarian', 20000);

UPDATE Employee SET salary = 55000 WHERE Emp_ID = 101;
UPDATE Employee SET salary = 50000 WHERE Emp_ID = 109;


SELECT * FROM Employee;

CREATE TABLE Customer(
Customer_ID INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE);

INSERT INTO Customer VALUES
(01,'Anisha', 'Palakkad', '2021-09-30'),
(02,'Devika', 'Kollam', '2021-07-27'),
(03,'Ashwathy', 'pathanamthitta', '2022-05-05'),
(04,'Sreejith', 'Palakkad', '2020-12-28'),
(05,'Sindhu', 'Kasarkode', '2021-01-02'),
(06,'Sachin', 'Palakkad', '2022-02-10'),
(07,'Anusree', 'Idukki', '2022-08-26'),
(08,'Vyshak', 'Kollam', '2022-10-13'),
(09,'Arjun', 'Pathanamthitta', '2021-08-01'),
(10,'Vishnu', 'Malappuram', '2023-04-03'),
(11,'Revathi', 'Idukki', '2022-08-10'),
(12,'Hari', 'Wayanad', '2023-09-17'),
(13,'Sobha', 'Kannur', '2023-11-22'),
(14,'Arjun', 'Kottayam', '2022-11-24'),
(15,'Anaswara', 'Palakkad', '2022-05-01');

SELECT * FROM Customer;


CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(30),
Issue_date DATE,
Isbn_book VARCHAR(30),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));

INSERT INTO IssueStatus VALUES
(1, 1, 'A', '2022-01-05', '1234567891011'),
(2, 2, 'B', '2022-02-10', '0123456789101'),
(3, 3, 'C', '2022-03-15', '2345678910123'),
(4, 4, 'D', '2022-04-20', '9645757952001'),
(5, 5, 'E', '2022-05-25', '7902626824044'),
(6, 4, 'F', '2022-04-25', '9745684404444'),
(7, 3, 'G', '2022-03-17', '0215456547487'),
(8, 2, 'H', '2022-07-10', '0245785217552');

select * from IssueStatus;


CREATE TABLE ReturnStatus(
Return_ID INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(30),
Return_date DATE,
ISBN_book2 VARCHAR(30),
FOREIGN KEY(Return_cust) REFERENCES Customer(Customer_ID),
FOREIGN KEY(ISBN_book2) REFERENCES Books(ISBN));

INSERT INTO ReturnStatus VALUES
(1, 1, 'A', '2022-02-10', '1234567891011'),
(2, 2, 'B', '2022-03-15', '0123456789101'),
(3, 3, 'C', '2022-04-20', '2345678910123'),
(4, 4, 'D', '2022-05-25', '9645757952001'),
(5, 5, 'E', '2022-06-30', '7902626824044');

select * from ReturnStatus;

CREATE TABLE Books(
ISBN VARCHAR(13) PRIMARY KEY,
Book_title VARCHAR(30),
Category VARCHAR(30),
Rental_price DECIMAL(4,2),
Status VARCHAR(3) DEFAULT 'Yes',
Author VARCHAR(30),
Publisher VARCHAR(30));


INSERT INTO Books VALUES
('1234567891011', 'A', 'Fiction', 13.00 , 'No', 'JOHN', 'LORD'),
('0123456789101', 'B', 'Fiction', 22.00 , 'Yes', 'KANE', 'SNG'),
('2345678910123', 'C', 'Science', 30.00 , 'Yes', 'LUE JOHN', 'ARNOLDS'),
('9645757952001', 'D', 'Drama', 18.00 , 'Yes', 'SMITH', 'ARON'),
('7902626824044', 'E', 'Fiction', 20.00 , 'No', 'Harper', 'LORA WORLD'),
('9745684404444', 'F', 'Fiction', 22.00 , 'Yes', 'ARUN', 'CSK Books'),
('0215456547487', 'G', 'Fantasy', 20.00 , 'Yes', ' SKS', 'INIDAN BOOKS'),
('0245785217552', 'H', 'Drama', 10.00 , 'Yes', 'PRP', 'KM BOOKS'),
('9789088888888', 'I', 'Mystery', 10.99 , 'Yes', 'MSK', 'CD BOOKS'),
('9789999999999', 'J', 'Fantasy', 16.00 , 'No', 'RRR', 'DORA BOOKS'),
('9786543210987', 'K', 'History', 13.00, 'Yes', 'NGK', 'SS BOOKS');

SELECT * FROM Books;


-- Retrieve the book title, category, and rental price of all available books. 
SELECT Book_title, Category, Rental_price FROM Books WHERE Status = 'Yes';

-- List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary FROM EMPLOYEE ORDER BY Salary DESC;

-- Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT i.Issued_book_name, c.Customer_name 
FROM IssueStatus i JOIN Customer c ON i.Issued_cust = c.Customer_ID;

-- Display the total count of books in each category
SELECT Category, count(*) AS Total_books FROM Books GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- List the customer names who registered before 2023-01-01 and have not issued any books yet. 
SELECT Customer_name FROM Customer 
WHERE Reg_date < '2023-01-01' AND Customer_ID NOT IN (SELECT Issued_cust FROM IssueStatus);

-- Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, count(*) AS Employee_count FROM Employee GROUP BY Branch_no;

-- Display the names of customers who have issued books in the month of June 2023.
SELECT c.Customer_name 
FROM Customer c JOIN IssueStatus i ON c.Customer_ID = i.Issued_cust
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Retrieve book_title from book table containing history. 
SELECT Book_title FROM Books WHERE Category = 'History';

-- Retrieve the branch numbers along with the count of employees for branches having more than 2 employees.
SELECT Branch_no, count(*) AS Employee_count FROM Employee GROUP BY Branch_no HAVING count(*) > 2;


