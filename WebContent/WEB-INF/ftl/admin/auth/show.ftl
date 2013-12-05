<#include "/admin/common/template-head.ftl">
<div class="container">
<div class="container-fluid">
	<div class="row-fluid">
	    <div class="span3">
			<#include "/admin/common/left-nav.ftl">
		</div>
		<div class="span9">
			<table class="table">
				<tr>
					<td><@spring.message "admin.model.email"/></td>
					<td>${admin.email}</td>
				</tr>
				<tr>
					<td><@spring.message "admin.model.password"/></td>
					<td>${admin.password}</td>
				</tr>
				<tr>
					<td><@spring.message "menu.options"/></td>
					<td>
						<a href="/admin/auth/new" class="btn btn-primary"><@spring.message "admin.nav.auth.new"/></a>
						<a href="/admin/auth/edit" class="btn btn-primary"><@spring.message "admin.auth.edit"/></a>
					</td>
				</tr>
			</table>
			
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">