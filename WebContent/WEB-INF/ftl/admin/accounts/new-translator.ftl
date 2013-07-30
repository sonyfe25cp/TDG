<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<form action="/admin/accounts/translator/create">
					<fieldset>
						<div class="control-group">
						    <label class="control-label" for="email">
						    	<@spring.message "translator.model.email"/>
						    </label>
						    <div class="controls">
						      <input type="text" id="email" name="email" access="email"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <label class="control-label" for="password">
						    	<@spring.message "translator.model.password"/>
						    </label>
						    <div class="controls">
						      <input type="password" id="password" name="password" access="password"/>
				    		</div>
				  		</div>
				  		<div class="control-group">
						    <div class="controls">
						  		<button id="submit" class="btn"><@spring.message "button.register"/></button>
				    		</div>
				  		</div>
					</fieldset>
		  		</form>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">