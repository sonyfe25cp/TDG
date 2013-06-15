<legend><@spring.message "seller.auth.show.title"/></legend>
<div class="form-horizontal">
	<div class="control-group">
	    <label class="control-label"><@spring.message "seller.model.email"/></label>
	    <div class="controls">
	      <label class="control-label">${seller.email}</label>
	    </div>
    </div>
	<div class="control-group">
	    <label class="control-label"><@spring.message "seller.model.password"/></label>
	    <div class="controls">
	    	<label class="control-label">${seller.password}</label>
	    </div>
    </div>
    <div class="control-group">
	    <div class="controls">
	      <a href="/seller/auth/edit" class="btn primary"><@spring.message "button.update"/></a>
	    </div>
    </div>
</div>