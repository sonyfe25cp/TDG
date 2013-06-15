<legend><@spring.message "seller.auth.edit.title"/></legend>
<form class="form-horizontal" action="/seller/auth/update">
	<div class="control-group">
	    <label class="control-label"><@spring.message "seller.model.email"/></label>
	    <div class="controls">
	      <input type="text" name="name">
	    </div>
    </div>
	<div class="control-group">
	    <label class="control-label"><@spring.message "seller.model.password"/></label>
	    <div class="controls">
	    <input type="text" name="name">
	    </div>
    </div>
    <div class="control-group">
	    <div class="controls">
	      <button type="submit" class="btn primary"><@spring.message "button.update"/></button>
	    </div>
    </div>
</form>