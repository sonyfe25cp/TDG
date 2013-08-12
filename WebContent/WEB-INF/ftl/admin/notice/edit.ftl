<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend>
					<#switch userType>
						<#case admin>
							<@spring.message "notice.show.admin"/>
						<#break>
						<#case seller>
							<@spring.message "notice.show.seller"/>
						<#break>
						<#case customer>
							<@spring.message "notice.show.customer"/>
						<#break>
					</#switch> 
				</legend>
				<form class="" action="/admin/notice/update/${userType}">
					<div class="control-group">
						<label class="control-label"><@spring.message "notice.model.content"/></label>
						<div class="controls">
							<input name="userType" value="${userType}" type="hidden"/>
							<textarea class="field span9" rows="8" name="content">${notice.content}</textarea>
					    </div>
					</div>
					<button type="submit" class="btn btn-primary"><@spring.message "button.submit"/></button
				</form>
			</div>
		</div>
	</div>
	<#include "/admin/common/template-bottom.ftl">
</div>