<table class="table">
	<tr>
		<td><@spring.message "financeRecord.show.date"/></td>
		<td>${financeRecord.id}</td>
	</tr>
	<tr>
		<td><@spring.message "financeRecord.model.orderMoney"/></td>
		<td>${financeRecord.orderMoney}</td>
	</tr>
	<tr>
		<td><@spring.message "financeRecord.model.translationMoney"/></td>
		<td>${financeRecord.translationMoney}</td>
	</tr>
	<tr>
		<td><@spring.message "financeRecord.model.storeMoney"/></td>
		<td>${financeRecord.storeMoney}</td>
	</tr>
	<tr>
		<td><@spring.message "financeRecord.model.serviceMoney"/></td>
		<td>${financeRecord.serviceMoney}</td>
	</tr>
	<tr>
		<td><@spring.message "financeRecord.model.otherMoney"/></td>
		<td>${financeRecord.otherMoney}</td>
	</tr>
</table>
<legend></legend>
<table>
	<tr>
		<td><@spring.message "financeRecord.model.totalGetFromAdmin"/></td>
		<td>${financeRecord.totalGetFromAdmin}</td>
	</tr>
	<tr>
		<td><@spring.message "financeRecord.model.totalPayAdmin"/></td>
		<td>${financeRecord.totalPayAdmin}</td>
	</tr>
	<tr>
		<td><@spring.message "financeRecord.model.total"/></td>
		<td>${financeRecord.total}</td>
	</tr>
	<tr>
		<td>
			<a href="/seller/financeRecord/apply?id=${financeRecord.id}" class="btn btn-info">
				<@spring.message "financeRecord.model.status.applying"/>
			</a>
		</td>
	</tr>
<table>