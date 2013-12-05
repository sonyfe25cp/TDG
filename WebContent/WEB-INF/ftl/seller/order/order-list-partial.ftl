<legend><@spring.message "order.title"/></legend>
<#if status == 'paid'>
	<script type="text/javascript" src="/js/seller/order-print-all.js"></script>
	<a class="btn btn-primary disabled" id="print_all">Print All Selected</a>
	<input value="" type="hidden" id="idArray"/>
</#if>
<table class="table">
	<thead>
		<#if status == 'paid'>
			<th>
				<input type="checkbox" name="all-select">
			</th>
		</#if>
		<th><@spring.message "order.model.id"/></th>
		<th><@spring.message "order.model.name"/></th>
		<th><@spring.message "order.model.price"/></th>
		<th><@spring.message "order.model.transferPrice"/></th>
		<th><@spring.message "order.model.createAt"/></th>
		<th><@spring.message "order.model.orderStatus"/></th>
		<th><@spring.message "menu.options"/></th>
	</thead>
	<tbody>
		<#list orders as order>
			<tr>
				<#if status == 'paid'>
					<th>
						<input type="checkbox" name="print">
						<input value="${order.id}" type="hidden" class="order_id"/>
					</th>
				</#if>
				<td>
					${order.id}
				</td>
				<td>
					${order.name}
				</td>
				<td>
					${order.originPrice}
				</td>
				<td>
					${order.transferPrice}
				</td>
				<td>
					<#if order.createAt??>
					${order.createAt?datetime}
					</#if>
				</td>
				<td>
					<#include "/common/order-status.ftl"/>
				</td>
				<td>
					<a href="/seller/order/show/${order.id}" class="btn btn-primary"><@spring.message "button.show"/></a>
					
					<#switch order.orderStatus>
						<#case 1>
							<a href="/seller/order/cancel/${order.id}" class="btn btn-danger"><@spring.message 'button.order.cancel'/></a>
						<#break>
						<#case 2>
							<a href="/seller/order/cancel/${order.id}" class="btn btn-danger"><@spring.message 'button.order.cancel'/></a>
							<a href="/seller/order/send/${order.id}" class="btn btn-primary"><@spring.message 'button.order.send'/></a>
						<#break>
						<#case 3>
						<#break>
						<#case 4>
						<#break>
						<#case 5>
						<#break>
						<#case 6>
						<#break>
						<#case 7>
						<#break>
						<#case 8>
							<a href="" class="btn btn-primary"><@spring.message "button.order.confirm"/></a>
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
		<li><a href="/seller/orders/${status}?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/seller/orders/${status}?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/seller/orders/${status}?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>