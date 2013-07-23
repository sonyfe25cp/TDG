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
					${order.orderStatus}
				</td>
				<td>
					<a href="" class="btn"><@spring.message "button.show"/></a>
					<a href="" class="btn"><@spring.message "button.cancel"/></a>
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