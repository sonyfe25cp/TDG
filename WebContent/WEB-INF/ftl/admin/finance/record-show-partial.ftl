<table class="table">
	<tr>
		<td>ID</td>
		<td>${financeRecord.id}</td>
	</tr>
	<tr>
		<td><@spring.message "financeRecord.show.date"/></td>
		<td>${financeRecord.beginDate?date} -- ${financeRecord.endDate?date}</td>
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
<table class="table table-bordered">
	<#if shopSetting??>
		<tr>
			<td><@spring.message "shopsetting.model.bankName"/></td>
			<td>${shopSetting.bankName}</td>
		</tr>
		<tr>
			<td><@spring.message "shopsetting.model.accountNumber"/></td>
			<td>${shopSetting.accountNumber}</td>
		</tr>
		<tr>
			<td><@spring.message "shopsetting.model.defaultCoinage"/></td>
			<td>
				<#switch shopSetting.defaultCoinage>
					<#case 1>$<#break>
					<#case 2>€<#break>
					<#case 3>￡<#break>
					<#case 4>JPY<#break>
					<#case 5>CNY<#break>
					<#default>
				</#switch>
			</td>
		</tr>
	</#if>
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
			<@spring.message "financeRecord.model.status"/>
		</td>
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
					<#case 4>
						<@spring.message "financeRecord.model.status.noneed"/>
					<#break>
				</#switch>
		</td>
	</tr>
	<tr>
		<td>
			<@spring.message "menu.options"/>
		</td>
		<td>
			<#switch financeRecord.status>
					<#case 0>
					<#break>
					<#case 1>
						<@spring.message "financeRecord.model.status.over"/>
					<#break>
					<#case 2>
						<a href="/admin/financeRecord/update?id=${financeRecord.id}&status=1" class="btn btn-primary"><@spring.message "financeRecord.model.status.over"/></a>
						<a href="/admin/financeRecord/update?id=${financeRecord.id}&status=3" class="btn btn-primary"><@spring.message "financeRecord.model.status.nexttime"/></a>
					<#break>
					<#case 3>
						<a href="/admin/financeRecord/update?id=${financeRecord.id}&status=1" class="btn btn-primary"><@spring.message "financeRecord.model.status.over"/></a>
					<#break>
					<#case 4>
						<a href="/admin/financeRecord/update?id=${financeRecord.id}&status=0" class="btn btn-primary"><@spring.message "financeRecord.model.status.ongoing"/></a>
					<#break>
				</#switch>
		</td>
	</tr>
<table>