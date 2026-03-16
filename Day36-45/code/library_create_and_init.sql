drop database if exists library;

create database library default charset utf8;

use library;

create table tb_book
(
bookid integer primary key auto_increment,
title varchar(100) not null,
author varchar(50) not null,
publisher varchar(50) not null,
price float not null,
lendout bit default 0,
lenddate datetime,
lendcount integer default 0
);

insert into tb_book (title, author, publisher, price, lendcount) values ('Core Java, Volume I', 'Cay S. Horstmann', 'China Machine Press', 98.2, 102);
insert into tb_book (title, author, publisher, price, lendcount) values ('Thinking in Java', 'Bruce Eckel', 'China Machine Press', 86.4, 87);
insert into tb_book (title, author, publisher, price, lendcount) values ('Understanding the Java Virtual Machine', 'Zhou Zhiming', 'China Machine Press', 64.4, 32);
insert into tb_book (title, author, publisher, price, lendcount) values ('Effective Java, Chinese Edition, 2nd Edition', 'Joshua Bloch', 'China Machine Press', 36.8, 200);
insert into tb_book (title, author, publisher, price, lendcount) values ('Data Structures and Algorithm Analysis in Java, 3rd Edition', 'Mark Allen Weiss', 'China Machine Press', 51.0, 15);
insert into tb_book (title, author, publisher, price, lendcount) values ('Java 8 in Action', 'Raoul-Gabriel Urma', 'Posts and Telecom Press', 56.8, 25);
insert into tb_book (title, author, publisher, price, lendcount) values ('Refactoring: Improving the Design of Existing Code', 'Martin Fowler', 'Posts and Telecom Press', 53.1, 99);
insert into tb_book (title, author, publisher, price, lendcount) values ('Code Complete, 2nd Edition', 'Steve McConnell', 'Publishing House of Electronics Industry', 53.1, 99);
insert into tb_book (title, author, publisher, price, lendcount) values ('The Pragmatic Programmer: From Journeyman to Master', 'Andrew Hunt, David Thomas', 'Publishing House of Electronics Industry', 45.4, 50);
insert into tb_book (title, author, publisher, price, lendcount) values ('Clean Code', 'Robert C. Martin', 'Posts and Telecom Press', 45.4, 30);
insert into tb_book (title, author, publisher, price, lendcount) values ('Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma, Richard Helm', 'China Machine Press', 30.2, 77);
insert into tb_book (title, author, publisher, price, lendcount) values ('The Zen of Design Patterns, 2nd Edition', 'Qin Xiaobo', 'China Machine Press', 70.4, 100);
