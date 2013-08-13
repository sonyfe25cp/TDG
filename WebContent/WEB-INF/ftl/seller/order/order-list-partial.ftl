<legend><@spring.message "order.title"/></legend>
<table class="table">
	<thead>
		<th><@spring.message "order.model.id"/></th>
		<th><@spring.message "order.model.name"/></th>
		<th><@spring.message "order.model.price"/></th>
		<th><@spring.message "order.model.orderStatus"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list orders as order>
			<tr>
				<td>
					${order.id}
				</td>
				<td>
					${order.name}
				</td>
				<td>
					${order.price}
				</td>
				<td>
					<#include "/common/order-status.ftl"/>
				</td>
				<td>
					<a href="/seller/order/show/${order.id}" class="btn"><@spring.message "button.show"/></a>
					
					<#switch order.orderStatus>
						<#case 1>
						<#break>
						<#case 2>
							<a href="/seller/order/send/${order.id}" class="btn">send</a>
						<#break>
						<#case 3>
						<#break>
						<#case 4>
							<@spring.message "order.status.receive"/>
						<#break>
						<#case 5>
							<@spring.message "order.status.cut"/>
						<#break>
						<#case 6>
							<@spring.message "order.status.return"/>
						<#break>
						<#case 7>
							<@spring.message "order.status.error"/>
						<#break>
						<#case 8>
							<@spring.message "order.status.auto"/>
							<a href="" class="btn"><@spring.message "button.order.confirm"/></a>
						<#break>
						<#case 10>
						<#break>
					</#switch>
					
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/seller/orders?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/seller/orders?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/seller/orders?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>