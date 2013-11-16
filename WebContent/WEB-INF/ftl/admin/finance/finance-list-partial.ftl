<table class="table">
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
		</tr>
		<#list financeUnits as financeUnit>
			<tr>
				<td>${financeUnit.id}</td>
				<td>${financeUnit.createAt?date}</td>
				<td>${financeUnit.receiver}</td>
				<td>${financeUnit.sender}</td>
				<td>
					<#include "/common/financeUnit-coinage-select.ftl">
					${financeUnit.money}
				</td>
				<td>${financeUnit.status}</td>
				<td>${financeUnit.relatedId}</td>
				<td>
					<#switch financeUnit.financeType>
						<#case 1>
							putong
						<#break>
					</#switch>
				<td>${financeUnit.over}</td>
			</tr>
		</#list>
	</thead>
	<tbody></tbody>
</table>