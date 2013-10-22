<legend><@spring.message "admin.accounts.customers.list.title"/></legend>
<table class="table">
	<thead>
		<th><@spring.message "customer.model.id"/></th>
		<th><@spring.message "customer.model.email"/></th>
		<th><@spring.message "customer.model.status"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list customers as customer>
			<tr>
				<td>
					${customer.id}
				</td>
				<td>
					${customer.email}
				</td>
				<td>
					<#switch customer.accountStatus>
						<#case 1>
							<@spring.message "account.status.apply"/>
						<#break>
						<#case 2>
							<@spring.message "account.status.suspend"/>
						<#break>
						<#case 3>
							<@spring.message "account.status.ok"/>
						<#break>
						<#case 4>
							<@spring.message "account.status.warning"/>
						<#break>
					</#switch>
				</td>
				<td>
					<a href="/admin/accounts/customers/${customer.id}"><@spring.message "button.show"/></a>
					<#switch customer.accountStatus>
						<#case 1>
							<a href="/admin/accounts/activecustomer?id=#{customer.id}&accountStatus=3" class="btn"><@spring.message "account.status.ok"/></a>
						<#break>
						<#case 2>
							<a href="/admin/accounts/activecustomer?id=#{customer.id}&accountStatus=3" class="btn"><@spring.message "account.status.ok"/></a>
						<#break>
						<#case 3>
							<a href="/admin/accounts/activecustomer?id=#{customer.id}&accountStatus=2" class="btn"><@spring.message "account.status.suspend"/></a>
							<a href="/admin/accounts/activecustomer?id=#{customer.id}&accountStatus=4" class="btn"><@spring.message "account.status.warning"/></a>
						<#break>
						<#case 4>
							<a href="/admin/accounts/activecustomer?id=#{customer.id}&accountStatus=3" class="btn"><@spring.message "account.status.ok"/></a>
							<a href="/admin/accounts/activecustomer?id=#{customer.id}&accountStatus=2" class="btn"><@spring.message "account.status.suspend"/></a>
						<#break>
					</#switch>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/admin/accounts/customers?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/admin/accounts/customers?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/admin/accounts/customers?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>