<#include "top-banner.ftl">
<div>
	<p><@spring.message "admin.nav.accounts"/></p>
	<ul>
		<li><a href="/admin/accounts/customers"><@spring.message "admin.nav.accounts.customers"/></a></li>
		<li><a href="/admin/accounts/sellers"><@spring.message "admin.nav.accounts.sellers"/></a></li>
		<li><a href="/admin/accounts/translators"><@spring.message "admin.nav.accounts.translators"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "admin.nav.finance"/></p>
	<ul>
		<li><a href="/admin/finance/thismonth"><@spring.message "admin.nav.finance.thismonth"/></a></li>
		<li><a href="/admin/finance/lastmonth"><@spring.message "admin.nav.finance.lastmonth"/></a></li>
		<li><a href="/admin/finance/history"><@spring.message "admin.nav.finance.history"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "admin.nav.auth"/></p>
	<ul>
		<li><a href="/admin/auth/show"><@spring.message "admin.nav.auth.show"/></a></li>
		<li><a href="/admin/auth/new"><@spring.message "admin.nav.auth.new"/></a></li>
	</ul>
</div>
