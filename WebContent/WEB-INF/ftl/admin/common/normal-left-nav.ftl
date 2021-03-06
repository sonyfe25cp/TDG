<#include "top-banner.ftl">
<div>
	<p><@spring.message "admin.nav.products"/></p>
	<ul>
		<li><a href="/admin/product/listbystatus?status=1"><@spring.message "admin.nav.products.inProductCreation"/></a></li>
		<li><a href="/admin/product/listbystatus?status=2"><@spring.message "admin.nav.products.inEnglishDisplay"/></a></li>
		<li><a href="/admin/product/listbystatus?status=3"><@spring.message "admin.nav.products.inTranslation"/></a></li>
		<li><a href="/admin/product/listbystatus?status=4"><@spring.message "admin.nav.products.translationComplete"/></a></li>
		<li><a href="/admin/product/listbystatus?status=5"><@spring.message "admin.nav.products.chinaListingCreated"/></a></li>
		<li><a href="/admin/product/listbystatus?status=6"><@spring.message "admin.nav.products.sellable"/></a></li>
		<li><a href="/admin/product/listbystatus?status=7"><@spring.message "admin.nav.products.unsellableWithChinaListing"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "admin.nav.brands"/></p>
	<ul>
		<li><a href="/admin/brand/listbystatus?status=2"><@spring.message "admin.nav.brands.inEnglishDisplay"/></a></li>
		<li><a href="/admin/brand/listbystatus?status=3"><@spring.message "admin.nav.brands.inTranslation"/></a></li>
		<li><a href="/admin/brand/listbystatus?status=4"><@spring.message "admin.nav.brands.translationComplete"/></a></li>
		<li><a href="/admin/brand/listbystatus?status=5"><@spring.message "admin.nav.brands.chinaListingCreated"/></a></li>
		<li><a href="/admin/brand/listbystatus?status=6"><@spring.message "admin.nav.brands.ok"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "admin.nav.auth"/></p>
	<ul>
		<li><a href="/admin/auth/show"><@spring.message "admin.nav.auth.show"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "admin.nav.orders"/></p>
	<ul>
		<li><a href="/admin/claim/list/claim"><@spring.message "admin.nav.orders.complain"/></a></li>
		<li><a href="/admin/claim/list/return"><@spring.message "admin.nav.orders.return"/></a></li>
		<li><a href="/admin/orders/cancelbyseller"><@spring.message "admin.nav.orders.cancelbyseller"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "admin.nav.notice"/></p>
	<ul>
		<li><a href="/admin/notice/show/seller"><@spring.message "notice.show.seller"/></a></li>
		<li><a href="/admin/notice/show/customer"><@spring.message "notice.show.customer"/></a></li>
		<li><a href="/admin/notice/show/translator"><@spring.message "notice.show.translator"/></a></li>
		<li><a href="/admin/notice/show/admin"><@spring.message "notice.show.admin"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "admin.nav.message"/></p>
	<ul>
		<li><a href="/admin/messageCenter/list?utype=seller"><@spring.message "admin.nav.message.seller"/></a></li>
		<li><a href="/admin/messageCenter/list?utype=customer"><@spring.message "admin.nav.message.customer"/></a></li>
		<li><a href="/admin/messageCenter/list?utype=translator"><@spring.message "admin.nav.message.translator"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "admin.nav.help"/></p>
	<ul>
		<li>
			<a href="/admin/manageHelp/tradeRulesManage">
				<@spring.message "customer.help.manage"/>
			</a>
		</li>
		<li>
			<a href="/admin/manageHelp/seller/aboutUsManage">
				<@spring.message "seller.help.manage"/>
			</a>
		</li>
	</ul>
</div>
