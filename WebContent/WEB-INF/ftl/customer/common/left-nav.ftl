<div>
	<p><@spring.message "customer.nav.orders"/></p>
	<ul>
		<li><a href="/customer/orders/nopay"><@spring.message "customer.nav.orders.nopay"/></a></li>
		<li><a href="/customer/orders/paid"><@spring.message "customer.nav.orders.paid"/></a></li>
		<li><a href="/customer/orders/send"><@spring.message "customer.nav.orders.send"/></a></li>
		<li><a href="/customer/orders/all"><@spring.message "customer.nav.orders.all"/></a></li>
		<!--<li><a href="/customer/orders/auto"><@spring.message "customer.nav.orders.auto"/></a></li>-->
		<li><a href="/customer/orders/cancelbyseller"><@spring.message "customer.nav.orders.cancelbyseller"/></a></li>
		<li><a href="/cart"><@spring.message "customer.nav.gobacktocart"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "customer.nav.auth"/></p>
	<ul>
		<li><a href="/customer/auth/show"><@spring.message "customer.nav.auth.show"/></a></li>
		<!-- <li><a href="/customer/auth/taobao"><@spring.message "customer.nav.taobao"/></a></li> -->
	</ul>
</div>
<div>
	<p><@spring.message "customer.nav.complain"/></p>
	<ul>
		<li><a href="/customer/claim/list/claim"><@spring.message "customer.nav.complain"/></a></li>
		<li><a href="/customer/claim/list/return"><@spring.message "customer.nav.orders.return"/></a></li>
	</ul>
</div>
<div>
	<p><@spring.message "seller.nav.helpcenter"/></p>
	<ul>
		<li><a href="/customer/messageCenter/list"><@spring.message "seller.nav.call"/></a></li>
	</ul>
</div>
