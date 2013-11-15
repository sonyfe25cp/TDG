<table>
	<thead>
		<tr>
			<th><@spring.message "financeunit.model.id"/></th>
			<th><@spring.message "financeunit.model.createAt"/></th>
			<th><@spring.message "financeunit.model.receiver"/></th>
			<th><@spring.message "financeunit.model.sender"/></th>
			<th><@spring.message "financeunit.model.money"/></th>
			<th><@spring.message "financeunit.model.status"/></th>
			<th><@spring.message "financeunit.model.relatedId" /></th>
			<th><@spring.message "financeunit.model.financeType"/></th>
			<th><@spring.message "financeunit.model.over"/></th>
			<th><@spring.message "menu.options"/></th>
		</tr>
		<#list financeUnits as unit>
			<tr>
				<td>${unit.id}</td>
				<td>${unit.createAt?date}</td>
				<td>${unit.receiver}</td>
				<td>${unit.sender}</td>
				<td>${unit.money}</td>
				<td>${unit.status}</td>
				<td>${unit.relatedId}</td>
				<td>${unit.financeType}</td>
				<td>${unit.over}</td>
				<td>
					<a href=""><@spring.message "button.show"/></a>
				</td>
			</tr>
		</#list>
	</thead>
	<tbody></tbody>
</table>