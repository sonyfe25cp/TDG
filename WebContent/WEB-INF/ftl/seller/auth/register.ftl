<#include "/seller/common/admin-template-head.ftl"/>

<div class="row-fluid">
	<div class="span6">
		<form>
			<fieldset>
				<h3><@spring.message "seller.register.hello"/></h3>
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
				      <input type="text" id="website" name="website"/>
		    		</div>
		  		</div>
		  		<div class="control-group">
				    <label class="control-label" for="productCategories">
				    	<@spring.message "seller.register.productCategories"/>
				    </label>
				    <div class="controls">
				      <input type="text" id="productCategories" name="productCategories"/>
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
				    <label class="control-label" for="email">
				    	<@spring.message "seller.register.email"/>
				    </label>
				    <div class="controls">
				      <input type="text" id="email" name="email"/>
		    		</div>
		  		</div>
		  		<div class="control-group">
				    <label class="control-label" for="primaryNumber">
				    	<@spring.message "seller.register.primaryNumber"/>
				    </label>
				    <div class="controls">
				      <input type="text" id="primaryNumber" name="primaryNumber"/>
		    		</div>
		  		</div>
		  		<div class="control-group">
				    <label class="control-label" for="secondNumber">
				    	<@spring.message "seller.register.secondNumber"/>
				    </label>
				    <div class="controls">
				      <input type="text" id="secondNumber" name="secondNumber"/>
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

<#include "/seller/common/admin-template-bottom.ftl"/>
