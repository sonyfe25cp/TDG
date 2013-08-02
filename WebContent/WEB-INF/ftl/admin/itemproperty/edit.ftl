<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<form action="/admin/property/itemproperty/update" class="form-horizontal">
					<div class="control-group">
					    <label class="control-label" for="inputEmail"><@spring.message "basefeature.model.name"/></label>
					    <div class="controls">
					    	<input type="hidden" name ="id"  value="${itemSubProperty.pid}"/>
					    	<input type="text" name ="name"  value="${itemSubProperty.pname}" placeholder="Name"/>
					    </div>
					</div>
					<div class="control-group">
					    <label class="control-label" for="inputEmail"><@spring.message "basefeature.model.english"/></label>
					    <div class="controls">
					    	<#if itemSubProperty.english??>
					      		<input type="text" name ="english" value="${itemSubProperty.english}"/>
					      	<#else>
					      		<input type="text" name ="english"/>
					      	</#if>
					    </div>
					</div>
					<div class="control-group">
					    <div class="controls">
					      <button class="btn btn-large btn-primary" type="submit" value="button"/><@spring.message "button.update"/></button>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">