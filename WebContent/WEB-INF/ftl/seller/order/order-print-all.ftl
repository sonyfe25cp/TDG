<#include "/seller/common/template-head.ftl">
<div class="container">
	<legend>Orders</legend>
	<table class="table">
		<tr>
			<th>Order Id</th>
			<th><@spring.message "order.model.name"/></th>
			<th><@spring.message "order.model.address"/></th>
			<th><@spring.message "order.model.city"/></th>
			<th><@spring.message "order.model.country"/></th>
			<th><@spring.message "order.model.postCode"/></th>
			<!-- about product-->
			<th><@spring.message "cart.model.name"/></th>
			<th>sku</th>
			<th><@spring.message "cart.model.counts"/></th>
		</tr>
		<#list orders as order>
			<#list order.orderItems as orderItem>
				<tr>
					<td>${order.id}</td>
					<td>
						${order.name}
					</td>
					<td>${order.address}</td>
					<td>${order.city}</td>
					<td>${order.country}</td>
					<td>${order.postCode}</td>
					<!-- about product -->
					<td>
						${orderItem.name}
						<#if orderItem.featureJson??>
							<p>${orderItem.featureJson}</p>
						</#if>
					</td>
					<td>${orderItem.sku}</td>
					<td>${orderItem.num}</td>
				</tr>
			</#list>
		</#list>
	</table>
	<button class="btn btn-primary" onclick="window.print()"><@spring.message "seller.order.print"/></button>
</div>