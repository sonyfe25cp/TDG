<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend><@spring.message "admin.auth.show.title"/></legend>
				<form action="/admin/auth/update" class="form-horizontal" method="post">
					<div class="control-group">
					    <label class="control-label"><@spring.message "admin.model.email"/></label>
					    <div class="controls">
					      <input name="email">
					    </div>
				    </div>
					<div class="control-group">
					    <label class="control-label"><@spring.message "admin.model.oldpassword"/></label>
					    <div class="controls">
					      <input name="oldPassword" type="password">
					    </div>
				    </div>
					<div class="control-group">
					    <label class="control-label"><@spring.message "admin.model.password"/></label>
					    <div class="controls">
					    	<input name="password" type="password">
					    </div>
				    </div>
				    <div class="control-group">
					    <div class="controls">
					      <button class="btn primary"><@spring.message "button.update"/></button>
					    </div>
				    </div>
				</div>
			</div>
		</div>
	<#include "/admin/common/template-bottom.ftl">
	</div>
</div>