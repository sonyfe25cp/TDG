<legend><@spring.message "order.title"/></legend>
	<#if orderRecords??>
		<table class="table">
			<tr>
				<td><@spring.message "orderRecord.model.createAt"/></td>
				<td><@spring.message "orderRecord.model.comment"/></td>
				<td><@spring.message "orderRecord.model.username"/></td>
			</tr>
			<#list orderRecords as record>
				<tr>
					<td>${record.createAt?datetime}</td>
					<td>${record.comment}</td>
					<td>${record.username}</td>
				</tr>
			</#list>
		</table>
	</#if>
	<div>
		<p><@spring.message "order.show.details"/></p>
		<p><@spring.message "order.model.name"/>: ${order.name}</p>
		<p><@spring.message "order.model.address"/>: ${order.address}</p>
		<p><@spring.message "order.model.city"/>: ${order.city}</p>
		<p><@spring.message "order.model.country"/>: ${order.country}</p>
		<p><@spring.message "order.model.postCode"/>: ${order.postCode}</p>
	</div>

	<div>
		<table class="table">
			<thead>
				<tr>
					<th><@spring.message "cart.model.name"/></th>
					<th><@spring.message "cart.model.price"/></th>
					<th><@spring.message "cart.model.counts"/></th>
				</tr>
			</thead>
			<tbody>
				<#list order.orderItems as orderItem>
					<tr>
						<td>
							<a href="/product/${orderItem.productId}" target="_blank">${orderItem.name}</a>
						</td>
						<td class="price">
							${orderItem.price}
						</td>
						<td>
							${orderItem.num}
						</td>
					</tr>
				</#list>
			</tbody>
		</table>
		<p><@spring.message "order.model.price"/> : ${order.price}</p>
	</div>
</table>
