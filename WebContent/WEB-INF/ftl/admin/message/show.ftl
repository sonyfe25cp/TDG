<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend>${message.title}</legend>
				<table class="table">
					<tr>
						<td>发信人</td>
						<td>
							<#if message.userType == 'seller'>
								商户：<a href="/admin/accounts/sellers/${message.userId}">${message.userId}</a>
							<#elseif message.userType == 'customer'>
								用户：<a href="/admin/accounts/customers/${message.userId}">${message.userId}</a>
							<#elseif message.userType == 'translator'>
								翻译人员：${message.userId}</a>
							</#if>
						</td>
					</tr>
					<tr>
						<td><@spring.message "message.model.title"/></td>
						<td>${message.title}</td>
					</tr>
					<tr>
						<td><@spring.message "message.model.content"/></td>
						<td>${message.content}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>