

create database LibraryDatabase;

use LibraryDatabase

create schema Book;
---
create schema Person;


create table [Book].[Author] (
[Author_ID] [int],
[Author_FirstName] [nvarchar](50) not null,
[Author_LastName] [nvarchar] (50) not null
);

create table [Book].[Publisher] (
[Publisher_ID] int primary key identity(1,1) not null,
[Publisher_Name] nvarchar (100) null
);

create table [Book].[Book] (
[Book_ID] int primary key not null,
[Book_Name] nvarchar (50) not null,
[Author_ID] int not null,
[Publisher _ID] int not null
);


create table [Person].[Person] (
[SSN] [bigint] primary key not null,
[Person_FirstName] [nvarchar] (50) null,
[Person_LastName] [nvarchar] (50) null
);


create table [Person].[Person_Mail] (
[Mail_ID] int primary key identity (1,1),
[Mail] nvarchar(max) not null,
[SSN] bigint unique not null
);

create table [Person].[Person_Phone] (
[Phone_Number] [bigint] primary key not null,
[SSN] [bigint] not null
);


create table [Person].[Loan] (
[SSN] bigint not null,
[Book_ID] int not null,
primary key ([SSN], [Book_ID])
);

