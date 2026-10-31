CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50),
    total_copies INT,
    available_copies INT
);

CREATE TABLE Book_Issue (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Students VALUES
(1, 'Aarav', 'aarav@gmail.com', 'CSE'),
(2, 'Priya', 'priya@gmail.com', 'IT'),
(3, 'Rahul', 'rahul@gmail.com', 'ECE'),
(4, 'Neha', 'neha@gmail.com', 'CSE'),
(5, 'Rohan', 'rohan@gmail.com', 'ME');

INSERT INTO Books VALUES
(101, 'DBMS', 'Korth', 'DBMS', 5, 4),
(102, 'Operating System', 'Galvin', 'OS', 4, 4),
(103, 'Computer Networks', 'Tanenbaum', 'CN', 3, 2),
(104, 'Let Us C', 'Kanetkar', 'Programming', 5, 5),
(105, 'Clean Code', 'Robert Martin', 'Programming', 3, 2),
(106, 'Java Programming', 'Kathy Sierra', 'Java', 2, 2),
(107, 'Algorithms', 'Cormen', 'DSA', 4, 3),
(108, 'Artificial Intelligence', 'Russell', 'AI', 3, 3),
(109, 'Software Engineering', 'Rajib Mall', 'SE', 2, 2),
(110, 'Python Programming', 'Guido', 'Programming', 3, 3);

INSERT INTO Book_Issue VALUES
(1, 1, 101, '2026-10-20', NULL, 'Issued'),
(2, 2, 103, '2026-10-21', NULL, 'Issued'),
(3, 3, 105, '2026-10-10', '2026-10-23', 'Returned'),
(4, 4, 107, '2026-10-25', NULL, 'Issued');

-- Display all students
SELECT * FROM Students;

-- Display all books
SELECT * FROM Books;

-- Available books
SELECT * FROM Books
WHERE available_copies > 0;

-- Student details
SELECT student_name, department FROM Students;

-- Books issued to students
SELECT Students.student_name, Books.book_name,
Book_Issue.issue_date, Book_Issue.status
FROM Book_Issue
JOIN Students ON Book_Issue.student_id = Students.student_id
JOIN Books ON Book_Issue.book_id = Books.book_id;

-- Count books by category
SELECT category, COUNT(*) AS total_books
FROM Books
GROUP BY category;

-- Count students
SELECT COUNT(*) FROM Students;

-- Update student department
UPDATE Students
SET department = 'CSE'
WHERE student_id = 2;

-- Return a book
UPDATE Book_Issue
SET return_date = '2026-10-31', status = 'Returned'
WHERE issue_id = 1;

UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 101;

-- Delete student (example)
-- DELETE FROM Students WHERE student_id = 5;
