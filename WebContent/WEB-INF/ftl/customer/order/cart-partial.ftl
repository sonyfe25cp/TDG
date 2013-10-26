
<script type="text/javascript" src="/js/customer/cart.js"></script>
<script type="text/javascript" src="/js/customer/address.js"></script>
<!--
<script type="text/javascript" src="/js/omartech.check.input.js"></script>
<script type="text/javascript" src="/js/jquery-cookie.js"></script>

-->
<div class="alert">
  <strong>Warning!</strong> Addresses are accepted only in English.
</div>
<div id="wrongMatch" class="alert alert-danger hidden">
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
					<th><@spring.message "cart.model.priceRMB"/></th>
					<th><@spring.message "cart.show.discount"/></th>
					<th><@spring.message "cart.show.shippingCountry"/></th>
					<th><@spring.message "cart.show.ifeeRMB"/></th>
					<th><@spring.message "cart.model.counts"/></th>
					<th><@spring.message "cart.show.sumRMB"/></th>
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
							<a href="/product/${orderItem.productId}">${orderItem.nameInChinese}</a>
							<input type="hidden" name="name" value="${orderItem.nameInChinese}"/>
							<#if orderItem.featureJson??>
								<p>${orderItem.featureJson}</p>
							</#if>
							<#if orderItem.sku??>
								<input type="hidden" name="skuId" value="${orderItem.sku}"/>
							</#if>
							<input type="hidden" name="itemId" value="${orderItem.itemId}"/>
							<input type="hidden" name="coinage" value="${orderItem.coinage}"/>
							<input type="hidden" name="sellerId" value="${orderItem.sellerId}"/>
							<input type="hidden" name="productId" value="${orderItem.productId}"/>
							<input type="hidden" name="iss" value="${orderItem.internationalShippingService}"/>
							<#if orderItem.internationalShippingService == 1>
								<input type="hidden" name="ifee" value="${orderItem.ifeeRMB}"/>
							</#if>
							<input type="hidden" name="countryCode" value="${orderItem.countryCode}"/>
							<input type="hidden" name="availableQuantity" value="${orderItem.availableQuantity}"/>
						</td>
						<td class="price">
							${orderItem.price}
						</td>
						<td class="priceRMB">
							${orderItem.priceRMB}
						</td>
						<td class="discount">
							${orderItem.discount}
						</td>
						<td>
							${orderItem.shippingCountry}
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
		<legend><@spring.message "cart.show.totalRMB"/></legend>
		<span id="total">
			${p}
		</span>
		<legend></legend>
		<a class="btn btn-primary" id="check"><@spring.message "button.submit"/></a>
	<#else>
		<a href="/customerindex"><@spring.message "cart.show.nothing"/></a>
	</#if>
<div>