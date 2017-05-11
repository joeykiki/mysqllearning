#encoding:utf-8

import MySQLdb

conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='LIUJINRU@LOVE',
    charset = "utf8",
    db='database2',
) #连接MySQL

cur = conn.cursor() #定义指向MySQL的游标

def dept_line(line):
        _result = line.decode("utf-8").strip().split(" ")#用utf-8来解码,并声明数字为int格式
        _result[2] = int(_result[2])
        return _result

with open("../mysql/university/department.txt",'r') as f:
    dept_data = [dept_line(line) for line in f.readlines()]#用dept_line函数来处理txt文件

for d in dept_data:  #插入数据
    cur.execute("insert into department(dept_name,building,budget) values('%s','%s','%s') ON DUPLICATE KEY UPDATE dept_name = VALUES(dept_name)"%(d[0],d[1],d[2]))

#同样的方法运用于students表的插入数据
def stu_line(line):
    _result = line.decode("utf-8").strip().split(" ")
    _result[0] = int(_result[0])
    _result[3] = int(_result[3])
    return _result
with open("../mysql/university/student.txt",'r') as f:
    stu_data = [stu_line(line) for line in f.readlines()]

for d1 in stu_data:
    cur.execute("insert into students(ID,name,sex,age,emotion_state,dept_name) values('%s','%s','%s','%s','%s','%s')ON DUPLICATE KEY UPDATE ID = VALUES(ID)"%(d1[0],d1[1],d1[2],d1[3],d1[4],d1[5]))

#同样的方法运用于exam表的插入数据
def ex_line(line):
    _result = line.decode("utf-8").strip().split(" ")
    _result[0] = int(_result[0])
    _result[2] = int(_result[2])
    return _result
with open("../mysql/university/exam.txt",'r') as f:
    ex_data = [ex_line(line) for line in f.readlines()]
    
for d2 in ex_data:
    cur.execute("insert into exam(student_ID,exam,grade) values('%s','%s','%s')ON DUPLICATE KEY UPDATE student_ID = VALUES(student_ID)"%(d2[0],d2[1],d2[2]))

print cur.execute("select * from exam")  #显示插入数据的数量
print cur.execute("select * from department")
print cur.execute("select * from students")
print cur.fetchall()   #显示所有的数据

conn.commit()  #提交


cur.close()  #关闭游标
conn.close()  #关闭连接


