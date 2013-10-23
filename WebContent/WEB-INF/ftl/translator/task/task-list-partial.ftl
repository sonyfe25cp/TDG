<table class="table">
	<thead>
		<th>ID</th>
		<th>name</th>
		<th><@spring.message "translationTask.model.status"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list tasks as task>
			<tr>
				<td>${task.id}</td>
				<td>
					<#if task.taskType == 'product'>
						${task.product.name}
					<#else>
						${task.brand.name}
					</#if>
				</td>
				<td>
					<#if task.status == 2>
						<@spring.message "translationTask.status.redo"/>
					<#else>
						<@spring.message "translationTask.status.new"/>
					</#if>
				</td>
				<td><a href="/translator/task/edit?taskId=${task.id}&taskType=${task.taskType}" class="btn btn-primary"><@spring.message "button.show"/></a></td>
			</tr>
		</#list>
	</tbody>
</table>