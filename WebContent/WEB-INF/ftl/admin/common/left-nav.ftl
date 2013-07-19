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
<div>
	<p><@spring.message "admin.nav.params"/></p>
	<ul>
		<li>
			<a href="/admin/saleproperty/list">
				<@spring.message "admin.nav.params.showBaseFeature"/>
			</a>
		</li>
	</ul>
</div>
<div>
	<p>投诉管理</p>
	<ul>
		<li><a href="/admin/auth/show">投诉订单</a></li>
		<li><a href="/admin/auth/new">退货管理</a></li>
	</ul>
</div>
<div>
	<p>留言管理</p>
	<ul>
		<li><a href="/admin/auth/show">卖家留言</a></li>
		<li><a href="/admin/auth/new">买家留言</a></li>
		<li><a href="/admin/auth/new">翻译留言</a></li>
	</ul>
</div>
<div>
	<p><帮助服务管理/></p>
	<ul>
		<li>
			<a href="/admin/manageHelp/tradeRulesManage">
				买家帮助管理
			</a>
		</li>
		<li>
			<a href="/admin/manageHelp/seller/aboutusManage">
				卖家帮助管理
			</a>
		</li>
	</ul>
</div>
