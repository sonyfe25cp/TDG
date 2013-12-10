<#include "/admin/common/template-head.ftl">
<#include "/admin/common/top-banner.ftl">
<div class="container">
	<div class="container-fluid">
		<div class="row-fluid">
		    <div class="span3">
				<#include "/admin/common/left-nav.ftl">
			</div>
			<div class="span9">
				<form action="/admin/productLine/update" class="form-horizontal">
						<input type="hidden" name="id" value="${productLine.id}"/>
						<input type="hidden" name ="parentId"  value="${productLine.parentId}"/>
						<input type="hidden" name="level" value="${productLine.level}"/>
					<div class="control-group">
					    <label class="control-label"><@spring.message "productLine.model.name"/></label>
					    <div class="controls">
					    	<input type="text" name ="name" placeholder="Name" value="${productLine.name}"/>
					    </div>
					</div>
					<div class="control-group">
					    <label class="control-label"><@spring.message "productLine.model.english"/></label>
					    <div class="controls">
					      	<input type="text" name ="english" value="${productLine.english}"/>
					    </div>
					</div>
					<div class="control-group">
					    <label class="control-label"><@spring.message "productLine.model.discount"/></label>
					    <div class="controls">
					      	<input type="text" name ="discount" value="${productLine.discount}"/>
					      	<span>只能填小数，如 0.2 表示 返利 20%；其他情况均不接受</span>
					    </div>
					</div>
					<div class="control-group">
					    <label class="control-label">佣金比例</label>
					    <div class="controls">
					      	<input type="text" name ="discount" value="${productLine.commission}"/>
					      	<span>只能填小数，如 0.2 表示 佣金比例 20%；其他情况均不接受</span>
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