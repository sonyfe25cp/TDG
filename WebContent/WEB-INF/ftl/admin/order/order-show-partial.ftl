<legend><@spring.message "order.title"/></legend>
	<#if orderRecords??>
		<legend><@spring.message "orderRecord.show.title"/></legend>
		<table class="table table-striped">
			<tr>
				<th><@spring.message "orderRecord.model.createAt"/></th>
				<th><@spring.message "orderRecord.model.comment"/></th>
				<th><@spring.message "orderRecord.model.username"/></th>
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
		<legend><@spring.message "order.show.details"/></legend>
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
	</div>
	<div>
		<table class="table table-striped">
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
		<#if order.comment??>
			<legend><@spring.message "order.model.comment"/></legend>
			<p>${order.comment}</p>
		</#if>
	</div>
</table>
