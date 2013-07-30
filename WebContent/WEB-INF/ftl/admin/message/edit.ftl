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
						<td><@spring.message "message.model.title"/></td>
						<td>${message.title}</td>
					</tr>
					<tr>
						<td><@spring.message "message.model.content"/></td>
						<td>${message.content}</td>
					</tr>
				</table>
				<legend></legend>
				<form class="" action="/admin/messageCenter/create">
					<div class="control-group">
						<label class="control-label"><@spring.message "message.model.title"/></label>
						<div class="controls">
							<input type="text" name="title" placeholder="title">
							<input type="hidden" name="messageId" value="${message.id}">
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "message.model.content"/></label>
						<div class="controls">
							<textarea class="field span9" rows="8" name="content"></textarea>
					    </div>
					</div>
					<button type="submit" class="btn btn-primary"><@spring.message "button.submit"/></button
				</form>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>