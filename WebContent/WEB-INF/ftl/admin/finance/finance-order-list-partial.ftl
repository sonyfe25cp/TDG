<table class="table">
	<tr>
		<th>ID</th>
		<th><@spring.message "financeunit.model.createAt"/></th>
		<th><@spring.message "financeunit.model.sender"/></th>
		<th><@spring.message "financeunit.model.receiver"/></th>
		<th><@spring.message "financeunit.model.money"/></th>
		<th><@spring.message "financeunit.model.status"/></th>
		<th><@spring.message "financeunit.model.relatedId"/></th>
		<th><@spring.message "financeunit.model.financeType"/></th>
		<th><@spring.message "financeunit.model.over"/></th>
		<th><@spring.message "menu.options"/></th>
	</tr>
	<#list financeUnits as financeUnit>
		<tr>
			<td>${financeUnit.id}</td>
			<td>${financeUnit.createAt?datetime}</td>
			<td>${financeUnit.sender}</td>
			<td>${financeUnit.receiver}</td>
			<td>${financeUnit.money}</td>
			<td>${financeUnit.status}</td>
			<td>${financeUnit.relatedId}</td>
			<td>${financeUnit.financeType}</td>
			<td>${financeUnit.over}</td>
			<td><a class="btn"><@spring.message "button.show"/></a></td>			
		</tr>
	</#list>
</table>