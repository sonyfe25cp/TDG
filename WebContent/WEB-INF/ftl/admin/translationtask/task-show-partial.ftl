<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript">
	 KindEditor.ready(function(K) {
         editor = K.create('#content',{
         });
         editor2 = K.create('#originContent',{
         });
         editor.readonly(true);
         editor2.readonly(true);
	});
	
</script>
<div class="row-fluid">
	<div class="span6">
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.name"/></label>
			<div class="controls">
				<#if translationTask.taskType == 'product'>
					<input type="text" value="${translationTask.product.name}" class="input-xlarge uneditable-input">
				<#else>
					<input type="text" value="${translationTask.brand.name}" class="input-xlarge uneditable-input">
				</#if>
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "message.model.content"/></label>
			<div class="controls">
				<#if translationTask.taskType == 'product'>
					<textarea class="field span3" rows="58" class="uneditable-input" id="originContent">${translationTask.product.description}</textarea>
				<#else>
					<textarea class="field span3" rows="58" class="uneditable-input" id="originContent">${translationTask.brand.description}</textarea>
				</#if>
		    </div>
		</div>
	</div>
	<div class="span6">
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.nameInChinese"/></label>
			<div class="controls">
				<#if translationTask.taskType == 'product'>
					<input type="text" value="${translationTask.product.nameInChinese}" class="input-xlarge uneditable-input">
				<#else>
					<input type="text" value="${translationTask.brand.nameInChinese}" class="input-xlarge uneditable-input">
				</#if>
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.descriptionInChinese"/></label>
			<div class="controls">
				<#if translationTask.taskType == 'product'>
					<textarea class="field span3" rows="58" class="uneditable-input" id="content">${translationTask.product.descriptionInChinese}</textarea>
				<#else>
					<textarea class="field span3" rows="58" class="uneditable-input" id="content">${translationTask.brand.descriptionInChinese}</textarea>
				</#if>
		    </div>
		</div>
	</div>
</div>