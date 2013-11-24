<table class="table">
	<tr>
		<th><@spring.message "financeRecord.model.createAt"/></th>
		<th><@spring.message "financeRecord.model.receiver"/></th>
		<th><@spring.message "financeRecord.model.totalGetFromAdmin"/></th>
		<th><@spring.message "financeRecord.model.totalPayAdmin"/></th>
		<th><@spring.message "financeRecord.model.total"/></th>
		<th><@spring.message "financeRecord.model.status"/></th>
		<th><@spring.message "menu.options"/></th>
	</tr>
	<#list financeRecords as financeRecord>
		<tr>
			<td>${financeRecord.createAt?date}</td>
			<td>${financeRecord.receiver}</td>
			<td>${financeRecord.totalGetFromAdmin}</td>
			<td>${financeRecord.totalPayAdmin}</td>
			<td>${financeRecord.total}</td>
			<td>
				<#switch financeRecord.status>
					<#case 0>
						<@spring.message "financeRecord.model.status.ongoing"/>
					<#break>
					<#case 1>
						<@spring.message "financeRecord.model.status.over"/>
					<#break>
					<#case 2>
						<@spring.message "financeRecord.model.status.applying"/>
					<#break>
					<#case 3>
						<@spring.message "financeRecord.model.status.nexttime"/>
					<#break>
				</#switch>
			</td>
			<td>
				<a href="/seller/financeRecord/show/${financeRecord.id}" class="btn"><@spring.message "button.show"/></a>
			</td>
		</tr>
	</#list>
</table>