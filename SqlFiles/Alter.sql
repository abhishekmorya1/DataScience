create database sample;

create database sample1;

# how to delete database

drop database sample;
drop database sample1;

use sample;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    branch VARCHAR(20),
    marks INT,
    city VARCHAR(30)
);

INSERT INTO students VALUES
(1, 'Amit', 21, 'Male', 'CSE', 85, 'Delhi'),
(2, 'Priya', 22, 'Female', 'IT', 92, 'Noida'),
(3, 'Rahul', 20, 'Male', 'ECE', 76, 'Faridabad'),
(4, 'Neha', 23, 'Female', 'CSE', 88, 'Gurgaon'),
(5, 'Rohit', 22, 'Male', 'ME', 65, 'Agra'),
(6, 'Sneha', 21, 'Female', 'IT', 79, 'Delhi'),
(7, 'Karan', 24, 'Male', 'Civil', 55, 'Jaipur'),
(8, 'Pooja', 20, 'Female', 'ECE', 95, 'Lucknow'),
(9, 'Vikas', 23, 'Male', 'CSE', 70, 'Noida'),
(10, 'Anjali', 22, 'Female', 'ME', 81, 'Faridabad');

select * from students;


# how to add new column

alter table students add column fee int;
alter table students add column grade varchar(20);

# how to add multiple column

alter table students add a int, add b int;
alter table students add (c int, d int);


# how to drop column 

alter table students drop column a;
alter table students drop b;

# how to drop multiple column

alter table students drop column c, drop d;


create table abhishek (name varchar(30), phone_number int(10));

select * from abhishek;

# rename table name

rename table abhishek to morya;

select * from morya;


select * from students;

# rename column

alter table students rename column fee to fees;


# update
# delete 
# truncate
# rollback
# commit - > save manually

# this will not allow to save data automatically 
set autocommit = 0;

use mca;
select * from students; 

update students set marks = 100;

rollback;

update students set marks = 100 where id = 1 ;
commit;

# update marks by 10 percent 

UPDATE students
SET marks = marks * 1.10
WHERE marks <= 90;

SELECT 
    name,
    age,
    marks,
    gender,

    CASE
        WHEN marks > 70 THEN "good"
        WHEN marks > 50 THEN "avg"
        ELSE "poor"
    END AS result,

    CASE
        WHEN age > 23 THEN "Adult"
        ELSE "Young"
    END AS age_group

FROM students;


# update multiple column 

update students set name = "ankit sharma" , age=22 where id =1;
select * from students;
 










