<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend>I want to leave a message to admin</legend>
				<form class="" action="/customer/messageCenter/create">
					<div class="control-group">
						<label class="control-label"><@spring.message "message.model.title"/></label>
						<div class="controls">
							<input type="text" name="title" placeholder="title">
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label"><@spring.message "message.model.content"/></label>
						<div class="controls">
							<textarea class="field span9" rows="8" name="content" placeholder="Content"></textarea>
					    </div>
					</div>
					<button type="submit" class="btn btn-primary"><@spring.message "button.submit"/></button
				</form>
			</div>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl">
</div>