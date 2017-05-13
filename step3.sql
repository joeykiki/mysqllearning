
-- 3-1.把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）写出MySQL语句。
select * from peoples where school != 'GDUFS';

-- 3-2.查找计算机系每次考试学生的平均成绩(最终显示考试名称, 平均分)。
select exam ,avg(grade) 
from students left join exam 
on students.ID = exam.student_ID
where dept_name='computer'
group by exam;  

-- 3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）。

select name,avg(grade) 
from students left join exam
on students.ID = exam.student_ID
where sex='f'
group by name ;
#avg(grade)=80 or avg(grade)>80

-- 3-4.找出人数最少的院系以及其年度预算。
 
select department.dept_name,budget,count(department.dept_name) 
from students left join department 
on students.dept_name = department.dept_name
group by department.dept_name ;
#where count(department.dept_name) = (select min(count(department.dept_name))from department); 

-- 3-5.计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句。

update department  set dept_name ='comp.sci' where dept_name = 'computer';

-- 3-6.修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）。

update department set T1.budget = T1.budget + max(T2.ID)*2000

-- 3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.

select avg(budget) 
from department left join students
on students.dept_name = department.dept_name;

insert into department values('avg_budget',NULL,avg(budget));

-- 3-8. 删除计算机系中考试成绩平均分低于70的学生.

delete from students left join exam 
on students.ID = exam.student_ID
where dept_name='computer' and avg(grade)<70
group by name;  

-- 3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.

select * 
from (select name from students left join exam 
on students.ID = exam.student_ID
where emotion_state='loving'
group by name) as T;

update students left join T on students.name = T.name set emotion_state='single';
 
-- 3-10(选做). 对每个学生, 往exam表格中插入名为Avg_Exam的考试, 考试分数为之前学生参加过考试的平均分.
