<#include "/customer/common/template-head.ftl">
<#include "/customer/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/customer/common/left-nav.ftl">
			</div>
			<div class="span9">
				<legend><@spring.message "customer.auth.show.title"/></legend>
				<form action="/customer/auth/update" class="form-horizontal">
					<div class="control-group">
					    <label class="control-label"><@spring.message "customer.model.oldpassword"/></label>
					    <div class="controls">
					      <input name="oldPassword" type="password">
					    </div>
				    </div>
					<div class="control-group">
					    <label class="control-label"><@spring.message "customer.model.newpassword"/></label>
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
	<#include "/customer/common/template-bottom.ftl">
	</div>
</div>