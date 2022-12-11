use education5;

--1
select * from subject; 

--2
select * from institute;

--3
select DISTINCT Stipendia from student

--4
select course from student group by course; 

--5
select Family,Name,Last_name from student order by family,name,last_name,birthday; 

--6
select Family,course,birthday from student order by course, birthday DESC; 

--7
select Lect_id,Family, Name,Last_name from lecturer; 

--8
select * from student where stipendia>0 order by stipendia DESC, family ;

--9
select * from student where course='1' order by family; 

--10
select * from student where course = '3' or course = '2' 

--11
select * from student where not (course ='1' or  course ='3'); 
select * from student where course <>'1' and  course <>'3';

--12
select DISTINCT subj_id, subj_name, mark from subject, exam where mark = 5 

--13
select DISTINCT subject.subj_id, subject.subj_name, knowledge.hour, exam.mark from subject 
join knowledge on knowledge.subj_id = subject.subj_id
join nagruzka on nagruzka.kvant_id = knowledge.kvant_id
join lecturer on nagruzka.lect_id = lecturer.lect_id
join exam on nagruzka.nagr_id = exam.nagr_id 
where mark = 2

--14
select student.family, student.name, student.last_name, subj_name  from student
join parents on student.student_id = parents.student_id
join town on parents.town_id = town.town_id
join exam on exam.student_id = student.student_id
join nagruzka on exam.nagr_id = nagruzka.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
where town_name = 'Березовский' and subj_name = 'Экономика'

--15
select DISTINCT student.family, student.name, student.last_name, subj_name, mark from student
join exam on exam.student_id = student.student_id
join nagruzka on exam.nagr_id = nagruzka.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
order by subj_name, mark DESC, student.family

--16
select DISTINCT student.family, student.name, student.last_name, subj_name, mark from student
join exam on exam.student_id = student.student_id
join nagruzka on exam.nagr_id = nagruzka.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
where mark = 2 and subj_name = 'Высшая математика'
order by family

--17
select DISTINCT student.family,student.name,student.last_name,town.town_name, name_medal from student
join parents on student.student_id = parents.student_id
join town on parents.town_id = town.town_id
join medalist on medalist.student_id = student.student_id
join medali on medali.medal_id = medalist.medal_id
where name_medal='золотая'
order by family

--18
select student.family,subject.subj_name, exam.exam_date from student
join exam on exam.student_id = student.student_id
join nagruzka on exam.nagr_id = nagruzka.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
where mark = 2
order by subj_name, family

--19
select student.family, student.name, student.last_name, exam_date, mark from student
join exam on exam.student_id = student.student_id
join nagruzka on exam.nagr_id = nagruzka.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
where mark = 2 and (exam_date = '24.05.2019' or exam_date = '13.06.2019')

--20
select student.family,lecturer.family,subject.subj_name, exam_date, mark from student
join exam on exam.student_id = student.student_id
join nagruzka on exam.nagr_id = nagruzka.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
join lecturer on lecturer.lect_id = nagruzka.lect_id
where mark = 5

--21
select DISTINCT inst_name,hour,mark from student
join exam on exam.student_id = student.student_id
join nagruzka on exam.nagr_id = nagruzka.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
join lecturer on lecturer.lect_id = nagruzka.lect_id
join institute on lecturer.lect_id = institute.inst_id
where hour > 80 and mark = 2

--------------2
select distinct SIN(stipendia) as SinFromStipendia from student 

select distinct FLOOR(15.15) as Floor

select distinct CEILING(321.5) as Ceiling

select distinct EXP(stipendia) as ExpFromStipendia from student 

select distinct SQRT(stipendia) as SqrtFromStipendia from student where stipendia >0

select distinct ROUND(1342.315,2) as Round 

select distinct LOG(hour,2) as LogFromHour from knowledge 

select distinct LOG10(hour) as Log10FromHour from knowledge 

--------------3
select family+' '+name from student

select family, CHARINDEX('ева',family)  from student

select LEFT(family,3) from student

select REPLACE(family,'а','о') from student

select LTRIM ('  '+family) from student

select RTRIM (family+'  ') from student

select family+SPACE(5)+name from student

select SUBSTRING(family,1,5) from student

----
select CONCAT(family,LEFT(name,1),LEFT(last_name,1)) from student --3.1.1
where LEFT(family,1) = 'А'

select family + SPACE(1) + LEFT(name,1) + SPACE(1) + LEFT(last_name,1) from student --3.1.2
where LEFT(family,1) = 'А'

select family + ' ' + LEFT(name,1) + '.' + LEFT(last_name,1) from student --3.1.3
where LEFT(family,1) = 'А'

select subject.subj_name, CHARINDEX('а',subj_name) from subject --3.2

select SPACE(LEN(last_name))+lecturer.last_name+SPACE(LEN(last_name)) from lecturer --3.3

select REPLACE(subj_name, 'ик',' анчугова') from subject --3.4

select subj_name, CHARINDEX('о',subj_name)from subject --3.5

----------4
select exam_date,DATEADD(YEAR,5,exam_date) from exam

select exam_date,DATENAME(day,exam_date),DATENAME(month,exam_date), DATENAME(WEEKDAY,exam_date) from exam
----------5
select DATEDIFF(MONTH,'1996-05-03','1996-07-15') as MonthDiff
----------6
select POWER(4,2) as example1
select POWER(2,course) as example2 from student where stipendia > 0
select POWER(hour,2) as example3 from knowledge 