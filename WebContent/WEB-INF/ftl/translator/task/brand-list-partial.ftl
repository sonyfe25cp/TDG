<table class="table">
	<thead>
		<th>ID</th>
		<th>name</th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list tasks as task>
			<#if task.brand??>
				<td>${task.id}</td>
				<td>${task.brand.name}</td>
				<td><a href="" class="btn btn-primary"><@spring.message "button.show"/></a></td>
			<#/if>
		</#list>
	</tbody>
</table>