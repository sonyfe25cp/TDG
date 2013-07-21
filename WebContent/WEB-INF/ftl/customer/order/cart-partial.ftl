<div class="row-fluid">
	<#if orderItems??>
		<table class="table">
			<tr>
				<th>Name</th>
				<th>Price</th>
				<th>Counts</th>
				<th>Options</th>
			</tr>
			<#assign p = 0 > 
			<#list orderItems as orderItem>
				<tr>
					<td>
						<a href="/product/${orderItem.productId}">${orderItem.name}</a>
					</td>
					<td>
						${orderItem.price}
					</td>
					<td>
						<input type="text" value="${orderItem.num}">
					</td>
					<td>
						<a>[x]</a>
					</td>
				</tr>
				<#assign tmp = orderItem.price * orderItem.num>
				<#assign p = p + tmp>
			</#list>
		</table>
		<legend>Total</legend>
		<lable>
			${p}
		</label>
	<#else>
		你什么也没买，回到首页
	</#if>
<div>