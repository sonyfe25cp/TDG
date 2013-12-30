<legend><@spring.message "order.show.details"/></legend>
<p>订单ID: ${order.id}</p>
<p>买家ID: ${order.customerId}</p>
<p>店铺ID: ${order.sellerId}</p>
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
					<td>
						<#if record.comment??>
							${record.comment}
						</#if>
					</td>
					<td>
						<#if record.comment??>
							${record.username}
						</#if>
					</td>
				</tr>
			</#list>
		</table>
	</#if>
	<#if order.cancelReason !=0>
		<legend><@spring.message "seller.order.cancel"/></legend>
		<table class="table">
			<tr>
				<td><@spring.message "seller.order.cancelReason"/></td>
				<td>
					<#switch order.cancelReason>
						<#case 1>
							<@spring.message "seller.order.cancel.first"/>
						<#break>
						<#case 2>
							<@spring.message "seller.order.cancel.second"/>
						<#break>
						<#case 3>
							<@spring.message "seller.order.cancel.third"/>
						<#break>
						<#case 4>
							<@spring.message "seller.order.cancel.fourth"/>
						<#break>
					</#switch>
				</td>
			</tr>
			<tr>
				<td><@spring.message "seller.order.cancelComment"/></td>
				<td>
					<#if order.cancelComment??>
						${order.cancelComment}
					</#if>
				</td>
			</tr>
		</table>
	</#if>
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
	</#if>
	<#if claimItem??>
		<legend>
			<#if claimItem.claimType == "claim">
				<@spring.message "order.complain"/>
			<#else>
				<@spring.message "order.return"/>
			</#if>
		</legend>
		<table class="table">
			<tr>
				<td>ID</td>
				<td>${claimItem.id}</td>
			</tr>
			<#if claimItem.claimType == "claim">
				<tr>
					<td><@spring.message "order.complain.label"/></td>
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
							<#case 8>
								<@spring.message "order.complain.eight"/>
							<#break>
							<#case 9>
								<@spring.message "order.complain.nine"/>
							<#break>
							<#case 10>
								<@spring.message "order.complain.ten"/>
							<#break>
						</#switch>
					</td>
				</tr>
			</#if>
			<tr>
				<td><@spring.message "claimItem.model.comment"/></td>
				<td>
					<#if claimItem.comment ??>
						${claimItem.comment}
					</#if>
				</td>
			</tr>
			<tr>
				<td><@spring.message "claimItem.model.commentByAdmin"/></td>
				<td>
					<#if claimItem.commentByAdmin ??>
						${claimItem.commentByAdmin}
					</#if>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<#if claimItem.flag == 1>
						由管理员协调解决
					</#if>
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
					<th><@spring.message "orderItem.model.price"/></th>
					<th><@spring.message "orderItem.model.finalPrice"/></th>
					
					<th><@spring.message "cart.model.counts"/></th>
					<th>Sum</th>
					<th><@spring.message "cart.show.ifeeRMB"/></th>
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
							￥${orderItem.priceRMB}
						</td>
						<td class="price">
							￥${orderItem.finalPriceRMB}
						</td>
						
						<td>
							${orderItem.num}
						</td>
						<td>
							￥${orderItem.sumPriceRMB}
						</td>
						<td>
							<#if orderItem.internationalShippingService ==1>
								${orderItem.ifeeRMB}
							<#else>
							0
							</#if>
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
