--task1
--Whenever a user enters blank ('', '  ') or null to F(address) it should automatically change it to Tashkent

create trigger auto_changer 
on F
After insert, update 
as 
UPDATE F
SET address = 'Tashkent'
where address IS NULL OR CAST(address AS VARCHAR(MAX)) = ''


create table F(fullname varchar(max), address varchar(max) default 'Tashkent')
insert into F values ('Park Ji Sung', 'Seoul')
insert into F values ('Lisandro Martinez', '')
insert into F(fullname) values ('Odil Axmedov')
insert into F values ('Andre Berchiche', null)

select * from F



--task2
create database HW3
use HW3

create table iam_projects(db_id int primary key,
id int,
name varchar(50),
type varchar(50))

create table iam_roles(db_id int primary key,
id int,
name varchar(50),
type varchar(50),
actions varchar(50))

create table iam_policies(db_id int primary key,
id int,
name varchar(50),
type varchar(50))

create table iam_members(db_id int primary key,
name varchar(50))

create table iam_statements(db_id int primary key,
effect varchar(50),
actions varchar(50),
resourses varchar(50),
policy_id int foreign key references iam_policies(db_id),
role_id int foreign key references iam_roles(db_id))

create table iam_policy_members(
memeber_id int foreign key references iam_members(db_id), 
policy_id int foreign key references iam_policies(db_id))

create table iam_role_projects(
role_id int foreign key references iam_roles(db_id) , 
project_id int foreign key references iam_projects(db_id))

create table iam_statement_projects(
project_id int foreign key references iam_projects(db_id), 
statement_id int  foreign key references iam_statements(db_id))

create table iam_policy_projects(
policy_id int foreign key references iam_policies(db_id), 
project_id int foreign key references iam_projects(db_id))

create table iam_staged_project_rules(db_id int primary key,
id int,
name varchar(50),
type varchar(50),
deleted bit,
project_id int foreign key references iam_projects(db_id))

create table iam_project_rules(db_id int primary key,
id int,
name varchar(50),
type varchar(50),
project_id int foreign key references iam_projects(db_id))

create table iam_staged_rule_conditions(db_id int primary key,
rule_db_id int foreign key references iam_staged_project_rules(db_id), 
value varchar(50),
attribute varchar(50),
operatopr varchar(50))

create table iam_rule_conditions(db_id int primary key,
rule_db_id int foreign key references iam_project_rules(db_id), 
value varchar(50),
attribute varchar(50),
operatopr varchar(50))

create table iam_projects_graveyard(db_id int primary key,
id int)



