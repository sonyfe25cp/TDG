<script type="text/javascript" src="/js/customer/cart.js"></script>
<script type="text/javascript" src="/js/omartech.check.input.js"></script>
<script type="text/javascript" src="/js/customer/address.js"></script>
<div class="alert">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>Warning!</strong> Addresses are accepted only in English.
</div>
<div class="row-fluid">
	<#if orderItems??>
		<div id="addresses">
			<legend><@spring.message "cart.show.address"/></legend>
			<ul>
				<#if addresses??>
					<#assign x = 1>
						<#list addresses as customerAddress>
							<li value="${customerAddress.id}">
								<input type='radio' name='address'>
								<span value="${customerAddress.countryCode}"> 
									${customerAddress.country} , ${customerAddress.city}  , ${customerAddress.address} ,  ${customerAddress.name} -- ${customerAddress.postCode}
								<span>
								<button class="delete">Delete</button>
							</li>
							<#assign x=x+1>
						</#list>
					<#if x < 8>
						<a id="new"><@spring.message "cart.show.newaddress"/></a>
					</#if>
				<#else>
					<a id="new"><@spring.message "cart.show.newaddress"/></a>
				</#if>
			</ul>
		</div>
		<legend><@spring.message "cart.show.orderItem"/></legend>
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" name="all-select">
					<th><@spring.message "cart.model.name"/></th>
					<th><@spring.message "cart.model.price"/></th>
					<th><@spring.message "cart.show.ifee"/></th>
					<th><@spring.message "cart.model.counts"/></th>
					<th><@spring.message "cart.show.sum"/></th>
					<th><@spring.message "cart.model.options"/></th>
				</tr>
			</thead>
			<tbody id="carts">
				<#assign p = 0 > 
				<#list orderItems as orderItem>
					<tr>
						<td>
							<input type="checkbox" class="cartItem" checked='true'>
						</td>
						<td>
							<a href="/product/${orderItem.productId}">${orderItem.name}</a>
							<input type="hidden" name="name" value="${orderItem.name}"/>
							<#if orderItem.sku??>
								<input type="hidden" name="skuId" value="${orderItem.sku}"/>
							</#if>
							<input type="hidden" name="itemId" value="${orderItem.itemId}"/>
							<input type="hidden" name="coinage" value="${orderItem.coinage}"/>
							<input type="hidden" name="sellerId" value="${orderItem.sellerId}"/>
							<input type="hidden" name="productId" value="${orderItem.productId}"/>
							<input type="hidden" class="iss" value="${orderItem.internationalShippingService}"/>
							<input type="hidden" class="countryCode" value="${orderItem.countryCode}"/>
						</td>
						<td class="price">
							${orderItem.priceRMB}
						</td>
						<td class="ifee">
							<#if orderItem.internationalShippingService == 1>
								<#assign ifee = orderItem.ifeeRMB >
								${ifee}
							<#else>
								0
								<#assign ifee = 0>
							</#if>
						</td>
						<td class="count">
							<input type="text" name="num" value="${orderItem.num}">
						</td>
						<td class="sum">
							<#assign sum = orderItem.num * orderItem.priceRMB + ifee>
							${sum}
						</td>
						<td>
							<a class="del">[删除]</a>
						</td>
					</tr>
					<#assign p = p + sum>
				</#list>
			</tbody>
		</table>
		<legend><@spring.message "cart.show.total"/></legend>
		<span id="total">
			${p}
		</span>
		<legend></legend>
		<a class="btn btn-primary" id="check"><@spring.message "button.submit"/></a>
	<#else>
		<a href="/customerindex"><@spring.message "cart.show.nothing"/></a>
	</#if>
<div>