[TOC]

#  JBPM数据库表

## 与部署对象和流程定义相关的表

### 部署对象表

```sql
mysql> desc jbpm4_deployment;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| DBID_      | bigint       | NO   | PRI | NULL    |       |
| NAME_      | longtext     | YES  |     | NULL    |       |
| TIMESTAMP_ | bigint       | YES  |     | NULL    |       |
| STATE_     | varchar(255) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
-------------------------------华丽的分割线-------------------------------------
select * from jbpm4_deployment;
//结果
+-------+-------+------------+--------+
| DBID_ | NAME_ | TIMESTAMP_ | STATE_ |
+-------+-------+------------+--------+
|     1 | NULL  |          0 | active |
| 20001 | NULL  |          0 | active |
| 60001 | NULL  |          0 | active |
| 70001 | NULL  |          0 | active |
| 80001 | NULL  |          0 | active |
+-------+-------+------------+--------+
```
### 流程定义表

````sql
mysql> desc jbpm4_deployprop;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| DBID_       | bigint       | NO   | PRI | NULL    |       |
| DEPLOYMENT_ | bigint       | YES  | MUL | NULL    |       |
| OBJNAME_    | varchar(255) | YES  |     | NULL    |       |
| KEY_        | varchar(255) | YES  |     | NULL    |       |
| STRINGVAL_  | varchar(255) | YES  |     | NULL    |       |
| LONGVAL_    | bigint       | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)
-------------------------------华丽的分割线-------------------------------------
select * from jbpm4_deployprop;
//结果：
+-------+-------------+------------+-----------+--------------+----------+
| DBID_ | DEPLOYMENT_ | OBJNAME_   | KEY_      | STRINGVAL_   | LONGVAL_ |
+-------+-------------+------------+-----------+--------------+----------+
|     4 |           1 | helloworld | langid    | jpdl-4.4     |     NULL |
|     5 |           1 | helloworld | pdid      | helloworld-1 |     NULL |
|     6 |           1 | helloworld | pdkey     | helloworld   |     NULL |
|     7 |           1 | helloworld | pdversion | NULL         |        1 |
| 80004 |       80001 | helloworld | langid    | jpdl-4.4     |     NULL |
| 80005 |       80001 | helloworld | pdid      | helloworld-2 |     NULL |
| 80006 |       80001 | helloworld | pdkey     | helloworld   |     NULL |
| 80007 |       80001 | helloworld | pdversion | NULL         |        2 |
+-------+-------------+------------+-----------+--------------+----------+
````

### 存放资源文件表

````sql
mysql> desc jbpm4_lob;
+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| DBID_       | bigint   | NO   | PRI | NULL    |       |
| DBVERSION_  | int      | NO   |     | NULL    |       |
| BLOB_VALUE_ | longblob | YES  |     | NULL    |       |
| DEPLOYMENT_ | bigint   | YES  | MUL | NULL    |       |
| NAME_       | longtext | YES  |     | NULL    |       |
+-------------+----------+------+-----+---------+-------+
5 rows in set (0.00 sec)
````

## 与执行对象相关的表

### 正在执行的执行对象表（流程实例表）

````sql
mysql> desc jbpm4_execution;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| DBID_          | bigint       | NO   | PRI | NULL    |       |
| CLASS_         | varchar(255) | NO   |     | NULL    |       |
| DBVERSION_     | int          | NO   |     | NULL    |       |
| ACTIVITYNAME_  | varchar(255) | YES  |     | NULL    |       |
| PROCDEFID_     | varchar(255) | YES  |     | NULL    |       |
| HASVARS_       | bit(1)       | YES  |     | NULL    |       |
| NAME_          | varchar(255) | YES  |     | NULL    |       |
| KEY_           | varchar(255) | YES  |     | NULL    |       |
| ID_            | varchar(255) | YES  | UNI | NULL    |       |
| STATE_         | varchar(255) | YES  |     | NULL    |       |
| SUSPHISTSTATE_ | varchar(255) | YES  |     | NULL    |       |
| PRIORITY_      | int          | YES  |     | NULL    |       |
| HISACTINST_    | bigint       | YES  |     | NULL    |       |
| PARENT_        | bigint       | YES  | MUL | NULL    |       |
| INSTANCE_      | bigint       | YES  | MUL | NULL    |       |
| SUPEREXEC_     | bigint       | YES  | MUL | NULL    |       |
| SUBPROCINST_   | bigint       | YES  | MUL | NULL    |       |
| PARENT_IDX_    | int          | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
18 rows in set (0.00 sec)
````

### 流程实例的历史表

````sql
mysql> desc JBPM4_HIST_PROCINST;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| DBID_        | bigint       | NO   | PRI | NULL    |       |
| DBVERSION_   | int          | NO   |     | NULL    |       |
| ID_          | varchar(255) | YES  |     | NULL    |       |
| PROCDEFID_   | varchar(255) | YES  |     | NULL    |       |
| KEY_         | varchar(255) | YES  |     | NULL    |       |
| START_       | datetime     | YES  |     | NULL    |       |
| END_         | datetime     | YES  |     | NULL    |       |
| DURATION_    | bigint       | YES  |     | NULL    |       |
| STATE_       | varchar(255) | YES  |     | NULL    |       |
| ENDACTIVITY_ | varchar(255) | YES  |     | NULL    |       |
| NEXTIDX_     | int          | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
11 rows in set (0.01 sec)
````

````sql
mysql> select * from JBPM4_HIST_PROCINST;
+-------+------------+------------------+--------------+------+---------------------+------+-----------+--------+--------------+----------+
| DBID_ | DBVERSION_ | ID_              | PROCDEFID_   | KEY_ | START_              | END_ | DURATION_ | STATE_ | ENDACTIVITY_ | NEXTIDX_ |
+-------+------------+------------------+--------------+------+---------------------+------+-----------+--------+--------------+----------+
| 10001 |          0 | helloworld.10001 | helloworld-1 | NULL | 2021-02-17 21:33:26 | NULL |      NULL | active | NULL         |        1 |
| 30001 |          0 | helloworld.30001 | helloworld-1 | NULL | 2021-02-17 21:44:38 | NULL |      NULL | active | NULL         |        1 |
| 90001 |          0 | helloworld.90001 | helloworld-2 | NULL | 2021-02-18 12:58:45 | NULL |      NULL | active | NULL         |        1 |
+-------+------------+------------------+--------------+------+---------------------+------+-----------+--------+--------------+----------+
3 rows in set (0.00 sec)
````

## 与任务相关表

### 正在执行的任务表

````sql
mysql> desc jbpm4_task;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| DBID_          | bigint       | NO   | PRI | NULL    |       |
| CLASS_         | char(1)      | NO   |     | NULL    |       |
| DBVERSION_     | int          | NO   |     | NULL    |       |
| NAME_          | varchar(255) | YES  |     | NULL    |       |
| DESCR_         | longtext     | YES  |     | NULL    |       |
| STATE_         | varchar(255) | YES  |     | NULL    |       |
| SUSPHISTSTATE_ | varchar(255) | YES  |     | NULL    |       |
| ASSIGNEE_      | varchar(255) | YES  |     | NULL    |       |
| FORM_          | varchar(255) | YES  |     | NULL    |       |
| PRIORITY_      | int          | YES  |     | NULL    |       |
| CREATE_        | datetime     | YES  |     | NULL    |       |
| DUEDATE_       | datetime     | YES  |     | NULL    |       |
| PROGRESS_      | int          | YES  |     | NULL    |       |
| SIGNALLING_    | bit(1)       | YES  |     | NULL    |       |
| EXECUTION_ID_  | varchar(255) | YES  |     | NULL    |       |
| ACTIVITY_NAME_ | varchar(255) | YES  |     | NULL    |       |
| HASVARS_       | bit(1)       | YES  |     | NULL    |       |
| SUPERTASK_     | bigint       | YES  | MUL | NULL    |       |
| EXECUTION_     | bigint       | YES  |     | NULL    |       |
| PROCINST_      | bigint       | YES  |     | NULL    |       |
| SWIMLANE_      | bigint       | YES  | MUL | NULL    |       |
| TASKDEFNAME_   | varchar(255) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
22 rows in set (0.00 sec)
````



````sql
mysql> select * from jbpm4_task;
+-------+--------+------------+-----------------------+--------+--------+----------------+-----------+-------+-----------+---------------------+----------+-----------+--------------------------+------------------+-----------------------+--------------------+------------+------------+-----------+-----------+-----------------------+
| DBID_ | CLASS_ | DBVERSION_ | NAME_                 | DESCR_ | STATE_ | SUSPHISTSTATE_ | ASSIGNEE_ | FORM_ | PRIORITY_ | CREATE_             | DUEDATE_ | PROGRESS_ | SIGNALLING_              | EXECUTION_ID_    | ACTIVITY_NAME_        | HASVARS_           | SUPERTASK_ | EXECUTION_ | PROCINST_ | SWIMLANE_ | TASKDEFNAME_          |
+-------+--------+------------+-----------------------+--------+--------+----------------+-----------+-------+-----------+---------------------+----------+-----------+--------------------------+------------------+-----------------------+--------------------+------------+------------+-----------+-----------+-----------------------+
| 10002 | T      |          1 | 提交申请              | NULL   | open   | NULL           | 员工      | NULL  |         0 | 2021-02-17 21:33:26 | NULL     |      NULL | 0x01                     | helloworld.10001 | 提交申请              | 0x00               |       NULL |      10001 |     10001 |      NULL | 提交申请              |
| 50001 | T      |          1 | 审批「总经理」        | NULL   | open   | NULL           | 总经理    | NULL  |         0 | 2021-02-17 21:52:13 | NULL     |      NULL | 0x01                     | helloworld.30001 | 审批「总经理」        | 0x00               |       NULL |      30001 |     30001 |      NULL | 审批「总经理」        |
| 90002 | T      |          1 | 提交申请              | NULL   | open   | NULL           | 员工      | NULL  |         0 | 2021-02-18 12:58:45 | NULL     |      NULL | 0x01                     | helloworld.90001 | 提交申请              | 0x00               |       NULL |      90001 |     90001 |      NULL | 提交申请              |
+-------+--------+------------+-----------------------+--------+--------+----------------+-----------+-------+-----------+---------------------+----------+-----------+--------------------------+------------------+-----------------------+--------------------+------------+------------+-----------+-----------+-----------------------+
3 rows in set (0.00 sec)
````



### 任务的历史表

````sql
mysql> desc JBPM4_HIST_TASK;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| DBID_      | bigint       | NO   | PRI | NULL    |       |
| DBVERSION_ | int          | NO   |     | NULL    |       |
| EXECUTION_ | varchar(255) | YES  |     | NULL    |       |
| OUTCOME_   | varchar(255) | YES  |     | NULL    |       |
| ASSIGNEE_  | varchar(255) | YES  |     | NULL    |       |
| PRIORITY_  | int          | YES  |     | NULL    |       |
| STATE_     | varchar(255) | YES  |     | NULL    |       |
| CREATE_    | datetime     | YES  |     | NULL    |       |
| END_       | datetime     | YES  |     | NULL    |       |
| DURATION_  | bigint       | YES  |     | NULL    |       |
| NEXTIDX_   | int          | YES  |     | NULL    |       |
| SUPERTASK_ | bigint       | YES  | MUL | NULL    |       |
+------------+--------------+------+-----+---------+-------+
12 rows in set (0.00 sec)
````

````sql
mysql> select * from JBPM4_HIST_TASK;
+-------+------------+------------------+-------------------------------------+--------------+-----------+-----------+---------------------+---------------------+-----------+----------+------------+
| DBID_ | DBVERSION_ | EXECUTION_       | OUTCOME_                            | ASSIGNEE_    | PRIORITY_ | STATE_    | CREATE_             | END_                | DURATION_ | NEXTIDX_ | SUPERTASK_ |
+-------+------------+------------------+-------------------------------------+--------------+-----------+-----------+---------------------+---------------------+-----------+----------+------------+
| 10002 |          0 | helloworld.10001 | NULL                                | 员工         |         0 | NULL      | 2021-02-17 21:33:26 | NULL                |         0 |        1 |       NULL |
| 30002 |          1 | helloworld.30001 | jbpm_no_task_outcome_specified_jbpm | 员工         |         0 | completed | 2021-02-17 21:44:38 | 2021-02-17 21:51:25 |    406571 |        1 |       NULL |
| 40001 |          1 | helloworld.30001 | jbpm_no_task_outcome_specified_jbpm | 部门经理     |         0 | completed | 2021-02-17 21:51:25 | 2021-02-17 21:52:13 |     47662 |        1 |       NULL |
| 50001 |          0 | helloworld.30001 | NULL                                | 总经理       |         0 | NULL      | 2021-02-17 21:52:13 | NULL                |         0 |        1 |       NULL |
| 90002 |          0 | helloworld.90001 | NULL                                | 员工         |         0 | NULL      | 2021-02-18 12:58:45 | NULL                |         0 |        1 |       NULL |
+-------+------------+------------------+-------------------------------------+--------------+-----------+-----------+---------------------+---------------------+-----------+----------+------------+
5 rows in set (0.00 sec)
````



### 存放流程变量表

````sql
mysql> SELECT * FROM JBPM4_VARIABLE;
+-------+--------+------------+--------+------------+--------------+------------+-------+------+-------------+---------------+------------+-------------+---------------+-------------+---------+
| DBID_ | CLASS_ | DBVERSION_ | KEY_   | CONVERTER_ | HIST_        | EXECUTION_ | TASK_ | LOB_ | DATE_VALUE_ | DOUBLE_VALUE_ | CLASSNAME_ | LONG_VALUE_ | STRING_VALUE_ | TEXT_VALUE_ | EXESYS_ |
+-------+--------+------------+--------+------------+--------------+------------+-------+------+-------------+---------------+------------+-------------+---------------+-------------+---------+
| 40001 | long   |          0 | 请假   | int-long   | 0x00         |      20001 |  NULL | NULL | NULL        |          NULL | NULL       |           3 | NULL          | NULL        |    NULL |
+-------+--------+------------+--------+------------+--------------+------------+-------+------+-------------+---------------+------------+-------------+---------------+-------------+---------+
1 row in set (0.00 sec)
````

````SQL
mysql> desc jbpm4_variable;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| DBID_         | bigint       | NO   | PRI | NULL    |       |
| CLASS_        | varchar(255) | NO   |     | NULL    |       |
| DBVERSION_    | int          | NO   |     | NULL    |       |
| KEY_          | varchar(255) | YES  |     | NULL    |       |
| CONVERTER_    | varchar(255) | YES  |     | NULL    |       |
| HIST_         | bit(1)       | YES  |     | NULL    |       |
| EXECUTION_    | bigint       | YES  | MUL | NULL    |       |
| TASK_         | bigint       | YES  | MUL | NULL    |       |
| LOB_          | bigint       | YES  | MUL | NULL    |       |
| DATE_VALUE_   | datetime     | YES  |     | NULL    |       |
| DOUBLE_VALUE_ | double       | YES  |     | NULL    |       |
| CLASSNAME_    | varchar(255) | YES  |     | NULL    |       |
| LONG_VALUE_   | bigint       | YES  |     | NULL    |       |
| STRING_VALUE_ | varchar(255) | YES  |     | NULL    |       |
| TEXT_VALUE_   | longtext     | YES  |     | NULL    |       |
| EXESYS_       | bigint       | YES  | MUL | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
16 rows in set (0.00 sec)
````



### 组任务

````sql
mysql> select * from JBPM4_PARTICIPATION;
+--------+------------+----------+---------+-----------+--------+-----------+
| DBID_  | DBVERSION_ | GROUPID_ | USERID_ | TYPE_     | TASK_  | SWIMLANE_ |
+--------+------------+----------+---------+-----------+--------+-----------+
| 160010 |          0 | NULL     | 大大    | candidate | 160009 |      NULL |
| 160011 |          0 | NULL     | 小小    | candidate | 160009 |      NULL |
| 160012 |          0 | NULL     | 中中    | candidate | 160009 |      NULL |
+--------+------------+----------+---------+-----------+--------+-----------+
3 rows in set (0.00 sec)
````











