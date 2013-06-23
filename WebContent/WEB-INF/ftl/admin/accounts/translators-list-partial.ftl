<legend><@spring.message "admin.accounts.translators.list.title"/></legend>
<table class="table">
	<thead>
		<th><@spring.message "translator.model.id"/></th>
		<th><@spring.message "translator.model.email"/></th>
		<th><@spring.message "translator.model.status"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list translators as translator>
			<tr>
				<td>
					${translator_index+1}
				</td>
				<td>
					${translator.email}
				</td>
				<td>
					<#switch translator.accountStatus>
						<#case 1>
							<@spring.message "account.status.apply"/>
						<#break>
						<#case 2>
							<@spring.message "account.status.suspend"/>
						<#break>
						<#case 3>
							<@spring.message "account.status.ok"/>
						<#break>
					</#switch>
				</td>
				<td>
					<#switch translator.accountStatus>
						<#case 1>
							<a href="/admin/accounts/activetranslator?id=#{translator.id}" class="btn"><@spring.message "button.active"/></a>
						<#break>
						<#case 2>
							<a href="/admin/accounts/activetranslator?id=#{translator.id}" class="btn"><@spring.message "button.active"/></a>
						<#break>
						<#case 3>
							<a href="/admin/accounts/disactivetranslator?id=#{translator.id}" class="btn"><@spring.message "button.disactive"/></a>
						<#break>
					</#switch>
					
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/admin/accounts/translators?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/admin/accounts/translators?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/admin/accounts/translators?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>