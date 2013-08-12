<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				
				<legend><@spring.message "notice.show.${userType}"/></legend>
				<table class="table">
					<tr>
						<td><@spring.message "notice.model.content"/></td>
					</tr>
					<tr>
						<#if notice??>
							<td>${notice.content}</td>
						</#if>
					</tr>
					<tr>
						<td>
							<#if notice??>
								<a class="btn btn-primary" href="/admin/notice/edit/${userType}"><@spring.message "button.edit"/></a>
							<#else>
								<a class="btn btn-primary" href="/admin/notice/new/${userType}"><@spring.message "button.add"/></a>
							</#if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>