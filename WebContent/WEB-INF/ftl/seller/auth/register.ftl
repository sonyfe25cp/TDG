<#include "/seller/common/template-head.ftl"/>
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
						    	<@spring.message "seller.register.email"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="email" name="email"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="password">
						    	<@spring.message "seller.register.password"/>
						    </label>
						    <div class="controls">
						      <input type="password" id="password" name="password"/>
				    		</div>
				  		</div>
				  		<p/>
						<legend><@spring.message "seller.register.business"/></legend>
						<div class="control-group">
						    <label class="control-label" for="businessName">
						    	<@spring.message "seller.register.businessName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="businessName" name="businessName"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="website">
						    	<@spring.message "seller.register.website"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="companyWebsiteAddress" name="companyWebsiteAddress"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="productCategories">
						    	<@spring.message "seller.register.productLines"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="productLines" name="productLines"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="businessAddress">
						    	<@spring.message "seller.register.businessAddress"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="businessAddress" name="businessAddress"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="city">
						    	<@spring.message "seller.register.city"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="city" name="city"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="country">
						    	<@spring.message "seller.register.country"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="country" name="country"/>
				    		</div>
				  		</div>
				  		<p/>
				  		<legend><@spring.message "seller.register.contact"/></legend>
				  		<div class="control-group">
						    <label class="control-label" for="firstName">
						    	<@spring.message "seller.register.firstName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="firstName" name="firstName"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="lastName">
						    	<@spring.message "seller.register.lastName"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="lastName" name="lastName"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="primaryNumber">
						    	<@spring.message "seller.register.primaryPhoneNumber"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="primaryPhoneNumber" name="primaryPhoneNumber"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="secondNumber">
						    	<@spring.message "seller.register.secondPhoneNumber"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="secondPhoneNumber" name="secondPhoneNumber"/>
				    		</div>
				  		</div>
				  		<button type="submit" class="btn"><@spring.message "seller.register.button"/></button>
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
