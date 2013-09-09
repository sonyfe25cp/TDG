<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<form action="/admin/productParameter/update" class="form-horizontal">
						<input type="hidden" name="id" value="${productParameter.id}"/>
						<input type="hidden" name ="parentId"  value="${productParameter.parentId}"/>
						<input type="hidden" name="level" value="${productParameter.level}"/>
					<div class="control-group">
					    <label class="control-label"><@spring.message "productParameter.model.name"/></label>
					    <div class="controls">
					    	<input type="text" name ="name" placeholder="Name" value="${productParameter.name}"/>
					    </div>
					</div>
					<div class="control-group">
					    <label class="control-label"><@spring.message "productParameter.model.english"/></label>
					    <div class="controls">
					      	<input type="text" name ="english" value="${productParameter.english}"/>
					    </div>
					</div>
					<div class="control-group">
					    <label class="control-label"><@spring.message "productParameter.model.pvalue"/></label>
					    <div class="controls">
					      	<input type="text" name ="english" value="${productParameter.pvalue}"/>
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