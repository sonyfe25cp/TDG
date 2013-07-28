<div>
	<p><@spring.message "customer.nav.orders"/></p>
	<ul>
		<li><a href="/customer/orders/all"><@spring.message "customer.nav.orders.new"/></a></li>
		<li><a href="/customer/orders/auto">留货</a></li>
		<li><a href="/customer/orders/return">退货订单</a></li>
	</ul>
</div>
<div>
	<p><@spring.message "customer.nav.auth"/></p>
	<ul>
		<li><a href="/customer/auth/show"><@spring.message "customer.nav.auth.show"/></a></li>
		<li><a href="/customer/auth/taobao"><@spring.message "customer.nav.taobao"/></a></li>
	</ul>
</div>
<div>
	<p>投诉管理</p>
	<ul>
		<li><a href="/customer/orders/error">我的投诉</a></li>
	</ul>
</div>
<div>
	<p><@spring.message "seller.nav.helpcenter"/></p>
	<ul>
		<li><a href="/customer/messageCenter/list"><@spring.message "seller.nav.call"/></a></li>
	</ul>
</div>
