<legend>
	<#if status??>
		<#include "/common/order-list-title.ftl"/>
	<#else>
		<@spring.message "order.title"/>
	</#if>
	
</legend>
<table class="table">
	<thead>
		<th><@spring.message "order.model.id"/></th>
		<th><@spring.message "order.show.details"/></th>
		<th><@spring.message "order.model.createAt"/></th>
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
					<#list order.orderItems as item>
						<p>${item.nameInChinese} </p>
						<#if item.featureJson??>
							<p>${item.featureJson}</p>
						</#if>
					</#list>
				</td>
				<td>
					${order.createAt?datetime}
				</td>
				<td>
					${order.name}
				</td>
				<td>
					￥${order.priceRMB}
				</td>
				<td>
					<#include "/common/order-status.ftl"/>
				</td>
				<td>
					<a href="/customer/order/show/${order.id}" class="btn"><@spring.message "button.show"/></a>
					<#switch order.orderStatus>
						<#case 1>
							<a href="/customer/paymoney?orderId=${order.id}" class="btn btn-primary"><@spring.message "button.order.pay"/></a>
							<a href="/customer/order/cancel/${order.id}" class="btn"><@spring.message "button.cancel"/></a>
						<#break>
						<#case 2>
							<#if order.customerObserveFlag == 1>
								<a href="/customer/order/complainShow/${order.id}" class="btn btn-danger"><@spring.message "button.order.complain"/></a>
							</#if>
						<#break>
						<#case 3>
							<a href="/customer/order/receive/${order.id}" class="btn btn-info"><@spring.message "button.order.receive"/></a>
							<#if order.customerObserveFlag == 1>
								<a href="/customer/order/complainShow/${order.id}" class="btn btn-danger"><@spring.message "button.order.complain"/></a>
							</#if>
						<#break>
						<#case 4>
							<#if order.customerObserveFlag == 1>
								<a href="/customer/order/complainShow/${order.id}" class="btn btn-danger"><@spring.message "button.order.complain"/></a>
							</#if>
						<#break>
						<#case 5>
							
						<#break>
						<#case 6>
							
						<#break>
						<#case 7>
							
						<#break>
						<#case 8>
						<#break>
						<#case 10>
							<a href="/customer/order/cancelComplain?orderId=${order.id}" class="btn btn-primary">取消投诉</a>
						<#break>
						<#case 11>
							<#if order.customerObserveFlag == 1>
								<a href="/customer/order/complainShow/${order.id}" class="btn btn-danger"><@spring.message "button.order.complain"/></a>
							</#if>
						<#break>
					</#switch>
					<#if order.customerObserveFlag == 1 && order.orderStatus == 3>
						<a class="btn" href="/customer/order/returnShow/${order.id}">无理由退货</a>
					</#if>
				</td>
			</tr>
		</#list>
	</tbody>
</table>
<div class="pagination pagination-centered">
	<ul>
		<li><a href="/customer/orders/${status}?pageNo=0"><@spring.message "page.first"/></a></li>
		<#if pageNo != 0>
			<li><a href="/customer/orders/${status}?pageNo=${pageNo-1}"><@spring.message "page.previous"/></a></li>
		</#if>
		<li><a href="/customer/orders/${status}?pageNo=${pageNo+1}"><@spring.message "page.next"/></a></li>
	</ul>
</div>
