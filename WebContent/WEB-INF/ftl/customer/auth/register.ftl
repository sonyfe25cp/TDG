<#include "/customer/common/template-head.ftl"/>
<script src="/js/omartech.check.input.js"></script>
<script src="/js/customer/auth.register.js"></script>
<div class="container">
	<div class="row-fluid">
		<div class="span3">
		</div>
		<div class="span9">
			<div class="row-fluid">
				<div class="span6">
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
					  		<button id="submit" class="btn"><@spring.message "button.register"/></button>
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
		</div>
	</div>
	<#include "/customer/common/template-bottom.ftl"/>
</div>