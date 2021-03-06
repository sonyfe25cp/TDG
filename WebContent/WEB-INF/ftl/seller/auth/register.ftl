<#include "/seller/common/template-head.ftl"/>
<script src="/js/omartech.check.input-en.js"></script>
<script src="/js/seller/auth.register.js"></script>
<div class="row-fluid">
	<div class="span3">
	</div>
	<div class="span9">
		<div class="row-fluid">
			<div class="span4">
				<#if !(flag)>
					<div class="alert">
						<strong>Alert:</strong>Please make sure you have input all the fields.
					</div>
				</#if>
				<form action="/sellerregist" method="post">
					<fieldset>
						<h3><@spring.message "seller.register.hello"/></h3>
						<p/>
						<legend><@spring.message "seller.register.account"/></legend>
						<div class="control-group">
						    <label class="control-label" for="email">
						    	*<@spring.message "seller.model.email"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="email" name="email" access="email"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="password">
						    	*<@spring.message "seller.model.password"/>
						    </label>
						    <div class="controls">
						      <input type="password" id="password" name="password" access="password"/>
				    		</div>
				  		</div>
				  		<p/>
						<legend><@spring.message "seller.model.business"/></legend>
						<div class="control-group">
						    <label class="control-label" for="businessName">
						    	*<@spring.message "seller.model.businessName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="businessName" name="businessName" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="website">
						    	*<@spring.message "seller.model.website"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="companyWebsiteAddress" name="companyWebsiteAddress" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="productCategories">
						    	*<@spring.message "seller.model.productLines"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="productLines" name="productLines" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="businessAddress">
						    	*<@spring.message "seller.model.businessAddress"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="businessAddress" name="businessAddress" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="city">
						    	*<@spring.message "seller.model.city"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="city" name="city" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="state">
						    	*<@spring.message "seller.model.state"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="state" name="state" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="country">
						    	*<@spring.message "seller.model.country"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="country" name="country" access="text"/>
				    		</div>
				  		</div>
				  		<p/>
				  		<legend><@spring.message "seller.model.contact"/></legend>
				  		<div class="control-group">
						    <label class="control-label" for="firstName">
						    	*<@spring.message "seller.model.firstName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="firstName" name="firstName" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="lastName">
						    	*<@spring.message "seller.model.lastName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="lastName" name="lastName" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="primaryNumber">
						    	*<@spring.message "seller.model.primaryPhoneNumber"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="primaryPhoneNumber" name="primaryPhoneNumber" access="int"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="secondNumber">
						    	<@spring.message "seller.model.secondPhoneNumber"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="secondPhoneNumber" name="secondPhoneNumber" access="int"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <div class="controls">
						      <input type="checkbox" id="licenseRead"/> <a href="/help/sellerlicense">I have read and accepted the User Participation Agreement.</a>
				    		</div>
				  		</div>
				  		<input id="submit" class="btn btn-primary" type="submit" value=<@spring.message "button.register"/> >
					</fieldset>
		  		</form>
			</div>
			<div class="span8">
				<p>
					 You're going to sell into China market, it's important for you to fill in complete information here <br/>so that we can better understand your business and help you.
				</p>
			</div>
		</div>
	</div>
</div>
<#include "/seller/common/template-bottom.ftl"/>
