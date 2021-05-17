create database MySql1;
use MySql1;
create table address(
                        id int primary key ,
                        address varchar(100)
);

create table classes(
                        id int primary key ,
                        name varchar(100),
                        language varchar(100),
                        description varchar(100)
);

create table students(
                         id int primary key ,
                         fullname varchar(100),
                         address_id int,
                         phone double,
                         class_id int,
                         constraint ph unique (phone)
);

create table course(
                       id int primary key ,
                       name varchar(100),
                       description varchar(100)
);

create table point(
                      id int primary key ,
                      course_id int,
                      student_id int,
                      point int

);
insert into address value (1,'HaNoi');
insert into address value (2,'HaNam');
insert into address value (3,'HaTinh');
insert into address value (4,'HaGiang');
insert into address value (5,'HaTay');
insert into classes(id, name, language, description) value
    (2,'java','TiengViet','Online'),
    (3,'java','TiengAnh','Online'),
    (4,'php','TiengAnh','Online'),
    (5,'php','TiengTrung','Online'),
    (1,'js','TiengTrung','Online');
insert into students value (1,'Nguyen Van A',1,123456789,1);
insert into students value (2,'Nguyen Van B',2,123456788,2);
insert into students value (3,'Nguyen Van C',3,123456787,3);
insert into students value (4,'Nguyen Van D',4,123456786,4);
insert into students value (5,'Nguyen Van E',5,123456785,5);
insert into course value (1,'Nguyen Van A','Online');
insert into course value (2,'Nguyen Van B','Online');
insert into course value (3,'Nguyen Van C','Online');
insert into course value (4,'Nguyen Van D','Online');
insert into course value (5,'Nguyen Van E','Online');
insert into point value (1,2,1,8);
insert into point value (2,3,2,7);
insert into point value (3,4,3,5);
insert into point value (4,5,4,9);
insert into point value (5,6,5,10);
use mysql1;
select classes.name, count(students.id)
from classes,students where classes.id = students.class_id
group by classes.name
;
select address.address, count(students.id)
from address,students where address.id = students.class_id
group by address.address
;



