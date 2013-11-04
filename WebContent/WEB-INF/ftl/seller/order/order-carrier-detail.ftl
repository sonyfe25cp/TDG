<#if order.orderStatus gte 3  && order.carrier??>
	<legend><@spring.message "seller.order.shippingMethod"/></legend>
	<table class="table">
		<tr>
			<td><@spring.message "seller.order.trackingId"/></td>
			<td>${order.trackingId}</td>
		</tr>
		<tr>
			<td><@spring.message "seller.order.tracking"/></td>
			<td>${order.trackingWeb}</td>
		</tr>
		<tr>
			<td><@spring.message "seller.order.kuaidi"/></td>
			<td>${order.carrier}</td>
		</tr>
	</table>
	<a class="btn btn-primary" href="/seller/order/updateShipping/${order.id}"><@spring.message "button.editshipping"/></a>
</#if>