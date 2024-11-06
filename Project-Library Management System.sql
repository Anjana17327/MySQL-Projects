create database library;
use library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(500),
    Contact_no VARCHAR(20)
);
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10 , 2 ),
    Branch_no INT,
    FOREIGN KEY (Branch_no)
        REFERENCES Branch (Branch_no)
);
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(300),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10 , 2 ),
    Status VARCHAR(3),
    Author VARCHAR(300),
    Publisher VARCHAR(300)
);
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(300),
    Reg_date DATE
);
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    FOREIGN KEY (Issued_cust)
        REFERENCES Customer (Customer_Id),
    Issued_book_name VARCHAR(300),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Isbn_book)
        REFERENCES Books (ISBN)
);
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(300),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2)
        REFERENCES Books (ISBN)
);

insert into Branch(Branch_no, Manager_Id,  Branch_address,Contact_no ) values
						(1,1001,"Kozhikode","2564789361"),
                        (2,1002,"Kannur","5879632451"),
                        (3,1003,"Thrissur","3698452178"),
                        (4,1004,"Eranakulam","2549876314"),
                        (5,1005,"Kollam","5469823146"),
                        (6,1006,"Thalasseri","1456982367");
                        
insert into  Employee (Emp_Id,Emp_name,Position,Salary,Branch_no) values
						(1,"Satheesh","Librarian",65000,1),
                        (2,"Priya","Manager",75000,3),
                        (3,"Seethu","Librarian",55000,5),
                        (4,"Rajan","Clerk",35000,4),
                        (5,"Ajayan","Manager",70000,2),
                        (6,"Sam","Technician",30000,4),
                        (7,"Ram","Assistant",45000,2),
                        (8,"Sanoop","Clerk",40000,1);
                        
insert into Books(ISBN,Book_title,Category,Rental_Price,Status,Author,Publisher) values
			(9788171300285,"Khasakkinte Ithihasam","Novel",50.00,"yes","O.V.Vijayan","DC Books"),
            (9788126402227,"Kerala Charithram","History",70.00,"no","A.Sreedhara Menon","DC Books"),
            (9788126417252,"Pathummayude Aadu","Literature",20.00,"yes","Vaikom Muhammad Basheer","DC Books"),
            (9788171302340,"Indhulegha","Literature",40.00,"no","O.Chandhu Menon","DC Books"),
            (9788171303231,"Pazhassi Raja","History",50.00,"yes","K.Mahadeva Menon","DC Books"),
            (9788171301053,"Kerala Samskaram","History",65.00,"yes","Sahithya Pravarthaka Co-operative Society","DC Books"),
            (9788126404085,"Randamoozham","Novel",60.00,"no","Benyamin","DC Books"),
            (9788126411236,"Kavithakal","Poetry",15.00,"yes","K.Sachidanandan","Current Books"),
            (9788125017225,"Malayalam History","History",30.00,"no","Padhanasree","NIT");
            
insert into Customer(Customer_Id,Customer_name,Customer_address,Reg_date) values
					(1,"Ajay","Kozhikode","2023-01-12"),
                    (2,"Malavika","Thalasseri","2023-05-28"),
                    (3,"Thomas","Kollam","2022-04-12"),
                    (4,"Manju","Thrissur","2021-10-14"),
                    (5,"Maya","Kozhikode","2020-11-20"),
                    (6,"Murali","Eranakulam","2021-04-18"),
                    (7,"Samuel","Thalasseri","2021-06-14"),
                    (8,"Geetha","Kozhikode","2021-07-08");
                    
insert into IssueStatus (Issue_Id,Issued_cust,Issued_book_name,Issue_date,Isbn_book) values
						(1,2,"Pathummayude Aadu","2023-06-28",9788126417252),
                        (2,4,"Pazhassi Raja","2024-04-24",9788171303231),
                        (3,4,"Randamoozham","2024-10-24",9788126404085),
                        (4,1,"Indhulegha","2024-08-28",9788171302340),
                        (5,8,"Khasakkinte Ithihasam","2024-09-12",9788171300285),
                        (6,7,"Kerala Samskaram","2024-05-20",9788126402227);
                        
insert into ReturnStatus(Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) values
						(1,1,"Indhulegha","2023-10-25",9788171302340),
                        (2,2,"Pathummayude Aadu","2024-07-28",9788126417252),
                        (3,4,"Randamoozham","2024-10-30",9788126404085),
                        (4,7,"Kerala Samskaram","2024-07-25",9788126402227),
                        (5,8,"Khasakkinte Ithihasam","2024-10-10",9788171300285),
                        (6,4,"Pazhassi Raja","2024-06-24",9788171303231);
                        
select * from Branch;

select * from Employee;

select * from Books;

select * from Customer;

select * from IssueStatus;

select * from ReturnStatus;

# Q1 Retrieve the book title, category, and rental price of all available books
SELECT 
    Book_title, Category, Rental_Price
FROM
    books
WHERE
    Status = 'yes';


# Q2 List the employee names and their respective salaries in descending order of salary
SELECT 
    Emp_name, Salary
FROM
    Employee
ORDER BY salary DESC;


#Q3 Retrieve the book titles and the corresponding customers who have issued those books.
SELECT 
    books.book_title, customer.customer_name
FROM
    issuestatus
        JOIN
    books ON issuestatus.Isbn_book = books.ISBN
        JOIN
    customer ON issuestatus.Issued_cust = customer.Customer_Id;
        
        
        
#Q4 Display the total count of books in each category
SELECT 
    Category, COUNT(*) AS Book_Count
FROM
    books
GROUP BY category;


#Q5 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT 
    Emp_name, Position
FROM
    employee
WHERE
    salary > 50000;


#Q6 List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT 
    customer.Customer_name
FROM
    customer
        LEFT JOIN
    issuestatus ON issuestatus.issued_cust = customer.customer_id
WHERE
    Reg_date < '2022-01-01'
        AND issuestatus.Issued_cust IS NULL;


#Q7 Display the branch numbers and the total count of employees in each branch.
SELECT 
    branch.Branch_no,
    COUNT(employee.Emp_Id) AS count_of_employee
FROM
    employee
        RIGHT JOIN
    branch ON employee.Branch_no = branch.Branch_no
GROUP BY branch.Branch_no;


#Q8 Display the names of customers who have issued books in the month of June 2023
SELECT 
    customer.Customer_name
FROM
    customer
        JOIN
    issuestatus ON customer.Customer_Id = issuestatus.Issued_cust
WHERE
    issuestatus.Issue_date >= "2023-06-01"
        AND issuestatus.Issue_date <"2023-07-01";


#Q9 Retrieve book_title from book table containing history
SELECT 
    Book_title
FROM
    books
WHERE
    Book_title LIKE '%history%';


#Q10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT 
    branch.Branch_no,
    COUNT(employee.Emp_Id) AS count_of_employee
FROM
    employee
        RIGHT JOIN
    branch ON employee.Branch_no = branch.Branch_no
GROUP BY branch.Branch_no
HAVING COUNT(employee.Emp_Id) > 5;


# Q11 Retrieve the names of employees who manage branches and their respective branch addresses
SELECT 
    employee.Emp_name, branch.Branch_address
FROM
    employee
        JOIN
    branch ON employee.Branch_no = branch.Branch_no
WHERE
    employee.Position = 'Manager';


#Q12  Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT 
    distinct customer.Customer_name
FROM
    customer
        JOIN
    issuestatus ON customer.Customer_Id = issuestatus.Issued_cust
        JOIN
    books ON books.ISBN = issuestatus.Isbn_book
WHERE
    books.Rental_Price > 25;
