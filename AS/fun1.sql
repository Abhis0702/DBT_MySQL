/*drop function if exists f1;
delimiter $
create function f1() returns int
deterministic
BEGIN
	select * from dept;
	return (10);
end $
delimiter ;


drop function if exists f2;
delimiter $
create function f2(x int, y int) returns int
deterministic
BEGIN
	declare z int;
	set z:= ifnull(x,0) + ifnull(y,0);
	return z;
end $
delimiter ;


drop function if exists f3;
delimiter $
create function f3() returns int
deterministic
BEGIN
	declare z int;
	select max(deptno)+1 into z from d;
	return z;
end $
delimiter ;


drop function if exists salary1;
delimiter $
create function salary1(_dno int) returns int
deterministic
BEGIN
	declare z int;
	select sum(sal) into z from emp where deptno=_dno;
	return z;	
end $
delimiter ;

drop function if exists salary;
delimiter $
create function salary(dno int) returns int
deterministic
BEGIN
	declare z int;
	select sum(sal) into z from emp where deptno=dno;
	return z;
end $
delimiter ;

drop function if exists autoNumber;
delimiter $
create function autoNumber() returns INTEGER
deterministic
BEGIN
	declare z int;
	select max(studentID)+1 into z from STUDENT_NEW;
	return z;
end $
delimiter ;


drop function if exists eid;
delimiter $
create function eid(email varchar(300)) returns varchar(300)
deterministic
BEGIN
declare flag bool;
select true into flag from login where email=emailID;

if flag=1 THEN
return (select concat(username,"  ",password) from login where email=emailID);

ELSE
return ("Emloyee Not Exists");

end if;

end $
delimiter ;


drop function if exists accept;
delimiter $
create function accept(x int) returns INTEGER
deterministic
BEGIN
	declare z int;
	select sum(marks) into z from student_qualifications
	where name in(10,12,'BE') and studentID in(x);
	return z;
end $
delimiter ;
*/

