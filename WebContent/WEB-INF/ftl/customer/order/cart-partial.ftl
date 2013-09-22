<script type="text/javascript" src="/js/customer/cart.js"></script>
<script type="text/javascript" src="/js/omartech.check.input.js"></script>
<script type="text/javascript" src="/js/customer/address.js"></script>
<div class="row-fluid">
	<#if orderItems??>
		<div id="addresses">
			<legend><@spring.message "cart.show.address"/></legend>
			<#if addresses??>
				<#assign x = 1>
				<#list addresses as customerAddress>
					<input type="radio" value="${customerAddress.id}" name="address"/>
						${customerAddress.country} &nbsp;${customerAddress.city} &nbsp; ${customerAddress.address} &nbsp; ${customerAddress.name} -- ${customerAddress.postCode}
					<a class="edit"><@spring.message "button.edit"/></a>
					<a class="delete"><@spring.message "button.delete"/></a>
					<p/>
					<#assign x=x+1>
				</#list>
				<#if x < 8>
					<a id="new"><@spring.message "cart.show.newaddress"/></a>
				</#if>
			<#else>
				<a id="new"><@spring.message "cart.show.newaddress"/></a>
			</#if>
			<!--
			<table>
				<tr>
					<td><@spring.message "customerAddress.model.name"/></td>
					<td><input type="text" name="name" value=""></td>
				</tr>
				<tr>
					<td><@spring.message "customerAddress.model.address"/></td>
					<td><input type="text" name="address" value=""></td>
				</tr>
				<tr>
					<td><@spring.message "customerAddress.model.city"/></td>
					<td><input type="text" name="city" value=""></td>
				</tr>
				<tr>
					<td><@spring.message "customerAddress.model.country"/></td>
					<td><input type="text" name="country" value=""></td>
				</tr>
				<tr>
					<td><@spring.message "customerAddress.model.postCode"/></td>
					<td><input type="text" name="postCode" value=""></td>
				</tr>
				<tr>
					<td></td>
					<td><a class="btn btn-info" id="create"><@spring.message "button.add"/></a></td>
				</tr>
			</table>
			-->
		</div>
		<legend><@spring.message "cart.show.orderItem"/></legend>
		<table class="table">
			<thead>
				<tr>
					<th><@spring.message "cart.model.name"/></th>
					<th><@spring.message "cart.model.price"/></th>
					<th><@spring.message "cart.model.counts"/></th>
					<th>sum</th>
					<th><@spring.message "cart.model.options"/></th>
				</tr>
			</thead>
			<tbody id="carts">
				<#assign p = 0 > 
				<#list orderItems as orderItem>
					<tr>
						<td>
							<a href="/product/${orderItem.productId}">${orderItem.name}</a>
							<input type="hidden" name="name" value="${orderItem.name}"/>
							<input type="hidden" name="skuId" value="${orderItem.skuId}"/>
							<input type="hidden" name="itemId" value="${orderItem.itemId}"/>
							<input type="hidden" name="coinage" value="${orderItem.coinage}"/>
							<input type="hidden" name="sellerId" value="${orderItem.sellerId}"/>
							<input type="hidden" name="productId" value="${orderItem.productId}"/>
						</td>
						<td class="price">
							${orderItem.price}
						</td>
						<td>
							<input type="text" name="num" value="${orderItem.num}">
						</td>
						<td class="sum">
							${orderItem.num * orderItem.price}
						</td>
						<td>
							<a class="del">[删除]</a>
						</td>
					</tr>
					<#assign tmp = orderItem.price * orderItem.num>
					<#assign p = p + tmp>
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