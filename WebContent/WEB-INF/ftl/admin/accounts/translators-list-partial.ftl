<legend><@spring.message "admin.accounts.translators.list.title"/></legend>
<a href="/admin/accounts/translator/new"><@spring.message "admin.accounts.translators.create"/></a>
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
						<#case 4>
							<@spring.message "account.status.warning"/>
						<#break>
					</#switch>
				</td>
				<td>
					<#switch translator.accountStatus>
						<#case 1>
							<a href="/admin/accounts/activetranslator?id=#{translator.id}&accountStatus=3" class="btn"><@spring.message "account.status.ok"/></a>
						<#break>
						<#case 2>
							<a href="/admin/accounts/activetranslator?id=#{translator.id}&accountStatus=3" class="btn"><@spring.message "account.status.ok"/></a>
						<#break>
						<#case 3>
							<a href="/admin/accounts/activetranslator?id=#{translator.id}&accountStatus=2" class="btn"><@spring.message "account.status.suspend"/></a>
							<a href="/admin/accounts/activetranslator?id=#{translator.id}&accountStatus=4" class="btn"><@spring.message "account.status.warning"/></a>
						<#break>
						<#case 4>
							<a href="/admin/accounts/activetranslator?id=#{translator.id}&accountStatus=3" class="btn"><@spring.message "account.status.ok"/></a>
							<a href="/admin/accounts/activetranslator?id=#{translator.id}&accountStatus=2" class="btn"><@spring.message "account.status.suspend"/></a>
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