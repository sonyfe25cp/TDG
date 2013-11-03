<#include "/seller/common/template-head.ftl">
<div class="container">
	<table class="table table-bordered">
		<tr>
			<td><@spring.message "order.model.name"/></td>
			<td>${order.name}</td>
		</tr>
		<tr>
			<td><@spring.message "order.model.address"/></td>
			<td>${order.address}</td>
		</tr>
		<tr>
			<td><@spring.message "order.model.city"/></td>
			<td>${order.city}</td>
		</tr>
		<tr>
			<td><@spring.message "order.model.country"/></td>
			<td>${order.country}</td>
		</tr>
		<tr>
			<td><@spring.message "order.model.postCode"/></td>
			<td>${order.postCode}</td>
		</tr>
	</table>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th><@spring.message "cart.model.name"/></th>
				<th>sku</th>
				<th><@spring.message "cart.model.price"/></th>
				<th><@spring.message "cart.show.ifee"/></th>
				<th><@spring.message "cart.model.counts"/></th>
			</tr>
		</thead>
		<tbody>
			<#list order.orderItems as orderItem>
				<tr>
					<td>
						<a href="/product/${orderItem.productId}" target="_blank">${orderItem.name}</a>
					</td>
					<td class="sku">
						${orderItem.sku}
					</td>
					<td class="price">
						${orderItem.price}
					</td>
					<td>
						<#if orderItem.internationalShippingService ==1>
							${orderItem.internationalShippingFee}
						<#else>
						0
						</#if>
					</td>
					<td>
						${orderItem.num}
					</td>
				</tr>
			</#list>
		</tbody>
	</table>
	<button class="btn btn-primary" onclick="window.print()"><@spring.message "seller.order.print"/></button>
</div>