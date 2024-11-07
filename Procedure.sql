create or replace procedure grademark(m IN int,g OUT varchar)
as 
begin
if m<=1500 and m>=990 then
g:='Dist';
elsif m<=989 and m>=900 then
g:='First';
elsif m<=899 and m>=825 then
g:='Second';
else
g:='Fail';
end if;
end;
/
declare
r int;
n varchar(20);
m int;
g varchar(20);
begin r:=&r;
select rollno,name,mark into r,n,m from student1 where rollno=r;
grademark(m,g);
insert into grade1 values(r,n,g);
Exception
when NO_DATA_FOUND then
dbms_output.put_line('invalid rollno');
end;
/


SQL>  create table student1(rollno int, name varchar(20),mark int);

Table created.

SQL> create table grade1(rollno int, name varchar(20),grade varchar(20));

Table created.

SQL> insert into student1 values(1,'adi',1500);

1 row created.
c
SQL> insert into student1 values(2,'rasd',955);

1 row created.

SQL> insert into student1 values(3,'mahi',852);

1 row created.