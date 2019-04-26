create database Library

use Library

create table Library_Branch (
	BranchID int primary key not null identity (100,1),
	BranchName varchar(100) not null,
	Address varchar(200) not null
);
insert into Library_Branch
	(BranchName, Address)
	values
	('Sharpstown', '434 Newton St.'),
	('Central', '292 Dhalia Ave.'),
	('Weston', '3400 Navajo St.'),
	('Uptown', '1700 Pennslyvania Ave.'),
	('Whittier', '2800 High St.')
;

create table Publisher (
	PublisherName varchar(50) primary key not null,
	Address varchar(200) not null,
	Phone varchar(15) not null,
);
insert into Publisher
	(PublisherName, Address, Phone)
	values
	('Penguin', 'New York', '555-578-0011'),
	('Scholastic', 'San Francisco', '405-555-5555'),
	('Oxford', 'Oxford, UK', '+44 79888892'),
	('Sage', 'New York', '212-559-9090')
;

create table Books (
	BookID int primary key not null identity (1,1),
	Title varchar(50) not null,
	PublisherName varchar(50) not null constraint fk_PublisherName foreign key references Publisher(PublisherName) on update cascade on delete cascade,

);
insert into Books
	(Title, PublisherName)
	values
	('The Lost Tribe', 'Penguin'),
	('Peter Pan', 'Penguin'),
	('Harry Potter', 'Penguin'),
	('Chronicles of Narnia', 'Penguin'),
	('Bernstein Bears', 'Scholastic'),
	('Politics of Africa', 'Sage'),
	('Dancing for Dummies', 'Scholastic'),
	('Troll People', 'Scholastic'),
	('The Age of Data', 'Scholastic'),
	('Star Trek IV', 'Scholastic'),
	('Freaky Numbers', 'Sage'),
	('Dancing in the Dark', 'Penguin'),
	('History of Snails', 'Oxford'),
	('Donuts', 'Penguin'),
	('Cooking for Tall People', 'Penguin'),
	('Why Chocolate?', 'Penguin'),
	('Bicycles - Friend or Foe?', 'Oxford'),
	('How to Make Money', 'Sage'),
	('Caligraphy Tools', 'Penguin'),
	('Climate Change', 'Oxford')
;

create table Book_Authors (
	BookID int not null constraint fk_BookID_Authors foreign key references Books(BookID) on update cascade on delete cascade,
	AuthorName varchar(60) not null
);
insert into Book_Authors
	(BookID, AuthorName)
	values
	(1, 'Terry Dalton'),
	(2, 'Bob Smith'),
	(3, 'J.K. Rowling'),
	(4, 'C.S. Lewis'),
	(5, 'Goldie Locks'),
	(6, 'Meredith Smith'),
	(7, 'Stephen King'),
	(8, 'Stephen King'),
	(9, 'Geordi LaForge'),
	(10, 'John Khan'),
	(11, 'Stephen Hawking'),
	(12, 'Stephen King'),
	(13, 'Martha Stewart'),
	(14, 'Jane Doe'),
	(15, 'Bob'),
	(16, 'J.K. Rowling'),
	(17, 'Rick Price'),
	(18, 'Tim Jones'),
	(19, 'Bob Smith'),
	(20, 'Geordi LaForge')
;

create table Book_Copies (
	BookID int not null constraint fk_BookID_Copies foreign key references Books(BookID) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchID_Copies foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
	Number_Of_Copies int not null
);
insert into Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	values
	(1, 100, 2),
	(2, 100, 6),
	(3, 100, 3),
	(4, 100, 5),
	(7, 100, 2),
	(17, 100, 15),
	(8, 100, 3),
	(9, 100, 9),
	(20, 100, 7),
	(5, 100, 2),
	(1, 101, 5),
	(3, 101, 6),
	(5, 101, 8),
	(7, 101, 6),
	(9, 101, 7),
	(11, 101, 8),
	(13, 101, 2),
	(15, 101, 4),
	(17, 101, 2),
	(19, 101, 3),
	(3, 102, 6),
	(8, 102, 20),
	(5, 102, 4),
	(9, 102, 2),
	(10, 102, 2),
	(13, 102, 2),
	(18, 102, 2),
	(1, 102, 2),
	(2, 102, 2),
	(12, 102, 2),
	(11, 102, 2),
	(4, 102, 2),
	(20, 102, 2),
	(1, 103, 2),
	(2, 103, 7),
	(3, 103, 8),
	(4, 103, 2),
	(5, 103, 2),
	(6, 103, 2),
	(7, 103, 3),
	(8, 103, 6),
	(9, 103, 2),
	(10, 103, 2),
	(11, 103, 2),
	(12, 103, 2),
	(13, 103, 4),
	(14, 103, 3),
	(15, 103, 9),
	(16, 103, 20),
	(17, 103, 2),
	(18, 103, 3)
;

create table Borrower (
	CardNo int primary key not null identity (1000,1),
	Name varchar(50) not null,
	Address varchar(50) not null,
	Phone varchar(15) not null
);
insert into Borrower
	(Name, Address, Phone)
	values
	('Bob Johnson', '123 Grape St.', '404-559-0900'),
	('Larry Jones', '43 Commerce Ave.', '404-334-8989'),
	('Carrie Reynolds', '890 Emerson St.', '123-456-7890'),
	('Mike Andrews', '78 Vista Way', '303-559-7896'),
	('Linda Deckerson', '43 Vista Way', '720-342-1212'),
	('Jamie Johnson', '123 Grape St.', '404-559-0901'),
	('William Bobbers', '12 Apple St.', '510-717-7177'),
	('Jake Jabs', '456 Furniture Row', '893-559-0900'),
	('Doc Bones', '123 Enterprise Lane', '192-888-0907')
;

create table Book_Loans (
	BookID int not null constraint fk_BookID_Loans foreign key references Books(BookID) on update cascade on delete cascade,
	BranchID int not null constraint fk_BranchID_Loans foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
	CardNo int not null constraint fk_CardNo foreign key references Borrower(CardNo) on update cascade on delete cascade,
	DateOut date not null,
	DateDue date not null
);

insert into Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	values
	(1, 100, 1000, '2019-03-03', '2019-06-03'),
	(2, 100, 1000, '2019-03-03', '2019-06-03'),
	(3, 100, 1000, '2019-03-03', '2019-06-03'),
	(4, 100, 1000, '2019-03-03', '2019-06-03'),
	(7, 100, 1000, '2019-03-03', '2019-06-03'),
	(17, 100, 1000, '2019-03-03', '2019-06-03'),
	(1, 101, 1001, '2019-03-03', '2019-06-03'),
	(3, 101, 1001, '2019-03-03', '2019-06-03'),
	(5, 101, 1001, '2019-03-03', '2019-06-03'),
	(7, 101, 1001, '2019-03-03', '2019-06-03'),
	(9, 101, 1001, '2019-03-03', '2019-06-03'),
	(11, 101, 1001, '2019-03-03', '2019-06-03'),
	(13, 101, 1001, '2019-03-03', '2019-06-03'),
	(15, 101, 1001, '2019-03-03', '2019-06-03'),
	(17, 101, 1001, '2019-03-03', '2019-06-03'),
	(3, 102, 1002, '2019-03-03', '2019-06-03'),
	(8, 102, 1002, '2019-03-03', '2019-06-03'),
	(5, 102, 1002, '2019-03-03', '2019-06-03'),
	(9, 102, 1002, '2019-03-03', '2019-06-03'),
	(10, 102, 1002, '2019-03-03', '2019-06-03'),
	(13, 102, 1002, '2019-03-03', '2019-06-03'),
	(18, 103, 1003, '2019-03-03', '2019-06-03'),
	(3, 103, 1003, '2019-03-03', '2019-06-03'),
	(1, 103, 1003, '2019-03-03', '2019-06-03'),
	(1, 100, 1007, '2019-03-03', '2019-06-03'),
	(19, 101, 1005, '2019-03-03', '2019-06-03'),
	(1, 101, 1005, '2019-03-03', '2019-06-03'),
	(18, 102, 1006, '2019-03-03', '2019-06-03'),
	(1, 102, 1006, '2019-03-03', '2019-06-03'),
	(2, 102, 1006, '2019-03-03', '2019-06-03'),
	(12, 102, 1006, '2019-03-03', '2019-06-03'),
	(11, 102, 1006, '2019-03-03', '2019-06-03'),
	(2, 103, 1007, '2019-03-03', '2019-06-03'),
	(3, 103, 1007, '2019-03-03', '2019-06-03'),
	(8, 100, 1000, '2019-03-09', '2019-06-09'),
	(3, 101, 1001, '2019-03-09', '2019-06-09'),
	(5, 101, 1007, '2019-03-09', '2019-06-09'),
	(4, 102, 1006, '2019-03-09', '2019-06-09'),
	(20, 102, 1002, '2019-03-09', '2019-06-09'),
	(8, 102, 1002, '2019-03-09', '2019-06-09'),
	(5, 102, 1002, '2019-03-09', '2019-06-09'),
	(7, 101, 1007, '2019-03-05', '2019-06-05'),
	(3, 102, 1006, '2019-03-05', '2019-06-05'),
	(4, 103, 1007, '2019-03-05', '2019-06-05'),
	(8, 102, 1002, '2019-03-05', '2019-06-05'),
	(5, 103, 1003, '2019-03-05', '2019-06-05'),
	(9, 100, 1005, '2019-03-05', '2019-06-05'),
	(20, 100, 1005, '2019-03-05', '2019-06-05'),
	(5, 100, 1005, '2019-03-04', '2019-06-04'),
	(2, 100, 1000, '2019-03-04', '2019-06-04'),
	(17, 100, 1000, '2019-03-04', '2019-06-04')
;

go

-- Stored Procedure #1
create proc dbo.BookCount @Title varchar(50), @Branch varchar(50)=null
as
select
	a1.Title, a2.BranchName 'Branch', a3.Number_Of_Copies 'Copies'
	from Book_Copies a3
	inner join Books a1 on a1.BookID = a3.BookID
	inner join Library_Branch a2 on a2.BranchID = a3.BranchID
where a1.Title like @Title + '%'
and a2.BranchName = isnull(@Branch,a2.BranchName)
go

exec BookCount @Title = 'The Lost Tribe', @Branch = 'Sharpstown'

/* Can use the same procedure for both 1 and 2
Here is the how to execute it to see how many copies of "The Lost Tribe" are in each branch: */
exec BookCount @Title = 'The Lost Tribe'
go

-- Stored Procedure #3
create proc dbo.SeeNoLoans
as
select a1.Name from Borrower a1
	full outer join Book_Loans a2 on a2.CardNo = a1.CardNo
	where a2.BookID IS NULL
go
exec SeeNoLoans

-- Stored Procedure #4
-- First, changing some dates so there will be some results for this procedure
UPDATE Book_Loans SET DateDue = getdate() WHERE DateDue = '2019-06-09'
go
-- Now for the procedure
create proc dbo.DueToday @Branch varchar(50)=null
as
declare @TodayDate date = getdate()
select
	a0.BranchName, a1.Title, a2.Name, a2.Address
	from Borrower a2
	inner join Book_Loans a3 on a3.CardNo = a2.CardNo
	inner join Books a1 on a1.BookID = a3.BookID
	inner join Library_Branch a0 on a0.BranchID = a3.BranchID
where a3.DateDue = @TodayDate
and a0.BranchName = ISNULL(@Branch,a0.BranchName)
go
exec DueToday @Branch = 'Sharpstown'
;

-- Stored Procedure #5
create proc dbo.LoansByBranch
as
select a1.BranchName as 'Branch', count(BookID) as 'Total Loans' 
	from Book_Loans a2 
	inner join Library_Branch a1 on a1.BranchID = a2.BranchID
	group by a1.BranchName
go
exec LoansByBranch

-- Stored Procedure #6
create proc dbo.LotsOfLoans
as
select 
	a2.Name, a2.Address, count(BookID) as 'Total Books Out'
	from Book_Loans a1
	full outer join Borrower a2 on a2.CardNo = a1.CardNo
	group by a2.Name, a2.Address
	having count(BookID) >= 5
	order by count(BookID) desc;
go
exec LotsOfLoans

-- Stored Procedure #7
create proc dbo.StephenKing
as
select 
	a1.Title, a2.AuthorName as 'Author', a3.Number_Of_Copies as 'Copies', a4.BranchName as 'Branch'
	from Books a1
	inner join Book_Authors a2 on a2.BookID = a1.BookID
	inner join Book_Copies a3 on a3.BookID = a2.BookID
	inner join Library_Branch a4 on a4.BranchID = a3.BranchID
where a2.AuthorName = 'Stephen King'
and a4.BranchName = 'Central'
go
exec StephenKing
	--OR, if I wanted it to be more useful --
create proc dbo.AuthorCopiesByBranch @Branch varchar(50)=null, @Author varchar(50)=null
as
select
	a1.Title, a2.AuthorName as 'Author', a3.Number_Of_Copies as 'Copies', a4.BranchName as 'Branch'
	from Books a1
	inner join Book_Authors a2 on a2.BookID = a1.BookID
	inner join Book_Copies a3 on a3.BookID = a2.BookID
	inner join Library_Branch a4 on a4.BranchID = a3.BranchID
where a2.AuthorName like '%' + @Author + '%'
and a4.BranchName like @Branch + '%'
go
exec AuthorCopiesByBranch @Branch = 'Centr', @Author = ' King'