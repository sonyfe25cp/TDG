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

4. 配置自增起始数：

	alter table seller AUTO_INCREMENT = 10000;
	
	alter table customer AUTO_INCREMENT= 10000;
	
	alter table product AUTO_INCREMENT = 1000000;
	
	alter table item AUTO_INCREMENT = 1000000;

===淘宝配置===

1. Api = 21575152
Secret: c842db834eb1e7789a0b7ca770c810c6
callback: http://tdg.omartech.com/taobao/callback