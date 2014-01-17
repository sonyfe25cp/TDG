<#include "/customer/common/template-head.ftl"/>
<script src="/js/omartech.check.input.js"></script>
<script src="/js/customer/auth.register.js"></script>
<div class="container">
	<#if message??>
		<div class="alert">
		  <strong>警告!</strong> ${message}
		</div>
	</#if>
	<div class="row-fluid">
		
		<div class="span4">
			<form action="/customerregister" method="post">
				<fieldset>
					<h3><@spring.message "customer.register.hello"/></h3>
					<p/>
					<legend><@spring.message "customer.register.account"/></legend>
					<div class="control-group">
					    <label class="control-label" for="email">
					    	<@spring.message "customer.model.email"/>
					    </label>
					    <div class="controls">
					      <input type="text" id="email" name="email" access="email"/>
			    		</div>
			  		</div>
			  		<div class="control-group">
					    <label class="control-label" for="password">
					    	<@spring.message "customer.model.password"/>
					    </label>
					    <div class="controls">
					      <input type="password" id="password" name="password" access="password"/>
			    		</div>
			  		</div>
			  		<div class="control-group">
					    <label class="control-label" for="repassword">
					    	<@spring.message "customer.model.repassword"/>
					    </label>
					    <div class="controls">
					      <input type="password" id="repassword" name="repassword" access="repassword"/>
			    		</div>
			  		</div>
			  		<div class="control-group">
					    <label class="control-label">
					    	<@spring.message "customer.model.phonenum"/>
					    </label>
					    <div class="controls">
					      <input type="text" id="phoneNum" name="phoneNum" access="int"/>
			    		</div>
			  		</div>
			  		<div class="control-group">
					    <div class="controls">
					      <input type="checkbox" id="licenseRead"/> I have read and accepted the User Participation Agreement.
			    		</div>
			  		</div>
			  		<button id="submit" class="btn btn-primary"><@spring.message "button.register"/></button>
				</fieldset>
	  		</form>
		</div>
		<div class="span6">
			<h3><@spring.message "customer.register.announcement"/></h3>
			<p>
				<@spring.message "customer.register.announcementBody"/>
			</p>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl"/>
</div>