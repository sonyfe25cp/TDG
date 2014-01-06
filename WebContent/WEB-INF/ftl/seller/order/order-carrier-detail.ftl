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
		<tr>
			<td><@spring.message "seller.order.sendDate"/></td>
			<td>${order.sendAt?date}</td>
		</tr>
	</table>
	<#if order.orderStatus == 3 || (claimItem?? && (claimItem.claimTypeId == 1 || claimItem.claimTypeId == 2))><!-- sent but not received -->
		<a class="btn btn-primary" href="/seller/order/updateShipping/${order.id}"><@spring.message "button.editshipping"/></a>
	</#if>
</#if>