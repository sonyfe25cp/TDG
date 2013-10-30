<#include "/admin/common/template-head.ftl">
<div class="container">
<div class="container-fluid">
	<div class="row-fluid">
	    <div class="span3">
			<#include "/admin/common/left-nav.ftl">
		</div>
		<div class="span9">
			<p>新管理员创建成功</p>
			<table class="table">
				<tr>
					<td><@spring.message "admin.model.email"/></td>
					<td>${admin.email}</td>
				</tr>
				<tr>
					<td><@spring.message "admin.model.password"/></td>
					<td>${admin.password}</td>
				</tr>
			</table>
			<span>说明：创建的管理员账号默认密码为123123，请创建成功后自行修改密码</span>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">