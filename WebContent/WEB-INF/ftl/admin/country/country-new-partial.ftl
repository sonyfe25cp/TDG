<form action="/admin/country/create" class="form-horizontal">
	<div class="control-group">
	    <label class="control-label"><@spring.message "country.model.name"/></label>
	    <div class="controls">
	    	<input type="text" name ="name"/>
	    </div>
	</div>
	<div class="control-group">
	    <label class="control-label"><@spring.message "country.model.nameInChinese"/></label>
	    <div class="controls">
	      	<input type="text" name ="nameInChinese"/>
	    </div>
	</div>
	<div class="control-group">
	    <div class="controls">
	      <button class="btn btn-large btn-primary" type="submit" value="button"/><@spring.message "button.add"/></button>
	    </div>
	</div>
</form>