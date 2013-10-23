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
	<#if claimItem??>
		<legend><@spring.message "order.complain"/></legend>
		<table class="table">
			<tr>
				<th>ID</th>
				<th><@spring.message "order.complain.label"/></th>
			</tr>
			<tr>
				<td>${claimItem.id}</td>
				<td>
					<#switch claimItem.claimTypeId>
						<#case 1>
							<@spring.message "order.complain.one"/>
						<#break>
						<#case 2>
							<@spring.message "order.complain.two"/>
						<#break>
						<#case 3>
							<@spring.message "order.complain.three"/>
						<#break>
						<#case 4>
							<@spring.message "order.complain.four"/>
						<#break>
						<#case 5>
							<@spring.message "order.complain.five"/>
						<#break>
						<#case 6>
							<@spring.message "order.complain.six"/>
						<#break>
						<#case 7>
							<@spring.message "order.complain.seven"/>
						<#break>
					</#switch>
				</td>
			</tr>
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
					<th><@spring.message "cart.model.priceRMB"/></th>
					<th><@spring.message "cart.show.ifeeRMB"/></th>
					<th><@spring.message "cart.model.counts"/></th>
				</tr>
			</thead>
			<tbody>
				<#list order.orderItems as orderItem>
					<tr>
						<td>
							<a href="/product/${orderItem.productId}" target="_blank">
								<#if orderItem.nameInChinese??>
									${orderItem.nameInChinese}
								<#else>
									${orderItem.name}
								</#if>
								<#if orderItem.featureJson??>
									<p>${orderItem.featureJson}</p>
								</#if>
							</a>
						</td>
						<td class="price">
							${orderItem.priceRMB}
						</td>
						<td>
							<#if orderItem.internationalShippingService ==1>
								${orderItem.ifeeRMB}
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
		<p><@spring.message "order.model.price"/> : ${order.priceRMB}</p>
		<#if order.comment??>
			<legend><@spring.message "order.model.comment"/></legend>
			<p>${order.comment}</p>
		</#if>
	</div>
</table>
