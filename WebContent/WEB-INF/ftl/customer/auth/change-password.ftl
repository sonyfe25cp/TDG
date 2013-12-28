<#include "/customer/common/template-head.ftl"/>
<div class="row-fluid">
	<div>
		step3: 创建新密码
	</div>
	<form action="/changecustomerpassword" method="post">
		<input type="hidden" type="text" name="email" value="${email}">
		新密码: <input type="password" name="password" access="password"></input>
		重复输入新密码:<input type="password" type="text" value="" access="repassword">
		<input type="submit" value=<@spring.message "button.submit"/>>
	</form>
</div>
<#include "/customer/common/template-bottom.ftl"/>