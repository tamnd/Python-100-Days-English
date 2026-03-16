-- Drop the `school` database if it already exists
drop database if exists `school`;

-- Create a database named `school` with the default character set
create database `school` default charset utf8mb4;

-- Switch to the `school` database context
use `school`;

-- Create the college table
create table `tb_college`
(
`col_id` int unsigned auto_increment comment 'id',
`col_name` varchar(50) not null comment 'name',
`col_intro` varchar(5000) default '' comment 'introduction',
primary key (`col_id`)
) engine=innodb comment 'college table';

-- Create the student table
create table `tb_student`
(
`stu_id` int unsigned not null comment 'student id',
`stu_name` varchar(20) not null comment 'name',
`stu_sex` boolean default 1 comment 'sex',
`stu_birth` date not null comment 'date of birth',
`stu_addr` varchar(255) default '' comment 'hometown',
`col_id` int unsigned not null comment 'college id',
primary key (`stu_id`),
foreign key (`col_id`) references `tb_college` (`col_id`)
) engine=innodb comment 'student table';

-- Create the teacher table
create table `tb_teacher`
(
`tea_id` int unsigned not null comment 'employee id',
`tea_name` varchar(20) not null comment 'name',
`tea_title` varchar(10) default 'assistant' comment 'title',
`col_id` int unsigned not null comment 'college id',
primary key (`tea_id`),
foreign key (`col_id`) references `tb_college` (`col_id`)
) engine=innodb comment 'teacher table';

-- Create the course table
create table `tb_course`
(
`cou_id` int unsigned not null comment 'id',
`cou_name` varchar(50) not null comment 'name',
`cou_credit` int unsigned not null comment 'credits',
`tea_id` int unsigned not null comment 'teacher id',
primary key (`cou_id`),
foreign key (`tea_id`) references `tb_teacher` (`tea_id`)
) engine=innodb comment 'course table';

-- Create the course-selection record table
create table `tb_record`
(
`rec_id` bigint unsigned auto_increment comment 'selection record id',
`sid` int unsigned not null comment 'student id',
`cid` int unsigned not null comment 'course id',
`sel_date` date not null comment 'selection date',
`score` decimal(4,1) comment 'exam score',
primary key (`rec_id`),
foreign key (`sid`) references `tb_student` (`stu_id`),
foreign key (`cid`) references `tb_course` (`cou_id`),
unique (`sid`, `cid`)
) engine=innodb comment 'course-selection record table';

-- Insert college data
insert into `tb_college` 
    (`col_name`, `col_intro`) 
values 
    ('School of Computer Science', 'Founded from the university''s computer major established in 1958, this school later formed a computer science department and expanded into an independent college. It now integrates teaching and research resources and includes programs in computer science, IoT engineering, and computational finance, along with multiple research institutes and teaching labs.'),
    ('School of Foreign Languages', 'This school includes several teaching units and undergraduate majors, plus doctoral and master''s degree authorization in multiple disciplines. Its faculty includes more than 200 staff members, with a large share of teachers holding or pursuing doctoral degrees from leading universities in China and abroad.'),
    ('School of Economics and Management', 'The school traces its roots to an economics program founded in 1905 and has been associated with several well-known economists and scholars over the years.');

-- Insert student data
insert into `tb_student` 
    (`stu_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_addr`, `col_id`) 
values
    (1001, 'Yang Guo', 1, '1990-3-4', 'Changsha, Hunan', 1),
    (1002, 'Ren Woxing', 1, '1992-2-2', 'Changsha, Hunan', 1),
    (1033, 'Wang Yuyan', 0, '1989-12-3', 'Chengdu, Sichuan', 1),
    (1572, 'Yue Buqun', 1, '1993-7-19', 'Xianyang, Shaanxi', 1),
    (1378, 'Ji Yanran', 0, '1995-8-12', 'Mianyang, Sichuan', 1),
    (1954, 'Lin Pingzhi', 1, '1994-9-20', 'Putian, Fujian', 1),
    (2035, 'Dongfang Bubai', 1, '1988-6-30', null, 2),
    (3011, 'Lin Zhennan', 1, '1985-12-12', 'Putian, Fujian', 3),
    (3755, 'Xiang Shaolong', 1, '1993-1-25', null, 3),
    (3923, 'Yang Buhui', 0, '1985-4-17', 'Chengdu, Sichuan', 3);

-- Insert teacher data
insert into `tb_teacher` 
    (`tea_id`, `tea_name`, `tea_title`, `col_id`) 
values 
    (1122, 'Zhang Sanfeng', 'Professor', 1),
    (1133, 'Song Yuanqiao', 'Associate Professor', 1),
    (1144, 'Yang Xiao', 'Associate Professor', 1),
    (2255, 'Fan Yao', 'Associate Professor', 2),
    (3366, 'Wei Yixiao', default, 3);

-- Insert course data
insert into `tb_course` 
    (`cou_id`, `cou_name`, `cou_credit`, `tea_id`) 
values 
    (1111, 'Python Programming', 3, 1122),
    (2222, 'Web Frontend Development', 2, 1122),
    (3333, 'Operating Systems', 4, 1122),
    (4444, 'Computer Networks', 2, 1133),
    (5555, 'Compiler Principles', 4, 1144),
    (6666, 'Algorithms and Data Structures', 3, 1144),
    (7777, 'Business French', 3, 2255),
    (8888, 'Cost Accounting', 2, 3366),
    (9999, 'Auditing', 3, 3366);

-- Insert course-selection data
insert into `tb_record` 
    (`sid`, `cid`, `sel_date`, `score`) 
values 
    (1001, 1111, '2017-09-01', 95),
    (1001, 2222, '2017-09-01', 87.5),
    (1001, 3333, '2017-09-01', 100),
    (1001, 4444, '2018-09-03', null),
    (1001, 6666, '2017-09-02', 100),
    (1002, 1111, '2017-09-03', 65),
    (1002, 5555, '2017-09-01', 42),
    (1033, 1111, '2017-09-03', 92.5),
    (1033, 4444, '2017-09-01', 78),
    (1033, 5555, '2017-09-01', 82.5),
    (1572, 1111, '2017-09-02', 78),
    (1378, 1111, '2017-09-05', 82),
    (1378, 7777, '2017-09-02', 65.5),
    (2035, 7777, '2018-09-03', 88),
    (2035, 9999, '2019-09-02', null),
    (3755, 1111, '2019-09-02', null),
    (3755, 8888, '2019-09-02', null),
    (3755, 9999, '2017-09-01', 92);
