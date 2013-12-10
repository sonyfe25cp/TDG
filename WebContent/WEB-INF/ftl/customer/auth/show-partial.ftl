<legend><@spring.message "customer.auth.show.title"/></legend>
<div class="form-horizontal">
	<div class="control-group">
	    <label class="control-label">用户编号:</label>
	    <div class="controls">
	      <label>${customer.id}</label>
	    </div>
    </div>
	<div class="control-group">
	    <label class="control-label"><@spring.message "customer.model.email"/></label>
	    <div class="controls">
	      <label>${customer.email}</label>
	    </div>
    </div>
	<div class="control-group">
	    <label class="control-label"><@spring.message "customer.model.password"/></label>
	    <div class="controls">
	    	<label>${customer.password}</label>
	    </div>
    </div>
    <div class="control-group">
	    <label class="control-label"><@spring.message "customer.model.phonenum"/></label>
	    <div class="controls">
	    	<#if customer.phoneNum??>
	    		<label>${customer.phoneNum}</label>
	    	</#if>
	    </div>
    </div>
    <div class="control-group">
	    <div class="controls">
	      <a href="/customer/auth/edit" class="btn primary"><@spring.message "button.edit"/></a>
	    </div>
    </div>
</div>