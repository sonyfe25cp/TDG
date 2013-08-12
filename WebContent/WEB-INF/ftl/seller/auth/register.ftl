<#include "/seller/common/template-head.ftl"/>
<script src="/js/omartech.check.input.js"></script>
<script src="/js/seller/register.js"></script>
<div class="row-fluid">
	<div class="span3">
	</div>
	<div class="span9">
		<div class="row-fluid">
			<div class="span6">
				<form action="/sellerregist" method="post">
					<fieldset>
						<h3><@spring.message "seller.register.hello"/></h3>
						<p/>
						<legend><@spring.message "seller.register.account"/></legend>
						<div class="control-group">
						    <label class="control-label" for="email">
						    	<@spring.message "seller.model.email"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="email" name="email" access="email"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="password">
						    	<@spring.message "seller.model.password"/>
						    </label>
						    <div class="controls">
						      <input type="password" id="password" name="password" access="password"/>
				    		</div>
				  		</div>
				  		<p/>
						<legend><@spring.message "seller.model.business"/></legend>
						<div class="control-group">
						    <label class="control-label" for="businessName">
						    	<@spring.message "seller.model.businessName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="businessName" name="businessName" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="website">
						    	<@spring.message "seller.model.website"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="companyWebsiteAddress" name="companyWebsiteAddress" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="productCategories">
						    	<@spring.message "seller.model.productLines"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="productLines" name="productLines" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="businessAddress">
						    	<@spring.message "seller.model.businessAddress"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="businessAddress" name="businessAddress" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="city">
						    	<@spring.message "seller.model.city"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="city" name="city" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="state">
						    	<@spring.message "seller.model.state"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="state" name="state" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="country">
						    	<@spring.message "seller.model.country"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="country" name="country" access="text"/>
				    		</div>
				  		</div>
				  		<p/>
				  		<legend><@spring.message "seller.model.contact"/></legend>
				  		<div class="control-group">
						    <label class="control-label" for="firstName">
						    	<@spring.message "seller.model.firstName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="firstName" name="firstName" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="lastName">
						    	<@spring.message "seller.model.lastName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="lastName" name="lastName" access="text"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="primaryNumber">
						    	<@spring.message "seller.model.primaryPhoneNumber"/>
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
				  		<button id="submit" class="btn"><@spring.message "button.register"/></button>
					</fieldset>
		  		</form>
			</div>
			<div class="span6">
				<h3><@spring.message "seller.register.announcement"/></h3>
				<p>
					<@spring.message "seller.register.announcementBody"/>
				</p>
			</div>
		</div>
	</div>
</div>

<#include "/seller/common/template-bottom.ftl"/>
