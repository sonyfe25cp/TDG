<table class="table">
	<tr>
		<th><@spring.message "financeRecord.model.createAt"/></th>
		<th><@spring.message "financeRecord.model.sellerId"/></th>
		<th><@spring.message "financeRecord.model.totalGetFromAdmin"/></th>
		<th><@spring.message "financeRecord.model.totalPayAdmin"/></th>
		<th><@spring.message "financeRecord.model.total"/></th>
		<th><@spring.message "financeRecord.model.status"/></th>
		<th><@spring.message "menu.options"/></th>
	</tr>
	<#list financeRecords as financeRecord>
		<tr>
			<td>${financeRecord.createAt?date}</td>
			<td>${financeRecord.sellerId}</td>
			<td>${financeRecord.totalGetFromAdmin}</td>
			<td>${financeRecord.totalPayAdmin}</td>
			<td>${financeRecord.total}</td>
			<td>${financeRecord.status}</td>
			<td>
				<a href="/admin/financeRecord/show/${financeRecord.id}" class="btn"><@spring.message "button.show"/></a>
			</td>
		</tr>
	</#list>
</table>