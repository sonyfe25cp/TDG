<script type="text/javascript" src="/js/customer/cart.js"></script>
<script type="text/javascript" src="/js/customer/address.js"></script>
<div class="row-fluid">
	<div id="addresses">
		<legend>Address</legend>
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
				<a id="new">Create a new address ? </a>
			</#if>
		<#else>
			<a id="new">Create a new address ? </a>
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
	<#if orderItems??>
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Price</th>
					<th>Counts</th>
					<th>Options</th>
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
						</td>
						<td class="price">
							${orderItem.price}
						</td>
						<td>
							<input type="text" name="num" value="${orderItem.num}">
						</td>
						<td>
							<a>[x]</a>
						</td>
					</tr>
					<#assign tmp = orderItem.price * orderItem.num>
					<#assign p = p + tmp>
				</#list>
			</tbody>
		</table>
		<legend>Total</legend>
		<lable>
			${p}
		</label>
		<legend></legend>
		<a class="btn btn-primary" id="check"><@spring.message "button.submit"/></a>
	<#else>
		你什么也没买，回到首页
	</#if>
<div>