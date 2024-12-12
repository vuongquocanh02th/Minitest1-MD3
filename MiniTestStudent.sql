
use studentmanagement;

create table address(
id int auto_increment primary key,
addressName varchar(50) not null);

create table classes(
id int auto_increment primary key,
className varchar(50) not null,
languageName varchar(50) not null,
classDescription varchar(100) );

create table students(
id int auto_increment primary key,
fullName varchar(50) not null,
address_id int not null,
age int not null,
phone int unique,
classes_id int not null);

alter table students
add foreign key(address_id) references address(id),
add foreign key(classes_id) references classes(id);

create table course(
id int auto_increment primary key,
courseName varchar(50) not null,
courseDescription varchar(100));

create table points(
id int auto_increment primary key,
course_id int not null,
student_id int not null,
pointNum int not null);

alter table points
add foreign key(course_id) references course(id),
add foreign key(student_id) references students(id);

insert into address(addressName)
values
('Ha Noi'),
('TPHCM'),
('Da Nang'),
('Can Tho'),
('Vinh Long');

insert into classes(className, languageName, classDescription)
values
('A1', 'English', 'No description'),
('A2', 'Japanese', 'No description'),
('A3', 'Korean', 'No description'),
('A4', 'Chinese', 'No description'),
('A5', 'US', 'No description');

insert into students(fullName, address_id, age, phone, classes_id)
values

('Nguyen Quan', 5, 15, 0969489777, 2),
('Nguyen Quang Anh', 5, 15, 0969489766, 2),
('Nguyen Van Quang', 5, 15, 0969489755, 2),
('Nguyen Van Dung', 5, 15, 0969489722, 2),
('Nguyen Van', 5, 15, 0969489711, 2);


insert into course(courseName, courseDescription)
values
('Course 1', 'No'),
('Course 2', 'No'),
('Course 3', 'No'),
('Course 4', 'No'),
('Course 5', 'No');

insert into points(course_id, student_id, pointNum)
values
(1, 1, 10),
(2, 2, 9),
(5, 4, 7),
(4, 3, 6),
(3, 5, 8),
(2, 6, 10),
(3, 7, 5),
(4, 8, 9),
(5, 9, 10),
(2, 10, 5),
(1, 11, 6),
(2, 12, 7),
(3, 13, 8),
(4, 14, 9),
(5, 15, 10);

select * from students 
where fullName like 'Nguyen%';

select * from students 
where fullName like '% Anh';

select * from students 
where age between 15 and 18; 

select * from students 
where id in(12, 13); 

select classes_id, 
count(*) as so_luong_hoc_vien
from students
group by classes_id;

select c.className,
count(s.id) as so_luong_hoc_vien
from students s
join classes c on s.classes_id = c.id
group by c.id;

select a.addressName, count(s.id) as so_luong_hoc_vien
from students s 
join address a on s.address_id = a.id
group by a.id;

select course_id, AVG(pointNum) as diem_trung_binh
from points
group by course_id;

select c.courseName, AVG(p.pointNum) as diem_trung_binh
from points p 
join course c on p.course_id = c.id
group by c.id;

select course_id, avg(pointNum) as diem_trung_binh
from points
group by course_id
order by diem_trung_binh desc
limit 1;

select c.courseName, avg(p.pointNum) as diem_trung_binh
from points p 
join course c on p.course_id = c.id
group by c.id
order by diem_trung_binh desc
limit 1;