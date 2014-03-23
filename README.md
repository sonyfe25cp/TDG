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


===部署时注意事项===
1. productLine表必须优先内置
2. country表需要内置，修改js/customer/cart.js中默认的ChinaCode
3. product，item，seller，customer需要更改起始数目(目前设定国际地址仅接受发货国与中国，若去掉该限制，只需要将ChinaCode相关的一行干掉即可)
4. 数据库必须是utf-8，tomcat配置uriencoding=utf8
5. 目前卖家统一用美元结算，在翻译提交翻译内容时不再检测卖家是否设置货币，FinanceService-line457