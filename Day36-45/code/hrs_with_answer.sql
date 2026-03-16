drop database if exists hrs;
create database hrs default charset utf8mb4;

use hrs;

create table tb_dept
(
dno int not null comment 'id',
dname varchar(10) not null comment 'name',
dloc varchar(20) not null comment 'location',
primary key (dno)
);

insert into tb_dept values 
    (10, 'Accounting', 'Beijing'),
    (20, 'R&D', 'Chengdu'),
    (30, 'Sales', 'Chongqing'),
    (40, 'Operations', 'Shenzhen');

create table tb_emp
(
eno int not null comment 'employee id',
ename varchar(20) not null comment 'employee name',
job varchar(20) not null comment 'job title',
mgr int comment 'manager id',
sal int not null comment 'monthly salary',
comm int comment 'monthly allowance',
dno int comment 'department id',
primary key (eno),
foreign key (dno) references tb_dept (dno)
);

-- alter table tb_emp add constraint pk_emp_eno primary key (eno);
-- alter table tb_emp add constraint uk_emp_ename unique (ename);
-- alter table tb_emp add constraint fk_emp_mgr foreign key (mgr) references tb_emp (eno);
-- alter table tb_emp add constraint fk_emp_dno foreign key (dno) references tb_dept (dno);

insert into tb_emp values 
    (7800, 'Zhang Sanfeng', 'President', null, 9000, 1200, 20),
    (2056, 'Qiao Feng', 'Analyst', 7800, 5000, 1500, 20),
    (3088, 'Li Mochou', 'Designer', 2056, 3500, 800, 20),
    (3211, 'Zhang Wuji', 'Programmer', 2056, 3200, null, 20),
    (3233, 'Qiu Chuji', 'Programmer', 2056, 3400, null, 20),
    (3251, 'Zhang Cuishan', 'Programmer', 2056, 4000, null, 20),
    (5566, 'Song Yuanqiao', 'Accountant', 7800, 4000, 1000, 10),
    (5234, 'Guo Jing', 'Cashier', 5566, 2000, null, 10),
    (3344, 'Huang Rong', 'Sales Manager', 7800, 3000, 800, 30),
    (1359, 'Hu Yidao', 'Sales Representative', 3344, 1800, 200, 30),
    (4466, 'Miao Renfeng', 'Sales Representative', 3344, 2500, null, 30),
    (3244, 'Ouyang Feng', 'Programmer', 3088, 3200, null, 20),
    (3577, 'Yang Guo', 'Accountant', 5566, 2200, null, 10),
    (3588, 'Zhu Jiuzhen', 'Accountant', 5566, 2500, null, 10);


-- Query the name and monthly salary of the highest-paid employee
select ename, sal from tb_emp where sal=(select max(sal) from tb_emp);

select ename, sal from tb_emp where sal>=all(select sal from tb_emp);

-- Query employee names and annual compensation ((monthly salary + allowance) * 13)
select ename, (sal+ifnull(comm,0))*13 as ann_sal from tb_emp order by ann_sal desc;

-- Query department ids and headcounts for departments that have employees
select dno, count(*) as total from tb_emp group by dno;

-- Query the names and headcounts of all departments
select dname, ifnull(total,0) as total from tb_dept left join 
(select dno, count(*) as total from tb_emp group by dno) tb_temp 
on tb_dept.dno=tb_temp.dno;

-- Query the name and monthly salary of the highest-paid employee excluding the boss
select ename, sal from tb_emp where sal=(
	select max(sal) from tb_emp where mgr is not null
);

-- Query the name and monthly salary of the employee with the second-highest salary
select ename, sal from tb_emp where sal=(
	select distinct sal from tb_emp order by sal desc limit 1,1
);

select ename, sal from tb_emp where sal=(
	select max(sal) from tb_emp where sal<(select max(sal) from tb_emp)
);

-- Query the names and monthly salaries of employees earning above the average salary
select ename, sal from tb_emp where sal>(select avg(sal) from tb_emp);

-- Query employees whose salary is above their department average, with name, department id, and salary
select ename, t1.dno, sal from tb_emp t1 inner join 
(select dno, avg(sal) as avg_sal from tb_emp group by dno) t2
on t1.dno=t2.dno and sal>avg_sal;

-- Query the highest-paid person in each department with name, salary, and department name
select ename, sal, dname 
from tb_emp t1, tb_dept t2, (
	select dno, max(sal) as max_sal from tb_emp group by dno
) t3 where t1.dno=t2.dno and t1.dno=t3.dno and sal=max_sal;

-- Query the names and job titles of managers
-- Hint: avoid overusing in/not in and distinct
-- You can use existence checks (exists/not exists) instead of set operations and deduplication
select ename, job from tb_emp where eno in (
	select distinct mgr from tb_emp where mgr is not null
);

select ename, job from tb_emp where eno=any(
	select distinct mgr from tb_emp where mgr is not null
);

select ename, job from tb_emp t1 where exists (
	select 'x' from tb_emp t2 where t1.eno=t2.mgr
);

-- MySQL 8 provides window functions: row_number() / rank() / dense_rank()
-- Query the ranking, name, and monthly salary of employees ranked 4th to 6th by salary
select ename, sal from tb_emp order by sal desc limit 3,3;

select row_num, ename, sal from 
(select @a:=@a+1 as row_num, ename, sal 
from tb_emp, (select @a:=0) t1 order by sal desc) t2 
where row_num between 4 and 6;

-- Window functions are better suited to offline analytics than transactional business databases
select 
	ename, sal, 
	row_number() over (order by sal desc) as row_num,
    rank() over (order by sal desc) as ranking,
    dense_rank() over (order by sal desc) as dense_ranking
from tb_emp limit 3 offset 3;

select ename, sal, ranking from (
	select ename, sal, dense_rank() over (order by sal desc) as ranking from tb_emp
) tb_temp where ranking between 4 and 6;

-- Window functions are mainly used to solve Top-N query problems
-- Query the top two earners in each department with name, salary, and department id
select ename, sal, dno from (
	select ename, sal, dno, rank() over (partition by dno order by sal desc) as ranking
	from tb_emp
) tb_temp where ranking<=2;

select ename, sal, dno from tb_emp t1 
where (select count(*) from tb_emp t2 where t1.dno=t2.dno and t2.sal>t1.sal)<2 
order by dno asc, sal desc;
