<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<form action="/admin/productLine/create" class="form-horizontal">
					<#if parent??>
						<div class="control-group">
						    <label class="control-label"><@spring.message "productLine.show.parent"/></label>
						    <div class="controls">
						    	<span>${parent.name} -- ${parent.english}</span>
							    <input type="hidden" name ="parentId"  value="${parent.id}"/>
							    <input type="hidden" name="level" value="${parent.level + 1}"/>
						    </div>
						</div>
					<#else>
						<input type="hidden" name ="parentId"  value="0"/>
						<input type="hidden" name="level" value="1"/>
					</#if>
					<div class="control-group">
					    <label class="control-label"><@spring.message "productLine.model.name"/></label>
					    <div class="controls">
					    	<input type="text" name ="name" placeholder="Name"/>
					    </div>
					</div>
					<div class="control-group">
					    <label class="control-label"><@spring.message "productLine.model.english"/></label>
					    <div class="controls">
					      	<input type="text" name ="english"/>
					    </div>
					</div>
					<div class="control-group">
					    <div class="controls">
					      <button class="btn btn-large btn-primary" type="submit" value="button"/><@spring.message "button.add"/></button>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<#include "/admin/common/template-bottom.ftl">