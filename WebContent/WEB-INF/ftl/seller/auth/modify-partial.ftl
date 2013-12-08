<legend><@spring.message "seller.auth.edit.title"/></legend>
<form class="form-horizontal" action="/seller/auth/update">
	<div class="control-group">
	    <label class="control-label"><@spring.message "seller.model.email"/></label>
	    <div class="controls">
	      ${seller.email}
	    </div>
    </div>
	<div class="control-group">
	    <label class="control-label"><@spring.message "seller.model.password"/></label>
	    <div class="controls">
	    <input type="hidden" name="sellerId" value="${seller.id}"/>
	    <input type="text" name="password">
	    <span><@spring.message "seller.auth.edit.passwordnoneed"/></span>
	    </div>
    </div>
    <div class="control-group">
	    <label class="control-label"><@spring.message "seller.model.primaryPhoneNumber"/></label>
	    <div class="controls">
	    <input type="text" name="primaryPhoneNumber" value="${seller.primaryPhoneNumber}">
	    </div>
    </div>
    <div class="control-group">
	    <label class="control-label"><@spring.message "seller.model.secondPhoneNumber"/></label>
	    <div class="controls">
	    <input type="text" name="secondPhoneNumber" value="${seller.secondPhoneNumber}">
	    </div>
    </div>
    <div class="control-group">
	    <div class="controls">
	      <button type="submit" class="btn primary"><@spring.message "button.update"/></button>
	    </div>
    </div>
</form>