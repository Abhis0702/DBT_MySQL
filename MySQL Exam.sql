/*
230945920031



Section 1

Q.1 select *, monthname(hiredate) Month from emp order by monthname(hiredate);

Q.2

Q.3 select M.Avg 'Manager Avg',M.Max'Manager Max',M.Min'Manager Min', C.Avg'Clerk Avg',C.Max'Clerk Max',C.Min'Clerk Min' from (select floor(avg(sal))Avg, max(sal)Max, min(sal)Min from emp where job='Manager')M ,(select floor(avg(sal))Avg,max(sal)Max, min(sal)Min from emp where job='clerk')C;

Q.4 select job, count(job)Count from emp group by job having Count=1;

Q.5 select min(sal)'2nd Lowest Sal' from emp where sal>(select min(sal) Min from emp);

Q.6 select ename, job, sal, ifnull(comm, 'No Commision') from emp;

Q.7 select deptno,floor(avg(sal))'Average Sal'from emp where deptno in(select deptno from emp group by deptno having count(deptno)>3) group by deptno;

Q.8 select ename, sal from emp where sal>(select sal from emp where ename= 'ADAMS');

Q.9

Q.10 select year(hiredate)Year, count(year(hiredate))Count from emp group by hiredate having Count=8;



Section 2

Q.1 

drop procedure if exists emp;
delimiter $
create procedure emp()
BEGIN
declare _empno,_mgr,_sal,_comm,_deptno,_bonusid int;
declare _ename,_job,_username,_pwd,_phone varchar(50);
declare _gender char(1);
declare _hiredate date;
declare _isActive tinyint(1);

declare c1 cursor for select * from emp;
open c1;
	l:LOOP		
		fetch c1 into _empno,_ename,_gender,_job,_mgr,_hiredate,_sal,_comm,_deptno,_bonusid,_username,_pwd,_phone,_isActive;
		select _empno,_ename,_gender,_job,_mgr,_hiredate,_sal,_comm,_deptno,_bonusid,_username,_pwd,_phone,_isActive;		
	end loop l;
close c1;

end $
delimiter ;



Q.2 */


drop function if exists myAutoNumber;
delimiter $
create function myAutoNumber(_namefirst varchar(20),_namelast varchar(20)) returns int
deterministic
begin 
	declare x int;
	declare flag bool;
	set x:=(select max(studentID)+1 from student1);
	return x;
	select true into flag from student1 where namefirst=_namefirst and namelast=_namelast;
	if flag then 
		select 'Student exists';
	else 
		return x;
		insert into student1(studentID) values(x);
		
	end if;
end $
delimiter ;