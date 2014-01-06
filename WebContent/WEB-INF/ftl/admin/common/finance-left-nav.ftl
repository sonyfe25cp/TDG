<#include "top-banner.ftl">
<div>
	<p><@spring.message "admin.nav.finance"/></p>
	<ul>
		<li><a href="/admin/financeRecord/list"><@spring.message "admin.nav.finance.record"/></a></li>
		<li><a href="/admin/finance/receive-all"><@spring.message "admin.nav.finance.receive"/></a></li>
		<li><a href="/admin/finance/send-all"><@spring.message "admin.nav.finance.send"/></a></li>
		<!--
			<li><a href="/admin/finance/thismonth"><@spring.message "admin.nav.finance.thismonth"/></a></li>
			<li><a href="/admin/finance/lastmonth"><@spring.message "admin.nav.finance.lastmonth"/></a></li>
			<li><a href="/admin/finance/history"><@spring.message "admin.nav.finance.history"/></a></li>
		-->
	</ul>
</div>
