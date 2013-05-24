TDG(Taobao Dai Gou)

===

You can treat this project as a simple ERP(Enterprise Resource Planning) system.

simple product management repo with taobao api and paypel api

===开源项目使用情况===

SpringFramework 3.2.2 + SpringMVC + MyBatis 3.2.2 + freemarker + mysql

===MySql 配置===

1. create user 'tdg'@'%' IDENTIFIED by '';

2. GRANT ALL  ON tdg.* TO 'tdg'@'%';

3. 导入各个表请使用 source doc/tdg.sql