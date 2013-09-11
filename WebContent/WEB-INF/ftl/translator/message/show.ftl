<#include "/translator/common/template-head.ftl">
<#include "/translator/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/translator/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend>${message.title}</legend>
				<table class="table">
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
	<#include "/translator/common/template-bottom.ftl">
</div>