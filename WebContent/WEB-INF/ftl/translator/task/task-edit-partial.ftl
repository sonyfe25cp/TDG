<script charset="utf-8" src="/js/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript">
	 KindEditor.ready(function(K) {
         editor = K.create('#content',{
         	uploadJson : '/translator/upload/image',
         	filePostName : 'image',
         });
         editor2 = K.create('#originContent',{
         	uploadJson : '/translator/upload/image',
         	filePostName : 'image',
         });
         editor2.hideMenu();
         editor2.readonly(true);
	});
</script>
<div class="row-fluid">
	<div class="span6">
		<div class="control-group">
			<label class="control-label"><@spring.message "product.model.name"/></label>
			<div class="controls">
				<#if task.taskType == 'product'>
					<input type="text" value="${task.product.name}" class="input-xlarge uneditable-input">
				<#else>
					<input type="text" value="${task.brand.name}" class="input-xlarge uneditable-input">
				</#if>
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label"><@spring.message "message.model.content"/></label>
			<div class="controls">
				<#if task.taskType == 'product'>
					<textarea class="field span9" rows="58" class="uneditable-input" id="originContent">${task.product.description}</textarea>
				<#else>
					<textarea class="field span9" rows="58" class="uneditable-input" id="originContent">${task.brand.description}</textarea>
				</#if>
		    </div>
		</div>
	</div>
	<div class="span6">
		<form action="/translator/task/update" method="post">
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.nameInChinese"/></label>
				<div class="controls">
					<input type="text" name="nameInChinese"/>
					<input type="hidden" name="id" value="${task.taskId}"/>
					<input type="hidden" name="taskId" value="${task.id}"/>
					<input type="hidden" name="taskType" value="${task.taskType}"/>
			    </div>
			</div>
			<div class="control-group">
				<label class="control-label"><@spring.message "product.model.descriptionInChinese"/></label>
				<div class="controls">
					<textarea class="field span9" rows="58" name="descriptionInChinese" id="content"></textarea>
			    </div>
			</div>
			<legend></legend>
			<input type="submit" value='<@spring.message "button.update"/>' class="btn btn-primary">
		</form>
	</div>
</div>