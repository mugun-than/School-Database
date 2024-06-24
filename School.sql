show databases;
create database school_management;
use school_management;

create table Schools (
id int auto_increment,
school_name varchar(45),
primary key (id));

create table Standards (
id int auto_increment,
school_id int,
standard_name varchar(3),
fee int,
primary key (id),
foreign key (school_id) references Schools(id));

create table Sections (
id int auto_increment,
section_name varchar(1),
school_id int,
standard_id int,
primary key (id),
foreign key (school_id) references Schools(id),
foreign key (standard_id) references Standards(id));

create table Students (
id int auto_increment,
student_name varchar(45),
dob Date,
section_id int,
standard_id int,
school_id int,
primary key (id),
foreign key (section_id) references Sections(id),
foreign key (standard_id) references Standards(id),
foreign key (school_id) references Schools(id));

create table Attendance (
student_id int,
cdate date,
cstatus char(1),
primary key (student_id),
check(cstatus in ('a', 'p')),
foreign key (student_id) references Students(id));

create table FeePayment (
id int auto_increment,
student_id int,
amount_paid int,
d date,
primary key (id),
foreign key (student_id) references Students(id));

create table Subjects (
id int,
standard_id int,
school_id int,
subject_name varchar(45),
foreign key (standard_id) references Standards(id),
foreign key (school_id) references Schools(id),
primary key (id, standard_id, school_id));

create table TimeTable (
id int auto_increment,
days varchar(10),
start_time time,
end_time time,
subject_id int,
section_id int,
standard_id int,
school_id int,
primary key (id),
foreign key (section_id) references Sections(id),
foreign key (subject_id, standard_id, school_id) references Subjects(id, standard_id, school_id),
check(days in ('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'))); 

create table WorkRole (
id int auto_increment,
role_name varchar(45),
basic_salary int,
school_id int,
primary key (id),
foreign key (school_id) references Schools(id));

create table Employee (
id int auto_increment,
employee_name varchar(45),
dob date,
experience int,
work_role int,
primary key (id),
foreign key (work_role) references WorkRole(id));

create table Teachers (
employee_id int, 
section_id int, 
subject_id int,
standard_id int,
school_id int,
primary key (employee_id),
foreign key (section_id) references Sections(id),
foreign key (subject_id, standard_id, school_id) references Subjects(id, standard_id, school_id));

create table SalaryPayment (
id int auto_increment,
employee_id int,
amount_paid int,
cdate date,
primary key (id),
foreign key (employee_id) references Employee(id));

create table Exam (
id int,
exam_name varchar(45),
edate date,
subject_id int,
standard_id int,
school_id int,
primary key (id, standard_id, subject_id),
foreign key (subject_id, standard_id, school_id) references Subjects(id, standard_id, school_id),
check(exam_name in ('quarterly', 'halfyearly', 'annual')),
check(id in (1, 2, 3)));

create table ExamResult (
student_id int,
exam_id int,
standard_id int,
subject_id int,
marks int,
primary key (student_id, standard_id, exam_id, subject_id),
foreign key (student_id) references Students(id),
foreign key (exam_id, standard_id, subject_id) references Exam(id, standard_id, subject_id));
 
 -- INSERTING SCHOOLS
insert into Schools (school_name) values 
('K.S.R Matric Higher Secondary School'),
('Government Boys Higher Secondary School');

-- INSERTING TO SCHOOL 1

-- INSERTING STANDARDS
insert into Standards (school_id, standard_name, fee) values 
(1, 'I', 4000),
(1, 'II', 5000),
(1, 'III', 6000),
(1, 'IV', 10000),
(1, 'V', 12000),
(1, 'VI', 14000),
(1, 'VII', 18000),
(1, '8', 20000),
(1, 'IX', 25000),
(1, 'X', 25000),
(1, 'XI', 30000),
(1, 'XII', 40000);

-- INSERTING SECTIONS
insert into Sections (section_name, school_id, standard_id) values
('A', 1, 1),
('B', 1, 1),
('A', 1, 2),
('B', 1, 3),
('A', 1, 3),
('B', 1, 3),
('A', 1, 4),
('B', 1, 4),
('A', 1, 5),
('B', 1, 5),
('A', 1, 6),
('B', 1, 6),
('A', 1, 7),
('B', 1, 7),
('A', 1, 8),
('B', 1, 8),
('A', 1, 9),
('B', 1, 9),
('A', 1, 10),
('B', 1, 10),
('A', 1, 11),
('B', 1, 11),
('A', 1, 12),
('B', 1, 12);

-- INSERTING STUDENTS (STUDENT11A1 - student from school 1 standard 1 section A student no 1)
insert into Students (student_name, dob, section_id, standard_id, school_id) values 
('student11A1', '2020-09-23', 1, 1, 1),
('student11A2', '2020-01-14', 1, 1, 1),
('student11A3', '2020-12-02', 1, 1, 1),
('student11A4', '2020-09-22', 1, 1, 1),
('student11A5', '2020-03-23', 1, 1, 1),
('student11B1', '2020-06-24', 2, 1, 1),
('student11B2', '2020-12-24', 2, 1, 1),
('student11B3', '2020-11-24', 2, 1, 1),
('student11B4', '2020-12-12', 2, 1, 1),
('student11B5', '2020-02-06', 2, 1, 1),
('student12A1', '2019-09-23', 1, 2, 1),
('student12A2', '2019-01-14', 1, 2, 1),
('student12A3', '2019-12-02', 1, 2, 1),
('student12A4', '2019-09-22', 1, 2, 1),
('student12A5', '2019-03-23', 1, 2, 1),
('student12B1', '2019-06-24', 2, 2, 1),
('student12B2', '2019-12-24', 2, 2, 1),
('student12B3', '2019-11-24', 2, 2, 1),
('student12B4', '2019-12-12', 2, 2, 1),
('student13A1', '2018-09-23', 1, 3, 1),
('student13A2', '2018-01-14', 1, 3, 1),
('student13A3', '2018-12-02', 1, 3, 1),
('student13A4', '2018-09-22', 1, 3, 1),
('student13A5', '2018-03-23', 1, 3, 1),
('student13B1', '2018-06-24', 2, 3, 1),
('student13B2', '2018-12-24', 2, 3, 1),
('student13B3', '2018-11-24', 2, 3, 1),
('student13B4', '2018-12-12', 2, 3, 1),
('student13B5', '2018-02-06', 2, 3, 1);

/* INSERTING SUBJECTS
SUBJECT_ID  SUBJECT NAME
    1        TAMIL
    2        ENGLISH
    3        MATHS
    4        SCIENCE
    5        SOCIAL SCIENCE
    6        PHYSICS
    7        CHEMISTRY
    8        BIOLOGY
    9        COMPUTER SCIENCE */

insert into Subjects (id, standard_id, school_id, subject_name) values 
(1, 1, 1, 'Tamil'),
(2, 1, 1, 'English'),
(3, 1, 1, 'Maths'),
(4, 1, 1, 'Science'),
(5, 1, 1, 'Social Science'),
(1, 2, 1, 'Tamil'),
(2, 2, 1, 'English'),
(3, 2, 1, 'Maths'),
(4, 2, 1, 'Science'),
(5, 2, 1, 'Social Science'),
(1, 3, 1, 'Tamil'),
(2, 3, 1, 'English'),
(3, 3, 1, 'Maths'),
(4, 3, 1, 'Science'),
(5, 3, 1, 'Social Science');

-- INSERTING WORKROLE
insert into WorkRole (role_name, basic_salary, school_id) values
('Teacher', 16000, 1),
('Office', 10000, 1),
('Lab Assitant', 12000, 1),
('Cleaning', 8000, 1),
('Principal', 24000, 1),
('Head Master', 20000, 1);

-- INSERTING EMPLOYEES
insert into Employee (employee_name, dob, experience, work_role) values 
('Teacher_1', '2002-12-24', 2, 1),
('Teacher_2', '2001-12-12', 4, 1),
('Teacher_3', '2000-01-23', 8, 1),
('Teacher_4', '1990-02-17', 12, 1),
('Teacher_5', '2004-09-18', 1, 1),
('LabAssistant_1', '2003-02-22', 3, 3),
('Office_1', '2000-12-12', 6, 2),
('Principal', '1970-12-23', 20, 5),
('HeadMaster', '1980-11-11', 11, 6); 

-- INSERTING TEACHERS 
insert into Teachers (employee_id, section_id, subject_id, standard_id, school_id) values
(1, 5, 1, 3, 1),
(2, 5, 2, 3, 1),
(3, 5, 3, 3, 1),
(4, 5, 4, 3, 1),
(5, 5, 5, 3, 1);

-- INSERTING SALARY PAYMENT
insert into salaryPayment (employee_id, amount_paid, cdate) values
(1, 1000, current_date()),
(2, 1000, current_date()),
(3, 1000, current_date()),
(4, 1000, current_date()),
(5, 1000, current_date()),
(6, 1000, current_date()),
(7, 1000, current_date()),
(8, 1000, current_date()),
(9, 1000, current_date());

-- INSERTING EXAM SCHEDULE
insert into Exam (id, exam_name, edate, subject_id, standard_id, school_id) values 
(1, 'quarterly', '2024-04-11', 1, 3, 1),
(1, 'quarterly', '2024-04-11', 2, 3, 1),
(1, 'quarterly', '2024-04-11', 3, 3, 1),
(1, 'quarterly', '2024-04-11', 4, 3, 1),
(1, 'quarterly', '2024-04-11', 5, 3, 1);

-- INSERTING TIMETABLE FOR STANDARD 3 SECTION A
insert into TimeTable (days, start_time, end_time, subject_id, section_id, standard_id, school_id) values 
('monday', '09:00:00', '10:00:00', 1, 5, 3, 1),
('monday', '10:00:00', '11:00:00', 2, 5, 3, 1),
('monday', '11:00:00', '12:00:00', 3, 5, 3, 1),
('monday', '12:00:00', '13:00:00', 4, 5, 3, 1),
('monday', '13:00:00', '14:00:00', 5, 5, 3, 1),
('monday', '14:00:00', '15:00:00', 1, 5, 3, 1),
('tuesday', '09:00:00', '10:00:00', 1, 5, 3, 1),
('tuesday', '10:00:00', '11:00:00', 2, 5, 3, 1),
('tuesday', '11:00:00', '12:00:00', 3, 5, 3, 1),
('tuesday', '12:00:00', '13:00:00', 4, 5, 3, 1),
('tuesday', '13:00:00', '14:00:00', 5, 5, 3, 1),
('tuesday', '14:00:00', '15:00:00', 2, 5, 3, 1),
('wednesday', '09:00:00', '10:00:00', 1, 5, 3, 1),
('wednesday', '10:00:00', '11:00:00', 2, 5, 3, 1),
('wednesday', '11:00:00', '12:00:00', 3, 5, 3, 1),
('wednesday', '12:00:00', '13:00:00', 4, 5, 3, 1),
('wednesday', '13:00:00', '14:00:00', 5, 5, 3, 1),
('wednesday', '14:00:00', '15:00:00', 3, 5, 3, 1),
('thursday', '09:00:00', '10:00:00', 1, 5, 3, 1),
('thursday', '10:00:00', '11:00:00', 2, 5, 3, 1),
('thursday', '11:00:00', '12:00:00', 3, 5, 3, 1),
('thursday', '12:00:00', '13:00:00', 4, 5, 3, 1),
('thursday', '13:00:00', '14:00:00', 5, 5, 3, 1),
('thursday', '14:00:00', '15:00:00', 4, 5, 3, 1),
('friday', '09:00:00', '10:00:00', 1, 5, 3, 1),
('friday', '10:00:00', '11:00:00', 2, 5, 3, 1),
('friday', '11:00:00', '12:00:00', 3, 5, 3, 1),
('friday', '12:00:00', '13:00:00', 4, 5, 3, 1),
('friday', '13:00:00', '14:00:00', 5, 5, 3, 1),
('friday', '14:00:00', '15:00:00', 5, 5, 3, 1),
('saturday', '09:00:00', '10:00:00', 1, 5, 3, 1),
('saturday', '10:00:00', '11:00:00', 2, 5, 3, 1),
('saturday', '11:00:00', '12:00:00', 3, 5, 3, 1),
('saturday', '12:00:00', '13:00:00', 4, 5, 3, 1),
('saturday', '13:00:00', '14:00:00', 5, 5, 3, 1),
('saturday', '14:00:00', '15:00:00', 1, 5, 3, 1);

-- INSERTING ATTENDANCE
insert into Attendance (student_id, cdate, cstatus) values
(20, current_date(), 'a'),
(21, current_date(), 'p'),
(22, current_date(), 'p'),
(23, current_date(), 'p'),
(24, current_date(), 'a');

-- INSERTING FEE PAYMENT
insert into FeePayment (student_id, amount_paid, d) values 
(20, 1000, current_date()),
(21, 1000, current_date()),
(22, 1000, current_date()),
(23, 5000, current_date()),
(24, 6000, current_date());

-- INSERTING EXAM RESULTS
insert into ExamResult (student_id, exam_id, standard_id, subject_id, marks) values
(20, 1, 3, 1, 100),
(21, 1, 3, 1, 90),
(22, 1, 3, 1, 10),
(23, 1, 3, 1, 70),
(24, 1, 3, 1, 80),
(20, 1, 3, 2, 90),
(21, 1, 3, 2, 90),
(22, 1, 3, 2, 50),
(23, 1, 3, 2, 60),
(24, 1, 3, 2, 100),
(20, 1, 3, 3, 60),
(21, 1, 3, 3, 50),
(22, 1, 3, 3, 70),
(23, 1, 3, 3, 80),
(24, 1, 3, 3, 80),
(20, 1, 3, 4, 40),
(21, 1, 3, 4, 50),
(22, 1, 3, 4, 40),
(23, 1, 3, 4, 100),
(24, 1, 3, 4, 80),
(20, 1, 3, 5, 60),
(21, 1, 3, 5, 100),
(22, 1, 3, 5, 80),
(23, 1, 3, 5, 100),
(24, 1, 3, 5, 65);


/* EXECUTING SAMPLE QUERIES - FOR EASE OF ACCESS considered only School (K.S.R. Martic), standard III, section A*/
-- 1. List of all students who all present today
select *
from Attendance join Students on Attendance.student_id = Students.id
where cstatus = 'p' and cdate = current_date();

-- 2. Number of students present today
select standard_id, section_id, count(student_id) as attendance_count
from Attendance join Students on Attendance.student_id = Students.id
where cstatus = 'p'
group by standard_id, section_id;

-- 3. Print the student quarterly exam's total mark out of 500
select student_id, exam_id, student_name, sum(marks) as total_mark
from ExamResult join Students on ExamResult.student_id = Students.id
group by student_id, exam_id
having exam_id = 1;

-- 4. Print students with pending fees and their due amount
select student_id, student_name, sum(amount_paid) as amount_paid, abs(sum(amount_paid) - fee) as due_amount  
from FeePayment join Students on FeePayment.student_id = Students.id join Standards on Students.standard_id = Standards.id
group by student_id;
select * 
from FeePayment join Students on FeePayment.student_id = Students.id join Standards on Students.standard_id = Standards.id;