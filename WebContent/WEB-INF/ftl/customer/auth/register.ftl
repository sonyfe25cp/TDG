<#include "/customer/common/template-head.ftl"/>
<script src="/js/omartech.check.input.js"></script>
<script src="/js/customer/auth.register.js"></script>
<#include "/customer/common/top-banner.ftl"/>
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
					      <span class="help-inline">
					      	由于该平台产品的销售均是海外直营商家，为确保将来在您购买中出现任何需要沟通情况时，我们的客服人员能在第一时间联系到您，请填写能联系到您的邮箱地址和手机号码。
					      </span>
			    		</div>
			  		</div>
			  		<div class="control-group">
					    <div class="controls">
					      <input type="checkbox" id="licenseRead"/> <a href="/help/license">我已阅读并同意协议.</a>
			    		</div>
			  		</div>
			  		<button id="submit" class="btn btn-primary"><@spring.message "button.register"/></button>
				</fieldset>
	  		</form>
		</div>
		<div class="span6">
			<p>
				
			</p>
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl"/>
</div>