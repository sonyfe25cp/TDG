<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				<h3>恭喜注册成功</h3>
				<p>注册邮箱为 : ${customer.email}</p>
				<p>密码是 : ${customer.password}</p>
			</div>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl">
</div>