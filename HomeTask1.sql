create database HW1

USE HW1

create table table1(companys varchar(50))
create table table2(subjects varchar(50))
create table table3(countries varchar(50))
create table table4(integers int)
create table table5(negative_numbers int)
create table table6(animals varchar(50))
create table table7(names varchar(50))
create table table8(stars varchar(50))
create table table9(schools varchar(50))
create table table10(colleges varchar(50))


create login login1 with password = 'something'

create user User1 for login login1

create role UserRole
alter role UserRole add member User1

grant select, update on table1 to UserRole
grant select, update on table4 to UserRole
grant select, update on table5 to UserRole
grant select, update on table8 to UserRole
grant select, update on table10 to UserRole


